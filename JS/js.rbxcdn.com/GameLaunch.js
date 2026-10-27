! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "414e605cf5541997a70ac078564f83dc69a67a63"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "d2d8857d-3a61-434d-99ca-c60a94ea1625", e._sentryDebugIdIdentifier = "sentry-dbid-d2d8857d-3a61-434d-99ca-c60a94ea1625")
    } catch (e) {}
}(),
function() {
    var e = {
            742: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = u(e),
                        r = t[0],
                        n = t[1];
                    return (r + n) * 3 / 4 - n
                }, t.toByteArray = function(e) {
                    var t, r, a = u(e),
                        i = a[0],
                        l = a[1],
                        c = new o((i + l) * 3 / 4 - l),
                        s = 0,
                        f = l > 0 ? i - 4 : i;
                    for (r = 0; r < f; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], c[s++] = t >> 16 & 255, c[s++] = t >> 8 & 255, c[s++] = 255 & t;
                    return 2 === l && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, c[s++] = 255 & t), 1 === l && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, c[s++] = t >> 8 & 255, c[s++] = 255 & t), c
                }, t.fromByteArray = function(e) {
                    for (var t, n = e.length, o = n % 3, a = [], i = 0, l = n - o; i < l; i += 16383) a.push(function(e, t, n) {
                        for (var o, a = [], i = t; i < n; i += 3) o = (e[i] << 16 & 0xff0000) + (e[i + 1] << 8 & 65280) + (255 & e[i + 2]), a.push(r[o >> 18 & 63] + r[o >> 12 & 63] + r[o >> 6 & 63] + r[63 & o]);
                        return a.join("")
                    }(e, i, i + 16383 > l ? l : i + 16383));
                    return 1 === o ? a.push(r[(t = e[n - 1]) >> 2] + r[t << 4 & 63] + "==") : 2 === o && a.push(r[(t = (e[n - 2] << 8) + e[n - 1]) >> 10] + r[t >> 4 & 63] + r[t << 2 & 63] + "="), a.join("")
                };
                for (var r = [], n = [], o = "u" > typeof Uint8Array ? Uint8Array : Array, a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", i = 0, l = a.length; i < l; ++i) r[i] = a[i], n[a.charCodeAt(i)] = i;

                function u(e) {
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
                    a = r(619),
                    i = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function l(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, u.prototype), t
                }

                function u(e, t, r) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return f(e)
                    }
                    return c(e, t, r)
                }

                function c(e, t, r) {
                    if ("string" == typeof e) {
                        var o = e,
                            a = t;
                        if (("string" != typeof a || "" === a) && (a = "utf8"), !u.isEncoding(a)) throw TypeError("Unknown encoding: " + a);
                        var i = 0 | y(o, a),
                            c = l(i),
                            s = c.write(o, a);
                        return s !== i && (c = c.slice(0, s)), c
                    }
                    if (ArrayBuffer.isView(e)) {
                        var f = e;
                        if (C(f, Uint8Array)) {
                            var m = new Uint8Array(f);
                            return d(m.buffer, m.byteOffset, m.byteLength)
                        }
                        return p(f)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)));
                    if (C(e, ArrayBuffer) || e && C(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (C(e, SharedArrayBuffer) || e && C(e.buffer, SharedArrayBuffer))) return d(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var b = e.valueOf && e.valueOf();
                    if (null != b && b !== e) return u.from(b, t, r);
                    var v = function(e) {
                        if (u.isBuffer(e)) {
                            var t = 0 | h(e.length),
                                r = l(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? l(0) : p(e) : "Buffer" === e.type && Array.isArray(e.data) ? p(e.data) : void 0
                    }(e);
                    if (v) return v;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return u.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)))
                }

                function s(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return s(e), l(e < 0 ? 0 : 0 | h(e))
                }

                function p(e) {
                    for (var t = e.length < 0 ? 0 : 0 | h(e.length), r = l(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
                }

                function d(e, t, r) {
                    var n;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), u.prototype), n
                }

                function h(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function y(e, t) {
                    if (u.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || C(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + (void 0 === e ? "undefined" : n(e)));
                    var r = e.length,
                        o = arguments.length > 2 && !0 === arguments[2];
                    if (!o && 0 === r) return 0;
                    for (var a = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return r;
                        case "utf8":
                        case "utf-8":
                            return I(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return x(e).length;
                        default:
                            if (a) return o ? -1 : I(e).length;
                            t = ("" + t).toLowerCase(), a = !0
                    }
                }

                function m(e, t, r) {
                    var n, a, i, l = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var o = "", a = t; a < r; ++a) o += k[e[a]];
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
                            return n = this, a = t, i = r, 0 === a && i === n.length ? o.fromByteArray(n) : o.fromByteArray(n.slice(a, i));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, r) {
                                for (var n = e.slice(t, r), o = "", a = 0; a < n.length - 1; a += 2) o += String.fromCharCode(n[a] + 256 * n[a + 1]);
                                return o
                            }(this, t, r);
                        default:
                            if (l) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), l = !0
                    }
                }

                function b(e, t, r) {
                    var n = e[t];
                    e[t] = e[r], e[r] = n
                }

                function v(e, t, r, n, o) {
                    var a;
                    if (0 === e.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (a = r *= 1) != a && (r = o ? 0 : e.length - 1), r < 0 && (r = e.length + r), r >= e.length)
                        if (o) return -1;
                        else r = e.length - 1;
                    else if (r < 0)
                        if (!o) return -1;
                        else r = 0;
                    if ("string" == typeof t && (t = u.from(t, n)), u.isBuffer(t)) return 0 === t.length ? -1 : g(e, t, r, n, o);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (o) return Uint8Array.prototype.indexOf.call(e, t, r);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, r);
                        return g(e, [t], r, n, o)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function g(e, t, r, n, o) {
                    var a, i = 1,
                        l = e.length,
                        u = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        i = 2, l /= 2, u /= 2, r /= 2
                    }

                    function c(e, t) {
                        return 1 === i ? e[t] : e.readUInt16BE(t * i)
                    }
                    if (o) {
                        var s = -1;
                        for (a = r; a < l; a++)
                            if (c(e, a) === c(t, -1 === s ? 0 : a - s)) {
                                if (-1 === s && (s = a), a - s + 1 === u) return s * i
                            } else - 1 !== s && (a -= a - s), s = -1
                    } else
                        for (r + u > l && (r = l - u), a = r; a >= 0; a--) {
                            for (var f = !0, p = 0; p < u; p++)
                                if (c(e, a + p) !== c(t, p)) {
                                    f = !1;
                                    break
                                } if (f) return a
                        }
                    return -1
                }

                function w(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], o = t; o < r;) {
                        var a, i, l, u, c = e[o],
                            s = null,
                            f = c > 239 ? 4 : c > 223 ? 3 : c > 191 ? 2 : 1;
                        if (o + f <= r) switch (f) {
                            case 1:
                                c < 128 && (s = c);
                                break;
                            case 2:
                                (192 & (a = e[o + 1])) == 128 && (u = (31 & c) << 6 | 63 & a) > 127 && (s = u);
                                break;
                            case 3:
                                a = e[o + 1], i = e[o + 2], (192 & a) == 128 && (192 & i) == 128 && (u = (15 & c) << 12 | (63 & a) << 6 | 63 & i) > 2047 && (u < 55296 || u > 57343) && (s = u);
                                break;
                            case 4:
                                a = e[o + 1], i = e[o + 2], l = e[o + 3], (192 & a) == 128 && (192 & i) == 128 && (192 & l) == 128 && (u = (15 & c) << 18 | (63 & a) << 12 | (63 & i) << 6 | 63 & l) > 65535 && u < 1114112 && (s = u)
                        }
                        null === s ? (s = 65533, f = 1) : s > 65535 && (s -= 65536, n.push(s >>> 10 & 1023 | 55296), s = 56320 | 1023 & s), n.push(s), o += f
                    }
                    var p = n,
                        d = p.length;
                    if (d <= 4096) return String.fromCharCode.apply(String, p);
                    for (var h = "", y = 0; y < d;) h += String.fromCharCode.apply(String, p.slice(y, y += 4096));
                    return h
                }

                function O(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function S(e, t, r, n, o, a) {
                    if (!u.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > o || t < a) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function P(e, t, r, n, o, a) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function E(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || P(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), a.write(e, t, r, n, 23, 4), r + 4
                }

                function A(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || P(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), a.write(e, t, r, n, 52, 8), r + 8
                }
                t.Buffer = u, t.SlowBuffer = function(e) {
                    return +e != e && (e = 0), u.alloc(+e)
                }, t.INSPECT_MAX_BYTES = 50, t.kMaxLength = 0x7fffffff, u.TYPED_ARRAY_SUPPORT = function() {
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
                }(), !u.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(u.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (u.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(u.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (u.isBuffer(this)) return this.byteOffset
                    }
                }), u.poolSize = 8192, u.from = function(e, t, r) {
                    return c(e, t, r)
                }, Object.setPrototypeOf(u.prototype, Uint8Array.prototype), Object.setPrototypeOf(u, Uint8Array), u.alloc = function(e, t, r) {
                    return (s(e), e <= 0) ? l(e) : void 0 !== t ? "string" == typeof r ? l(e).fill(t, r) : l(e).fill(t) : l(e)
                }, u.allocUnsafe = function(e) {
                    return f(e)
                }, u.allocUnsafeSlow = function(e) {
                    return f(e)
                }, u.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== u.prototype
                }, u.compare = function(e, t) {
                    if (C(e, Uint8Array) && (e = u.from(e, e.offset, e.byteLength)), C(t, Uint8Array) && (t = u.from(t, t.offset, t.byteLength)), !u.isBuffer(e) || !u.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, o = 0, a = Math.min(r, n); o < a; ++o)
                        if (e[o] !== t[o]) {
                            r = e[o], n = t[o];
                            break
                        } return r < n ? -1 : +(n < r)
                }, u.isEncoding = function(e) {
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
                }, u.concat = function(e, t) {
                    if (!Array.isArray(e)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === e.length) return u.alloc(0);
                    if (void 0 === t)
                        for (r = 0, t = 0; r < e.length; ++r) t += e[r].length;
                    var r, n = u.allocUnsafe(t),
                        o = 0;
                    for (r = 0; r < e.length; ++r) {
                        var a = e[r];
                        if (C(a, Uint8Array)) o + a.length > n.length ? u.from(a).copy(n, o) : Uint8Array.prototype.set.call(n, a, o);
                        else if (u.isBuffer(a)) a.copy(n, o);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        o += a.length
                    }
                    return n
                }, u.byteLength = y, u.prototype._isBuffer = !0, u.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) b(this, t, t + 1);
                    return this
                }, u.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) b(this, t, t + 3), b(this, t + 1, t + 2);
                    return this
                }, u.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) b(this, t, t + 7), b(this, t + 1, t + 6), b(this, t + 2, t + 5), b(this, t + 3, t + 4);
                    return this
                }, u.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? w(this, 0, e) : m.apply(this, arguments)
                }, u.prototype.toLocaleString = u.prototype.toString, u.prototype.equals = function(e) {
                    if (!u.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === u.compare(this, e)
                }, u.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, i && (u.prototype[i] = u.prototype.inspect), u.prototype.compare = function(e, t, r, o, a) {
                    if (C(e, Uint8Array) && (e = u.from(e, e.offset, e.byteLength)), !u.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : n(e)));
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === o && (o = 0), void 0 === a && (a = this.length), t < 0 || r > e.length || o < 0 || a > this.length) throw RangeError("out of range index");
                    if (o >= a && t >= r) return 0;
                    if (o >= a) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, o >>>= 0, a >>>= 0, this === e) return 0;
                    for (var i = a - o, l = r - t, c = Math.min(i, l), s = this.slice(o, a), f = e.slice(t, r), p = 0; p < c; ++p)
                        if (s[p] !== f[p]) {
                            i = s[p], l = f[p];
                            break
                        } return i < l ? -1 : +(l < i)
                }, u.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, u.prototype.indexOf = function(e, t, r) {
                    return v(this, e, t, r, !0)
                }, u.prototype.lastIndexOf = function(e, t, r) {
                    return v(this, e, t, r, !1)
                }, u.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var o, a, i, l, u, c, s, f, p = this.length - t;
                    if ((void 0 === r || r > p) && (r = p), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var d = !1;;) switch (n) {
                        case "hex":
                            return function(e, t, r, n) {
                                r = Number(r) || 0;
                                var o = e.length - r;
                                n ? (n = Number(n)) > o && (n = o) : n = o;
                                var a = t.length;
                                n > a / 2 && (n = a / 2);
                                for (var i = 0; i < n; ++i) {
                                    var l, u = parseInt(t.substr(2 * i, 2), 16);
                                    if ((l = u) != l) break;
                                    e[r + i] = u
                                }
                                return i
                            }(this, e, t, r);
                        case "utf8":
                        case "utf-8":
                            return o = t, a = r, T(I(e, this.length - o), this, o, a);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return i = t, l = r, T(function(e) {
                                for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                                return t
                            }(e), this, i, l);
                        case "base64":
                            return u = t, c = r, T(x(e), this, u, c);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return s = t, f = r, T(function(e, t) {
                                for (var r, n, o = [], a = 0; a < e.length && !((t -= 2) < 0); ++a) n = (r = e.charCodeAt(a)) >> 8, o.push(r % 256), o.push(n);
                                return o
                            }(e, this.length - s), this, s, f);
                        default:
                            if (d) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), d = !0
                    }
                }, u.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, u.prototype.slice = function(e, t) {
                    var r = this.length;
                    e = ~~e, t = void 0 === t ? r : ~~t, e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), t < e && (t = e);
                    var n = this.subarray(e, t);
                    return Object.setPrototypeOf(n, u.prototype), n
                }, u.prototype.readUintLE = u.prototype.readUIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || O(e, t, this.length);
                    for (var n = this[e], o = 1, a = 0; ++a < t && (o *= 256);) n += this[e + a] * o;
                    return n
                }, u.prototype.readUintBE = u.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || O(e, t, this.length);
                    for (var n = this[e + --t], o = 1; t > 0 && (o *= 256);) n += this[e + --t] * o;
                    return n
                }, u.prototype.readUint8 = u.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || O(e, 1, this.length), this[e]
                }, u.prototype.readUint16LE = u.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || O(e, 2, this.length), this[e] | this[e + 1] << 8
                }, u.prototype.readUint16BE = u.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || O(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, u.prototype.readUint32LE = u.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, u.prototype.readUint32BE = u.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, u.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || O(e, t, this.length);
                    for (var n = this[e], o = 1, a = 0; ++a < t && (o *= 256);) n += this[e + a] * o;
                    return n >= (o *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, u.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || O(e, t, this.length);
                    for (var n = t, o = 1, a = this[e + --n]; n > 0 && (o *= 256);) a += this[e + --n] * o;
                    return a >= (o *= 128) && (a -= Math.pow(2, 8 * t)), a
                }, u.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || O(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, u.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || O(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, u.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || O(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, u.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, u.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, u.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), a.read(this, e, !0, 23, 4)
                }, u.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), a.read(this, e, !1, 23, 4)
                }, u.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || O(e, 8, this.length), a.read(this, e, !0, 52, 8)
                }, u.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || O(e, 8, this.length), a.read(this, e, !1, 52, 8)
                }, u.prototype.writeUintLE = u.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        S(this, e, t, r, o, 0)
                    }
                    var a = 1,
                        i = 0;
                    for (this[t] = 255 & e; ++i < r && (a *= 256);) this[t + i] = e / a & 255;
                    return t + r
                }, u.prototype.writeUintBE = u.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        S(this, e, t, r, o, 0)
                    }
                    var a = r - 1,
                        i = 1;
                    for (this[t + a] = 255 & e; --a >= 0 && (i *= 256);) this[t + a] = e / i & 255;
                    return t + r
                }, u.prototype.writeUint8 = u.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, u.prototype.writeUint16LE = u.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, u.prototype.writeUint16BE = u.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, u.prototype.writeUint32LE = u.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, u.prototype.writeUint32BE = u.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, u.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        S(this, e, t, r, o - 1, -o)
                    }
                    var a = 0,
                        i = 1,
                        l = 0;
                    for (this[t] = 255 & e; ++a < r && (i *= 256);) e < 0 && 0 === l && 0 !== this[t + a - 1] && (l = 1), this[t + a] = (e / i | 0) - l & 255;
                    return t + r
                }, u.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        S(this, e, t, r, o - 1, -o)
                    }
                    var a = r - 1,
                        i = 1,
                        l = 0;
                    for (this[t + a] = 255 & e; --a >= 0 && (i *= 256);) e < 0 && 0 === l && 0 !== this[t + a + 1] && (l = 1), this[t + a] = (e / i | 0) - l & 255;
                    return t + r
                }, u.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, u.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, u.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, u.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, u.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || S(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, u.prototype.writeFloatLE = function(e, t, r) {
                    return E(this, e, t, !0, r)
                }, u.prototype.writeFloatBE = function(e, t, r) {
                    return E(this, e, t, !1, r)
                }, u.prototype.writeDoubleLE = function(e, t, r) {
                    return A(this, e, t, !0, r)
                }, u.prototype.writeDoubleBE = function(e, t, r) {
                    return A(this, e, t, !1, r)
                }, u.prototype.copy = function(e, t, r, n) {
                    if (!u.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (r || (r = 0), n || 0 === n || (n = this.length), t >= e.length && (t = e.length), t || (t = 0), n > 0 && n < r && (n = r), n === r || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (r < 0 || r >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), e.length - t < n - r && (n = e.length - t + r);
                    var o = n - r;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, r, n) : Uint8Array.prototype.set.call(e, this.subarray(r, n), t), o
                }, u.prototype.fill = function(e, t, r, n) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (n = t, t = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !u.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === e.length) {
                            var o, a = e.charCodeAt(0);
                            ("utf8" === n && a < 128 || "latin1" === n) && (e = a)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < r) throw RangeError("Out of range index");
                    if (r <= t) return this;
                    if (t >>>= 0, r = void 0 === r ? this.length : r >>> 0, e || (e = 0), "number" == typeof e)
                        for (o = t; o < r; ++o) this[o] = e;
                    else {
                        var i = u.isBuffer(e) ? e : u.from(e, n),
                            l = i.length;
                        if (0 === l) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (o = 0; o < r - t; ++o) this[o + t] = i[o % l]
                    }
                    return this
                };
                var j = /[^+/0-9A-Za-z-_]/g;

                function I(e, t) {
                    t = t || 1 / 0;
                    for (var r, n = e.length, o = null, a = [], i = 0; i < n; ++i) {
                        if ((r = e.charCodeAt(i)) > 55295 && r < 57344) {
                            if (!o) {
                                if (r > 56319 || i + 1 === n) {
                                    (t -= 3) > -1 && a.push(239, 191, 189);
                                    continue
                                }
                                o = r;
                                continue
                            }
                            if (r < 56320) {
                                (t -= 3) > -1 && a.push(239, 191, 189), o = r;
                                continue
                            }
                            r = (o - 55296 << 10 | r - 56320) + 65536
                        } else o && (t -= 3) > -1 && a.push(239, 191, 189);
                        if (o = null, r < 128) {
                            if ((t -= 1) < 0) break;
                            a.push(r)
                        } else if (r < 2048) {
                            if ((t -= 2) < 0) break;
                            a.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((t -= 3) < 0) break;
                            a.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((t -= 4) < 0) break;
                            a.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return a
                }

                function x(e) {
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

                function C(e, t) {
                    return (null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var k = function() {
                    for (var e = "0123456789abcdef", t = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, o = 0; o < 16; ++o) t[n + o] = e[r] + e[o];
                    return t
                }()
            },
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
                        for (var e = "", a = 0; a < arguments.length; a++) {
                            var i = arguments[a];
                            i && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var a = "";
                                for (var i in e) r.call(e, i) && e[i] && (a = o(a, i));
                                return a
                            }(i)))
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
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, r, n, o) {
                    var a, i, l = 8 * o - n - 1,
                        u = (1 << l) - 1,
                        c = u >> 1,
                        s = -7,
                        f = r ? o - 1 : 0,
                        p = r ? -1 : 1,
                        d = e[t + f];
                    for (f += p, a = d & (1 << -s) - 1, d >>= -s, s += l; s > 0; a = 256 * a + e[t + f], f += p, s -= 8);
                    for (i = a & (1 << -s) - 1, a >>= -s, s += n; s > 0; i = 256 * i + e[t + f], f += p, s -= 8);
                    if (0 === a) a = 1 - c;
                    else {
                        if (a === u) return i ? NaN : 1 / 0 * (d ? -1 : 1);
                        i += Math.pow(2, n), a -= c
                    }
                    return (d ? -1 : 1) * i * Math.pow(2, a - n)
                }, t.write = function(e, t, r, n, o, a) {
                    var i, l, u, c = 8 * a - o - 1,
                        s = (1 << c) - 1,
                        f = s >> 1,
                        p = 5960464477539062e-23 * (23 === o),
                        d = n ? 0 : a - 1,
                        h = n ? 1 : -1,
                        y = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (l = +!!isNaN(t), i = s) : (i = Math.floor(Math.log(t) / Math.LN2), t * (u = Math.pow(2, -i)) < 1 && (i--, u *= 2), i + f >= 1 ? t += p / u : t += p * Math.pow(2, 1 - f), t * u >= 2 && (i++, u /= 2), i + f >= s ? (l = 0, i = s) : i + f >= 1 ? (l = (t * u - 1) * Math.pow(2, o), i += f) : (l = t * Math.pow(2, f - 1) * Math.pow(2, o), i = 0)); o >= 8; e[r + d] = 255 & l, d += h, l /= 256, o -= 8);
                    for (i = i << o | l, c += o; c > 0; e[r + d] = 255 & i, d += h, i /= 256, c -= 8);
                    e[r + d - h] |= 128 * y
                }
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, o, a = {
                        exports: {}
                    },
                    i = a.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function u() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    r = l
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : u
                } catch (e) {
                    n = u
                }

                function c(e) {
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

                function d() {
                    f && o && (f = !1, o.length ? s = o.concat(s) : p = -1, s.length && h())
                }

                function h() {
                    if (!f) {
                        var e = c(d);
                        f = !0;
                        for (var t = s.length; t;) {
                            for (o = s, s = []; ++p < t;) o && o[p].run();
                            p = -1, t = s.length
                        }
                        o = null, f = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === u || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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
                i.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new y(e, t)), 1 !== s.length || f || c(h)
                }, y.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, i.title = "browser", i.browser = !0, i.env = {}, i.argv = [], i.version = "", i.versions = {}, i.on = m, i.addListener = m, i.once = m, i.off = m, i.removeListener = m, i.removeAllListeners = m, i.emit = m, i.prependListener = m, i.prependOnceListener = m, i.listeners = function(e) {
                    return []
                }, i.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, i.cwd = function() {
                    return "/"
                }, i.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, i.umask = function() {
                    return 0
                };
                var v = a.exports.browser,
                    g = a.exports.binding,
                    w = {},
                    O = "browser",
                    S = "browser",
                    P = "browser",
                    E = [],
                    A = {
                        nextTick: a.exports.nextTick,
                        title: a.exports.title,
                        browser: v,
                        env: a.exports.env,
                        argv: a.exports.argv,
                        version: a.exports.version,
                        versions: a.exports.versions,
                        on: a.exports.on,
                        addListener: a.exports.addListener,
                        once: a.exports.once,
                        off: a.exports.off,
                        removeListener: a.exports.removeListener,
                        removeAllListeners: a.exports.removeAllListeners,
                        emit: a.exports.emit,
                        emitWarning: b,
                        prependListener: a.exports.prependListener,
                        prependOnceListener: a.exports.prependOnceListener,
                        listeners: a.exports.listeners,
                        binding: g,
                        cwd: a.exports.cwd,
                        chdir: a.exports.chdir,
                        umask: a.exports.umask,
                        exit: b,
                        pid: 1,
                        features: w,
                        kill: b,
                        dlopen: b,
                        uptime: b,
                        memoryUsage: b,
                        uvCounters: b,
                        platform: O,
                        arch: S,
                        execPath: P,
                        execArgv: E
                    };
                t.addListener = a.exports.addListener, t.arch = S, t.argv = a.exports.argv, t.binding = g, t.browser = v, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = A, t.dlopen = b, t.emit = a.exports.emit, t.emitWarning = b, t.env = a.exports.env, t.execArgv = E, t.execPath = P, t.exit = b, t.features = w, t.kill = b, t.listeners = a.exports.listeners, t.memoryUsage = b, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = O, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = b, t.uvCounters = b, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = A
            },
            848: function(e, t, r) {
                "use strict";
                var n = r(564).Buffer;

                function o(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var a = void 0 !== n,
                    i = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    l = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function u(e, t, r) {
                    null == r && null !== t && (void 0 === t ? "undefined" : o(t)) === "object" && (r = t, t = void 0), a && n.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var u = JSON.parse(e, t);
                    if (null === u || (void 0 === u ? "undefined" : o(u)) !== "object") return u;
                    var s = r && r.protoAction || "error",
                        f = r && r.constructorAction || "error";
                    if ("ignore" === s && "ignore" === f) return u;
                    if ("ignore" !== s && "ignore" !== f) {
                        if (!1 === i.test(e) && !1 === l.test(e)) return u
                    } else if ("ignore" !== s && "ignore" === f) {
                        if (!1 === i.test(e)) return u
                    } else if (!1 === l.test(e)) return u;
                    return c(u, {
                        protoAction: s,
                        constructorAction: f,
                        safe: r && r.safe
                    })
                }

                function c(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = t.protoAction, n = void 0 === r ? "error" : r, a = t.constructorAction, i = void 0 === a ? "error" : a, l = t.safe, u = [e]; u.length;) {
                        var c = u;
                        u = [];
                        var s = !0,
                            f = !1,
                            p = void 0;
                        try {
                            for (var d, h = c[Symbol.iterator](); !(s = (d = h.next()).done); s = !0) {
                                var y = d.value;
                                if ("ignore" !== n && Object.prototype.hasOwnProperty.call(y, "__proto__")) {
                                    if (!0 === l) return null;
                                    if ("error" === n) throw SyntaxError("Object contains forbidden prototype property");
                                    delete y.__proto__
                                }
                                if ("ignore" !== i && Object.prototype.hasOwnProperty.call(y, "constructor") && null !== y.constructor && "object" === o(y.constructor) && Object.prototype.hasOwnProperty.call(y.constructor, "prototype")) {
                                    if (!0 === l) return null;
                                    if ("error" === i) throw SyntaxError("Object contains forbidden prototype property");
                                    delete y.constructor
                                }
                                for (var m in y) {
                                    var b = y[m];
                                    b && (void 0 === b ? "undefined" : o(b)) === "object" && u.push(b)
                                }
                            }
                        } catch (e) {
                            f = !0, p = e
                        } finally {
                            try {
                                s || null == h.return || h.return()
                            } finally {
                                if (f) throw p
                            }
                        }
                    }
                    return e
                }

                function s(e, t, r) {
                    var n = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return u(e, t, r)
                    } finally {
                        Error.stackTraceLimit = n
                    }
                }
                e.exports = s, e.exports.default = s, e.exports.parse = s, e.exports.safeParse = function(e, t) {
                    var r = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return u(e, t, {
                            safe: !0
                        })
                    } catch (e) {
                        return
                    } finally {
                        Error.stackTraceLimit = r
                    }
                }, e.exports.scan = c
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var a = t[n] = {
            exports: {}
        };
        return e[n](a, a.exports, r), a.exports
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
            var e, t, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v, g, w, O, S, P, E, A, j, I, x, T, C, k, N, D, R, _, L, U, B, M, F, H, G, z = window.jQuery,
                V = r.n(z),
                W = window.Roblox,
                q = window.React,
                K = r.n(q),
                $ = window.TanstackQuery,
                Z = window.Roblox["core-scripts"].environmentUrls,
                Y = r.n(Z),
                X = window.Roblox["core-lib"].http.index,
                J = window.Roblox["core-lib"].url.index,
                Q = function() {
                    return J.Url.parse(Y().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                ee = function(e, t, r) {
                    try {
                        X.postUntyped(e().withSearchParams(function(e) {
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
                            name: t
                        }, r)), "", {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e4)
                        })
                    } catch (e) {}
                },
                et = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    t.forEach(function(e) {
                        ee(Q, e)
                    })
                },
                er = window.Roblox["core-scripts"].http.http,
                en = window.Roblox["core-scripts"].dataStore,
                eo = r.n(en),
                ea = window.Roblox["core-scripts"].guac;

            function ei(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function el(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ei(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ei(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function eu(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ec = eo().gamesDataStore,
                es = function() {
                    return el(function() {
                        return eu(this, function(e) {
                            return [2, (0, ea.callBehaviour)("play-button-ui")]
                        })
                    })()
                },
                ef = function() {
                    var e = {
                        url: "".concat(Y().apiGatewayUrl, "/user-settings-api/v1/user-settings/settings-and-options"),
                        withCredentials: !0
                    };
                    return er.get(e).then(function(e) {
                        return e.data
                    })
                },
                ep = function(e) {
                    var t = {
                        url: "".concat(Y().apiGatewayUrl, "/experience-guidelines-api/experience-guidelines/get-age-recommendation"),
                        withCredentials: !0
                    };
                    return er.post(t, {
                        universeId: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                ed = function(e, t) {
                    var r = {
                        url: "".concat(Y().apiGatewayUrl, "/fiat-paid-access-service/v1/purchase"),
                        withCredentials: !0,
                        retryable: !0
                    };
                    return er.post(r, {
                        rootPlaceId: e,
                        expectedBasePriceId: t
                    }).then(function(e) {
                        var t, r;
                        return null != (r = JSON.parse(null != (t = e.data.checkoutUrl) ? t : "").checkoutUrl) ? r : ""
                    })
                },
                eh = {
                    UnplayableOtherReason: "UnplayableOtherReason",
                    Playable: "Playable",
                    GuestProhibited: "GuestProhibited",
                    GameUnapproved: "GameUnapproved",
                    IncorrectConfiguration: "IncorrectConfiguration",
                    UniverseRootPlaceIsPrivate: "UniverseRootPlaceIsPrivate",
                    InsufficientPermissionFriendsOnly: "InsufficientPermissionFriendsOnly",
                    InsufficientPermissionGroupOnly: "InsufficientPermissionGroupOnly",
                    DeviceRestricted: "DeviceRestricted",
                    UnderReview: "UnderReview",
                    PurchaseRequired: "PurchaseRequired",
                    AccountRestricted: "AccountRestricted",
                    TemporarilyUnavailable: "TemporarilyUnavailable",
                    ComplianceBlocked: "ComplianceBlocked",
                    ContextualPlayabilityRegionalAvailability: "ContextualPlayabilityRegionalAvailability",
                    ContextualPlayabilityRegionalCompliance: "ContextualPlayabilityRegionalCompliance",
                    ContextualPlayabilityAgeRecommendationParentalControls: "ContextualPlayabilityAgeRecommendationParentalControls",
                    ContextualPlayabilityAgeGated: "ContextualPlayabilityAgeGated",
                    PlaceHasNoPublishedVersion: "PlaceHasNoPublishedVersion",
                    ContextualPlayabilityUnverifiedSeventeenPlusUser: "ContextualPlayabilityUnverifiedSeventeenPlusUser",
                    FiatPurchaseRequired: "FiatPurchaseRequired",
                    ContextualPlayabilityUnrated: "ContextualPlayabilityUnrated",
                    ContextualPlayabilityAgeGatedByDescriptor: "ContextualPlayabilityAgeGatedByDescriptor",
                    ContextualPlayabilityExperienceBlockedParentalControls: "ContextualPlayabilityExperienceBlockedParentalControls",
                    ContextualPlayabilityRequireParentApproval: "ContextualPlayabilityRequireParentApproval",
                    ContextualPlayabilityCoreGated: "ContextualPlayabilityCoreGated",
                    ContextualPlayabilityAgeCheckRequired: "ContextualPlayabilityAgeCheckRequired",
                    ContextualPlayabilityPlaytestDisabled: "ContextualPlayabilityPlaytestDisabled",
                    ContextualPlayabilityTrustedFriendRequired: "ContextualPlayabilityTrustedFriendRequired",
                    FiatPurchaseDeviceRestricted: "FiatPurchaseDeviceRestricted"
                };

            function ey(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var em = (ey(R = {}, eh.UnplayableOtherReason, "UnplayableError.UnplayableOther"), ey(R, eh.TemporarilyUnavailable, "UnplayableError.TemporarilyUnavailable"), ey(R, eh.GameUnapproved, "UnplayableError.GameUnapproved"), ey(R, eh.IncorrectConfiguration, "UnplayableError.IncorrectConfiguration"), ey(R, eh.UniverseRootPlaceIsPrivate, "UnplayableError.CreatorHasntMadeAvailable"), ey(R, eh.InsufficientPermissionFriendsOnly, "UnplayableError.CreatorHasntMadeAvailable"), ey(R, eh.InsufficientPermissionGroupOnly, "UnplayableError.CreatorHasntMadeAvailable"), ey(R, eh.DeviceRestricted, "UnplayableError.DeviceRestrictedDefault"), ey(R, eh.FiatPurchaseDeviceRestricted, "UnplayableError.FiatPurchaseDeviceRestricted"), ey(R, eh.UnderReview, "UnplayableError.Moderated"), ey(R, eh.AccountRestricted, "UnplayableError.AccountRestricted"), ey(R, eh.ComplianceBlocked, "UnplayableError.ComplianceBlocked"), ey(R, eh.ContextualPlayabilityRegionalAvailability, "UnplayableError.ContextualPlayabilityRegionalAvailability"), ey(R, eh.ContextualPlayabilityRegionalCompliance, "UnplayableError.ContextualPlayabilityRegionalCompliance"), ey(R, eh.ContextualPlayabilityAgeRecommendationParentalControls, "UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls"), ey(R, eh.ContextualPlayabilityAgeGated, "UnplayableError.ContextualPlayabilityAgeGated"), ey(R, eh.PlaceHasNoPublishedVersion, "UnplayableError.CreatorHasntMadeAvailable"), ey(R, eh.ContextualPlayabilityUnrated, "UnplayableError.ContextualPlayabilityUnrated"), ey(R, eh.ContextualPlayabilityAgeGatedByDescriptor, "UnplayableError.ContextualPlayabilityAgeGatedByDescriptor"), ey(R, eh.ContextualPlayabilityExperienceBlockedParentalControls, "UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls"), ey(R, eh.ContextualPlayabilityRequireParentApproval, "UnplayableError.ContextualPlayabilityRequireParentApproval"), R),
                eb = "PlayButtonMessage.AgreeToNotice",
                ev = "PlayButtonText.Unlock",
                eg = "PlayButtonText.Unavailable",
                ew = "PlayButtonText.Buy",
                eO = "PlayButtonText.PlayDemo",
                eS = "PlayButtonText.PlayOnWeb",
                eP = function(e, t) {
                    var r, n;
                    return {
                        eventName: "playGameClicked",
                        ctx: "click",
                        properties: (r = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    ey(e, t, r[t])
                                })
                            }
                            return e
                        }({}, t), n = n = {
                            placeId: e
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(n)).forEach(function(e) {
                            Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                        }), r),
                        gamePlayIntentEventCtx: "PlayButton"
                    }
                },
                eE = {
                    ActionNeeded: "ActionNeededButtonShown",
                    Unplayable: "UnplayableErrorShown",
                    SeventeenPlusInPlayable: "ReachedSeventeenPlusCaseInPlayable",
                    PlayButtonUpsellSelfUpdateSettingTriggered: "PlayButtonUpsellSelfUpdateSettingTriggered",
                    PlayButtonUpsellAskYourParentTriggered: "PlayButtonUpsellAskYourParentTriggered",
                    PlayButtonUpsellRestrictedUnplayableTriggered: "PlayButtonUpsellRestrictedUnplayableTriggered",
                    PlayButtonUpsellAgeRestrictionVerificationTriggered: "PlayButtonUpsellAgeRestrictionVerificationTriggered",
                    PlayButtonUpsellUnknownSettingOrAge: "PlayButtonUpsellUnknownSettingOrAge",
                    PlayButtonUpsellMinimalMaturityRating: "PlayButtonUpsellMinimalMaturityRating",
                    PlayButtonUpsellAgeNotInMapping: "PlayButtonUpsellAgeNotInMapping",
                    PlayButtonUpsellParentalConsentError: "PlayButtonUpsellParentalConsentError",
                    PlayButtonUpsellAgeRestrictionVerificationError: "PlayButtonUpsellAgeRestrictionVerificationError",
                    PlayButtonUpsellUnknownRequirement: "PlayButtonUpsellUnknownRequirement",
                    PlayButtonUpsellExperienceApprovalTriggered: "PlayButtonUpsellExperienceApprovalTriggered",
                    PlayButtonUpsellExperienceApprovalError: "PlayButtonUpsellExperienceApprovalError",
                    PreparePurchaseUrlError: "PreparePurchaseUrlError",
                    PlayButtonShowIdentificationError: "PlayButtonShowIdentificationIssueCaught",
                    PlayabilityStatusFetchInvalidUniverseId: "PlayabilityStatusFetchInvalidUniverseId",
                    PlayabilityStatusFetchInvalidResponse: "PlayabilityStatusFetchInvalidResponse",
                    PlayabilityStatusFetchFailed: "PlayabilityStatusFetchFailed",
                    PlayableUxTreatmentMalformedData: "PlayableUxTreatmentMalformedData",
                    PlayableUxTreatmentUnknownTreatment: "PlayableUxTreatmentUnknownTreatment",
                    PlayableUxTreatmentPlayabilityStatusStillLoading: "PlayableUxTreatmentPlayabilityStatusStillLoading"
                },
                eA = {
                    eventName: "unlockPlayIntent",
                    ageCheckUpsellName: "AgeCheckRequired",
                    gameLaunchFallbackUpsellName: "GameLaunch",
                    restrictedUnplayableUpsellName: "RestrictedUnplayableOptionNotFound",
                    unverifiedSeventeenPlusUpsellName: "AgeVerificationUnverifiedSeventeenPlusUser",
                    fiatPurchaseUpsellName: "FiatPurchase",
                    reconfirmLaunchModalUpsellName: "ReconfirmLaunchModal",
                    experienceApprovalUpsellName: "ExperienceApproval",
                    updatePlaytestSettingsUpsellName: "UpdatePlaytestSettings",
                    trustedFriendRequiredUpsellName: "TrustedFriendRequired"
                },
                ej = "gameJoinAgeCheckRequired",
                eI = "gameJoinContentMaturityLock",
                ex = {
                    settingChange: "account_management/SettingsChange",
                    accountManagement: "account_management/AccountManagement"
                };

            function eT(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var eC = {
                    playabilityStatus: eh.TemporarilyUnavailable,
                    isPlayable: void 0,
                    unplayableDisplayText: void 0,
                    playableUxTreatment: void 0,
                    upsellUxTreatment: void 0,
                    demoModeAvailable: void 0,
                    privatePlaytestInfo: void 0
                },
                ek = function(e) {
                    var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                        r = (0, $.useQuery)({
                            queryKey: ["playabilityStatus", e],
                            queryFn: function() {
                                var t;
                                return (t = function() {
                                    var t, r;
                                    return function(e, t) {
                                        var r, n, o, a = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & o[0]) throw o[1];
                                                    return o[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                            l = Object.defineProperty;
                                        return l(i, "next", {
                                            value: u(0)
                                        }), l(i, "throw", {
                                            value: u(1)
                                        }), l(i, "return", {
                                            value: u(2)
                                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                            value: function() {
                                                return this
                                            }
                                        }), i;

                                        function u(l) {
                                            return function(u) {
                                                var c = [l, u];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                        case 0:
                                                        case 1:
                                                            o = c;
                                                            break;
                                                        case 4:
                                                            return a.label++, {
                                                                value: c[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            a.label++, n = c[1], c = [0];
                                                            continue;
                                                        case 7:
                                                            c = a.ops.pop(), a.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                a = 0;
                                                                continue
                                                            }
                                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                                a.label = c[1];
                                                                break
                                                            }
                                                            if (6 === c[0] && a.label < o[1]) {
                                                                a.label = o[1], o = c;
                                                                break
                                                            }
                                                            if (o && a.label < o[2]) {
                                                                a.label = o[2], a.ops.push(c);
                                                                break
                                                            }
                                                            o[2] && a.ops.pop(), a.trys.pop();
                                                            continue
                                                    }
                                                    c = t.call(e, a)
                                                } catch (e) {
                                                    c = [6, e], n = 0
                                                } finally {
                                                    r = o = 0
                                                }
                                                if (5 & c[0]) throw c[1];
                                                return {
                                                    value: c[0] ? c[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                if (!e) throw et(eE.PlayabilityStatusFetchInvalidUniverseId), Error("Invalid universe ID for playability status fetch");
                                                n.label = 1;
                                            case 1:
                                                var o;
                                                return n.trys.push([1, 3, , 4]), [4, (o = [e], el(function() {
                                                    var e;
                                                    return eu(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, ec.getPlayabilityStatus(o)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())];
                                            case 2:
                                                return r = n.sent(), [3, 4];
                                            case 3:
                                                throw n.sent(), et(eE.PlayabilityStatusFetchFailed), Error("Playability status fetch failed");
                                            case 4:
                                                if (!(null == r ? void 0 : r.playabilityStatus) || void 0 === r.isPlayable) throw et(eE.PlayabilityStatusFetchInvalidResponse), Error("Invalid playability status response");
                                                return [2, {
                                                    playabilityStatus: r.playabilityStatus,
                                                    isPlayable: r.isPlayable,
                                                    unplayableDisplayText: r.unplayableDisplayText,
                                                    playableUxTreatment: r.playableUxTreatment,
                                                    upsellUxTreatment: r.upsellUxTreatment,
                                                    demoModeAvailable: r.demoModeAvailable,
                                                    privatePlaytestInfo: null != (t = r.privatePlaytestInfo) ? t : void 0
                                                }]
                                        }
                                    })
                                }, function() {
                                    var e = this,
                                        r = arguments;
                                    return new Promise(function(n, o) {
                                        var a = t.apply(e, r);

                                        function i(e) {
                                            eT(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            eT(a, n, o, i, l, "throw", e)
                                        }
                                        i(void 0)
                                    })
                                })()
                            },
                            staleTime: 3e4,
                            enabled: t
                        }),
                        n = r.data,
                        o = r.isFetching,
                        a = r.isError,
                        i = r.refetch,
                        l = (0, q.useCallback)(function() {
                            i()
                        }, [i]);
                    return (0, q.useEffect)(function() {
                        var e = function(e) {
                            e.persisted && t && l()
                        };
                        return window.addEventListener("pageshow", e),
                            function() {
                                window.removeEventListener("pageshow", e)
                            }
                    }, [l, t]), (0, q.useMemo)(function() {
                        return a ? {
                            playabilityStatus: eC.playabilityStatus,
                            isPlayable: eC.isPlayable,
                            unplayableDisplayText: eC.unplayableDisplayText,
                            playableUxTreatment: eC.playableUxTreatment,
                            upsellUxTreatment: eC.upsellUxTreatment,
                            demoModeAvailable: eC.demoModeAvailable,
                            privatePlaytestInfo: eC.privatePlaytestInfo,
                            isFetchingPlayability: o,
                            refetchPlayabilityData: l
                        } : {
                            playabilityStatus: null == n ? void 0 : n.playabilityStatus,
                            isPlayable: null == n ? void 0 : n.isPlayable,
                            unplayableDisplayText: null == n ? void 0 : n.unplayableDisplayText,
                            playableUxTreatment: null == n ? void 0 : n.playableUxTreatment,
                            upsellUxTreatment: null == n ? void 0 : n.upsellUxTreatment,
                            demoModeAvailable: null == n ? void 0 : n.demoModeAvailable,
                            privatePlaytestInfo: null == n ? void 0 : n.privatePlaytestInfo,
                            isFetchingPlayability: o,
                            refetchPlayabilityData: l
                        }
                    }, [n, a, o, l])
                },
                eN = window.Roblox["core-scripts"].endpoints,
                eD = window.Roblox["core-scripts"].game,
                eR = window.Roblox["core-scripts"].eventStream,
                e_ = window.Roblox["core-scripts"].util.url,
                eL = "function" == typeof crypto.randomUUID,
                eU = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                eB = function() {
                    return eL ? crypto.randomUUID() : eU()
                },
                eM = window.Roblox["core-scripts"].meta.device,
                eF = function(e, t, r) {
                    return new Promise(function(n) {
                        var o = new CustomEvent(e, {
                            cancelable: !0,
                            detail: t(n)
                        });
                        window.dispatchEvent(o) && n(r)
                    })
                },
                eH = function() {
                    return null
                },
                eG = globalThis.window,
                ez = globalThis.navigator,
                eV = void 0 === eG ? void 0 : eG,
                eW = null == eV || void 0 === ez ? void 0 : ez,
                eq = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null == eW ? void 0 : eW.userAgent;
                    if (void 0 !== e) {
                        if (null !== /Edge\/([0-9._]+)/.exec(e) || null !== /EdgA?\/([0-9.]+)/.exec(e)) return "edge";
                        if (null !== /(?!Chrom.*OPR)Chrom(?:e|ium)\/([0-9.]+)(:?\s|$)/.exec(e)) return "chrome";
                        if (null !== /Firefox\/([0-9.]+)(?:\s|$)/.exec(e)) return "firefox";
                        if (null !== /Opera\/([0-9.]+)(?:\s|$)/.exec(e) || null !== /OPR\/([0-9.]+)(:?\s|$)/.exec(e)) return "opera";
                        if (null !== /Trident\/7\.0.*rv:([0-9.]+).*\).*Gecko$/.exec(e) || null !== /MSIE\s([0-9.]+);.*Trident\/[4-7].0/.exec(e) || null !== /MSIE\s(7\.0)/.exec(e)) return "ie";
                        if (null !== /Version\/([0-9._]+).*Safari/.exec(e)) return "safari"
                    }
                    return ""
                };

            function eK(e, t, r) {
                return t = eY(t),
                    function(e, t) {
                        var r;
                        if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, e0() ? Reflect.construct(t, r || [], eY(e).constructor) : t.apply(e, r))
            }

            function e$(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function eZ(e, t, r) {
                return (eZ = e0() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && eJ(o, r.prototype), o
                }).apply(null, arguments)
            }

            function eY(e) {
                return (eY = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eX(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && eJ(e, t)
            }

            function eJ(e, t) {
                return (eJ = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function eQ(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (eQ = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return eZ(e, arguments, eY(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), eJ(r, e)
                })(e)
            }

            function e0() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (e0 = function() {
                    return !!e
                })()
            }

            function e1(e, t, r) {
                function n(r, n) {
                    var o, a;
                    for (var l in Object.defineProperty(r, "_zod", {
                            value: null != (o = r._zod) ? o : {},
                            enumerable: !1
                        }), null != (a = r._zod).traits || (a.traits = new Set), r._zod.traits.add(e), t(r, n), i.prototype) l in r || Object.defineProperty(r, l, {
                        value: i.prototype[l].bind(r)
                    });
                    r._zod.constr = i, r._zod.def = n
                }
                var o, a = function(e) {
                    function t() {
                        return e$(this, t), eK(this, t, arguments)
                    }
                    return eX(t, e), t
                }(null != (o = null == r ? void 0 : r.Parent) ? o : Object);

                function i(e) {
                    var t = (null == r ? void 0 : r.Parent) ? new a : this;
                    n(t, e), null != (c = t._zod).deferred || (c.deferred = []);
                    var o = !0,
                        i = !1,
                        l = void 0;
                    try {
                        for (var u, c, s, f = t._zod.deferred[Symbol.iterator](); !(o = (s = f.next()).done); o = !0)(0, s.value)()
                    } catch (e) {
                        i = !0, l = e
                    } finally {
                        try {
                            o || null == f.return || f.return()
                        } finally {
                            if (i) throw l
                        }
                    }
                    return t
                }
                return Object.defineProperty(a, "name", {
                    value: e
                }), Object.defineProperty(i, "init", {
                    value: n
                }), Object.defineProperty(i, Symbol.hasInstance, {
                    value: function(t) {
                        var n, o, a;
                        return null != r && !!r.Parent && (null != (a = r.Parent) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](t) : t instanceof a) || (null == t || null == (o = t._zod) || null == (n = o.traits) ? void 0 : n.has(e))
                    }
                }), Object.defineProperty(i, "name", {
                    value: e
                }), i
            }
            Object.freeze({
                status: "aborted"
            }), Symbol("zod_brand");
            var e2 = function(e) {
                function t() {
                    return e$(this, t), eK(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                }
                return eX(t, e), t
            }(eQ(Error));
            eQ(Error);
            var e3 = {};

            function e6(e) {
                return e && Object.assign(e3, e), e3
            }

            function e5(e) {
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

            function e8(e, t) {
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

            function e4(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function e7(e, t) {
                return (void 0 === t ? "undefined" : e4(t)) === "bigint" ? t.toString() : t
            }

            function e9(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }

            function te(e) {
                var t = +!!e.startsWith("^"),
                    r = e.endsWith("$") ? e.length - 1 : e.length;
                return e.slice(t, r)
            }
            var tt = Symbol("evaluating");

            function tr(e, t, r) {
                var n = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (n !== tt) return void 0 === n && (n = tt, n = r()), n
                    },
                    set: function(r) {
                        Object.defineProperty(e, t, {
                            value: r
                        })
                    },
                    configurable: !0
                })
            }
            var tn = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r]
            };

            function to(e) {
                return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
            }

            function ta(e) {
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
                return (delete e.message, "string" == typeof e.error) ? e8(e5({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function ti(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var n = r; n < e.issues.length; n++)
                    if ((null == (t = e.issues[n]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function tl(e, t) {
                return t.map(function(t) {
                    return null != t.path || (t.path = []), t.path.unshift(e), t
                })
            }

            function tu(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function tc(e, t, r) {
                var n, o, a, i, l, u, c, s, f, p, d, h = e8(e5({}, e), {
                    path: null != (n = e.path) ? n : []
                });
                return e.message || (h.message = null != (o = null != (a = null != (i = null != (l = tu(null == (s = e.inst) || null == (c = s._zod.def) || null == (u = c.error) ? void 0 : u.call(c, e))) ? l : tu(null == t || null == (f = t.error) ? void 0 : f.call(t, e))) ? i : tu(null == (p = r.customError) ? void 0 : p.call(r, e))) ? a : tu(null == (d = r.localeError) ? void 0 : d.call(r, e))) ? o : "Invalid input"), delete h.inst, delete h.continue, (null == t ? void 0 : t.reportInput) || delete h.input, h
            }
            e9(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var ts = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, e7, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                tf = e1("$ZodError", ts),
                tp = e1("$ZodError", ts, {
                    Parent: Error
                });

            function td(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function th(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            td(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            td(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ty(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function tm(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tb = (e = tp, function(t, r, n, o) {
                    var a = n ? Object.assign(n, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        i = t._zod.run({
                            value: r,
                            issues: []
                        }, a);
                    if (ty(i, Promise)) throw new e2;
                    if (i.issues.length) {
                        var l, u = new(null != (l = null == o ? void 0 : o.Err) ? l : e)(i.issues.map(function(e) {
                            return tc(e, a, e6())
                        }));
                        throw tn(u, null == o ? void 0 : o.callee), u
                    }
                    return i.value
                }),
                tv = (t = tp, function(e, r, n, o) {
                    return th(function() {
                        var a, i, l, u;
                        return tm(this, function(c) {
                            switch (c.label) {
                                case 0:
                                    if (a = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, !ty(i = e._zod.run({
                                            value: r,
                                            issues: []
                                        }, a), Promise)) return [3, 2];
                                    return [4, i];
                                case 1:
                                    i = c.sent(), c.label = 2;
                                case 2:
                                    if (i.issues.length) throw tn(u = new(null != (l = null == o ? void 0 : o.Err) ? l : t)(i.issues.map(function(e) {
                                        return tc(e, a, e6())
                                    })), null == o ? void 0 : o.callee), u;
                                    return [2, i.value]
                            }
                        })
                    })()
                }),
                tg = (n = tp, function(e, t, r) {
                    var o, a, i = r ? (o = function(e) {
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
                        }({}, r), a = a = {
                            async: !1
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(o, Object.getOwnPropertyDescriptors(a)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(a)).forEach(function(e) {
                            Object.defineProperty(o, e, Object.getOwnPropertyDescriptor(a, e))
                        }), o) : {
                            async: !1
                        },
                        l = e._zod.run({
                            value: t,
                            issues: []
                        }, i);
                    if (ty(l, Promise)) throw new e2;
                    return l.issues.length ? {
                        success: !1,
                        error: new(null != n ? n : tf)(l.issues.map(function(e) {
                            return tc(e, i, e6())
                        }))
                    } : {
                        success: !0,
                        data: l.value
                    }
                }),
                tw = (o = tp, function(e, t, r) {
                    return th(function() {
                        var n, a;
                        return tm(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (n = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, !ty(a = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, n), Promise)) return [3, 2];
                                    return [4, a];
                                case 1:
                                    a = i.sent(), i.label = 2;
                                case 2:
                                    return [2, a.issues.length ? {
                                        success: !1,
                                        error: new o(a.issues.map(function(e) {
                                            return tc(e, n, e6())
                                        }))
                                    } : {
                                        success: !0,
                                        data: a.value
                                    }]
                            }
                        })
                    })()
                });
            RegExp('^[^\\s@"]{1,64}@[^\\s@]{1,255}$', "u");
            var tO = function(e) {
                    var t, r, n = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (r = null == e ? void 0 : e.maximum) ? r : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(n, "$"))
                },
                tS = {
                    major: 4,
                    minor: 1,
                    patch: 11
                };

            function tP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tE(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tA(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function tj(e) {
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

            function tI(e, t) {
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

            function tx(e) {
                return function(e) {
                    if (Array.isArray(e)) return tP(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tP(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tP(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tT = e1("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = tS;
                    var r, n = tx(null != (l = e._zod.def.checks) ? l : []);
                    e._zod.traits.has("$ZodCheck") && n.unshift(e);
                    var o = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var l, u, c, s = n[Symbol.iterator](); !(o = (c = s.next()).done); o = !0) {
                            var f = c.value,
                                p = !0,
                                d = !1,
                                h = void 0;
                            try {
                                for (var y, m = f._zod.onattach[Symbol.iterator](); !(p = (y = m.next()).done); p = !0)(0, y.value)(e)
                            } catch (e) {
                                d = !0, h = e
                            } finally {
                                try {
                                    p || null == m.return || m.return()
                                } finally {
                                    if (d) throw h
                                }
                            }
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            o || null == s.return || s.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    if (0 === n.length) null != (u = e._zod).deferred || (u.deferred = []), null == (r = e._zod.deferred) || r.push(function() {
                        e._zod.run = e._zod.parse
                    });
                    else {
                        var b = function(e, t, r) {
                                var n = ti(e),
                                    o = !0,
                                    a = !1,
                                    i = void 0;
                                try {
                                    for (var l, u, c = t[Symbol.iterator](); !(o = (u = c.next()).done); o = !0) ! function() {
                                        var t = u.value;
                                        if (t._zod.def.when) {
                                            if (!t._zod.def.when(e)) return
                                        } else if (n) return;
                                        var o = e.issues.length,
                                            a = t._zod.check(e);
                                        if (tA(a, Promise) && (null == r ? void 0 : r.async) === !1) throw new e2;
                                        if (l || tA(a, Promise)) l = (null != l ? l : Promise.resolve()).then(function() {
                                            var t;
                                            return (t = function() {
                                                return function(e, t) {
                                                    var r, n, o, a = {
                                                            label: 0,
                                                            sent: function() {
                                                                if (1 & o[0]) throw o[1];
                                                                return o[1]
                                                            },
                                                            trys: [],
                                                            ops: []
                                                        },
                                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                                        l = Object.defineProperty;
                                                    return l(i, "next", {
                                                        value: u(0)
                                                    }), l(i, "throw", {
                                                        value: u(1)
                                                    }), l(i, "return", {
                                                        value: u(2)
                                                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                                        value: function() {
                                                            return this
                                                        }
                                                    }), i;

                                                    function u(l) {
                                                        return function(u) {
                                                            var c = [l, u];
                                                            if (r) throw TypeError("Generator is already executing.");
                                                            for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                                                if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                                switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                                    case 0:
                                                                    case 1:
                                                                        o = c;
                                                                        break;
                                                                    case 4:
                                                                        return a.label++, {
                                                                            value: c[1],
                                                                            done: !1
                                                                        };
                                                                    case 5:
                                                                        a.label++, n = c[1], c = [0];
                                                                        continue;
                                                                    case 7:
                                                                        c = a.ops.pop(), a.trys.pop();
                                                                        continue;
                                                                    default:
                                                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                            a = 0;
                                                                            continue
                                                                        }
                                                                        if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                                            a.label = c[1];
                                                                            break
                                                                        }
                                                                        if (6 === c[0] && a.label < o[1]) {
                                                                            a.label = o[1], o = c;
                                                                            break
                                                                        }
                                                                        if (o && a.label < o[2]) {
                                                                            a.label = o[2], a.ops.push(c);
                                                                            break
                                                                        }
                                                                        o[2] && a.ops.pop(), a.trys.pop();
                                                                        continue
                                                                }
                                                                c = t.call(e, a)
                                                            } catch (e) {
                                                                c = [6, e], n = 0
                                                            } finally {
                                                                r = o = 0
                                                            }
                                                            if (5 & c[0]) throw c[1];
                                                            return {
                                                                value: c[0] ? c[1] : void 0,
                                                                done: !0
                                                            }
                                                        }
                                                    }
                                                }(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, a];
                                                        case 1:
                                                            if (t.sent(), e.issues.length === o) return [2];
                                                            return n || (n = ti(e, o)), [2]
                                                    }
                                                })
                                            }, function() {
                                                var e = this,
                                                    r = arguments;
                                                return new Promise(function(n, o) {
                                                    var a = t.apply(e, r);

                                                    function i(e) {
                                                        tE(a, n, o, i, l, "next", e)
                                                    }

                                                    function l(e) {
                                                        tE(a, n, o, i, l, "throw", e)
                                                    }
                                                    i(void 0)
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === o) return;
                                            n || (n = ti(e, o))
                                        }
                                    }()
                                } catch (e) {
                                    a = !0, i = e
                                } finally {
                                    try {
                                        o || null == c.return || c.return()
                                    } finally {
                                        if (a) throw i
                                    }
                                }
                                return l ? l.then(function() {
                                    return e
                                }) : e
                            },
                            v = function(t, r, o) {
                                if (ti(t)) return t.aborted = !0, t;
                                var a = b(r, n, o);
                                if (tA(a, Promise)) {
                                    if (!1 === o.async) throw new e2;
                                    return a.then(function(t) {
                                        return e._zod.parse(t, o)
                                    })
                                }
                                return e._zod.parse(a, o)
                            };
                        e._zod.run = function(t, r) {
                            if (r.skipChecks) return e._zod.parse(t, r);
                            if ("backward" === r.direction) {
                                var o = e._zod.parse({
                                    value: t.value,
                                    issues: []
                                }, tI(tj({}, r), {
                                    skipChecks: !0
                                }));
                                return tA(o, Promise) ? o.then(function(e) {
                                    return v(e, t, r)
                                }) : v(o, t, r)
                            }
                            var a = e._zod.parse(t, r);
                            if (tA(a, Promise)) {
                                if (!1 === r.async) throw new e2;
                                return a.then(function(e) {
                                    return b(e, n, r)
                                })
                            }
                            return b(a, n, r)
                        }
                    }
                    e["~standard"] = {
                        validate: function(t) {
                            try {
                                var r, n = tg(e, t);
                                return n.success ? {
                                    value: n.data
                                } : {
                                    issues: null == (r = n.error) ? void 0 : r.issues
                                }
                            } catch (r) {
                                return tw(e, t).then(function(e) {
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
                tC = e1("$ZodString", function(e, t) {
                    var r, n, o;
                    tT.init(e, t), e._zod.pattern = null != (r = tx(null != (n = null == e || null == (o = e._zod.bag) ? void 0 : o.patterns) ? n : []).pop()) ? r : tO(e._zod.bag), e._zod.parse = function(r, n) {
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

            function tk(e, t, r) {
                if (e.issues.length) {
                    var n;
                    (n = t.issues).push.apply(n, tx(tl(r, e.issues)))
                }
                t.value[r] = e.value
            }
            var tN = e1("$ZodArray", function(e, t) {
                tT.init(e, t), e._zod.parse = function(r, n) {
                    var o = function(e) {
                            var o = a[e],
                                l = t.element._zod.run({
                                    value: o,
                                    issues: []
                                }, n);
                            tA(l, Promise) ? i.push(l.then(function(t) {
                                return tk(t, r, e)
                            })) : tk(l, r, e)
                        },
                        a = r.value;
                    if (!Array.isArray(a)) return r.issues.push({
                        expected: "array",
                        code: "invalid_type",
                        input: a,
                        inst: e
                    }), r;
                    r.value = Array(a.length);
                    for (var i = [], l = 0; l < a.length; l++) o(l);
                    return i.length ? Promise.all(i).then(function() {
                        return r
                    }) : r
                }
            });

            function tD(e, t, r, n) {
                if (e.issues.length) {
                    var o;
                    (o = t.issues).push.apply(o, tx(tl(r, e.issues)))
                }
                void 0 === e.value ? r in n && (t.value[r] = void 0) : t.value[r] = e.value
            }
            var tR = e1("$ZodObject", function(e, t) {
                    tT.init(e, t);
                    var r, n = Object.getOwnPropertyDescriptor(t, "shape");
                    if (!(null == n ? void 0 : n.get)) {
                        var o = t.shape;
                        Object.defineProperty(t, "shape", {
                            get: function() {
                                var e = tj({}, o);
                                return Object.defineProperty(t, "shape", {
                                    value: e
                                }), e
                            }
                        })
                    }
                    var a = e9(function() {
                        return function(e) {
                            var t, r = Object.keys(e.shape),
                                n = !0,
                                o = !1,
                                a = void 0;
                            try {
                                for (var i, l = r[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                                    var u, c, s, f, p = i.value;
                                    if (!(null == (f = e.shape) || null == (s = f[p]) || null == (c = s._zod) || null == (u = c.traits) ? void 0 : u.has("$ZodType"))) throw Error('Invalid element at key "'.concat(p, '": expected a Zod schema'))
                                }
                            } catch (e) {
                                o = !0, a = e
                            } finally {
                                try {
                                    n || null == l.return || l.return()
                                } finally {
                                    if (o) throw a
                                }
                            }
                            var d = Object.keys(t = e.shape).filter(function(e) {
                                return "optional" === t[e]._zod.optin && "optional" === t[e]._zod.optout
                            });
                            return tI(tj({}, e), {
                                keys: r,
                                keySet: new Set(r),
                                numKeys: r.length,
                                optionalKeys: new Set(d)
                            })
                        }(t)
                    });
                    tr(e._zod, "propValues", function() {
                        var e = t.shape,
                            r = {};
                        for (var n in e) {
                            var o = e[n]._zod;
                            if (o.values) {
                                null != r[n] || (r[n] = new Set);
                                var a = !0,
                                    i = !1,
                                    l = void 0;
                                try {
                                    for (var u, c, s = o.values[Symbol.iterator](); !(a = (c = s.next()).done); a = !0) {
                                        var f = c.value;
                                        r[n].add(f)
                                    }
                                } catch (e) {
                                    i = !0, l = e
                                } finally {
                                    try {
                                        a || null == s.return || s.return()
                                    } finally {
                                        if (i) throw l
                                    }
                                }
                            }
                        }
                        return r
                    });
                    var i = t.catchall;
                    e._zod.parse = function(t, n) {
                        null != r || (r = a.value);
                        var o = t.value;
                        if (!((void 0 === (p = o) ? "undefined" : e4(p)) === "object" && null !== p && !Array.isArray(p))) return t.issues.push({
                            expected: "object",
                            code: "invalid_type",
                            input: o,
                            inst: e
                        }), t;
                        t.value = {};
                        var l = [],
                            u = r.shape,
                            c = !0,
                            s = !1,
                            f = void 0;
                        try {
                            for (var p, d, h = r.keys[Symbol.iterator](); !(c = (d = h.next()).done); c = !0) ! function() {
                                var e = d.value,
                                    r = u[e]._zod.run({
                                        value: o[e],
                                        issues: []
                                    }, n);
                                tA(r, Promise) ? l.push(r.then(function(r) {
                                    return tD(r, t, e, o)
                                })) : tD(r, t, e, o)
                            }()
                        } catch (e) {
                            s = !0, f = e
                        } finally {
                            try {
                                c || null == h.return || h.return()
                            } finally {
                                if (s) throw f
                            }
                        }
                        return i ? function(e, t, r, n, o, a) {
                            var i = [],
                                l = o.keySet,
                                u = o.catchall._zod,
                                c = u.def.type,
                                s = !0,
                                f = !1,
                                p = void 0;
                            try {
                                for (var d, h = Object.keys(t)[Symbol.iterator](); !(s = (d = h.next()).done); s = !0) ! function() {
                                    var o = d.value;
                                    if (!l.has(o)) {
                                        if ("never" === c) return i.push(o);
                                        var a = u.run({
                                            value: t[o],
                                            issues: []
                                        }, n);
                                        tA(a, Promise) ? e.push(a.then(function(e) {
                                            return tD(e, r, o, t)
                                        })) : tD(a, r, o, t)
                                    }
                                }()
                            } catch (e) {
                                f = !0, p = e
                            } finally {
                                try {
                                    s || null == h.return || h.return()
                                } finally {
                                    if (f) throw p
                                }
                            }
                            return (i.length && r.issues.push({
                                code: "unrecognized_keys",
                                keys: i,
                                input: t,
                                inst: a
                            }), e.length) ? Promise.all(e).then(function() {
                                return r
                            }) : r
                        }(l, o, t, n, a.value, e) : l.length ? Promise.all(l).then(function() {
                            return t
                        }) : t
                    }
                }),
                t_ = e1("$ZodLiteral", function(e, t) {
                    if (tT.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
                    e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                        return "string" == typeof e ? to(e) : e ? to(e.toString()) : String(e)
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

            function tL(e, t) {
                return e.issues.length && void 0 === t ? {
                    issues: [],
                    value: void 0
                } : e
            }
            var tU = e1("$ZodOptional", function(e, t) {
                    tT.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", tr(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tx(t.innerType._zod.values).concat([void 0])) : void 0
                    }), tr(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(te(e.source), ")?$")) : void 0
                    }), e._zod.parse = function(e, r) {
                        if ("optional" === t.innerType._zod.optin) {
                            var n = t.innerType._zod.run(e, r);
                            return tA(n, Promise) ? n.then(function(t) {
                                return tL(t, e.value)
                            }) : tL(n, e.value)
                        }
                        return void 0 === e.value ? e : t.innerType._zod.run(e, r)
                    }
                }),
                tB = e1("$ZodNullable", function(e, t) {
                    tT.init(e, t), tr(e._zod, "optin", function() {
                        return t.innerType._zod.optin
                    }), tr(e._zod, "optout", function() {
                        return t.innerType._zod.optout
                    }), tr(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(te(e.source), "|null)$")) : void 0
                    }), tr(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tx(t.innerType._zod.values).concat([null])) : void 0
                    }), e._zod.parse = function(e, r) {
                        return null === e.value ? e : t.innerType._zod.run(e, r)
                    }
                });

            function tM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tF(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tH(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            tF(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            tF(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function tG(e) {
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

            function tz(e) {
                return function(e) {
                    if (Array.isArray(e)) return tM(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tM(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tM(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tV(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            Symbol("ZodOutput"), Symbol("ZodInput");
            var tW = e1("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    tT.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, r) {
                        return tb(e, t, r, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, r) {
                        return tg(e, t, r)
                    }, e.parseAsync = function(t, r) {
                        return tH(function() {
                            return tV(this, function(n) {
                                return [2, tv(e, t, r, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, r) {
                        return tH(function() {
                            return tV(this, function(n) {
                                return [2, tw(e, t, r)]
                            })
                        })()
                    }, e.check = function() {
                        for (var r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
                        return e.clone((r = tG({}, t), n = n = {
                            checks: tz(null != (o = t.checks) ? o : []).concat(tz(i.map(function(e) {
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
                tq = e1("ZodMiniString", function(e, t) {
                    tC.init(e, t), tW.init(e, t)
                });

            function tK(e) {
                return new tq(function(e) {
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
                }, ta(e)))
            }
            var t$ = e1("ZodMiniArray", function(e, t) {
                    tN.init(e, t), tW.init(e, t)
                }),
                tZ = e1("ZodMiniObject", function(e, t) {
                    tR.init(e, t), tW.init(e, t), tr(e, "shape", function() {
                        return t.shape
                    })
                });

            function tY(e, t) {
                return new tZ(tG({
                    type: "object",
                    shape: null != e ? e : {}
                }, ta(t)))
            }
            var tX = e1("ZodMiniLiteral", function(e, t) {
                    t_.init(e, t), tW.init(e, t)
                }),
                tJ = e1("ZodMiniOptional", function(e, t) {
                    tU.init(e, t), tW.init(e, t)
                }),
                tQ = e1("ZodMiniNullable", function(e, t) {
                    tB.init(e, t), tW.init(e, t)
                });

            function t0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t1(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function t2(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            t1(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            t1(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function t3(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function t6(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function t5(e, t, r) {
                return t && t6(e.prototype, t), r && t6(e, r), e
            }

            function t8(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function t4(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function t7(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            r(848);
            var t9 = function() {
                    function e(t) {
                        t3(this, e), t8(this, "value", void 0), this.value = t
                    }
                    return t5(e, [{
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
                            return rt.fromResult(this.cast())
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
                re = function() {
                    function e(t) {
                        t3(this, e), t8(this, "error", void 0), this.error = t
                    }
                    return t5(e, [{
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
                            return rt.fromResult(this.cast())
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
            (_ || (_ = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new t9(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var rt = function() {
                    function e(t) {
                        t3(this, e), t8(this, "promise", void 0), this.promise = t
                    }
                    return t5(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return t2(function() {
                                    var r, n;
                                    return t7(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return n = t9.bind, [4, t(e.value)];
                                            case 1:
                                                return r = new(n.apply(t9, [void 0, o.sent()])), [3, 3];
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
                                return t2(function() {
                                    var r, n;
                                    return t7(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return n = re.bind, [4, t(e.error)];
                                            case 1:
                                                return r = new(n.apply(re, [void 0, o.sent()])), [3, 3];
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
                                return t4(n, e) ? n.promise : n
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(r) {
                                if (r.isOk()) return r.cast();
                                var n = t(r.error);
                                return t4(n, e) ? n.promise : n
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
                                return new t9(e)
                            }).catch(function(e) {
                                return new re(r(e))
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
                            return t4(t, e) ? t : t4(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                                return e.fromPromiseResult(t.apply(void 0, function(e) {
                                    if (Array.isArray(e)) return t0(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return t0(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return t0(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(_.all))
                        }
                    }]), e
                }(),
                rr = function(e) {
                    return new t9(e)
                },
                rn = function(e) {
                    return new re(e)
                };

            function ro(e, t, r) {
                return (ro = ru() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && ri(o, r.prototype), o
                }).apply(null, arguments)
            }

            function ra(e) {
                return (ra = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ri(e, t) {
                return (ri = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function rl(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (rl = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return ro(e, arguments, ra(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), ri(r, e)
                })(e)
            }

            function ru() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (ru = function() {
                    return !!e
                })()
            }
            rl(Error);
            var rc = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e) {
                        var r, n, o, a, i;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return n = t, o = [e.message, {
                            cause: e
                        }], n = ra(n), r = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, ru() ? Reflect.construct(n, o || [], ra(this).constructor) : n.apply(this, o)), i = void 0, (a = "cause") in r ? Object.defineProperty(r, a, {
                            value: i,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[a] = i, r.cause = e, r
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && ri(t, e), t
                }(rl(Error)),
                rs = function(e, t) {
                    try {
                        return rr(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return rn(new rc(e))
                    }
                };

            function rf(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function rp(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            rf(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            rf(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function rd(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rh = function(e, t) {
                    return J.Url.parse("".concat(e.replace(/\/+$/, "")).concat(t)).getOrThrow()
                },
                ry = tY({
                    status: tK()
                }),
                rm = ["Unknown", "BootstrapperInstalling", "AppStarted", "AcquiringGame", "JoiningGame", "InGame", "LeftGame"],
                rb = function() {
                    return rp(function() {
                        var e, t, r, n;
                        return rd(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return [4, X.getUntyped(rh(Y().authApi, "/v1/client-assertion/"), {
                                        credentials: "include"
                                    })];
                                case 1:
                                    return t = o.sent(), [4, X.fetch(rh(Y().authApi, "/v1/authentication-ticket/"), {
                                        method: "POST",
                                        credentials: "include",
                                        headers: {
                                            "content-type": "application/json"
                                        },
                                        body: rs(null != (e = t.isOk() ? t.value : null) ? e : {}).getOrThrow()
                                    })];
                                case 2:
                                    if ((r = o.sent()).isErr() || !(n = r.value.headers.get("rbx-authentication-ticket"))) return [2, void 0];
                                    return [2, n]
                            }
                        })
                    })()
                };

            function rv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rg(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rv(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rv(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rw = function(e) {
                    return "play" !== e
                },
                rO = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
                rS = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : Y().domain;
                    return rO.includes(t) ? "".concat(e, "-").concat(t.split(".")[0]) : e
                },
                rP = function(e, t, r) {
                    var n = ["1", "launchmode:".concat(e.launchMode)];
                    return t && n.push("gameinfo:".concat(encodeURIComponent(t))), n.push("launchtime:".concat(String(e.launchTime))), r && (null != r.userId && n.push("distributorType:Global", "userId:".concat(String(r.userId))), n.push("browser:".concat(r.browser))), Object.entries(e.otherParams).forEach(function(e) {
                        var t = rg(e, 2),
                            r = t[0],
                            o = t[1];
                        n.push(r === o ? r : "".concat(r, ":").concat(encodeURIComponent(String(o))))
                    }), "".concat(e.protocolName, ":").concat(n.join("+"))
                };

            function rE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rA(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function rj(e) {
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

            function rI(e, t) {
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

            function rx(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rE(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rE(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rT = function(e) {
                    null == (t = document.querySelector("iframe#gamelaunch")) || t.remove();
                    var t, r = document.createElement("iframe");
                    r.id = "gamelaunch", r.className = "hidden", r.src = e, document.body.appendChild(r), window.dispatchEvent(new Event("ProtocolLaunchStartSelenium"))
                },
                rC = function() {
                    var e = !1;
                    return {
                        get: function() {
                            return e
                        },
                        set: function(t) {
                            e = t
                        }
                    }
                },
                rk = function(e) {
                    var t, r, n = null != (t = e.installState) ? t : rC(),
                        o = null != (r = e.openProtocolUrl) ? r : rT,
                        a = function(e) {
                            return {
                                launchMethod: "Protocol",
                                params: e
                            }
                        },
                        i = function(t) {
                            var r;
                            return (r = function() {
                                var r, i, l, u, c;
                                return function(e, t) {
                                    var r, n, o, a = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        l = Object.defineProperty;
                                    return l(i, "next", {
                                        value: u(0)
                                    }), l(i, "throw", {
                                        value: u(1)
                                    }), l(i, "return", {
                                        value: u(2)
                                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function u(l) {
                                        return function(u) {
                                            var c = [l, u];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                                if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = c;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: c[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, n = c[1], c = [0];
                                                        continue;
                                                    case 7:
                                                        c = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                            a.label = c[1];
                                                            break
                                                        }
                                                        if (6 === c[0] && a.label < o[1]) {
                                                            a.label = o[1], o = c;
                                                            break
                                                        }
                                                        if (o && a.label < o[2]) {
                                                            a.label = o[2], a.ops.push(c);
                                                            break
                                                        }
                                                        o[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                c = t.call(e, a)
                                            } catch (e) {
                                                c = [6, e], n = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & c[0]) throw c[1];
                                            return {
                                                value: c[0] ? c[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(s) {
                                    switch (s.label) {
                                        case 0:
                                            if (s.trys.push([0, 5, , 6]), r = rw(t.launchMode), i = rp(function() {
                                                    return rd(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return [4, X.fetch(rh(Y().matchmakingApi, "/v1/client-status"), {
                                                                    method: "POST",
                                                                    credentials: "include",
                                                                    headers: {
                                                                        "content-type": "application/json"
                                                                    },
                                                                    body: rs({
                                                                        status: "Unknown"
                                                                    }).value
                                                                })];
                                                            case 1:
                                                                return e.sent().getOrThrow(), [2]
                                                        }
                                                    })
                                                })(), !(e.isAuthenticated() && !r)) return [3, 2];
                                            return [4, Promise.all([rb(), i])];
                                        case 1:
                                            return l = rx.apply(void 0, [s.sent(), 1])[0], [3, 4];
                                        case 2:
                                            return [4, i];
                                        case 3:
                                            s.sent(), s.label = 4;
                                        case 4:
                                            return u = r ? {
                                                userId: e.isAuthenticated() ? e.getUserId() : null,
                                                browser: eq()
                                            } : void 0, o(rP(t, l, u)), e.onLaunchSucceeded(), e.onEvent("startClientSucceeded", a(t)), n.get() && (e.onEvent("successfulInstall", a(t)), n.set(!1)), [3, 6];
                                        case 5:
                                            return c = s.sent(), e.onLaunchFailed(c), [3, 6];
                                        case 6:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    t = arguments;
                                return new Promise(function(n, o) {
                                    var a = r.apply(e, t);

                                    function i(e) {
                                        rA(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        rA(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        },
                        l = function(t) {
                            var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "play",
                                n = e.getConfig(),
                                o = rw(r),
                                l = rI(rj({}, t), {
                                    protocolName: rS(o ? "roblox-studio" : "roblox-player"),
                                    launchMode: r,
                                    launchTime: Date.now()
                                }),
                                u = l.otherParams;
                            u.browsertrackerid = e.getBrowserTrackerId(), u.robloxLocale = n.robloxLocale, u.gameLocale = n.gameLocale, o ? u.channel = n.studioChannel : n.isOmitPlayerChannelForWinAndMacEnabled && e.isWindowsOrMac() || (u.channel = n.playerChannel), o || !n.isDuarAutoOptInEnabled || u.LaunchExp || (u.LaunchExp = n.isDuarOptOutDisabled ? "InApp" : "PreferInApp"), e.onEvent("startClientAttempted", a(l));
                            var c = i(l);
                            return e.onLaunchStarted(l, function() {
                                return i(l)
                            }), c
                        },
                        u = function(t, r) {
                            var n = function() {
                                o(t)
                            };
                            e.onLaunchStarted(r, function() {
                                return n(), Promise.resolve()
                            }), n()
                        },
                        c = function(t, r) {
                            var n, o, a, i;
                            return n = e.getConfig().placeLauncherUrl, o = t, a = e.getBrowserTrackerId(), i = r, "".concat(n, "?").concat(Object.entries(function(e) {
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
                                request: o,
                                browserTrackerId: a
                            }, Object.fromEntries(Object.entries(i).filter(function(e) {
                                return void 0 !== rg(e, 2)[1]
                            })))).map(function(e) {
                                var t = rg(e, 2),
                                    r = t[0],
                                    n = t[1];
                                return "".concat(encodeURIComponent(r), "=").concat(encodeURIComponent(null != n ? n : ""))
                            }).join("&").replace(/%20/g, "+"))
                        };
                    return {
                        joinMultiplayerGame: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: c("RequestGame", e)
                                },
                                placeId: e.placeId,
                                isPlayTogetherGame: !0 === e.isPlayTogetherGame,
                                launchData: e.launchData,
                                eventId: e.eventId
                            })
                        },
                        followPlayerIntoGame: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: c("RequestFollowUser", e)
                                }
                            })
                        },
                        joinGameInstance: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: c("RequestGameJob", e)
                                },
                                placeId: e.placeId,
                                isPlayTogetherGame: !0 === e.isPlayTogetherGame
                            })
                        },
                        joinPrivateGame: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: c("RequestPrivateGame", e)
                                },
                                placeId: e.placeId
                            })
                        },
                        playTogetherGame: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: c("RequestPlayTogetherGame", e)
                                },
                                placeId: e.placeId,
                                conversationId: e.conversationId
                            })
                        },
                        openStudio: function() {
                            return l({
                                otherParams: {
                                    avatar: "avatar"
                                }
                            }, "edit")
                        },
                        editGameInStudio: function(e) {
                            var t = e.placeId,
                                r = e.universeId,
                                n = e.startTeamTest,
                                o = void 0 !== n && n,
                                a = e.instanceId,
                                i = e.annotationId;
                            return l({
                                otherParams: rI(rj({
                                    task: o ? "StartTeamTest" : "EditPlace",
                                    placeId: t,
                                    universeId: r
                                }, !o && a ? {
                                    targetInstanceId: a
                                } : {}, !o && i ? {
                                    annotationId: i
                                } : {}), {
                                    avatar: "avatar"
                                }),
                                placeId: t
                            }, "edit")
                        },
                        tryAssetInStudio: function(e) {
                            return l({
                                otherParams: {
                                    assetid: e.assetId,
                                    avatar: "avatar"
                                }
                            }, "asset")
                        },
                        openPluginInStudio: function(e) {
                            return l({
                                otherParams: {
                                    pluginid: e.pluginId,
                                    avatar: "avatar"
                                }
                            }, "plugin")
                        },
                        startDeepLinkFlow: function(e) {
                            u(e, {})
                        },
                        startGameWithDeepLinkUrl: function(e, t) {
                            u(e, {
                                protocolName: rS("roblox-player"),
                                launchMode: "play",
                                otherParams: {},
                                placeId: t
                            })
                        },
                        beginInstall: function(t) {
                            e.onEvent("beginInstall", a(t)), n.set(!0)
                        },
                        manualDownload: function() {
                            e.onEvent("manualDownload", a({}))
                        }
                    }
                },
                rN = function(e) {
                    return e
                },
                rD = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                rR = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? rN(e.toString()) : null
                },
                r_ = function(e) {
                    var t = rD(e);
                    return null == t ? null : rR(t)
                },
                rL = "blackbird",
                rU = function(e) {
                    var t, r, n, o, a = null != (t = e.userid) ? t : e.user,
                        i = null == a ? void 0 : null != (r = r_(a)) ? r : void 0;
                    if ("string" == typeof i) return {
                        isAuthenticated: !0,
                        id: i,
                        userName: null != (n = e.name) ? n : e.userName,
                        displayName: null != (o = e.displayname) ? o : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === rL || e.userMembership === rL ? rL : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                rB = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return rU(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                };

            function rM(e) {
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
            var rF = function() {
                    var e, t, r;
                    return null != eH() || null != (e = null == (r = window.Roblox) || null == (t = r.GameLauncher) ? void 0 : t.isJoinAttemptIdEnabled()) && e
                },
                rH = function() {
                    var e = window.location.href;
                    window.location.href = "/login?".concat(new URLSearchParams({
                        returnUrl: e
                    }).toString())
                },
                rG = function(e, t, r, n) {
                    var o = r.eventName,
                        a = r.ctx,
                        i = r.gamePlayIntentEventCtx,
                        l = r.properties,
                        u = t.rootPlaceId,
                        c = t.placeId,
                        s = t.gameInstanceId,
                        f = t.playerId,
                        p = t.joinData,
                        d = t.privateServerLinkCode,
                        h = t.referredByPlayerId;
                    if (null != c) {
                        if (void 0 === rB()) return void rH();
                        var y = eB(),
                            m = function(e) {
                                return rj(rI(rj({}, e), {
                                    joinAttemptId: null != y ? y : eB()
                                }), i ? {
                                    joinAttemptOrigin: i
                                } : {})
                            },
                            b = function(e) {
                                var t, r, u = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                (0, eR.sendEventWithTarget)(o, a, rM((t = rM({}, l), r = r = {
                                    joinAttemptId: y
                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(r)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                                }), t), u, null == n ? {} : {
                                    actionType: n
                                })), (0, eR.sendGamePlayEvent)(i, e, void 0, y, n)
                            };
                        return c === u && s ? (b(u, {
                            gameInstanceId: s
                        }), e.joinGameInstance(m({
                            placeId: c,
                            gameId: s,
                            isPlayTogetherGame: !0,
                            referredByPlayerId: h
                        }))) : u && f ? (b(u, {
                            playerId: f
                        }), e.followPlayerIntoGame(m({
                            userId: f
                        }))) : d ? (b(c), e.joinPrivateGame(m({
                            placeId: c,
                            linkCode: d
                        }))) : (b(c), e.joinMultiplayerGame(m({
                            placeId: c,
                            isPlayTogetherGame: !1,
                            launchData: null == p ? void 0 : p.launchData,
                            eventId: null == p ? void 0 : p.eventId,
                            referredByPlayerId: h
                        })))
                    }
                },
                rz = function(e, t, r) {
                    var n = eH();
                    null == n ? (0, eD.launchGame)(e, t, r) : rG(n, e, t, r)
                },
                rV = function(e) {
                    var t = e.featureName,
                        r = e.redirectLink,
                        n = e.ampFeatureCheckData,
                        o = void 0 === n ? [] : n,
                        a = e.isAsyncCall,
                        i = void 0 === a || a,
                        l = e.usePrologue,
                        u = void 0 !== l && l,
                        c = e.ampRecourseData,
                        s = void 0 === c ? null : c,
                        f = e.featureSpecificData,
                        p = e.namespace,
                        d = e.wizardIntent;
                    return eF("StartAccessManagementUpsell", function(e) {
                        return {
                            featureName: t,
                            redirectLink: null != r ? r : null,
                            ampFeatureCheckData: o,
                            isAsyncCall: i,
                            usePrologue: u,
                            ampRecourseData: s,
                            featureSpecificData: null != f ? f : null,
                            namespace: null != p ? p : null,
                            wizardIntent: null != d ? d : null,
                            closeCallback: function(t) {
                                e("Granted" === t)
                            }
                        }
                    }, !1)
                },
                rW = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS,
                rq = function() {
                    if (rW) return rV;
                    var e = null == eV ? void 0 : eV.Roblox.AccessManagementUpsellV2Service;
                    return e && function(t) {
                        return e.startAccessManagementUpsell(t)
                    }
                };

            function rK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r$(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function rZ(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            r$(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            r$(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function rY(e) {
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
                if (e) {
                    if ("string" == typeof e) return rK(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rK(e, t)
                }
            }

            function rJ(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rQ = {
                pid: "experiencestart_mobileweb",
                is_retargeting: "false"
            };

            function r0(e) {
                if (!rF()) return {};
                var t = e.joinAttemptOrigin,
                    r = e.joinAttemptId;
                return {
                    joinAttemptId: r = "string" == typeof r ? r : eB(),
                    joinAttemptOrigin: t
                }
            }

            function r1(e, t, r, n) {
                var o = rY({
                    placeId: t
                }, e, r0(e), r, null == n ? {} : {
                    actionType: n
                });
                return (0, eR.sendEventWithTarget)("playGameClicked", "click", o), o
            }

            function r2(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = "".concat(Y().websiteUrl, "/games/start?placeid=").concat(e);
                if (rF()) {
                    var n = r0(t),
                        o = n.joinAttemptId,
                        a = n.joinAttemptOrigin;
                    "string" == typeof o && o.length > 0 && (r += "&joinAttemptId=".concat(o), "string" == typeof a && a.length > 0 && (r += "&joinAttemptOrigin=".concat(a)))
                }
                var i = t.launchData,
                    l = t.eventId;
                return "string" == typeof i && i.length > 0 && (r += "&launchData=".concat(i)), "string" == typeof l && l.length > 0 && (r += "&eventId=".concat(l)), encodeURIComponent(r)
            }
            var r3 = function(e, t, r, n) {
                    var o = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : {},
                        a = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {},
                        i = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : {},
                        l = arguments.length > 7 ? arguments[7] : void 0,
                        u = (0, eM.getDeviceMeta)();
                    if ((null == u ? void 0 : u.isIosDevice) || (null == u ? void 0 : u.isAndroidDevice) || (0, eM.isIos13Ipad)() || (null == u ? void 0 : u.isChromeOs)) {
                        var c = r1(o, e, a, l),
                            s = r2(e, c),
                            f = (0, e_.composeQueryString)(rY({}, rQ, i));
                        window.open("https://ro.blox.com/Ebh5?".concat(f, "&af_dp=").concat(s, "&af_web_dp=").concat(s, "&deep_link_value=").concat(s), "_self")
                    } else {
                        var p = "0";
                        null !== window.localStorage.getItem("ref_info") && (p = function() {
                            var e = window.localStorage.getItem("ref_info");
                            if (!e) return {};
                            try {
                                return JSON.parse(atob(e))
                            } catch (e) {
                                return {}
                            }
                        }()[e]), rz((0, eD.buildPlayGameProperties)(t, e, n, void 0, r, p, a), eP(e, o), l), window.localStorage.getItem("ref_info") && window.localStorage.removeItem("ref_info")
                    }
                },
                r6 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = (0, eM.getDeviceMeta)();
                    if ((null == r ? void 0 : r.isIosDevice) || (null == r ? void 0 : r.isAndroidDevice) || (0, eM.isIos13Ipad)() || (null == r ? void 0 : r.isChromeOs)) {
                        var n = r1({}, e, {}),
                            o = r2(e, n),
                            a = (0, e_.composeQueryString)(rY({}, rQ, t));
                        window.open("https://ro.blox.com/Ebh5?".concat(a, "&af_dp=").concat(o, "&af_web_dp=").concat(o, "&deep_link_value=").concat(o), "_self")
                    } else rz((0, eD.buildPlayGameProperties)(void 0, e), eP(e, {}))
                },
                r5 = function() {
                    var e;
                    return null == (e = window.Roblox) ? void 0 : e.IdentityVerificationService
                },
                r8 = function(e) {
                    var t = e.context,
                        r = e.pageContext;
                    return rZ(function() {
                        var e, n, o, a;
                        return rJ(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return i.trys.push([0, 2, , 3]), o = {
                                        featureName: "TriggerAgeCheckUpsellIncludingVPC",
                                        isAsyncCall: !1,
                                        usePrologue: !1,
                                        namespace: "core_content/CoreContent",
                                        featureSpecificData: {
                                            context: "".concat(t, "-").concat(r)
                                        }
                                    }, [4, null == (n = rq()) ? void 0 : n(o)];
                                case 1:
                                    return [2, null != (e = i.sent()) && e];
                                case 2:
                                    throw a = i.sent(), et(eE.PlayButtonUpsellAgeRestrictionVerificationError), a;
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                r4 = function(e, t) {
                    try {
                        var r, n, o = null == (n = (r = new URLSearchParams(window.location.search), function(e) {
                            if (Array.isArray(e)) return rK(e)
                        }(r) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rX(r) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()).find(function(e) {
                            var t = (function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var o = [],
                                        a = !0,
                                        i = !1;
                                    try {
                                        for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                    } catch (e) {
                                        i = !0, r = e
                                    } finally {
                                        try {
                                            a || null == n.return || n.return()
                                        } finally {
                                            if (i) throw r
                                        }
                                    }
                                    return o
                                }
                            }(e) || rX(e, 1) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0];
                            return "sharelinksourcetype" === t.toLowerCase()
                        })) ? void 0 : n[1];
                        if ((null == o ? void 0 : o.toLowerCase()) !== "experiencedetails") return;
                        (0, eR.sendEventWithTarget)("shareLinkGameJoin", "GamePlayButtonWeb", {
                            placeId: e,
                            universeId: t
                        }, eR.targetTypes.WWW)
                    } catch (e) {}
                },
                r7 = function(e, t) {
                    return void 0 !== e && e !== eh.Playable && e !== eh.GuestProhibited && e !== eh.PurchaseRequired && e !== eh.ContextualPlayabilityUnverifiedSeventeenPlusUser && e !== eh.FiatPurchaseRequired && e !== eh.ContextualPlayabilityAgeCheckRequired && (e !== eh.ContextualPlayabilityAgeRecommendationParentalControls && e !== eh.ContextualPlayabilityRequireParentApproval || !t) && !0
                },
                r9 = function(e, t, r, n) {
                    (0, eR.sendEvent)({
                        name: eA.eventName,
                        type: eA.eventName,
                        context: eR.eventTypes.formInteraction
                    }, {
                        universeId: e,
                        upsellName: t,
                        playabilityStatus: r,
                        pg: n
                    })
                },
                ne = window.ReactJSX,
                nt = r(611),
                nr = r.n(nt),
                nn = function() {
                    for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var a = t.length;
                                for (r = 0; r < a; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                            } else
                                for (n in t) t[n] && (o && (o += " "), o += n);
                        return o
                    }(e)) && (n && (n += " "), n += t);
                    return n
                },
                no = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                na = function(e) {
                    var t = e.className;
                    return K().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: nn("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                ni = function(e) {
                    var t = e.width,
                        r = e.height;
                    return K().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, K().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function nl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nu(e) {
                if (Array.isArray(e)) return e
            }

            function nc() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ns(e, t) {
                if (e) {
                    if ("string" == typeof e) return nl(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nl(e, t)
                }
            }
            var nf = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                np = K().forwardRef(function(e, t) {
                    var r, n = nu(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ns(r) || nc(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        u = o.className,
                        c = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["name", "size", "className", "children"])),
                        s = (nu(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || ns(a, 1) || nc())[0];
                    return K().createElement("span", function(e) {
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
                        className: nn("grow-0 shrink-0 basis-auto icon", i, nf[void 0 === l ? "Medium" : l], u)
                    }, c))
                });

            function nd(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nh(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ny() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = nh(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : nh(t[e], null)
                        }
                    }
                }
            }

            function nm() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return q.useCallback(ny.apply(void 0, function(e) {
                    if (Array.isArray(e)) return nd(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nd(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nd(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function nb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nv(e) {
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

            function ng(e, t) {
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

            function nw(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function nO(e) {
                return function(e) {
                    if (Array.isArray(e)) return nb(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nb(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nb(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nS(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            np.displayName = "Icon";
            var nP = Symbol.for("react.lazy"),
                nE = q[" use ".trim().toString()];

            function nA(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : nS(e)) === "object" && "$$typeof" in e && e.$$typeof === nP && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nS(t)) === "object" && null !== t && "then" in t
            }
            var nj = ((a = q.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nw(e, ["children"]);
                    if (nA(r) && "function" == typeof nE && (r = nE(r._payload)), q.isValidElement(r)) {
                        var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = nv({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, nO(t));
                                        return o.apply(void 0, nO(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = nv({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return nv({}, e, r)
                            }(n, r.props);
                        return r.type !== q.Fragment && (s.ref = t ? ny(t, c) : c), q.cloneElement(r, s)
                    }
                    return q.Children.count(r) > 1 ? q.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), y = a, (m = q.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nw(e, ["children"]);
                    nA(r) && "function" == typeof nE && (r = nE(r._payload));
                    var o = q.Children.toArray(r),
                        a = o.find(nx);
                    if (a) {
                        var i = a.props.children,
                            l = o.map(function(e) {
                                return e !== a ? e : q.Children.count(i) > 1 ? q.Children.only(null) : q.isValidElement(i) ? i.props.children : null
                            });
                        return (0, ne.jsx)(y, ng(nv({}, n), {
                            ref: t,
                            children: q.isValidElement(i) ? q.cloneElement(i, void 0, l) : null
                        }))
                    }
                    return (0, ne.jsx)(y, ng(nv({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), m),
                nI = Symbol("radix.slottable");

            function nx(e) {
                return q.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nI
            }

            function nT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nC(e) {
                if (Array.isArray(e)) return e
            }

            function nk() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nN(e) {
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

            function nD(e, t) {
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

            function nR(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function n_(e, t) {
                if (e) {
                    if ("string" == typeof e) return nT(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nT(e, t)
                }
            }
            var nL = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                nU = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                nB = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nM = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nF = (0, q.forwardRef)(function(e, t) {
                    var r, n = nC(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || n_(r) || nk(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.className,
                        u = o.style,
                        c = o.isDisabled,
                        s = void 0 !== c && c,
                        f = o.isLoading,
                        p = void 0 !== f && f,
                        d = o.icon,
                        h = o.size,
                        y = void 0 === h ? "Large" : h,
                        m = o.variant,
                        b = void 0 === m ? "Emphasis" : m,
                        v = o.asChild,
                        g = nR(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (nC(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || n_(a, 1) || nk())[0],
                        O = nn("foundation-web-button", s ? "opacity-[0.5]" : [no, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nU[y], s ? nM[b] : nB[b], l),
                        S = nN({
                            textDecoration: "none"
                        }, u),
                        P = function(e) {
                            return K().createElement(K().Fragment, null, K().createElement(na, null), p && K().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, K().createElement(ni, {
                                width: nL[y],
                                height: nL[y]
                            })), K().createElement("span", {
                                className: nn("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && K().createElement(np, {
                                name: d,
                                size: y
                            }), K().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var E = nR(g, ["as"]),
                            A = K().Children.only(i);
                        return K().createElement(nj, nD(nN({
                            ref: w
                        }, E), {
                            className: O,
                            style: S,
                            "aria-disabled": s || void 0
                        }), K().cloneElement(A, {}, P(A.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var j = g.href,
                            I = nR(g, ["as", "href"]);
                        return K().createElement("a", nD(nN({
                            ref: w
                        }, I), {
                            "aria-disabled": s,
                            href: s ? void 0 : j,
                            className: O,
                            style: S
                        }), P(i))
                    }
                    g.as;
                    var x = nR(g, ["as"]);
                    return K().createElement("button", nD(nN({
                        ref: w,
                        type: "button"
                    }, x), {
                        disabled: s,
                        className: O,
                        style: S
                    }), P(i))
                }),
                nH = window.Roblox.NavigationService,
                nG = window.Roblox.ExperimentationService,
                nz = r.n(nG),
                nV = "full",
                nW = function(e) {
                    return e === nV && "btn-full-width"
                },
                nq = {
                    display: "flex"
                };

            function nK(e, t) {
                var r = t && t.cache ? t.cache : nJ,
                    n = t && t.serializer ? t.serializer : nY;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var r, n, o = 1 === e.length ? n$ : nZ;
                    return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
                })(e, {
                    cache: r,
                    serializer: n
                })
            }

            function n$(e, t, r, n) {
                var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
                    a = t.get(o);
                return void 0 === a && (a = e.call(this, n), t.set(o, a)), a
            }

            function nZ(e, t, r) {
                var n = Array.prototype.slice.call(arguments, 3),
                    o = r(n),
                    a = t.get(o);
                return void 0 === a && (a = e.apply(this, n), t.set(o, a)), a
            }
            var nY = function() {
                    return JSON.stringify(arguments)
                },
                nX = function() {
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
                nJ = {
                    create: function() {
                        return new nX
                    }
                },
                nQ = {
                    variadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, nZ.bind(this, e, r, n)
                    },
                    monadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, n$.bind(this, e, r, n)
                    }
                };

            function n0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n1(e, t, r) {
                return (n1 = n5() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && n3(o, r.prototype), o
                }).apply(null, arguments)
            }

            function n2(e) {
                return (n2 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function n3(e, t) {
                return (n3 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function n6(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (n6 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return n1(e, arguments, n2(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), n3(r, e)
                })(e)
            }

            function n5() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (n5 = function() {
                    return !!e
                })()
            }
            var n8 = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        var n, o, a, i = e;
                        return r && (i += ": " + r), n = t, o = [i], n = n2(n), (a = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, n5() ? Reflect.construct(n, o || [], n2(this).constructor) : n.apply(this, o))).code = e, r && (a.originalMessage = r), a
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && n3(t, e), t
                }(n6(Error)),
                n4 = ((b = n4 || {}).MISSING_MESSAGE = "MISSING_MESSAGE", b.MISSING_FORMAT = "MISSING_FORMAT", b.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", b.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", b.INVALID_MESSAGE = "INVALID_MESSAGE", b.INVALID_KEY = "INVALID_KEY", b.FORMATTING_ERROR = "FORMATTING_ERROR", b);

            function n7(e, t) {
                return nK(e, {
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
                    strategy: nQ.variadic
                })
            }

            function n9(e, t) {
                return n7(function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return n1(e, function(e) {
                        if (Array.isArray(e)) return n0(e)
                    }(r) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return n0(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n0(e, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())
                }, t)
            }

            function oe(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ot(e) {
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

            function or(e, t) {
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
            var on = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                oo = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                oa = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                oi = /^(@+)?(\+|#+)?[rs]?$/g,
                ol = /(\*)(0+)|(#+)(0+)|(0+)/g,
                ou = /^(0+)$/;

            function oc(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(oi, function(e, r, n) {
                    return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
                }), t
            }

            function os(e) {
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

            function of(e) {
                var t = os(e);
                return t || {}
            }

            function op(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function od(e) {
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

            function oh(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function oy(e, t) {
                if (e) {
                    if ("string" == typeof e) return op(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return op(e, t)
                }
            }
            var om = ((v = {})[v.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", v[v.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", v[v.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", v[v.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", v[v.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", v[v.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", v[v.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", v[v.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", v[v.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", v[v.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", v[v.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", v[v.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", v[v.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", v[v.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", v[v.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", v[v.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", v[v.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", v[v.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", v[v.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", v[v.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", v[v.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", v[v.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", v[v.INVALID_TAG = 23] = "INVALID_TAG", v[v.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", v[v.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", v[v.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", v);

            function ob(e) {
                return !!(e && (void 0 === e ? "undefined" : oh(e)) === "object" && 0 === e.type)
            }

            function ov(e) {
                return !!(e && (void 0 === e ? "undefined" : oh(e)) === "object" && 1 === e.type)
            }
            var og = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                ow = {
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
                oO = new RegExp("^".concat(og.source, "*")),
                oS = new RegExp("".concat(og.source, "*$"));

            function oP(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var oE = !!Object.fromEntries,
                oA = !!String.prototype.trimStart,
                oj = !!String.prototype.trimEnd,
                oI = oE ? Object.fromEntries : function(e) {
                    var t = {},
                        r = !0,
                        n = !1,
                        o = void 0;
                    try {
                        for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                            var l, u = (l = a.value, function(e) {
                                    if (Array.isArray(e)) return e
                                }(l) || function(e) {
                                    var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                    if (null != n) {
                                        var o = [],
                                            a = !0,
                                            i = !1;
                                        try {
                                            for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                        } catch (e) {
                                            i = !0, r = e
                                        } finally {
                                            try {
                                                a || null == n.return || n.return()
                                            } finally {
                                                if (i) throw r
                                            }
                                        }
                                        return o
                                    }
                                }(l) || oy(l, 2) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()),
                                c = u[0],
                                s = u[1];
                            t[c] = s
                        }
                    } catch (e) {
                        n = !0, o = e
                    } finally {
                        try {
                            r || null == i.return || i.return()
                        } finally {
                            if (n) throw o
                        }
                    }
                    return t
                },
                ox = oA ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(oO, "")
                },
                oT = oj ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(oS, "")
                },
                oC = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                ok = function() {
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
                                                    var a = e.charCodeAt(n + 1);
                                                    n += a >= 56320 && a <= 57343 ? 2 : 1
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
                                                    location: oP(r, this.clonePosition())
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
                                        var a = this.parseArgument(e, r);
                                        if (a.err) return a;
                                        n.push(a.val)
                                    } else if (125 === o && e > 0) break;
                                    else if (35 === o && ("plural" === t || "selectordinal" === t)) {
                                        var i = this.clonePosition();
                                        this.bump(), n.push({
                                            type: 7,
                                            location: oP(i, this.clonePosition())
                                        })
                                    } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                        if (60 === o && !this.ignoreTag && oN(this.peek() || 0)) {
                                            var l = this.parseTag(e, t);
                                            if (l.err) return l;
                                            n.push(l.val)
                                        } else {
                                            var u = this.parseLiteral(e, t);
                                            if (u.err) return u;
                                            n.push(u.val)
                                        }
                                    else if (!r) return this.error(26, oP(this.clonePosition(), this.clonePosition()));
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
                                        location: oP(r, this.clonePosition())
                                    },
                                    err: null
                                };
                                if (!this.bumpIf(">")) return this.error(23, oP(r, this.clonePosition()));
                                var o = this.parseMessage(e + 1, t, !0);
                                if (o.err) return o;
                                var a = o.val,
                                    i = this.clonePosition();
                                if (!this.bumpIf("</")) return this.error(27, oP(r, this.clonePosition()));
                                if (this.isEOF() || !oN(this.char())) return this.error(23, oP(i, this.clonePosition()));
                                var l = this.clonePosition();
                                return n !== this.parseTagName() ? this.error(26, oP(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                    val: {
                                        type: 8,
                                        value: n,
                                        children: a,
                                        location: oP(r, this.clonePosition())
                                    },
                                    err: null
                                } : this.error(23, oP(i, this.clonePosition()))
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
                                    var a = this.tryParseUnquoted(e, t);
                                    if (a) {
                                        n += a;
                                        continue
                                    }
                                    var i = this.tryParseLeftAngleBracket();
                                    if (i) {
                                        n += i;
                                        continue
                                    }
                                    break
                                }
                                return {
                                    val: {
                                        type: 0,
                                        value: n,
                                        location: oP(r, this.clonePosition())
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseLeftAngleBracket",
                            value: function() {
                                var e;
                                return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (oN(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                                    if (Array.isArray(e)) return op(e)
                                }(r) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || oy(r) || function() {
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
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, oP(r, this.clonePosition()));
                                if (125 === this.char()) return this.bump(), this.error(2, oP(r, this.clonePosition()));
                                var n = this.parseIdentifierIfPossible().value;
                                if (!n) return this.error(3, oP(r, this.clonePosition()));
                                if (this.bumpSpace(), this.isEOF()) return this.error(1, oP(r, this.clonePosition()));
                                switch (this.char()) {
                                    case 125:
                                        return this.bump(), {
                                            val: {
                                                type: 1,
                                                value: n,
                                                location: oP(r, this.clonePosition())
                                            },
                                            err: null
                                        };
                                    case 44:
                                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, oP(r, this.clonePosition()));
                                        return this.parseArgumentOptions(e, t, n, r);
                                    default:
                                        return this.error(3, oP(r, this.clonePosition()))
                                }
                            }
                        }, {
                            key: "parseIdentifierIfPossible",
                            value: function() {
                                var e, t, r = this.clonePosition(),
                                    n = this.offset(),
                                    o = (e = this.message, oC.lastIndex = n, null != (t = oC.exec(e)[1]) ? t : ""),
                                    a = n + o.length;
                                return this.bumpTo(a), {
                                    value: o,
                                    location: oP(r, this.clonePosition())
                                }
                            }
                        }, {
                            key: "parseArgumentOptions",
                            value: function(e, t, r, n) {
                                var o = this.clonePosition(),
                                    a = this.parseIdentifierIfPossible().value,
                                    i = this.clonePosition();
                                switch (a) {
                                    case "":
                                        return this.error(4, oP(o, i));
                                    case "number":
                                    case "date":
                                    case "time":
                                        this.bumpSpace();
                                        var l, u = null;
                                        if (this.bumpIf(",")) {
                                            this.bumpSpace();
                                            var c = this.clonePosition(),
                                                s = this.parseSimpleArgStyleIfPossible();
                                            if (s.err) return s;
                                            var f = oT(s.val);
                                            if (0 === f.length) return this.error(6, oP(this.clonePosition(), this.clonePosition()));
                                            u = {
                                                style: f,
                                                styleLocation: oP(c, this.clonePosition())
                                            }
                                        }
                                        var p = this.tryParseArgumentClose(n);
                                        if (p.err) return p;
                                        var d = oP(n, this.clonePosition());
                                        if (u && u.style.startsWith("::")) {
                                            var h = ox(u.style.slice(2));
                                            if ("number" === a) {
                                                var y = this.parseNumberSkeletonFromString(h, u.styleLocation);
                                                if (y.err) return y;
                                                return {
                                                    val: {
                                                        type: 2,
                                                        value: r,
                                                        location: d,
                                                        style: y.val
                                                    },
                                                    err: null
                                                }
                                            }
                                            if (0 === h.length) return this.error(10, d);
                                            var m, b = h;
                                            return this.locale && (b = function(e, t) {
                                                for (var r = "", n = 0; n < e.length; n++) {
                                                    var o = e.charAt(n);
                                                    if ("j" === o) {
                                                        for (var a = 0; n + 1 < e.length && e.charAt(n + 1) === o;) a++, n++;
                                                        var i = 1 + (1 & a),
                                                            l = a < 2 ? 1 : 3 + (a >> 1),
                                                            u = function(e) {
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
                                                                return "root" !== n && (t = e.maximize().region), (ow[t || ""] || ow[n || ""] || ow["".concat(n, "-001")] || ow["001"])[0]
                                                            }(t);
                                                        for (("H" == u || "k" == u) && (l = 0); l-- > 0;) r += "a";
                                                        for (; i-- > 0;) r = u + r
                                                    } else "J" === o ? r += "H" : r += o
                                                }
                                                return r
                                            }(h, this.locale)), {
                                                val: {
                                                    type: "date" === a ? 3 : 4,
                                                    value: r,
                                                    location: d,
                                                    style: {
                                                        type: 1,
                                                        pattern: b,
                                                        location: u.styleLocation,
                                                        parsedOptions: this.shouldParseSkeletons ? (m = {}, b.replace(on, function(e) {
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
                                                type: "number" === a ? 2 : "date" === a ? 3 : 4,
                                                value: r,
                                                location: d,
                                                style: null != (l = null == u ? void 0 : u.style) ? l : null
                                            }, err: null
                                        };
                                    case "plural":
                                    case "selectordinal":
                                    case "select":
                                        var v = this.clonePosition();
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, oP(v, od({}, v)));
                                        this.bumpSpace();
                                        var g = this.parseIdentifierIfPossible(),
                                            w = 0;
                                        if ("select" !== a && "offset" === g.value) {
                                            if (!this.bumpIf(":")) return this.error(13, oP(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var O = this.tryParseDecimalInteger(13, 14);
                                            if (O.err) return O;
                                            this.bumpSpace(), g = this.parseIdentifierIfPossible(), w = O.val
                                        }
                                        var S = this.tryParsePluralOrSelectOptions(e, a, t, g);
                                        if (S.err) return S;
                                        var P = this.tryParseArgumentClose(n);
                                        if (P.err) return P;
                                        var E = oP(n, this.clonePosition());
                                        if ("select" === a) return {
                                            val: {
                                                type: 5,
                                                value: r,
                                                options: oI(S.val),
                                                location: E
                                            },
                                            err: null
                                        };
                                        return {
                                            val: {
                                                type: 6,
                                                value: r,
                                                options: oI(S.val),
                                                offset: w,
                                                pluralType: "plural" === a ? "cardinal" : "ordinal",
                                                location: E
                                            }, err: null
                                        };
                                    default:
                                        return this.error(5, oP(o, i))
                                }
                            }
                        }, {
                            key: "tryParseArgumentClose",
                            value: function(e) {
                                return this.isEOF() || 125 !== this.char() ? this.error(1, oP(e, this.clonePosition())) : (this.bump(), {
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
                                        if (!this.bumpUntil("'")) return this.error(11, oP(r, this.clonePosition()));
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
                                        var t = e.split(oo).filter(function(e) {
                                                return e.length > 0
                                            }),
                                            r = [],
                                            n = !0,
                                            o = !1,
                                            a = void 0;
                                        try {
                                            for (var i, l = t[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                                                var u = i.value.split("/");
                                                if (0 === u.length) throw Error("Invalid number skeleton");
                                                var c = function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(u) || function(e) {
                                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                                    }(u) || function(e) {
                                                        if (e) {
                                                            if ("string" == typeof e) return oe(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oe(e, void 0)
                                                        }
                                                    }(u) || function() {
                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                    }(),
                                                    s = c[0],
                                                    f = c.slice(1),
                                                    p = !0,
                                                    d = !1,
                                                    h = void 0;
                                                try {
                                                    for (var y, m = f[Symbol.iterator](); !(p = (y = m.next()).done); p = !0) {
                                                        var b = y.value;
                                                        if (0 === b.length) throw Error("Invalid number skeleton")
                                                    }
                                                } catch (e) {
                                                    d = !0, h = e
                                                } finally {
                                                    try {
                                                        p || null == m.return || m.return()
                                                    } finally {
                                                        if (d) throw h
                                                    }
                                                }
                                                r.push({
                                                    stem: s,
                                                    options: f
                                                })
                                            }
                                        } catch (e) {
                                            o = !0, a = e
                                        } finally {
                                            try {
                                                n || null == l.return || l.return()
                                            } finally {
                                                if (o) throw a
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
                                                for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                                    var l = a.value;
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
                                                            t = ot(or(ot({}, t), {
                                                                notation: "scientific"
                                                            }), l.options.reduce(function(e, t) {
                                                                return ot({}, e, of(t))
                                                            }, {}));
                                                            continue;
                                                        case "engineering":
                                                            t = ot(or(ot({}, t), {
                                                                notation: "engineering"
                                                            }), l.options.reduce(function(e, t) {
                                                                return ot({}, e, of(t))
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
                                                            l.options[0].replace(ol, function(e, r, n, o, a, i) {
                                                                if (r) t.minimumIntegerDigits = n.length;
                                                                else if (o && a) throw Error("We currently do not support maximum integer digits");
                                                                else if (i) throw Error("We currently do not support exact integer digits");
                                                                return ""
                                                            });
                                                            continue
                                                    }
                                                    if (ou.test(l.stem)) {
                                                        t.minimumIntegerDigits = l.stem.length;
                                                        continue
                                                    }
                                                    if (oa.test(l.stem)) {
                                                        if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                        l.stem.replace(oa, function(e, r, n, o, a, i) {
                                                            return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : a && i ? (t.minimumFractionDigits = a.length, t.maximumFractionDigits = a.length + i.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                        });
                                                        var u = l.options[0];
                                                        "w" === u ? t = or(ot({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : u && (t = ot({}, t, oc(u)));
                                                        continue
                                                    }
                                                    if (oi.test(l.stem)) {
                                                        t = ot({}, t, oc(l.stem));
                                                        continue
                                                    }
                                                    var c = os(l.stem);
                                                    c && (t = ot({}, t, c));
                                                    var s = function(e) {
                                                        var t;
                                                        if ("E" === e[0] && "E" === e[1] ? (t = {
                                                                notation: "engineering"
                                                            }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                                notation: "scientific"
                                                            }, e = e.slice(1)), t) {
                                                            var r = e.slice(0, 2);
                                                            if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !ou.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                            t.minimumIntegerDigits = e.length
                                                        }
                                                        return t
                                                    }(l.stem);
                                                    s && (t = ot({}, t, s))
                                                }
                                            } catch (e) {
                                                n = !0, o = e
                                            } finally {
                                                try {
                                                    r || null == i.return || i.return()
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
                                for (var o = !1, a = [], i = new Set, l = n.value, u = n.location;;) {
                                    if (0 === l.length) {
                                        var c, s = this.clonePosition();
                                        if ("select" !== t && this.bumpIf("=")) {
                                            var f = this.tryParseDecimalInteger(16, 19);
                                            if (f.err) return f;
                                            u = oP(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                        } else break
                                    }
                                    if (i.has(l)) return this.error("select" === t ? 21 : 20, u);
                                    "other" === l && (o = !0), this.bumpSpace();
                                    var p = this.clonePosition();
                                    if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, oP(this.clonePosition(), this.clonePosition()));
                                    var d = this.parseMessage(e + 1, t, r);
                                    if (d.err) return d;
                                    var h = this.tryParseArgumentClose(p);
                                    if (h.err) return h;
                                    a.push([l, {
                                        value: d.val,
                                        location: oP(p, this.clonePosition())
                                    }]), i.add(l), this.bumpSpace(), l = (c = this.parseIdentifierIfPossible()).value, u = c.location
                                }
                                return 0 === a.length ? this.error("select" === t ? 15 : 16, oP(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, oP(this.clonePosition(), this.clonePosition())) : {
                                    val: a,
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseDecimalInteger",
                            value: function(e, t) {
                                var r = 1,
                                    n = this.clonePosition();
                                this.bumpIf("+") || this.bumpIf("-") && (r = -1);
                                for (var o = !1, a = 0; !this.isEOF();) {
                                    var i = this.char();
                                    if (i >= 48 && i <= 57) o = !0, a = 10 * a + (i - 48), this.bump();
                                    else break
                                }
                                var l = oP(n, this.clonePosition());
                                return o ? Number.isSafeInteger(a *= r) ? {
                                    val: a,
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

            function oN(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }

            function oD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oR(e, t, r) {
                return t = oF(t),
                    function(e, t) {
                        if (t && ("object" === oW(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, oK() ? Reflect.construct(t, r || [], oF(e).constructor) : t.apply(e, r))
            }

            function o_(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function oL(e, t, r) {
                return (oL = oK() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && oz(o, r.prototype), o
                }).apply(null, arguments)
            }

            function oU(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function oB(e, t, r) {
                return t && oU(e.prototype, t), r && oU(e, r), e
            }

            function oM() {
                return (oM = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function oF(e) {
                return (oF = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function oH(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && oz(e, t)
            }

            function oG(e) {
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

            function oz(e, t) {
                return (oz = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function oV(e) {
                return function(e) {
                    if (Array.isArray(e)) return oD(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oD(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oD(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oW(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function oq(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (oq = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return oL(e, arguments, oF(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), oz(r, e)
                })(e)
            }

            function oK() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (oK = function() {
                    return !!e
                })()
            }
            var o$ = function(e) {
                    function t(e, r, n) {
                        var o;
                        return o_(this, t), (o = oR(this, t, [e])).code = r, o.originalMessage = n, o
                    }
                    return oH(t, e), oB(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(oq(Error)),
                oZ = function(e) {
                    function t(e, r, n, o) {
                        return o_(this, t), oR(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return oH(t, e), t
                }(o$),
                oY = function(e) {
                    function t(e, r, n) {
                        return o_(this, t), oR(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return oH(t, e), t
                }(o$),
                oX = function(e) {
                    function t(e, r) {
                        return o_(this, t), oR(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
                    }
                    return oH(t, e), t
                }(o$);

            function oJ(e) {
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
            var oQ = ((L = function() {
                function e(t) {
                    var r, n = this,
                        o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        a = arguments.length > 2 ? arguments[2] : void 0,
                        i = arguments.length > 3 ? arguments[3] : void 0;
                    if (o_(this, e), this.formatterCache = {
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
                            return function e(t, r, n, o, a, i, l) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var u = [],
                                    c = !0,
                                    s = !1,
                                    f = void 0;
                                try {
                                    for (var p, d = t[Symbol.iterator](); !(c = (p = d.next()).done); c = !0) {
                                        var h = p.value;
                                        if (0 === h.type) {
                                            u.push({
                                                type: 0,
                                                value: h.value
                                            });
                                            continue
                                        }
                                        if (7 === h.type) {
                                            "number" == typeof i && u.push({
                                                type: 0,
                                                value: n.getNumberFormat(r).format(i)
                                            });
                                            continue
                                        }
                                        var y = h.value;
                                        if (!(a && y in a)) throw new oX(y, l);
                                        var m = a[y];
                                        if (1 === h.type) {
                                            m && "string" != typeof m && "number" != typeof m && (void 0 === m ? "undefined" : oW(m)) !== "bigint" || (m = "string" == typeof m || "number" == typeof m || (void 0 === m ? "undefined" : oW(m)) === "bigint" ? String(m) : ""), u.push({
                                                type: +("string" != typeof m),
                                                value: m
                                            });
                                            continue
                                        }
                                        if (3 === h.type) {
                                            var b = "string" == typeof h.style ? o.date[h.style] : ov(h.style) ? h.style.parsedOptions : void 0;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, b).format(m)
                                            });
                                            continue
                                        }
                                        if (4 === h.type) {
                                            var v = "string" == typeof h.style ? o.time[h.style] : ov(h.style) ? h.style.parsedOptions : o.time.medium;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, v).format(m)
                                            });
                                            continue
                                        }
                                        if (2 === h.type) {
                                            var g = "string" == typeof h.style ? o.number[h.style] : ob(h.style) ? h.style.parsedOptions : void 0;
                                            if (g && g.scale) {
                                                var w = g.scale || 1;
                                                if ((void 0 === m ? "undefined" : oW(m)) === "bigint") {
                                                    if (!Number.isInteger(w)) throw TypeError("Cannot apply fractional scale ".concat(w, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    m *= BigInt(w)
                                                } else m *= w
                                            }
                                            u.push({
                                                type: 0,
                                                value: n.getNumberFormat(r, g).format(m)
                                            });
                                            continue
                                        }
                                        if (8 === h.type) {
                                            var O = h.children,
                                                S = h.value,
                                                P = a[S];
                                            if ("function" != typeof P) throw new oY(S, "function", l);
                                            var E = P(e(O, r, n, o, a, i).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(E) || (E = [E]), u.push.apply(u, oV(E.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === h.type) {
                                            var A = m,
                                                j = (Object.prototype.hasOwnProperty.call(h.options, A) ? h.options[A] : void 0) || h.options.other;
                                            if (!j) throw new oZ(h.value, m, Object.keys(h.options), l);
                                            u.push.apply(u, oV(e(j.value, r, n, o, a)));
                                            continue
                                        }
                                        if (6 === h.type) {
                                            var I = "=".concat(m),
                                                x = Object.prototype.hasOwnProperty.call(h.options, I) ? h.options[I] : void 0;
                                            if (!x) {
                                                if (!Intl.PluralRules) throw new o$('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var T = (void 0 === m ? "undefined" : oW(m)) === "bigint" ? Number(m) : m,
                                                    C = n.getPluralRules(r, {
                                                        type: h.pluralType
                                                    }).select(T - (h.offset || 0));
                                                x = (Object.prototype.hasOwnProperty.call(h.options, C) ? h.options[C] : void 0) || h.options.other
                                            }
                                            if (!x) throw new oZ(h.value, m, Object.keys(h.options), l);
                                            var k = (void 0 === m ? "undefined" : oW(m)) === "bigint" ? Number(m) : m;
                                            u.push.apply(u, oV(e(x.value, r, n, o, a, k - (h.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    s = !0, f = e
                                } finally {
                                    try {
                                        c || null == d.return || d.return()
                                    } finally {
                                        if (s) throw f
                                    }
                                }
                                return u.length < 2 ? u : u.reduce(function(e, t) {
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
                        var l, u, c = i || {},
                            s = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(c), oM({}, c));
                        this.ast = e.__parse(t, (l = oG({}, s), u = u = {
                            locale: this.resolvedLocale
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(l, Object.getOwnPropertyDescriptors(u)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(u)).forEach(function(e) {
                            Object.defineProperty(l, e, Object.getOwnPropertyDescriptor(u, e))
                        }), l))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (r = e.formats, a ? Object.keys(r).reduce(function(e, t) {
                        var n, o;
                        return e[t] = (n = r[t], (o = a[t]) ? oG({}, n, o, Object.keys(n).reduce(function(e, t) {
                            return e[t] = oG({}, n[t], o[t]), e
                        }, {})) : n), e
                    }, oG({}, r)) : r), this.formatters = i && i.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: nK(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return oL(Intl.NumberFormat, oV(t))
                            }, {
                                cache: oJ(e.number),
                                strategy: nQ.variadic
                            }),
                            getDateTimeFormat: nK(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return oL(Intl.DateTimeFormat, oV(t))
                            }, {
                                cache: oJ(e.dateTime),
                                strategy: nQ.variadic
                            }),
                            getPluralRules: nK(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return oL(Intl.PluralRules, oV(t))
                            }, {
                                cache: oJ(e.pluralRules),
                                strategy: nQ.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return oB(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, L.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, L.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = new ok(e, t = od({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (r.err) {
                    var n = SyntaxError(om[r.err.kind]);
                    throw n.location = r.err.location, n.originalMessage = r.err.message, n
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                        else 2 === t.type && ob(t.style) || (3 === t.type || 4 === t.type) && ov(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(r.val), r.val
            }, L.formats = {
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
            }, L);

            function o0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o1(e) {
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

            function o2(e, t) {
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

            function o3(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return o0(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function o6() {
                for (var e, t, r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
                var u = o3(i, 4),
                    c = (u[0], u[1]),
                    s = u[2],
                    f = u[3];
                if (Array.isArray(c)) throw new n8(n4.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === c ? "undefined" : c && "u" > typeof Symbol && c.constructor === Symbol ? "symbol" : typeof c)) throw new n8(n4.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof c) {
                    var p = s || /'[{}<#|']/.test(c) ? void 0 : c;
                    if (p) return p
                }
                var d = f.cache,
                    h = f.formats,
                    y = f.formatters,
                    m = f.globalFormats,
                    b = f.locale,
                    v = f.timeZone;
                y.getMessageFormat || (y.getMessageFormat = n7(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new oQ(t[0], t[1], t[2], o1({
                        formatters: y
                    }, t[3]))
                }, d.message));
                try {
                    o = y.getMessageFormat(c, b, (e = oQ.formats.date, t = oQ.formats.time, r = o1({}, null == m ? void 0 : m.dateTime, null == h ? void 0 : h.dateTime), n = {
                        date: o1({}, e, r),
                        time: o1({}, t, r),
                        number: o1({}, null == m ? void 0 : m.number, null == h ? void 0 : h.number)
                    }, v && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            a = void 0;
                        try {
                            for (var i, l = Object.entries(t)[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                                var u = o3(i.value, 2),
                                    c = u[0],
                                    s = u[1];
                                t[c] = o1({
                                    timeZone: v
                                }, s)
                            }
                        } catch (e) {
                            o = !0, a = e
                        } finally {
                            try {
                                r || null == l.return || l.return()
                            } finally {
                                if (o) throw a
                            }
                        }
                    }), n), {
                        formatters: o2(o1({}, y), {
                            getDateTimeFormat: function(e, t) {
                                var r;
                                return y.getDateTimeFormat(e, o2(o1({}, t), {
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : v
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new n8(n4.INVALID_MESSAGE, void 0)
                }
                var g = o.format(s);
                return (0, q.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
            }

            function o5(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function o8(e) {
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

            function o4(e, t) {
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

            function o7() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return t.filter(Boolean).join(".")
            }

            function o9(e) {
                return o7(e.namespace, e.key)
            }

            function ae(e) {
                console.error(e)
            }

            function at(e, t, r, n) {
                var o = o7(n, r);
                if (!t) throw Error(o);
                var a = t;
                return r.split(".").forEach(function(t) {
                    var r = a[t];
                    if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
                    a = r
                }), a
            }
            o6.raw = !0;
            var ar = (0, q.createContext)(void 0);

            function an(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    a = e.messages,
                    i = e.now,
                    l = e.onError,
                    u = e.timeZone,
                    c = (0, q.useContext)(ar),
                    s = (0, q.useMemo)(function() {
                        return (null == c ? void 0 : c.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [o, null == c ? void 0 : c.cache]),
                    f = (0, q.useMemo)(function() {
                        return (null == c ? void 0 : c.formatters) || {
                            getDateTimeFormat: n9(Intl.DateTimeFormat, s.dateTime),
                            getNumberFormat: n9(Intl.NumberFormat, s.number),
                            getPluralRules: n9(Intl.PluralRules, s.pluralRules),
                            getRelativeTimeFormat: n9(Intl.RelativeTimeFormat, s.relativeTime),
                            getListFormat: n9(Intl.ListFormat, s.list),
                            getDisplayNames: n9(Intl.DisplayNames, s.displayNames)
                        }
                    }, [s, null == c ? void 0 : c.formatters]),
                    p = (0, q.useMemo)(function() {
                        var e, t, p, d, h, y, m;
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
                            formats: void 0 === r ? null == c ? void 0 : c.formats : r,
                            getMessageFallback: n || (null == c ? void 0 : c.getMessageFallback),
                            messages: void 0 === a ? null == c ? void 0 : c.messages : a,
                            now: i || (null == c ? void 0 : c.now),
                            onError: l || (null == c ? void 0 : c.onError),
                            timeZone: u || (null == c ? void 0 : c.timeZone)
                        }).formats, p = e.getMessageFallback, d = e.messages, h = e.onError, o4(o8({}, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: d || void 0,
                            onError: h || ae,
                            getMessageFallback: p || o9
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
                    }, [s, r, f, n, o, a, i, l, c, u]);
                return (0, ne.jsx)(ar.Provider, {
                    value: p,
                    children: t
                })
            }

            function ao() {
                var e = (0, q.useContext)(ar);
                if (!e) throw Error(void 0);
                return e
            }
            var aa = !1,
                ai = "u" < typeof window;

            function al(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var au = "__FN_nvfToKPAOuiV__",
                ac = "__FN_END_nvfToKPAOuiV__",
                as = new RegExp("".concat(au, "(\\d+)\\|")),
                af = new RegExp("".concat(ac, "(\\d+)\\|")),
                ap = function(e, t, r) {
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
                            a = "".concat(au).concat(r, "|"),
                            i = "".concat(ac).concat(r, "|");
                        n[e.opening] = a, n[e.closing] = i, o[r] = {
                            start: a,
                            end: i,
                            render: e.render
                        }
                    });
                    var a = function(e) {
                            var t = [],
                                r = as.exec(e),
                                n = af.exec(e);
                            if (n && (!r || n.index < r.index)) return null;
                            if (!r) return [e];
                            r.index > 0 && t.push(e.slice(0, r.index));
                            var i = null == r[1] ? void 0 : o[r[1]];
                            if (null == i) return null;
                            var l = e.indexOf(i.end);
                            if (l < r.index + r[0].length) return null;
                            var u = a(e.slice(r.index + r[0].length, l));
                            if (null == u) return null;
                            t.push(i.render(u));
                            var c = e.slice(l + i.end.length);
                            if (c.length > 0) {
                                var s = a(c);
                                if (null == s) return null;
                                t.push.apply(t, function(e) {
                                    if (Array.isArray(e)) return al(e)
                                }(s) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(s) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return al(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return al(e, void 0)
                                    }
                                }(s) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                            return t
                        },
                        i = a(e(n));
                    return null == i ? null : i.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, ne.jsx)(q.Fragment, {
                            children: e
                        }, t)
                    })
                },
                ad = function(e) {
                    return e.replaceAll(".", ":")
                };

            function ah(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ay(e) {
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

            function am(e, t) {
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

            function ab(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ah(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ah(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function av(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function ag() {
                return null != U || (U = "".concat(Y().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), U
            }
            var aw = function() {};

            function aO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aS(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var aP = function(e, t) {
                    return e << 3 | t
                },
                aE = aP(1, 2),
                aA = aP(2, 2),
                aj = aP(5, 2),
                aI = aP(6, 2),
                ax = aP(8, 2),
                aT = aP(1, 2),
                aC = aP(2, 1),
                ak = aP(3, 0),
                aN = aP(5, 2);
            aP(1, 2), aP(2, 1), aP(3, 0), aP(4, 2), aP(5, 2), aP(6, 0), aP(8, 2);
            var aD = aP(4, 0),
                aR = aP(6, 2),
                a_ = aP(7, 2);
            aP(1, 0), aP(2, 2);
            var aL = aP(1, 2),
                aU = aP(2, 2),
                aB = aP(1, 2);
            aP(1, 2), aP(2, 2), aP(1, 2);
            var aM = new TextEncoder,
                aF = function() {
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
                                var t = (void 0 === e ? "undefined" : aS(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = aM.encode(e);
                                this.writeVarint(t.length);
                                var r = !0,
                                    n = !1,
                                    o = void 0;
                                try {
                                    for (var a, i = t[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                        var l = a.value;
                                        this.buf.push(l)
                                    }
                                } catch (e) {
                                    n = !0, o = e
                                } finally {
                                    try {
                                        r || null == i.return || i.return()
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
                                    for (var o, a = e[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) {
                                        var i = o.value;
                                        this.buf.push(i)
                                    }
                                } catch (e) {
                                    r = !0, n = e
                                } finally {
                                    try {
                                        t || null == a.return || a.return()
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

            function aH(e, t, r) {
                var n = new aF;
                return n.writeVarint(aP(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function aG(e) {
                var t = new aF;
                if (t.writeVarint(aT), t.writeString(e.name), t.writeVarint(aC), t.writeDouble(e.value), t.writeVarint(ak), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new aF,
                            r = !0,
                            n = !1,
                            o = void 0;
                        try {
                            for (var a, i = Object.entries(e)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) ! function() {
                                var e, r = (e = a.value, function(e) {
                                        if (Array.isArray(e)) return e
                                    }(e) || function(e) {
                                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                        if (null != n) {
                                            var o = [],
                                                a = !0,
                                                i = !1;
                                            try {
                                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                            } catch (e) {
                                                i = !0, r = e
                                            } finally {
                                                try {
                                                    a || null == n.return || n.return()
                                                } finally {
                                                    if (i) throw r
                                                }
                                            }
                                            return o
                                        }
                                    }(e) || function(e) {
                                        if (e) {
                                            if ("string" == typeof e) return aO(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aO(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var i = aH(n, aP(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(aj), t.writeBytes(i)
                                } else if ("boolean" == typeof o) {
                                    var l = aH(n, aP(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(aI), t.writeBytes(l)
                                } else if ((void 0 === o ? "undefined" : aS(o)) === "bigint") {
                                    var u = aH(n, aP(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(aA), t.writeBytes(u)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var c = aH(n, aP(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(aE), t.writeBytes(c)
                                        } else if (Number.isInteger(o)) {
                                    var s = aH(n, aP(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(aA), t.writeBytes(s)
                                } else {
                                    var f = aH(n, aP(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(ax), t.writeBytes(f)
                                } else {
                                    var p = aH(n, aP(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(aj), t.writeBytes(p)
                                }
                            }()
                        } catch (e) {
                            n = !0, o = e
                        } finally {
                            try {
                                r || null == i.return || i.return()
                            } finally {
                                if (n) throw o
                            }
                        }
                        return t.toBytes()
                    }(e.attributes);
                    t.writeVarint(aN), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function az(e, t, r) {
                var n = new aF;
                n.writeVarint(aD), n.writeVarint(r);
                var o = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var l, u = e[Symbol.iterator](); !(o = (l = u.next()).done); o = !0) {
                        var c = l.value;
                        n.writeVarint(aR), n.writeBytes(c)
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        o || null == u.return || u.return()
                    } finally {
                        if (a) throw i
                    }
                }
                var s = !0,
                    f = !1,
                    p = void 0;
                try {
                    for (var d, h = t[Symbol.iterator](); !(s = (d = h.next()).done); s = !0) {
                        var y = d.value;
                        n.writeVarint(a_), n.writeBytes(y)
                    }
                } catch (e) {
                    f = !0, p = e
                } finally {
                    try {
                        s || null == h.return || h.return()
                    } finally {
                        if (f) throw p
                    }
                }
                return n.toBytes()
            }

            function aV(e) {
                var t = new aF;
                t.writeVarint(aL), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(aU), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new aF;
                return n.writeVarint(aB), n.writeBytes(r), n.toBytes()
            }
            var aW = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function aq(e) {
                return aW.test(e)
            }
            var aK = [],
                a$ = !1,
                aZ = !1;

            function aY(e, t) {
                var r, n, o, a = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    i = BigInt(Date.now());
                !0 === t || aZ || "u" > typeof document && "hidden" === document.visibilityState ? (r = aV(az(a.map(aG), [], i)).buffer, fetch("".concat(ag()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(aw)) : (n = aV(az(a.map(aG), [], i)), (o = function() {
                    var e, t, r, o, a, i, l, u, c, s, f, p, d;
                    return function(e, t) {
                        var r, n, o, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(i, "next", {
                            value: u(0)
                        }), l(i, "throw", {
                            value: u(1)
                        }), l(i, "return", {
                            value: u(2)
                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function u(l) {
                            return function(u) {
                                var c = [l, u];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                        case 0:
                                        case 1:
                                            o = c;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: c[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = c[1], c = [0];
                                            continue;
                                        case 7:
                                            c = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                a.label = c[1];
                                                break
                                            }
                                            if (6 === c[0] && a.label < o[1]) {
                                                a.label = o[1], o = c;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(c);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    c = t.call(e, a)
                                } catch (e) {
                                    c = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & c[0]) throw c[1];
                                return {
                                    value: c[0] ? c[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(h) {
                        switch (h.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(aw), t.close().catch(aw), r = [], [4, (o = e.readable.getReader()).read()];
                            case 1:
                                a = h.sent(), h.label = 2;
                            case 2:
                                if (a.done) return [3, 4];
                                return r.push(a.value), [4, o.read()];
                            case 3:
                                return a = h.sent(), [3, 2];
                            case 4:
                                i = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), l = 0, u = !0, c = !1, s = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(u = (p = f.next()).done); u = !0) d = p.value, i.set(d, l), l += d.length
                                } catch (e) {
                                    c = !0, s = e
                                } finally {
                                    try {
                                        u || null == f.return || f.return()
                                    } finally {
                                        if (c) throw s
                                    }
                                }
                                return [2, {
                                    body: i.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var a = o.apply(e, t);

                        function i(e) {
                            av(a, r, n, i, l, "next", e)
                        }

                        function l(e) {
                            av(a, r, n, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(ag()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(aw)
            }

            function aX() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = aK[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var a = n.value.splice(0);
                        0 !== a.length && aY(a, !0)
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

            function aJ(e, t) {
                var r, n, o, a = Math.max(1, null != (r = null == t ? void 0 : t.batchSize) ? r : 10),
                    i = null != (n = null == t ? void 0 : t.batchIntervalMs) ? n : 250;

                function l(e, r) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, r): console.error(e, r)
                }
                if (!aq(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var u = [];
                return aK.push(u), a$ || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && aX()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        aZ = !0, aX()
                    }), a$ = !0),
                    function(t, r, n) {
                        var c = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!aq(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        o = void 0;
                                    try {
                                        for (var a, i = Object.keys(t)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                            var l = a.value;
                                            if (!aq(l)) return !1
                                        }
                                    } catch (e) {
                                        n = !0, o = e
                                    } finally {
                                        try {
                                            r || null == i.return || i.return()
                                        } finally {
                                            if (n) throw o
                                        }
                                    }
                                }
                                return !0
                            }(c, r)) return void l("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: t,
                            attributes: r
                        });
                        var s = null != n ? n : 1;
                        if (!Number.isFinite(s)) return void l("@rbx/web-telemetry: value must be a finite number", {
                            name: t,
                            attributes: r
                        });
                        var f = r && Object.keys(r).length > 0 ? r : void 0;
                        u.push({
                            name: c,
                            attributes: f,
                            value: s,
                            timestampMs: BigInt(Date.now())
                        }), u.length >= a ? (void 0 !== o && (clearTimeout(o), o = void 0), aY(u.splice(0, a))) : void 0 === o && (o = setTimeout(function() {
                            for (o = void 0; u.length > 0;) aY(u.splice(0, a))
                        }, i))
                    }
            }
            var aQ = "WwwCommon",
                a0 = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), am(ay({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = ab(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = ab(r, 3),
                                i = a[0],
                                l = a[1],
                                u = a[2],
                                c = o(i, am(ay({}, null != l ? l : {}), {
                                    severity: "error"
                                }), u);
                            t(i, c)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = ab(r, 3),
                                i = a[0],
                                l = a[1],
                                u = a[2],
                                c = o(i, am(ay({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), u);
                            t(i, c)
                        }
                    }
                }({
                    publish: aJ(aQ)
                });
            a0.trackCounter;
            var a1 = a0.trackError;
            a0.trackCriticalError;
            var a2 = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                a3 = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                a6 = function(e, t, r) {
                    var n;
                    "u" > typeof window && a1(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = a2()) ? n : "unknown"
                    })
                },
                a5 = function(e) {
                    var t, r, n, o, a, i, l, u, c, s, f, p, d, h = (t = ad(e), r = {
                        "!": ao().messages
                    }, n = t ? "!.".concat(t) : "!", a = (o = ao()).cache, i = o.formats, l = o.formatters, u = o.getMessageFallback, c = o.locale, s = o.onError, f = o.timeZone, p = r["!"], d = "!" === n ? void 0 : n.slice(2), f || aa || !ai || (aa = !0, s(new n8(n4.ENVIRONMENT_FALLBACK, void 0))), (0, q.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, r) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var n = r ? at(e, t, r) : t;
                                    if (!n) throw Error(r);
                                    return n
                                } catch (e) {
                                    return new n8(n4.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: a,
                                formatters: l,
                                getMessageFallback: u,
                                messages: p,
                                namespace: d,
                                onError: s,
                                formats: i,
                                locale: c,
                                timeZone: f
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    r = e.formats,
                                    n = e.formatters,
                                    o = e.getMessageFallback,
                                    a = void 0 === o ? o9 : o,
                                    i = e.locale,
                                    l = e.messagesOrError,
                                    u = e.namespace,
                                    c = e.onError,
                                    s = e.timeZone,
                                    f = o5(l, n8);

                                function p(e, t, r, n) {
                                    var o = new n8(t, r);
                                    return c(o), null != n ? n : a({
                                        error: o,
                                        key: e,
                                        namespace: u
                                    })
                                }

                                function d(e, o, d, h) {
                                    var y, m, b;
                                    if (f) {
                                        if (!h) return c(l), a({
                                            error: l,
                                            key: e,
                                            namespace: u
                                        });
                                        y = h
                                    } else try {
                                        y = at(i, l, e, u)
                                    } catch (t) {
                                        if (!h) return p(e, n4.MISSING_MESSAGE, t.message, h);
                                        y = h
                                    }
                                    try {
                                        var v, g = o7(u, e);
                                        return o6(g, y, o ? (v = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, q.isValidElement)(o) ? (0, q.cloneElement)(o, {
                                                    key: e + r++
                                                }) : o
                                            } : n, v[e] = t
                                        }), v) : o, {
                                            cache: t,
                                            formatters: n,
                                            globalFormats: r,
                                            formats: d,
                                            locale: i,
                                            timeZone: s
                                        })
                                    } catch (t) {
                                        return o5(t, n8) ? (m = t.code, b = t.originalMessage) : (m = n4.FORMATTING_ERROR, b = t.message), p(e, m, b, h)
                                    }
                                }

                                function h(e, t, r, n) {
                                    var o = d(e, t, r, n);
                                    return "string" != typeof o ? p(e, n4.INVALID_MESSAGE, void 0) : o
                                }
                                return h.rich = d, h.markup = function(e, t, r, n) {
                                    return d(e, t, r, n)
                                }, h.raw = function(e) {
                                    if (f) return c(l), a({
                                        error: l,
                                        key: e,
                                        namespace: u
                                    });
                                    try {
                                        return at(i, l, e, u)
                                    } catch (t) {
                                        return p(e, n4.MISSING_MESSAGE, t.message)
                                    }
                                }, h.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return at(i, l, e, u), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, h
                            }(o4(o8({}, e), {
                                messagesOrError: t
                            }))
                    }, [a, l, u, p, d, s, i, c, f]));
                    return (0, q.useMemo)(function() {
                        return Object.assign(function(t, r, n) {
                            var o = ad(t);
                            return void 0 === n || h.has(o) ? h(o, r) : (a6("TranslationKeyNotFound", e, o), n)
                        }, {
                            rich: function(e, t) {
                                return h.rich(ad(e), t)
                            },
                            has: function(e) {
                                return a3(e) && h.has(ad(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!a3(t)) return a6("TranslationKeyNotFound", e, String(t)), n;
                                var o = ad(t),
                                    a = h.has(o);
                                return a || a6("TranslationKeyNotFound", e, o), a ? h(o, r) : n
                            },
                            html: function(t, r, n) {
                                if (!a3(t)) return a6("TranslationKeyNotFound", e, String(t)), null;
                                var o = ad(t);
                                if (!h.has(o)) return a6("TranslationKeyNotFound", e, o), null;
                                var a = ap(function(e) {
                                    return h(o, e)
                                }, r, n);
                                return null == a && a6("TranslationMalformed", e, o), a
                            }
                        })
                    }, [h, e])
                },
                a8 = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding", "Feature.Build", "Feature.Friends"];

            function a4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var a7 = function() {
                    var e = function(e) {
                            if (Array.isArray(e)) return e
                        }(a8) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 7 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a8) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return a4(e, 7);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a4(e, 7)
                            }
                        }(a8) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        t = e[0],
                        r = e[1],
                        n = e[2],
                        o = e[3],
                        a = e[4],
                        i = e[5],
                        l = e[6],
                        u = a5(t),
                        c = a5(r),
                        s = a5(n),
                        f = a5(o),
                        p = a5(a),
                        d = a5(i),
                        h = a5(l);
                    return (0, q.useMemo)(function() {
                        var e = [h, d, p, f, s, c, u];
                        return function(t, r, n) {
                            var o = e.find(function(e) {
                                return e.has(t)
                            });
                            return o ? o.dynamic(t, r && Object.fromEntries(Object.entries(r).filter(function(e) {
                                var t, r;
                                return "string" == typeof e[1] || "number" == typeof e[1] || (t = e[1], null != (r = Date) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r)
                            }))) : null != n ? n : ""
                        }
                    }, [u, c, s, f, p, d, h])
                },
                a9 = function(e) {
                    var t = e.onButtonClick,
                        r = e.buttonWidth,
                        n = e.buttonClassName,
                        o = a7();
                    return (0, ne.jsxs)(K().Fragment, {
                        children: [(0, ne.jsx)(nF, {
                            "data-testid": "play-action-needed-button",
                            variant: "Emphasis",
                            style: nq,
                            className: nr()(nW(void 0 === r ? nV : r), void 0 === n ? "btn-common-play-game-action-needed-lg" : n),
                            onClick: t,
                            children: o(ev)
                        }), (0, ne.jsx)("div", {
                            id: "access-management-upsell-container-v1"
                        })]
                    })
                },
                ie = function(e) {
                    var t = e.universeId,
                        r = e.buttonClassName,
                        n = e.pageContext,
                        o = (0, q.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), et(eE.PlayButtonUpsellExperienceApprovalTriggered), r9(t, eA.experienceApprovalUpsellName, eh.ContextualPlayabilityRequireParentApproval, n);
                            var r = rq();
                            r ? r({
                                featureName: "CanApproveExperience",
                                namespace: ex.accountManagement,
                                isAsyncCall: !1,
                                usePrologue: !0,
                                ampRecourseData: {
                                    universeId: t,
                                    experienceManagementAction: "Approve"
                                }
                            }).catch(function() {
                                et(eE.PlayButtonUpsellExperienceApprovalError)
                            }) : et(eE.PlayButtonUpsellExperienceApprovalError)
                        }, [t, n]);
                    return (0, ne.jsx)(a9, {
                        onButtonClick: o,
                        buttonClassName: r
                    })
                };
            ie.defaultProps = {
                buttonClassName: void 0
            };
            var it = function(e) {
                    var t = e.buttonClassName,
                        r = e.buttonWidth;
                    return (0, ne.jsx)(nF, {
                        "data-testid": "play-button-loading",
                        variant: "Emphasis",
                        isLoading: !0,
                        "aria-label": "Loading",
                        style: nq,
                        className: nr()(nW(void 0 === r ? nV : r), void 0 === t ? "btn-common-play-game-lg" : t)
                    })
                },
                ir = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                io = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                ia = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        o = e.className,
                        a = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return K().createElement("button", function(e) {
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
                        className: nn("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", no, io[t], ir[r], n && "radius-circle", o)
                    }, a), K().createElement(na, null), K().createElement(np, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function ii(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function il(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iu(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ic(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iu(e, t, r[t])
                    })
                }
                return e
            }

            function is(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ip(e) {
                return function(e) {
                    if (Array.isArray(e)) return il(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return il(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return il(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function id() {
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
                            return ic({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return q.useMemo(function() {
                            return iu({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var ih = (null == (B = globalThis) ? void 0 : B.document) ? q.useLayoutEffect : function() {};

            function iy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var im = q[" useId ".trim().toString()] || function() {},
                ib = 0;

            function iv(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = q.useState(im())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return iy(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iy(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return ih(function() {
                    e || o(function(e) {
                        return null != e ? e : String(ib++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function ig(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iw(e) {
                var t = q.useRef(e);
                return q.useEffect(function() {
                    t.current = e
                }), q.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return ig(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return ig(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ig(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function iO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iS(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iO(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iO(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iP = window.RadixUI["react-dismissable-layer"],
                iE = window.RadixUI["react-focus-scope"],
                iA = window.ReactDOM,
                ij = r.n(iA);

            function iI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ix(e) {
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

            function iT(e, t) {
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

            function iC(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ik(e) {
                return function(e) {
                    if (Array.isArray(e)) return iI(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iI(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iI(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iN(e) {
                var t, r, n = (t = e, (r = q.forwardRef(function(e, t) {
                        var r = e.children,
                            n = iC(e, ["children"]);
                        if (q.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = ix({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            a.apply(void 0, ik(t)), o.apply(void 0, ik(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = ix({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return ix({}, e, r)
                                }(n, r.props);
                            return r.type !== q.Fragment && (s.ref = t ? ny(t, c) : c), q.cloneElement(r, s)
                        }
                        return q.Children.count(r) > 1 ? q.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = q.forwardRef(function(e, t) {
                        var r = e.children,
                            o = iC(e, ["children"]),
                            a = q.Children.toArray(r),
                            i = a.find(iR);
                        if (i) {
                            var l = i.props.children,
                                u = a.map(function(e) {
                                    return e !== i ? e : q.Children.count(l) > 1 ? q.Children.only(null) : q.isValidElement(l) ? l.props.children : null
                                });
                            return (0, ne.jsx)(n, iT(ix({}, o), {
                                ref: t,
                                children: q.isValidElement(l) ? q.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, ne.jsx)(n, iT(ix({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var iD = Symbol("radix.slottable");

            function iR(e) {
                return q.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === iD
            }

            function i_(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iL(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        i_(e, t, r[t])
                    })
                }
                return e
            }

            function iU(e, t) {
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
            var iB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = iN("Primitive.".concat(t)),
                    n = q.forwardRef(function(e, n) {
                        var o = e.asChild,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            i = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ne.jsx)(i, iU(iL({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), iU(iL({}, e), i_({}, t, n))
            }, {});

            function iM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var iF = q.forwardRef(function(e, t) {
                var r, n, o, a, i, l = e.container,
                    u = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, a = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }
                        if (a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    a = Object.getOwnPropertyNames(e);
                                for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(e, ["container"]),
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = q.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return iM(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iM(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    f = c[1];
                ih(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return p ? ij().createPortal((0, ne.jsx)(iB.div, (n = function(e) {
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
                }({}, u), o = o = {
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

            function iH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iG(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iH(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iH(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            iF.displayName = "Portal";
            var iz = function(e) {
                var t, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v = e.present,
                    g = e.children,
                    w = (t = v, a = (o = iG(q.useState(), 2))[0], i = o[1], l = q.useRef({}), u = q.useRef(t), c = q.useRef("none"), f = (s = iG((r = t ? "mounted" : "unmounted", n = {
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
                    }, q.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], q.useEffect(function() {
                        var e = iV(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), ih(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                o = iV(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = t
                        }
                    }, [t, p]), ih(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = iV(l.current).includes(e.animationName);
                                    if (e.target === a && n && (p("ANIMATION_END"), !u.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (c.current = iV(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: q.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : q.Children.only(g),
                    S = nm(w.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((d = O).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? d.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || w.isPresent ? q.cloneElement(O, {
                    ref: S
                }) : null
            };

            function iV(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            iz.displayName = "Presence";
            var iW = window.RadixUI["react-focus-guards"],
                iq = function() {
                    return (iq = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function iK(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var i$ = "right-scroll-bar-position",
                iZ = "width-before-scroll-bar";

            function iY(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var iX = "u" > typeof window ? q.useLayoutEffect : q.useEffect,
                iJ = new WeakMap,
                iQ = (void 0 === g && (g = {}), (void 0 === w && (w = function(e) {
                    return e
                }), O = [], S = !1, P = {
                    read: function() {
                        if (S) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return O.length ? O[O.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = w(e, S);
                        return O.push(t),
                            function() {
                                O = O.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (S = !0; O.length;) {
                            var t = O;
                            O = [], t.forEach(e)
                        }
                        O = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return O
                            }
                        }
                    },
                    assignMedium: function(e) {
                        S = !0;
                        var t = [];
                        if (O.length) {
                            var r = O;
                            O = [], r.forEach(e), t = O
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), O = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), O
                            }
                        }
                    }
                }).options = iq({
                    async: !0,
                    ssr: !1
                }, g), P),
                i0 = function() {},
                i1 = q.forwardRef(function(e, t) {
                    var r, n, o, a, i = q.useRef(null),
                        l = q.useState({
                            onScrollCapture: i0,
                            onWheelCapture: i0,
                            onTouchMoveCapture: i0
                        }),
                        u = l[0],
                        c = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        p = e.className,
                        d = e.removeScrollBar,
                        h = e.enabled,
                        y = e.shards,
                        m = e.sideCar,
                        b = e.noRelative,
                        v = e.noIsolation,
                        g = e.inert,
                        w = e.allowPinchZoom,
                        O = e.as,
                        S = e.gapMode,
                        P = iK(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        E = (r = [i, t], n = function(e) {
                            return r.forEach(function(t) {
                                return iY(t, e)
                            })
                        }, (o = (0, q.useState)(function() {
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
                        })[0]).callback = n, a = o.facade, iX(function() {
                            var e = iJ.get(a);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = a.current;
                                t.forEach(function(e) {
                                    n.has(e) || iY(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || iY(e, o)
                                })
                            }
                            iJ.set(a, r)
                        }, [r]), a),
                        A = iq(iq({}, P), u);
                    return q.createElement(q.Fragment, null, h && q.createElement(m, {
                        sideCar: iQ,
                        removeScrollBar: d,
                        shards: y,
                        noRelative: b,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: c,
                        allowPinchZoom: !!w,
                        lockRef: i,
                        gapMode: S
                    }), s ? q.cloneElement(q.Children.only(f), iq(iq({}, A), {
                        ref: E
                    })) : q.createElement(void 0 === O ? "div" : O, iq({}, A, {
                        className: p,
                        ref: E
                    }), f))
                });
            i1.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, i1.classNames = {
                fullWidth: iZ,
                zeroRight: i$
            };
            var i2 = function(e) {
                var t = e.sideCar,
                    r = iK(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return q.createElement(n, iq({}, r))
            };
            i2.isSideCarExport = !0;
            var i3 = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = M || r.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, a;
                                (o = t).styleSheet ? o.styleSheet.cssText = n : o.appendChild(document.createTextNode(n)), a = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(a)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                i6 = function() {
                    var e = i3();
                    return function(t, r) {
                        q.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                i5 = function() {
                    var e = i6();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                i8 = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                i4 = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                i7 = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [i4(r), i4(n), i4(o)]
                },
                i9 = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return i8;
                    var t = i7(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                le = i5(),
                lt = "data-scroll-locked",
                lr = function(e, t, r, n) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(lt, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(i$, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(iZ, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(i$, " .").concat(i$, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(iZ, " .").concat(iZ, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(lt, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                ln = function() {
                    var e = parseInt(document.body.getAttribute(lt) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                lo = function() {
                    q.useEffect(function() {
                        return document.body.setAttribute(lt, (ln() + 1).toString()),
                            function() {
                                var e = ln() - 1;
                                e <= 0 ? document.body.removeAttribute(lt) : document.body.setAttribute(lt, e.toString())
                            }
                    }, [])
                },
                la = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    lo();
                    var a = q.useMemo(function() {
                        return i9(o)
                    }, [o]);
                    return q.createElement(le, {
                        styles: lr(a, !t, o, r ? "" : "!important")
                    })
                },
                li = !1;
            if ("u" > typeof window) try {
                var ll = Object.defineProperty({}, "passive", {
                    get: function() {
                        return li = !0, !0
                    }
                });
                window.addEventListener("test", ll, ll), window.removeEventListener("test", ll, ll)
            } catch (e) {
                li = !1
            }
            var lu = !!li && {
                passive: !1
            };

            function lc(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var ls = function(e, t) {
                    if (!lc(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                lf = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && lc(n, ShadowRoot) && (n = n.host), lp(e, n)) {
                            var o = ld(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                lp = function(e, t) {
                    return "v" === e ? ls(t, "overflowY") : ls(t, "overflowX")
                },
                ld = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                lh = function(e, t, r, n, o) {
                    var a, i = (a = window.getComputedStyle(t).direction, "h" === e && "rtl" === a ? -1 : 1),
                        l = i * n,
                        u = r.target,
                        c = t.contains(u),
                        s = !1,
                        f = l > 0,
                        p = 0,
                        d = 0;
                    do {
                        if (!u) break;
                        var h = ld(e, u),
                            y = h[0],
                            m = h[1] - h[2] - i * y;
                        (y || m) && lp(e, u) && (p += m, d += y);
                        var b = u.parentNode;
                        u = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
                },
                ly = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                lm = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                lb = function(e) {
                    return e && "current" in e ? e.current : e
                },
                lv = 0,
                lg = [],
                lw = (E = function(e) {
                    var t = q.useRef([]),
                        r = q.useRef([0, 0]),
                        n = q.useRef(),
                        o = q.useState(lv++)[0],
                        a = q.useState(i5)[0],
                        i = q.useRef(e);
                    q.useEffect(function() {
                        i.current = e
                    }, [e]), q.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(lb), !0).filter(Boolean);
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
                    var l = q.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                            var o, a = ly(e),
                                l = r.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                s = e.target,
                                f = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = lf(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = lf(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (u || c) && (n.current = o), !o) return !0;
                            var d = n.current || o;
                            return lh(d, t, e, "h" === d ? u : c, !0)
                        }, []),
                        u = q.useCallback(function(e) {
                            if (lg.length && lg[lg.length - 1] === a) {
                                var r = "deltaY" in e ? lm(e) : ly(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (i.current.shards || []).map(lb).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = q.useCallback(function(e, r, n, o) {
                            var a = {
                                name: e,
                                delta: r,
                                target: n,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(a), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== a
                                })
                            }, 1)
                        }, []),
                        s = q.useCallback(function(e) {
                            r.current = ly(e), n.current = void 0
                        }, []),
                        f = q.useCallback(function(t) {
                            c(t.type, lm(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = q.useCallback(function(t) {
                            c(t.type, ly(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    q.useEffect(function() {
                        return lg.push(a), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", u, lu), document.addEventListener("touchmove", u, lu), document.addEventListener("touchstart", s, lu),
                            function() {
                                lg = lg.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", u, lu), document.removeEventListener("touchmove", u, lu), document.removeEventListener("touchstart", s, lu)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        h = e.inert;
                    return q.createElement(q.Fragment, null, h ? q.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, d ? q.createElement(la, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, iQ.useMedium(E), i2),
                lO = q.forwardRef(function(e, t) {
                    return q.createElement(i1, iq({}, e, {
                        ref: t,
                        sideCar: lw
                    }))
                });
            lO.classNames = i1.classNames;
            var lS = new WeakMap,
                lP = new WeakMap,
                lE = {},
                lA = 0,
                lj = function(e) {
                    return e && (e.host || lj(e.parentNode))
                },
                lI = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = lj(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    lE[r] || (lE[r] = new WeakMap);
                    var a = lE[r],
                        i = [],
                        l = new Set,
                        u = new Set(o),
                        c = function(e) {
                            !e || l.has(e) || (l.add(e), c(e.parentNode))
                        };
                    o.forEach(c);
                    var s = function(e) {
                        !e || u.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(n),
                                    o = null !== t && "false" !== t,
                                    u = (lS.get(e) || 0) + 1,
                                    c = (a.get(e) || 0) + 1;
                                lS.set(e, u), a.set(e, c), i.push(e), 1 === u && o && lP.set(e, !0), 1 === c && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), lA++,
                        function() {
                            i.forEach(function(e) {
                                var t = lS.get(e) - 1,
                                    o = a.get(e) - 1;
                                lS.set(e, t), a.set(e, o), t || (lP.has(e) || e.removeAttribute(n), lP.delete(e)), o || e.removeAttribute(r)
                            }), --lA || (lS = new WeakMap, lS = new WeakMap, lP = new WeakMap, lE = {})
                        }
                },
                lx = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), lI(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function lT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lC(e) {
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

            function lk(e, t) {
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

            function lN(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function lD(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return lT(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lT(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lR = "Dialog",
                l_ = lD(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return q.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return q.useMemo(function() {
                                    var t, o;
                                    return iu({}, "__scope".concat(e), (t = ic({}, r), o = null != (o = iu({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                        var o = q.createContext(n),
                            a = r.length;
                        r = ip(r).concat([n]);
                        var i = function(t) {
                            var r, n = t.scope,
                                i = t.children,
                                l = is(t, ["scope", "children"]),
                                u = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                                c = q.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, ne.jsx)(u.Provider, {
                                value: c,
                                children: i
                            })
                        };
                        return i.displayName = t + "Provider", [i, function(r, i) {
                            var l, u = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                                c = q.useContext(u);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, id.apply(void 0, [n].concat(ip(t)))]
                }(lR), 2),
                lL = l_[0];
            l_[1];
            var lU = lD(lL(lR), 2),
                lB = lU[0],
                lM = lU[1],
                lF = function(e) {
                    var t, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v = e.__scopeDialog,
                        g = e.children,
                        w = e.open,
                        O = e.defaultOpen,
                        S = e.onOpenChange,
                        P = e.modal,
                        E = q.useRef(null),
                        A = q.useRef(null),
                        j = lD((c = (u = {
                            prop: w,
                            defaultProp: O,
                            onChange: S
                        }).prop, d = (p = iS((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: f = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, a = iS(o = q.useState(r), 1)[0], i = q.useRef(a), l = iw(n), q.useEffect(function() {
                            i.current !== a && (l(a), i.current = a)
                        }, [a, i, l]), o), 2))[0], h = p[1], m = (y = void 0 !== c) ? c : d, b = iw(f), [m, q.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && b(t)
                            } else h(e)
                        }, [y, c, h, b])]), 2),
                        I = j[0],
                        x = j[1];
                    return (0, ne.jsx)(lB, {
                        scope: v,
                        triggerRef: E,
                        contentRef: A,
                        contentId: iv(),
                        titleId: iv(),
                        descriptionId: iv(),
                        open: void 0 !== I && I,
                        onOpenChange: x,
                        onOpenToggle: q.useCallback(function() {
                            return x(function(e) {
                                return !e
                            })
                        }, [x]),
                        modal: void 0 === P || P,
                        children: g
                    })
                };
            lF.displayName = lR;
            var lH = "DialogTrigger";
            q.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = lN(e, ["__scopeDialog"]),
                    o = lM(lH, r),
                    a = nm(t, o.triggerRef);
                return (0, ne.jsx)(iB.button, lk(lC({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": l4(o.open)
                }, n), {
                    ref: a,
                    onClick: ii(e.onClick, o.onOpenToggle)
                }))
            }).displayName = lH;
            var lG = "DialogPortal",
                lz = lD(lL(lG, {
                    forceMount: void 0
                }), 2),
                lV = lz[0],
                lW = lz[1],
                lq = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = lM(lG, t);
                    return (0, ne.jsx)(lV, {
                        scope: t,
                        forceMount: r,
                        children: q.Children.map(n, function(e) {
                            return (0, ne.jsx)(iz, {
                                present: r || a.open,
                                children: (0, ne.jsx)(iF, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            lq.displayName = lG;
            var lK = "DialogOverlay",
                l$ = q.forwardRef(function(e, t) {
                    var r = lW(lK, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = lN(e, ["forceMount"]),
                        i = lM(lK, e.__scopeDialog);
                    return i.modal ? (0, ne.jsx)(iz, {
                        present: o || i.open,
                        children: (0, ne.jsx)(lY, lk(lC({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            l$.displayName = lK;
            var lZ = iN("DialogOverlay.RemoveScroll"),
                lY = q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lN(e, ["__scopeDialog"]),
                        o = lM(lK, r);
                    return (0, ne.jsx)(lO, {
                        as: lZ,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, ne.jsx)(iB.div, lk(lC({
                            "data-state": l4(o.open)
                        }, n), {
                            ref: t,
                            style: lC({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                lX = "DialogContent",
                lJ = q.forwardRef(function(e, t) {
                    var r = lW(lX, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = lN(e, ["forceMount"]),
                        i = lM(lX, e.__scopeDialog);
                    return (0, ne.jsx)(iz, {
                        present: o || i.open,
                        children: i.modal ? (0, ne.jsx)(lQ, lk(lC({}, a), {
                            ref: t
                        })) : (0, ne.jsx)(l0, lk(lC({}, a), {
                            ref: t
                        }))
                    })
                });
            lJ.displayName = lX;
            var lQ = q.forwardRef(function(e, t) {
                    var r = lM(lX, e.__scopeDialog),
                        n = q.useRef(null),
                        o = nm(t, r.contentRef, n);
                    return q.useEffect(function() {
                        var e = n.current;
                        if (e) return lx(e)
                    }, []), (0, ne.jsx)(l1, lk(lC({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: ii(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: ii(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: ii(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                l0 = q.forwardRef(function(e, t) {
                    var r = lM(lX, e.__scopeDialog),
                        n = q.useRef(!1),
                        o = q.useRef(!1);
                    return (0, ne.jsx)(l1, lk(lC({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var a, i;
                            null == (a = e.onCloseAutoFocus) || a.call(e, t), t.defaultPrevented || (n.current || null == (i = r.triggerRef.current) || i.focus(), t.preventDefault()), n.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (a = e.onInteractOutside) || a.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var a, i, l = t.target;
                            (null == (i = r.triggerRef.current) ? void 0 : i.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                l1 = q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = lN(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = lM(lX, r),
                        u = q.useRef(null),
                        c = nm(t, u);
                    return (0, iW.useFocusGuards)(), (0, ne.jsxs)(ne.Fragment, {
                        children: [(0, ne.jsx)(iE.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: a,
                            children: (0, ne.jsx)(iP.DismissableLayer, lk(lC({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": l4(l.open)
                            }, i), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, ne.jsxs)(ne.Fragment, {
                            children: [(0, ne.jsx)(ut, {
                                titleId: l.titleId
                            }), (0, ne.jsx)(ur, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                l2 = "DialogTitle",
                l3 = q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lN(e, ["__scopeDialog"]),
                        o = lM(l2, r);
                    return (0, ne.jsx)(iB.h2, lk(lC({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            l3.displayName = l2;
            var l6 = "DialogDescription";
            q.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = lN(e, ["__scopeDialog"]),
                    o = lM(l6, r);
                return (0, ne.jsx)(iB.p, lk(lC({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = l6;
            var l5 = "DialogClose",
                l8 = q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lN(e, ["__scopeDialog"]),
                        o = lM(l5, r);
                    return (0, ne.jsx)(iB.button, lk(lC({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: ii(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function l4(e) {
                return e ? "open" : "closed"
            }
            l8.displayName = l5;
            var l7 = "DialogTitleWarning",
                l9 = lD((A = {
                    contentName: lX,
                    titleName: l2,
                    docsSlug: "dialog"
                }, j = q.createContext(A), (I = function(e) {
                    var t = e.children,
                        r = is(e, ["children"]),
                        n = q.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, ne.jsx)(j.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = l7 + "Provider", [I, function(e) {
                    var t = q.useContext(j);
                    if (t) return t;
                    if (void 0 !== A) return A;
                    throw Error("`".concat(e, "` must be used within `").concat(l7, "`"))
                }]), 2),
                ue = (l9[0], l9[1]),
                ut = function(e) {
                    var t = e.titleId,
                        r = ue(l7),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return q.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                ur = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = ue("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return q.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function un(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uo(e) {
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

            function ua(e, t) {
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

            function ui(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ul(e) {
                return function(e) {
                    if (Array.isArray(e)) return un(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return un(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return un(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uu = Symbol("radix.slottable");

            function uc(e) {
                return q.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === uu
            }

            function us(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function uf(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        us(e, t, r[t])
                    })
                }
                return e
            }

            function up(e, t) {
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
            var ud = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, o, a, i, l = (r = o = "Primitive.".concat(t), (n = q.forwardRef(function(e, t) {
                        var r = e.children,
                            n = ui(e, ["children"]);
                        if (q.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = uo({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, ul(t));
                                            return o.apply(void 0, ul(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = uo({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return uo({}, e, r)
                                }(n, r.props);
                            return r.type !== q.Fragment && (s.ref = t ? ny(t, c) : c), q.cloneElement(r, s)
                        }
                        return q.Children.count(r) > 1 ? q.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), a = n, (i = q.forwardRef(function(e, t) {
                        var r = e.children,
                            n = ui(e, ["children"]),
                            o = q.Children.toArray(r),
                            i = o.find(uc);
                        if (i) {
                            var l = i.props.children,
                                u = o.map(function(e) {
                                    return e !== i ? e : q.Children.count(l) > 1 ? q.Children.only(null) : q.isValidElement(l) ? l.props.children : null
                                });
                            return (0, ne.jsx)(a, ua(uo({}, n), {
                                ref: t,
                                children: q.isValidElement(l) ? q.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, ne.jsx)(a, ua(uo({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(o, ".Slot"), i),
                    u = q.forwardRef(function(e, r) {
                        var n = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            a = n ? l : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ne.jsx)(a, up(uf({}, o), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), up(uf({}, e), us({}, t, u))
            }, {});

            function uh(e) {
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
            var uy = Object.freeze({
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
                um = q.forwardRef(function(e, t) {
                    var r, n;
                    return (0, ne.jsx)(ud.span, (r = uh({}, e), n = n = {
                        ref: t,
                        style: uh({}, uy, e.style)
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

            function ub(e) {
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

            function uv(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }
            um.displayName = "VisuallyHidden";
            var ug = (0, q.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                uw = function() {
                    var e = (0, q.useContext)(ug);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                uO = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                uS = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                uP = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                uE = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        o = e.size,
                        a = e.type,
                        i = void 0 === a ? "Default" : a,
                        l = e.isModal,
                        u = e.hasCloseAffordance,
                        c = e.closeLabel,
                        s = e.hasMarginTop,
                        f = void 0 === s || s,
                        p = e.hasMarginBottom,
                        d = void 0 === p || p,
                        h = e.hasDescription,
                        y = void 0 !== h && h,
                        m = e.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== m && m,
                        v = (0, q.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: i,
                                hasCloseAffordance: u,
                                closeLabel: c,
                                hasMarginTop: f,
                                hasMarginBottom: d,
                                hasDescription: y
                            }
                        }, [o, l, i, u, c, f, d, y]);
                    return (0, q.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), K().createElement(ug.Provider, {
                        value: v
                    }, K().createElement(lF, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            uE.displayName = "Dialog";
            var uA = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    a = e.overlayStyle,
                    i = e.onOpenAutoFocus,
                    l = uv(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = uw(),
                    c = u.size,
                    s = u.isModal,
                    f = u.hasCloseAffordance,
                    p = u.closeLabel,
                    d = u.hasDescription,
                    h = nn("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    y = nn("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return K().createElement(lq, null, K().createElement(l$, {
                    className: h,
                    style: a
                }, K().createElement(lJ, ub({
                    className: y,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: i
                }, !d && {
                    "aria-describedby": void 0
                }, l), f && K().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, K().createElement(l8, {
                    asChild: !0
                }, K().createElement(ia, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            uA.displayName = "DialogContent";
            var uj = function(e) {
                var t = e.children,
                    r = e.className,
                    n = uv(e, ["children", "className"]),
                    o = uw(),
                    a = o.size,
                    i = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    u = nn(uO[a], i && uS[a], l && uP[a], r);
                return K().createElement("div", ub({
                    className: u
                }, n), t)
            };
            uj.displayName = "DialogBody";
            var uI = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = uv(e, ["children", "className", "hidden"]),
                    a = K().createElement(l3, ub({
                        className: r
                    }, o), t);
                return n ? K().createElement(um, null, a) : a
            };
            uI.displayName = "DialogTitle";
            var ux = function(e) {
                var t = e.children,
                    r = e.className,
                    n = uv(e, ["children", "className"]),
                    o = uw().size,
                    a = nn(uO[o], uP[o], r);
                return K().createElement("div", ub({
                    className: a
                }, n), t)
            };

            function uT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uC(e, t, r) {
                return (uC = uL() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && uN(o, r.prototype), o
                }).apply(null, arguments)
            }

            function uk(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function uN(e, t) {
                return (uN = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function uD(e) {
                return function(e) {
                    if (Array.isArray(e)) return uT(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || u_(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uR(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function u_(e, t) {
                if (e) {
                    if ("string" == typeof e) return uT(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uT(e, t)
                }
            }

            function uL() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (uL = function() {
                    return !!e
                })()
            }
            ux.displayName = "DialogFooter"; /*! @license DOMPurify 3.3.1 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.3.1/LICENSE */
            var uU = Object.entries,
                uB = Object.setPrototypeOf,
                uM = Object.isFrozen,
                uF = Object.getPrototypeOf,
                uH = Object.getOwnPropertyDescriptor,
                uG = Object.freeze,
                uz = Object.seal,
                uV = Object.create,
                uW = "u" > typeof Reflect && Reflect,
                uq = uW.apply,
                uK = uW.construct;
            uG || (uG = function(e) {
                return e
            }), uz || (uz = function(e) {
                return e
            }), uq || (uq = function(e, t) {
                for (var r = arguments.length, n = Array(r > 2 ? r - 2 : 0), o = 2; o < r; o++) n[o - 2] = arguments[o];
                return e.apply(t, n)
            }), uK || (uK = function(e) {
                for (var t = arguments.length, r = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) r[n - 1] = arguments[n];
                return uC(e, uD(r))
            });
            var u$ = u7(Array.prototype.forEach),
                uZ = u7(Array.prototype.lastIndexOf),
                uY = u7(Array.prototype.pop),
                uX = u7(Array.prototype.push),
                uJ = u7(Array.prototype.splice),
                uQ = u7(String.prototype.toLowerCase),
                u0 = u7(String.prototype.toString),
                u1 = u7(String.prototype.match),
                u2 = u7(String.prototype.replace),
                u3 = u7(String.prototype.indexOf),
                u6 = u7(String.prototype.trim),
                u5 = u7(Object.prototype.hasOwnProperty),
                u8 = u7(RegExp.prototype.test),
                u4 = (i = TypeError, function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return uK(i, t)
                });

            function u7(e) {
                return function(t) {
                    uk(t, RegExp) && (t.lastIndex = 0);
                    for (var r = arguments.length, n = Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
                    return uq(e, t, n)
                }
            }

            function u9(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : uQ;
                uB && uB(e, null);
                for (var n = t.length; n--;) {
                    var o = t[n];
                    if ("string" == typeof o) {
                        var a = r(o);
                        a !== o && (uM(t) || (t[n] = a), o = a)
                    }
                    e[o] = !0
                }
                return e
            }

            function ce(e) {
                var t = uV(null),
                    r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var a, i = uU(e)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                        var l, u = (l = a.value, function(e) {
                                if (Array.isArray(e)) return e
                            }(l) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var o = [],
                                        a = !0,
                                        i = !1;
                                    try {
                                        for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                    } catch (e) {
                                        i = !0, r = e
                                    } finally {
                                        try {
                                            a || null == n.return || n.return()
                                        } finally {
                                            if (i) throw r
                                        }
                                    }
                                    return o
                                }
                            }(l) || u_(l, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            c = u[0],
                            s = u[1];
                        u5(e, c) && (Array.isArray(s) ? t[c] = function(e) {
                            for (var t = 0; t < e.length; t++) u5(e, t) || (e[t] = null);
                            return e
                        }(s) : s && (void 0 === s ? "undefined" : uR(s)) === "object" && s.constructor === Object ? t[c] = ce(s) : t[c] = s)
                    }
                } catch (e) {
                    n = !0, o = e
                } finally {
                    try {
                        r || null == i.return || i.return()
                    } finally {
                        if (n) throw o
                    }
                }
                return t
            }

            function ct(e, t) {
                for (; null !== e;) {
                    var r = uH(e, t);
                    if (r) {
                        if (r.get) return u7(r.get);
                        if ("function" == typeof r.value) return u7(r.value)
                    }
                    e = uF(e)
                }
                return function() {
                    return null
                }
            }
            var cr = uG(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
                cn = uG(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
                co = uG(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
                ca = uG(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
                ci = uG(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
                cl = uG(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
                cu = uG(["#text"]),
                cc = uG(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns", "slot"]),
                cs = uG(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
                cf = uG(["accent", "accentunder", "align", "bevelled", "close", "columnsalign", "columnlines", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lspace", "lquote", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
                cp = uG(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
                cd = uz(/\{\{[\w\W]*|[\w\W]*\}\}/gm),
                ch = uz(/<%[\w\W]*|[\w\W]*%>/gm),
                cy = uz(/\$\{[\w\W]*/gm),
                cm = uz(/^data-[\-\w.\u00B7-\uFFFF]+$/),
                cb = uz(/^aria-[\-\w]+$/),
                cv = uz(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
                cg = uz(/^(?:\w+script|data):/i),
                cw = uz(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
                cO = uz(/^html$/i),
                cS = Object.freeze({
                    __proto__: null,
                    ARIA_ATTR: cb,
                    ATTR_WHITESPACE: cw,
                    CUSTOM_ELEMENT: uz(/^[a-z][.\w]*(-[.\w]+)+$/i),
                    DATA_ATTR: cm,
                    DOCTYPE_NAME: cO,
                    ERB_EXPR: ch,
                    IS_ALLOWED_URI: cv,
                    IS_SCRIPT_OR_DATA: cg,
                    MUSTACHE_EXPR: cd,
                    TMPLIT_EXPR: cy
                }),
                cP = function(e, t) {
                    if ((void 0 === e ? "undefined" : uR(e)) !== "object" || "function" != typeof e.createPolicy) return null;
                    var r = null,
                        n = "data-tt-policy-suffix";
                    t && t.hasAttribute(n) && (r = t.getAttribute(n));
                    var o = "dompurify" + (r ? "#" + r : "");
                    try {
                        return e.createPolicy(o, {
                            createHTML: function(e) {
                                return e
                            },
                            createScriptURL: function(e) {
                                return e
                            }
                        })
                    } catch (e) {
                        return console.warn("TrustedTypes policy " + o + " could not be created."), null
                    }
                },
                cE = function() {
                    return {
                        afterSanitizeAttributes: [],
                        afterSanitizeElements: [],
                        afterSanitizeShadowDOM: [],
                        beforeSanitizeAttributes: [],
                        beforeSanitizeElements: [],
                        beforeSanitizeShadowDOM: [],
                        uponSanitizeAttribute: [],
                        uponSanitizeElement: [],
                        uponSanitizeShadowNode: []
                    }
                },
                cA = function e() {
                    var t, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? null : window,
                        n = function(t) {
                            return e(t)
                        };
                    if (n.version = "3.3.1", n.removed = [], !r || !r.document || 9 !== r.document.nodeType || !r.Element) return n.isSupported = !1, n;
                    var o = r.document,
                        a = o,
                        i = a.currentScript,
                        l = r.DocumentFragment,
                        u = r.HTMLTemplateElement,
                        c = r.Node,
                        s = r.Element,
                        f = r.NodeFilter,
                        p = r.NamedNodeMap,
                        d = void 0 === p ? r.NamedNodeMap || r.MozNamedAttrMap : p,
                        h = r.HTMLFormElement,
                        y = r.DOMParser,
                        m = r.trustedTypes,
                        b = s.prototype,
                        v = ct(b, "cloneNode"),
                        g = ct(b, "remove"),
                        w = ct(b, "nextSibling"),
                        O = ct(b, "childNodes"),
                        S = ct(b, "parentNode");
                    if ("function" == typeof u) {
                        var P = o.createElement("template");
                        P.content && P.content.ownerDocument && (o = P.content.ownerDocument)
                    }
                    var E = "",
                        A = o.implementation,
                        j = o.createNodeIterator,
                        I = o.createDocumentFragment,
                        x = o.getElementsByTagName,
                        T = a.importNode,
                        C = cE();
                    n.isSupported = "function" == typeof uU && "function" == typeof S && A && void 0 !== A.createHTMLDocument;
                    var k = cS.MUSTACHE_EXPR,
                        N = cS.ERB_EXPR,
                        D = cS.TMPLIT_EXPR,
                        R = cS.DATA_ATTR,
                        _ = cS.ARIA_ATTR,
                        L = cS.IS_SCRIPT_OR_DATA,
                        U = cS.ATTR_WHITESPACE,
                        B = cS.CUSTOM_ELEMENT,
                        M = cS.IS_ALLOWED_URI,
                        F = null,
                        H = u9({}, uD(cr).concat(uD(cn), uD(co), uD(ci), uD(cu))),
                        G = null,
                        z = u9({}, uD(cc).concat(uD(cs), uD(cf), uD(cp))),
                        V = Object.seal(uV(null, {
                            tagNameCheck: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: null
                            },
                            attributeNameCheck: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: null
                            },
                            allowCustomizedBuiltInElements: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: !1
                            }
                        })),
                        W = null,
                        q = null,
                        K = Object.seal(uV(null, {
                            tagCheck: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: null
                            },
                            attributeCheck: {
                                writable: !0,
                                configurable: !1,
                                enumerable: !0,
                                value: null
                            }
                        })),
                        $ = !0,
                        Z = !0,
                        Y = !1,
                        X = !0,
                        J = !1,
                        Q = !0,
                        ee = !1,
                        et = !1,
                        er = !1,
                        en = !1,
                        eo = !1,
                        ea = !1,
                        ei = !0,
                        el = !1,
                        eu = !0,
                        ec = !1,
                        es = {},
                        ef = null,
                        ep = u9({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "style", "svg", "template", "thead", "title", "video", "xmp"]),
                        ed = null,
                        eh = u9({}, ["audio", "video", "img", "source", "image", "track"]),
                        ey = null,
                        em = u9({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
                        eb = "http://www.w3.org/1998/Math/MathML",
                        ev = "http://www.w3.org/2000/svg",
                        eg = "http://www.w3.org/1999/xhtml",
                        ew = eg,
                        eO = !1,
                        eS = null,
                        eP = u9({}, [eb, ev, eg], u0),
                        eE = u9({}, ["mi", "mo", "mn", "ms", "mtext"]),
                        eA = u9({}, ["annotation-xml"]),
                        ej = u9({}, ["title", "style", "font", "a", "script"]),
                        eI = null,
                        ex = ["application/xhtml+xml", "text/html"],
                        eT = null,
                        eC = null,
                        ek = o.createElement("form"),
                        eN = function(e) {
                            return uk(e, RegExp) || uk(e, Function)
                        },
                        eD = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            if (!eC || eC !== e) {
                                if (e && (void 0 === e ? "undefined" : uR(e)) === "object" || (e = {}), e = ce(e), eT = "application/xhtml+xml" === (eI = -1 === ex.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? u0 : uQ, F = u5(e, "ALLOWED_TAGS") ? u9({}, e.ALLOWED_TAGS, eT) : H, G = u5(e, "ALLOWED_ATTR") ? u9({}, e.ALLOWED_ATTR, eT) : z, eS = u5(e, "ALLOWED_NAMESPACES") ? u9({}, e.ALLOWED_NAMESPACES, u0) : eP, ey = u5(e, "ADD_URI_SAFE_ATTR") ? u9(ce(em), e.ADD_URI_SAFE_ATTR, eT) : em, ed = u5(e, "ADD_DATA_URI_TAGS") ? u9(ce(eh), e.ADD_DATA_URI_TAGS, eT) : eh, ef = u5(e, "FORBID_CONTENTS") ? u9({}, e.FORBID_CONTENTS, eT) : ep, W = u5(e, "FORBID_TAGS") ? u9({}, e.FORBID_TAGS, eT) : ce({}), q = u5(e, "FORBID_ATTR") ? u9({}, e.FORBID_ATTR, eT) : ce({}), es = !!u5(e, "USE_PROFILES") && e.USE_PROFILES, $ = !1 !== e.ALLOW_ARIA_ATTR, Z = !1 !== e.ALLOW_DATA_ATTR, Y = e.ALLOW_UNKNOWN_PROTOCOLS || !1, X = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, J = e.SAFE_FOR_TEMPLATES || !1, Q = !1 !== e.SAFE_FOR_XML, ee = e.WHOLE_DOCUMENT || !1, en = e.RETURN_DOM || !1, eo = e.RETURN_DOM_FRAGMENT || !1, ea = e.RETURN_TRUSTED_TYPE || !1, er = e.FORCE_BODY || !1, ei = !1 !== e.SANITIZE_DOM, el = e.SANITIZE_NAMED_PROPS || !1, eu = !1 !== e.KEEP_CONTENT, ec = e.IN_PLACE || !1, M = e.ALLOWED_URI_REGEXP || cv, ew = e.NAMESPACE || eg, eE = e.MATHML_TEXT_INTEGRATION_POINTS || eE, eA = e.HTML_INTEGRATION_POINTS || eA, V = e.CUSTOM_ELEMENT_HANDLING || {}, e.CUSTOM_ELEMENT_HANDLING && eN(e.CUSTOM_ELEMENT_HANDLING.tagNameCheck) && (V.tagNameCheck = e.CUSTOM_ELEMENT_HANDLING.tagNameCheck), e.CUSTOM_ELEMENT_HANDLING && eN(e.CUSTOM_ELEMENT_HANDLING.attributeNameCheck) && (V.attributeNameCheck = e.CUSTOM_ELEMENT_HANDLING.attributeNameCheck), e.CUSTOM_ELEMENT_HANDLING && "boolean" == typeof e.CUSTOM_ELEMENT_HANDLING.allowCustomizedBuiltInElements && (V.allowCustomizedBuiltInElements = e.CUSTOM_ELEMENT_HANDLING.allowCustomizedBuiltInElements), J && (Z = !1), eo && (en = !0), es && (F = u9({}, cu), G = [], !0 === es.html && (u9(F, cr), u9(G, cc)), !0 === es.svg && (u9(F, cn), u9(G, cs), u9(G, cp)), !0 === es.svgFilters && (u9(F, co), u9(G, cs), u9(G, cp)), !0 === es.mathMl && (u9(F, ci), u9(G, cf), u9(G, cp))), e.ADD_TAGS && ("function" == typeof e.ADD_TAGS ? K.tagCheck = e.ADD_TAGS : (F === H && (F = ce(F)), u9(F, e.ADD_TAGS, eT))), e.ADD_ATTR && ("function" == typeof e.ADD_ATTR ? K.attributeCheck = e.ADD_ATTR : (G === z && (G = ce(G)), u9(G, e.ADD_ATTR, eT))), e.ADD_URI_SAFE_ATTR && u9(ey, e.ADD_URI_SAFE_ATTR, eT), e.FORBID_CONTENTS && (ef === ep && (ef = ce(ef)), u9(ef, e.FORBID_CONTENTS, eT)), e.ADD_FORBID_CONTENTS && (ef === ep && (ef = ce(ef)), u9(ef, e.ADD_FORBID_CONTENTS, eT)), eu && (F["#text"] = !0), ee && u9(F, ["html", "head", "body"]), F.table && (u9(F, ["tbody"]), delete W.tbody), e.TRUSTED_TYPES_POLICY) {
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw u4('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw u4('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                                    E = (t = e.TRUSTED_TYPES_POLICY).createHTML("")
                                } else void 0 === t && (t = cP(m, i)), null !== t && "string" == typeof E && (E = t.createHTML(""));
                                uG && uG(e), eC = e
                            }
                        },
                        eR = u9({}, uD(cn).concat(uD(co), uD(ca))),
                        e_ = u9({}, uD(ci).concat(uD(cl))),
                        eL = function(e) {
                            var t = S(e);
                            t && t.tagName || (t = {
                                namespaceURI: ew,
                                tagName: "template"
                            });
                            var r = uQ(e.tagName),
                                n = uQ(t.tagName);
                            return !!eS[e.namespaceURI] && (e.namespaceURI === ev ? t.namespaceURI === eg ? "svg" === r : t.namespaceURI === eb ? "svg" === r && ("annotation-xml" === n || eE[n]) : !!eR[r] : e.namespaceURI === eb ? t.namespaceURI === eg ? "math" === r : t.namespaceURI === ev ? "math" === r && eA[n] : !!e_[r] : e.namespaceURI === eg ? (t.namespaceURI !== ev || !!eA[n]) && (t.namespaceURI !== eb || !!eE[n]) && !e_[r] && (ej[r] || !eR[r]) : "application/xhtml+xml" === eI && !!eS[e.namespaceURI])
                        },
                        eU = function(e) {
                            uX(n.removed, {
                                element: e
                            });
                            try {
                                S(e).removeChild(e)
                            } catch (t) {
                                g(e)
                            }
                        },
                        eB = function(e, t) {
                            try {
                                uX(n.removed, {
                                    attribute: t.getAttributeNode(e),
                                    from: t
                                })
                            } catch (e) {
                                uX(n.removed, {
                                    attribute: null,
                                    from: t
                                })
                            }
                            if (t.removeAttribute(e), "is" === e)
                                if (en || eo) try {
                                    eU(t)
                                } catch (e) {} else try {
                                    t.setAttribute(e, "")
                                } catch (e) {}
                        },
                        eM = function(e) {
                            var r = null,
                                n = null;
                            if (er) e = "<remove></remove>" + e;
                            else {
                                var a = u1(e, /^[\r\n\t ]+/);
                                n = a && a[0]
                            }
                            "application/xhtml+xml" === eI && ew === eg && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                            var i = t ? t.createHTML(e) : e;
                            if (ew === eg) try {
                                r = new y().parseFromString(i, eI)
                            } catch (e) {}
                            if (!r || !r.documentElement) {
                                r = A.createDocument(ew, "template", null);
                                try {
                                    r.documentElement.innerHTML = eO ? E : i
                                } catch (e) {}
                            }
                            var l = r.body || r.documentElement;
                            return (e && n && l.insertBefore(o.createTextNode(n), l.childNodes[0] || null), ew === eg) ? x.call(r, ee ? "html" : "body")[0] : ee ? r.documentElement : l
                        },
                        eF = function(e) {
                            return j.call(e.ownerDocument || e, e, f.SHOW_ELEMENT | f.SHOW_COMMENT | f.SHOW_TEXT | f.SHOW_PROCESSING_INSTRUCTION | f.SHOW_CDATA_SECTION, null)
                        },
                        eH = function(e) {
                            return uk(e, h) && ("string" != typeof e.nodeName || "string" != typeof e.textContent || "function" != typeof e.removeChild || !uk(e.attributes, d) || "function" != typeof e.removeAttribute || "function" != typeof e.setAttribute || "string" != typeof e.namespaceURI || "function" != typeof e.insertBefore || "function" != typeof e.hasChildNodes)
                        },
                        eG = function(e) {
                            return "function" == typeof c && uk(e, c)
                        };

                    function ez(e, t, r) {
                        u$(e, function(e) {
                            e.call(n, t, r, eC)
                        })
                    }
                    var eV = function(e) {
                            var t = null;
                            if (ez(C.beforeSanitizeElements, e, null), eH(e)) return eU(e), !0;
                            var r = eT(e.nodeName);
                            if (ez(C.uponSanitizeElement, e, {
                                    tagName: r,
                                    allowedTags: F
                                }), Q && e.hasChildNodes() && !eG(e.firstElementChild) && u8(/<[/\w!]/g, e.innerHTML) && u8(/<[/\w!]/g, e.textContent) || 7 === e.nodeType || Q && 8 === e.nodeType && u8(/<[/\w]/g, e.data)) return eU(e), !0;
                            if (!(uk(K.tagCheck, Function) && K.tagCheck(r)) && (!F[r] || W[r])) {
                                if (!W[r] && eq(r) && (uk(V.tagNameCheck, RegExp) && u8(V.tagNameCheck, r) || uk(V.tagNameCheck, Function) && V.tagNameCheck(r))) return !1;
                                if (eu && !ef[r]) {
                                    var o = S(e) || e.parentNode,
                                        a = O(e) || e.childNodes;
                                    if (a && o)
                                        for (var i = a.length, l = i - 1; l >= 0; --l) {
                                            var u = v(a[l], !0);
                                            u.__removalCount = (e.__removalCount || 0) + 1, o.insertBefore(u, w(e))
                                        }
                                }
                                return eU(e), !0
                            }
                            return uk(e, s) && !eL(e) || ("noscript" === r || "noembed" === r || "noframes" === r) && u8(/<\/no(script|embed|frames)/i, e.innerHTML) ? (eU(e), !0) : (J && 3 === e.nodeType && (t = e.textContent, u$([k, N, D], function(e) {
                                t = u2(t, e, " ")
                            }), e.textContent !== t && (uX(n.removed, {
                                element: e.cloneNode()
                            }), e.textContent = t)), ez(C.afterSanitizeElements, e, null), !1)
                        },
                        eW = function(e, t, r) {
                            if (ei && ("id" === t || "name" === t) && (r in o || r in ek)) return !1;
                            if (Z && !q[t] && u8(R, t));
                            else if ($ && u8(_, t));
                            else if (uk(K.attributeCheck, Function) && K.attributeCheck(t, e));
                            else if (!G[t] || q[t]) {
                                if (!(eq(e) && (uk(V.tagNameCheck, RegExp) && u8(V.tagNameCheck, e) || uk(V.tagNameCheck, Function) && V.tagNameCheck(e)) && (uk(V.attributeNameCheck, RegExp) && u8(V.attributeNameCheck, t) || uk(V.attributeNameCheck, Function) && V.attributeNameCheck(t, e)) || "is" === t && V.allowCustomizedBuiltInElements && (uk(V.tagNameCheck, RegExp) && u8(V.tagNameCheck, r) || uk(V.tagNameCheck, Function) && V.tagNameCheck(r)))) return !1
                            } else if (ey[t]);
                            else if (u8(M, u2(r, U, "")));
                            else if (("src" === t || "xlink:href" === t || "href" === t) && "script" !== e && 0 === u3(r, "data:") && ed[e]);
                            else if (Y && !u8(L, u2(r, U, "")));
                            else if (r) return !1;
                            return !0
                        },
                        eq = function(e) {
                            return "annotation-xml" !== e && u1(e, B)
                        },
                        eK = function(e) {
                            ez(C.beforeSanitizeAttributes, e, null);
                            var r = e.attributes;
                            if (!(!r || eH(e))) {
                                for (var o = {
                                        attrName: "",
                                        attrValue: "",
                                        keepAttr: !0,
                                        allowedAttributes: G,
                                        forceKeepAttr: void 0
                                    }, a = r.length; a--;) ! function() {
                                    var i = r[a],
                                        l = i.name,
                                        u = i.namespaceURI,
                                        c = i.value,
                                        s = eT(l),
                                        f = "value" === l ? c : u6(c);
                                    if (o.attrName = s, o.attrValue = f, o.keepAttr = !0, o.forceKeepAttr = void 0, ez(C.uponSanitizeAttribute, e, o), f = o.attrValue, el && ("id" === s || "name" === s) && (eB(l, e), f = "user-content-" + f), Q && u8(/((--!?|])>)|<\/(style|title|textarea)/i, f) || "attributename" === s && u1(f, "href")) return eB(l, e);
                                    if (!o.forceKeepAttr) {
                                        if (!o.keepAttr || !X && u8(/\/>/i, f)) return eB(l, e);
                                        J && u$([k, N, D], function(e) {
                                            f = u2(f, e, " ")
                                        });
                                        var p = eT(e.nodeName);
                                        if (!eW(p, s, f)) return eB(l, e);
                                        if (t && (void 0 === m ? "undefined" : uR(m)) === "object" && "function" == typeof m.getAttributeType)
                                            if (u);
                                            else switch (m.getAttributeType(p, s)) {
                                                case "TrustedHTML":
                                                    f = t.createHTML(f);
                                                    break;
                                                case "TrustedScriptURL":
                                                    f = t.createScriptURL(f)
                                            }
                                        if (f !== c) try {
                                            u ? e.setAttributeNS(u, l, f) : e.setAttribute(l, f), eH(e) ? eU(e) : uY(n.removed)
                                        } catch (t) {
                                            eB(l, e)
                                        }
                                    }
                                }();
                                ez(C.afterSanitizeAttributes, e, null)
                            }
                        },
                        e$ = function e(t) {
                            var r = null,
                                n = eF(t);
                            for (ez(C.beforeSanitizeShadowDOM, t, null); r = n.nextNode();) ez(C.uponSanitizeShadowNode, r, null), eV(r), eK(r), uk(r.content, l) && e(r.content);
                            ez(C.afterSanitizeShadowDOM, t, null)
                        };
                    return n.sanitize = function(e) {
                        var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            o = null,
                            i = null,
                            u = null,
                            s = null;
                        if ((eO = !e) && (e = "\x3c!--\x3e"), "string" != typeof e && !eG(e))
                            if ("function" == typeof e.toString) {
                                if ("string" != typeof(e = e.toString())) throw u4("dirty is not a string, aborting")
                            } else throw u4("toString is not a function");
                        if (!n.isSupported) return e;
                        if (et || eD(r), n.removed = [], "string" == typeof e && (ec = !1), ec) {
                            if (e.nodeName) {
                                var f = eT(e.nodeName);
                                if (!F[f] || W[f]) throw u4("root node is forbidden and cannot be sanitized in-place")
                            }
                        } else if (uk(e, c)) 1 === (i = (o = eM("\x3c!----\x3e")).ownerDocument.importNode(e, !0)).nodeType && "BODY" === i.nodeName || "HTML" === i.nodeName ? o = i : o.appendChild(i);
                        else {
                            if (!en && !J && !ee && -1 === e.indexOf("<")) return t && ea ? t.createHTML(e) : e;
                            if (!(o = eM(e))) return en ? null : ea ? E : ""
                        }
                        o && er && eU(o.firstChild);
                        for (var p = eF(ec ? e : o); u = p.nextNode();) eV(u), eK(u), uk(u.content, l) && e$(u.content);
                        if (ec) return e;
                        if (en) {
                            if (eo)
                                for (s = I.call(o.ownerDocument); o.firstChild;) s.appendChild(o.firstChild);
                            else s = o;
                            return (G.shadowroot || G.shadowrootmode) && (s = T.call(a, s, !0)), s
                        }
                        var d = ee ? o.outerHTML : o.innerHTML;
                        return ee && F["!doctype"] && o.ownerDocument && o.ownerDocument.doctype && o.ownerDocument.doctype.name && u8(cO, o.ownerDocument.doctype.name) && (d = "<!DOCTYPE " + o.ownerDocument.doctype.name + ">\n" + d), J && u$([k, N, D], function(e) {
                            d = u2(d, e, " ")
                        }), t && ea ? t.createHTML(d) : d
                    }, n.setConfig = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        eD(e), et = !0
                    }, n.clearConfig = function() {
                        eC = null, et = !1
                    }, n.isValidAttribute = function(e, t, r) {
                        return eC || eD({}), eW(eT(e), eT(t), r)
                    }, n.addHook = function(e, t) {
                        "function" == typeof t && uX(C[e], t)
                    }, n.removeHook = function(e, t) {
                        if (void 0 !== t) {
                            var r = uZ(C[e], t);
                            return -1 === r ? void 0 : uJ(C[e], r, 1)[0]
                        }
                        return uY(C[e])
                    }, n.removeHooks = function(e) {
                        C[e] = []
                    }, n.removeAllHooks = function() {
                        C = cE()
                    }, n
                }(),
                cj = {
                    ADD_ATTR: ["target"]
                },
                cI = cA();
            cI.addHook("afterSanitizeAttributes", function(e) {
                "A" === e.nodeName && (e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer"))
            });
            var cx = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = t.shouldOpenLinksInNewTab;
                    return (0, q.useMemo)(function() {
                        return (r ? cI : cA).sanitize(e, cj)
                    }, [e, r])
                },
                cT = function(e) {
                    var t = e.titleText,
                        r = e.bodyText,
                        n = e.primaryButtonText,
                        o = e.secondaryButtonText,
                        a = e.closeLabelText,
                        i = e.onPrimaryButtonClick,
                        l = e.onSecondaryButtonClick,
                        u = e.isModalOpen,
                        c = e.onCloseModal,
                        s = e.hasCloseAffordance,
                        f = e.orientButtonsVertically,
                        p = void 0 !== f && f,
                        d = cx(r, {
                            shouldOpenLinksInNewTab: !0
                        }),
                        h = n && i ? (0, ne.jsx)(nF, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: i,
                            className: "grow basis-0",
                            children: n
                        }) : null,
                        y = o && l ? (0, ne.jsx)(nF, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: l,
                            className: "grow basis-0",
                            children: o
                        }) : null;
                    return (0, ne.jsx)(uE, {
                        open: u,
                        onOpenChange: function(e) {
                            e || c()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: void 0 === s || s,
                        closeLabel: a,
                        children: (0, ne.jsxs)(uA, {
                            children: [(0, ne.jsxs)(uj, {
                                className: "flex flex-col gap-large",
                                children: [(0, ne.jsx)(uI, {
                                    children: t
                                }), (0, ne.jsx)("span", {
                                    className: "[&_a]:[font-weight:700] [&_a]:underline",
                                    dangerouslySetInnerHTML: {
                                        __html: d
                                    }
                                })]
                            }), (0, ne.jsx)(ux, {
                                className: p ? "flex flex-col gap-small" : "flex gap-x-medium",
                                children: p ? (0, ne.jsxs)(q.Fragment, {
                                    children: [h, y]
                                }) : (0, ne.jsxs)(q.Fragment, {
                                    children: [y, h]
                                })
                            })]
                        })
                    })
                },
                cC = function(e) {
                    var t = e.isModalOpen,
                        r = e.navigateToAccountSettings,
                        n = e.closeModal,
                        o = e.translate;
                    return (0, ne.jsx)(cT, {
                        titleText: o("UpdateMaturitySettingModal.Label.Title"),
                        bodyText: o("UpdateMaturitySettingModal.Label.Body"),
                        primaryButtonText: o("UpdateMaturitySettingModal.Action.GoToSettings"),
                        secondaryButtonText: o("UpdateMaturitySettingModal.Action.Cancel"),
                        closeLabelText: o("Action.Close"),
                        onPrimaryButtonClick: r,
                        onSecondaryButtonClick: n,
                        isModalOpen: t,
                        onCloseModal: n
                    })
                },
                ck = function(e) {
                    var t = e.isModalOpen,
                        r = e.closeModal,
                        n = e.translate;
                    return (0, ne.jsx)(cT, {
                        titleText: n("RestrictedUnplayableModal.Label.Title"),
                        bodyText: n("RestrictedUnplayableModal.Label.Body"),
                        secondaryButtonText: n("RestrictedUnplayableModal.Action.Ok"),
                        closeLabelText: n("Action.Close"),
                        onSecondaryButtonClick: r,
                        isModalOpen: t,
                        onCloseModal: r
                    })
                },
                cN = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = !!e && !t,
                        n = (0, $.useQuery)({
                            queryKey: ["ageRecommendation", e],
                            queryFn: function() {
                                return ep(e)
                            },
                            enabled: r
                        }),
                        o = n.data,
                        a = n.isError,
                        i = n.isLoading;
                    return {
                        ageRecommendationData: o,
                        hasError: a,
                        isLoading: r && i
                    }
                };

            function cD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cR(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return cD(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cD(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var c_ = function(e) {
                var t, r, n = cR((0, q.useState)(void 0), 2),
                    o = n[0],
                    a = n[1],
                    i = cR((0, q.useState)(!1), 2),
                    l = i[0],
                    u = i[1],
                    c = cR((0, q.useState)(!1), 2),
                    s = c[0],
                    f = c[1];
                (0, q.useEffect)(function() {
                    f(!1), u(!0), ef().then(function(e) {
                        a(e.contentAgeRestriction)
                    }).catch(function() {
                        f(!0)
                    }).finally(function() {
                        u(!1)
                    })
                }, []);
                var p = cN(e),
                    d = p.ageRecommendationData,
                    h = p.hasError,
                    y = p.isLoading;
                return {
                    contentAgeRestriction: o,
                    contentMaturityRating: null == d || null == (r = d.ageRecommendationDetails) || null == (t = r.summary.ageRecommendation) ? void 0 : t.contentMaturity,
                    isFetching: l || y,
                    hasError: s || h
                }
            };

            function cL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cU(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function cB(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return cL(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cL(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var cM = function(e, t, r, n, o, a, i, l) {
                    var u = (0, $.useQuery)({
                            queryKey: ["guacPlayButtonUI"],
                            queryFn: function() {
                                return es()
                            },
                            staleTime: 6e4
                        }).data,
                        c = cB((0, q.useState)(!1), 2),
                        s = c[0],
                        f = c[1],
                        p = cB((0, q.useState)(!1), 2),
                        d = p[0],
                        h = p[1],
                        y = (0, q.useCallback)(function() {
                            r3(e, n, o, a, i, void 0, l)
                        }, [i, a, e, o, n, l]),
                        m = (0, q.useCallback)(function(e, n, o) {
                            var a;
                            return (a = function() {
                                var a, i, l, c, s, p;
                                return function(e, t) {
                                    var r, n, o, a = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        l = Object.defineProperty;
                                    return l(i, "next", {
                                        value: u(0)
                                    }), l(i, "throw", {
                                        value: u(1)
                                    }), l(i, "return", {
                                        value: u(2)
                                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function u(l) {
                                        return function(u) {
                                            var c = [l, u];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                                if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = c;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: c[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, n = c[1], c = [0];
                                                        continue;
                                                    case 7:
                                                        c = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                            a.label = c[1];
                                                            break
                                                        }
                                                        if (6 === c[0] && a.label < o[1]) {
                                                            a.label = o[1], o = c;
                                                            break
                                                        }
                                                        if (o && a.label < o[2]) {
                                                            a.label = o[2], a.ops.push(c);
                                                            break
                                                        }
                                                        o[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                c = t.call(e, a)
                                            } catch (e) {
                                                c = [6, e], n = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & c[0]) throw c[1];
                                            return {
                                                value: c[0] ? c[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(d) {
                                    switch (d.label) {
                                        case 0:
                                            if (a = function(e) {
                                                    r9(t, e, eh.ContextualPlayabilityAgeRecommendationParentalControls, r)
                                                }, o || void 0 === e || void 0 === n) return y(), et(eE.PlayButtonUpsellUnknownSettingOrAge), a(eA.gameLaunchFallbackUpsellName), [2];
                                            if ("minimal" === n) return y(), et(eE.PlayButtonUpsellMinimalMaturityRating), a(eA.gameLaunchFallbackUpsellName), [2];
                                            if (!(i = ({
                                                    mild: "NinePlus",
                                                    moderate: "ThirteenPlus",
                                                    restricted: "SeventeenPlus",
                                                    unrated: "ThirteenPlus"
                                                })[n])) return y(), et(eE.PlayButtonUpsellAgeNotInMapping), a(eA.gameLaunchFallbackUpsellName), [2];
                                            if (!(l = e.options.find(function(e) {
                                                    return e.option.optionValue === i
                                                }))) return [3, 13];
                                            switch (c = l.requirement) {
                                                case "SelfUpdateSetting":
                                                    return [3, 1];
                                                case "ParentalConsent":
                                                    return [3, 2];
                                                case "ContentAgeRestrictionVerification":
                                                    return [3, 7]
                                            }
                                            return [3, 11];
                                        case 1:
                                            return f(!0), et(eE.PlayButtonUpsellSelfUpdateSettingTriggered), a(c), [3, 12];
                                        case 2:
                                            if (et(eE.PlayButtonUpsellAskYourParentTriggered), a(c), !(s = rq())) return et(eE.PlayButtonUpsellParentalConsentError), [3, 12];
                                            d.label = 3;
                                        case 3:
                                            return d.trys.push([3, 5, , 6]), p = (null == u ? void 0 : u.useExperienceApprovalForParentalConsent) ? {
                                                featureName: "CanApproveExperience",
                                                namespace: ex.accountManagement,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    universeId: t,
                                                    experienceManagementAction: "Approve"
                                                }
                                            } : {
                                                featureName: "CanChangeSetting",
                                                namespace: ex.settingChange,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    contentAgeRestriction: l.option.optionValue
                                                }
                                            }, [4, s(p)];
                                        case 4:
                                            return d.sent(), [3, 6];
                                        case 5:
                                            return d.sent(), y(), et(eE.PlayButtonUpsellParentalConsentError), a(eA.gameLaunchFallbackUpsellName), [3, 6];
                                        case 6:
                                        case 10:
                                            return [3, 12];
                                        case 7:
                                            return d.trys.push([7, 9, , 10]), et(eE.PlayButtonUpsellAgeRestrictionVerificationTriggered), a(c), [4, r8({
                                                context: eI,
                                                pageContext: r
                                            })];
                                        case 8:
                                            return d.sent() && window.location.reload(), [3, 10];
                                        case 9:
                                            return d.sent(), y(), a(eA.gameLaunchFallbackUpsellName), [3, 10];
                                        case 11:
                                            y(), et(eE.PlayButtonUpsellUnknownRequirement), a(eA.gameLaunchFallbackUpsellName), d.label = 12;
                                        case 12:
                                            return [3, 14];
                                        case 13:
                                            h(!0), et(eE.PlayButtonUpsellRestrictedUnplayableTriggered), a(eA.restrictedUnplayableUpsellName), d.label = 14;
                                        case 14:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    t = arguments;
                                return new Promise(function(r, n) {
                                    var o = a.apply(e, t);

                                    function i(e) {
                                        cU(o, r, n, i, l, "next", e)
                                    }

                                    function l(e) {
                                        cU(o, r, n, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [u, y, t, r]),
                        b = (0, q.useCallback)(function() {
                            f(!1)
                        }, []),
                        v = (0, q.useCallback)(function() {
                            h(!1)
                        }, []);
                    return {
                        launchPlayButtonUpsell: m,
                        isSelfUpdateSettingModalOpen: s,
                        navigateToAccountSettings: (0, q.useCallback)(function() {
                            var e = (0, eN.getAbsoluteUrl)("/my/account#!/privacy");
                            "u" > typeof window && (window.location.href = e, f(!1))
                        }, []),
                        closeSelfUpdateSettingModal: b,
                        isRestrictedUnplayableModalOpen: d,
                        closeRestrictedUnplayableModal: v
                    }
                },
                cF = function(e) {
                    var t = e.universeId,
                        r = e.buttonClassName,
                        n = e.placeId,
                        o = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        l = e.eventProperties,
                        u = e.appsFlyerReferralProperties,
                        c = e.pageContext,
                        s = a7(),
                        f = c_(t),
                        p = f.contentAgeRestriction,
                        d = f.contentMaturityRating,
                        h = f.isFetching,
                        y = f.hasError,
                        m = cM(n, t, c, o, a, i, l, u),
                        b = m.launchPlayButtonUpsell,
                        v = m.isSelfUpdateSettingModalOpen,
                        g = m.navigateToAccountSettings,
                        w = m.closeSelfUpdateSettingModal,
                        O = m.isRestrictedUnplayableModalOpen,
                        S = m.closeRestrictedUnplayableModal,
                        P = (0, q.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), b(p, d, y)
                        }, [b, p, d, y]);
                    return !y && h ? (0, ne.jsx)(it, {
                        buttonClassName: null != r ? r : "btn-common-play-game-action-needed-lg"
                    }) : (0, ne.jsxs)(K().Fragment, {
                        children: [(0, ne.jsx)(a9, {
                            onButtonClick: P,
                            buttonClassName: r
                        }), v && (0, ne.jsx)(cC, {
                            isModalOpen: v,
                            navigateToAccountSettings: g,
                            closeModal: w,
                            translate: s
                        }), O && (0, ne.jsx)(ck, {
                            isModalOpen: O,
                            closeModal: S,
                            translate: s
                        })]
                    })
                };

            function cH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cG(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function cz(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return cH(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cH(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            cF.defaultProps = {
                buttonClassName: void 0,
                rootPlaceId: void 0,
                privateServerLinkCode: void 0,
                gameInstanceId: void 0,
                eventProperties: {},
                appsFlyerReferralProperties: {}
            };
            var cV = function(e, t) {
                    var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                        n = (0, $.useQuery)({
                            queryKey: ["purchaseProductData", e, t],
                            queryFn: function() {
                                var r;
                                return (r = function() {
                                    var r;
                                    return function(e, t) {
                                        var r, n, o, a = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & o[0]) throw o[1];
                                                    return o[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                            l = Object.defineProperty;
                                        return l(i, "next", {
                                            value: u(0)
                                        }), l(i, "throw", {
                                            value: u(1)
                                        }), l(i, "return", {
                                            value: u(2)
                                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                            value: function() {
                                                return this
                                            }
                                        }), i;

                                        function u(l) {
                                            return function(u) {
                                                var c = [l, u];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                        case 0:
                                                        case 1:
                                                            o = c;
                                                            break;
                                                        case 4:
                                                            return a.label++, {
                                                                value: c[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            a.label++, n = c[1], c = [0];
                                                            continue;
                                                        case 7:
                                                            c = a.ops.pop(), a.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                a = 0;
                                                                continue
                                                            }
                                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                                a.label = c[1];
                                                                break
                                                            }
                                                            if (6 === c[0] && a.label < o[1]) {
                                                                a.label = o[1], o = c;
                                                                break
                                                            }
                                                            if (o && a.label < o[2]) {
                                                                a.label = o[2], a.ops.push(c);
                                                                break
                                                            }
                                                            o[2] && a.ops.pop(), a.trys.pop();
                                                            continue
                                                    }
                                                    c = t.call(e, a)
                                                } catch (e) {
                                                    c = [6, e], n = 0
                                                } finally {
                                                    r = o = 0
                                                }
                                                if (5 & c[0]) throw c[1];
                                                return {
                                                    value: c[0] ? c[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                var o, a;
                                                return [4, Promise.all([(o = [e], el(function() {
                                                    var e;
                                                    return eu(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, ec.getProductInfo(o)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data.data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })()), (a = [t], el(function() {
                                                    var e;
                                                    return eu(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, ec.getPlaceDetails(a)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())])];
                                            case 1:
                                                return [2, {
                                                    productInfo: (r = cz.apply(void 0, [n.sent(), 2]))[0],
                                                    productDetails: r[1]
                                                }]
                                        }
                                    })
                                }, function() {
                                    var e = this,
                                        t = arguments;
                                    return new Promise(function(n, o) {
                                        var a = r.apply(e, t);

                                        function i(e) {
                                            cG(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            cG(a, n, o, i, l, "throw", e)
                                        }
                                        i(void 0)
                                    })
                                })()
                            },
                            enabled: r,
                            staleTime: 3e4
                        }).data,
                        o = null == n ? void 0 : n.productInfo,
                        a = null == n ? void 0 : n.productDetails;
                    return void 0 === o || void 0 === a ? {
                        isLoading: !0,
                        productInfo: void 0,
                        productDetails: void 0
                    } : {
                        isLoading: !1,
                        productInfo: o,
                        productDetails: a
                    }
                },
                cW = function(e) {
                    var t = e.buttonWidth,
                        r = e.buttonClassName,
                        n = e.iconClassName,
                        o = e.hideButtonText,
                        a = e.hideButtonIcon,
                        i = e.buttonContent,
                        l = e.onClick,
                        u = e.isPurchasing,
                        c = e.redirectUrl;
                    return c ? (0, ne.jsx)("a", {
                        href: c,
                        className: "purchase-button-link",
                        children: (0, ne.jsxs)(nF, {
                            "data-testid": "play-purchase-button",
                            variant: "Emphasis",
                            style: nq,
                            className: nr()(nW(t), r),
                            onClick: function() {
                                return null
                            },
                            isDisabled: u,
                            children: [!a && (0, ne.jsx)("span", {
                                className: n
                            }), !o && (0, ne.jsx)("span", {
                                className: "btn-text",
                                children: i
                            })]
                        })
                    }) : (0, ne.jsxs)(nF, {
                        "data-testid": "play-purchase-button",
                        variant: "Emphasis",
                        style: nq,
                        className: nr()(nW(t), r),
                        onClick: function(e) {
                            l && !u && l(e)
                        },
                        isDisabled: u,
                        children: [!a && (0, ne.jsx)("span", {
                            className: n
                        }), !o && (0, ne.jsx)("span", {
                            className: "btn-text",
                            children: i
                        })]
                    })
                };

            function cq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cK(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            cW.defaultProps = {
                hideButtonText: !1,
                buttonWidth: nV,
                buttonClassName: "btn-economy-robux-white-lg",
                iconClassName: "icon-robux-white",
                hideButtonIcon: !1,
                isPurchasing: !1,
                onClick: void 0,
                redirectUrl: void 0
            };
            var c$ = function(e) {
                    var t, r, n, o = e.universeId,
                        a = e.placeId,
                        i = e.productDetails,
                        l = e.translate,
                        u = e.iconClassName,
                        c = e.buttonWidth,
                        s = e.buttonClassName,
                        f = e.hideButtonText,
                        p = e.redirectPurchaseUrl,
                        d = e.showDefaultPurchaseText,
                        h = e.pageContext,
                        y = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, q.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return cq(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cq(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        m = y[0],
                        b = y[1],
                        v = (0, q.useCallback)(function(e) {
                            var t;
                            return (t = function() {
                                var t, r, n;
                                return function(e, t) {
                                    var r, n, o, a = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        l = Object.defineProperty;
                                    return l(i, "next", {
                                        value: u(0)
                                    }), l(i, "throw", {
                                        value: u(1)
                                    }), l(i, "return", {
                                        value: u(2)
                                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function u(l) {
                                        return function(u) {
                                            var c = [l, u];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                                if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = c;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: c[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, n = c[1], c = [0];
                                                        continue;
                                                    case 7:
                                                        c = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                            a.label = c[1];
                                                            break
                                                        }
                                                        if (6 === c[0] && a.label < o[1]) {
                                                            a.label = o[1], o = c;
                                                            break
                                                        }
                                                        if (o && a.label < o[2]) {
                                                            a.label = o[2], a.ops.push(c);
                                                            break
                                                        }
                                                        o[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                c = t.call(e, a)
                                            } catch (e) {
                                                c = [6, e], n = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & c[0]) throw c[1];
                                            return {
                                                value: c[0] ? c[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            if (e.preventDefault(), e.stopPropagation(), r = null == (t = i.fiatPurchaseData) ? void 0 : t.basePriceId, !a || !r) return [2];
                                            b(!0), l.label = 1;
                                        case 1:
                                            return l.trys.push([1, 3, 4, 5]), r9(o, eA.fiatPurchaseUpsellName, eh.FiatPurchaseRequired, h), [4, ed(a, r)];
                                        case 2:
                                            return (n = l.sent()) && (0, e_.isValidStripeCheckoutUrl)(n) && (window.location.href = n), [3, 5];
                                        case 3:
                                            return l.sent(), et(eE.PreparePurchaseUrlError), console.error("Error preparing purchase url"), [3, 5];
                                        case 4:
                                            return b(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    r = arguments;
                                return new Promise(function(n, o) {
                                    var a = t.apply(e, r);

                                    function i(e) {
                                        cK(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        cK(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [a, i, o, h]);
                    return (0, ne.jsx)(cW, {
                        buttonWidth: c,
                        buttonClassName: s,
                        iconClassName: u,
                        hideButtonText: f,
                        hideButtonIcon: !0,
                        buttonContent: void 0 !== d && d ? l(ew) : null != (r = null == (n = i.fiatPurchaseData) ? void 0 : n.localizedFiatPrice) ? r : "",
                        onClick: p ? void 0 : v,
                        redirectUrl: p,
                        isPurchasing: m
                    })
                },
                cZ = window.RobloxItemPurchase;

            function cY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cX(e) {
                if (Array.isArray(e)) return e
            }

            function cJ() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function cQ(e) {
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

            function c0(e, t) {
                if (e) {
                    if ("string" == typeof e) return cY(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cY(e, t)
                }
            }
            var c1 = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
                c2 = (0, q.forwardRef)(function(e, t) {
                    var r, n, o, a = cX(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || c0(r) || cJ(),
                        i = a[0],
                        l = a.slice(1),
                        u = i.className,
                        c = i.style,
                        s = i.variant,
                        f = void 0 === s ? "Rectangle" : s,
                        p = i.isAnimated,
                        d = i.width,
                        h = i.height,
                        y = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["className", "style", "variant", "isAnimated", "width", "height"]),
                        m = (cX(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(l) || c0(l, 1) || cJ())[0],
                        b = "Text" === f,
                        v = "Circle" === f,
                        g = {};
                    return b ? (g.height = null != h ? h : "1em", g.width = null != d ? d : "100%") : (void 0 !== d && (g.width = d), void 0 !== h && (g.height = h)), K().createElement("div", (n = cQ({
                        ref: m,
                        "aria-hidden": "true",
                        "data-variant": f
                    }, y), o = o = {
                        className: nn("relative clip block bg-[var(--color-common-shimmer)]", b && "radius-xsmall", v && "radius-circle", !b && !v && "radius-small", (void 0 === p || p) && c1, u),
                        style: cQ({}, g, c)
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
            c2.displayName = "Skeleton";
            var c3 = Error("thumbnail pending"),
                c6 = function(e, t) {
                    return t === c3 && e < 5
                },
                c5 = function() {
                    var e, t;
                    return {
                        promise: new Promise(function(r, n) {
                            e = r, t = n
                        }),
                        resolve: e,
                        reject: t
                    }
                };

            function c8(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var c4 = "150x150",
                c7 = "webp",
                c9 = function(e) {
                    var t, r, n, o;
                    return "".concat(e.type, ":").concat(e.targetId, ":").concat(null != (t = e.size) ? t : c4, ":").concat(null != (r = e.format) ? r : c7, ":").concat(null != (n = e.version) ? n : "", ":").concat(null != (o = e.headShape) ? o : "", ":").concat(e.includeBackground ? "bg" : "", ":").concat(e.includeProfileFrame ? "frame" : "")
                },
                se = tY({
                    data: (T = tY({
                        requestId: tK(),
                        state: new tX(tG({
                            type: "literal",
                            values: Array.isArray(x = ["Completed", "Pending", "Blocked", "Error", "InReview"]) ? x : [x]
                        }, ta(void 0))),
                        imageUrl: new tJ({
                            type: "optional",
                            innerType: new tQ({
                                type: "nullable",
                                innerType: tK()
                            })
                        })
                    }), new t$(tG({
                        type: "array",
                        element: T
                    }, ta(void 0))))
                }),
                st = function(e) {
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
                sr = (C = {
                    delay: 50,
                    maxSize: 100
                }, k = function(e) {
                    var t;
                    return (t = function() {
                        var t, r;
                        return function(e, t) {
                            var r, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: u(0)
                            }), l(i, "throw", {
                                value: u(1)
                            }), l(i, "return", {
                                value: u(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function u(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                        switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    a.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && a.label < o[1]) {
                                                    a.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(c);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, a)
                                    } catch (e) {
                                        c = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return t = J.Url.parse(Y().thumbnailsApi).getOrThrow().withPath("/v1/batch"), r = e.map(function(e) {
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
                                            requestId: c9(e),
                                            type: e.type,
                                            targetId: e.targetId,
                                            size: null != (t = e.size) ? t : c4,
                                            format: null != (r = e.format) ? r : c7
                                        }, null != e.version ? {
                                            version: e.version
                                        } : {}, e.headShape ? {
                                            headShape: e.headShape
                                        } : {}, e.includeBackground ? {
                                            includeBackground: !0
                                        } : {}, e.includeProfileFrame && "AvatarHeadShot" === e.type ? {
                                            includeProfileFrame: !0
                                        } : {})
                                    }), [4, X.post(t, r, se, {
                                        credentials: "include",
                                        headers: {
                                            Accept: "application/json"
                                        },
                                        retry: X.defaultBrowserRetryDelay
                                    })];
                                case 1:
                                    return [2, st(n.sent().getOrThrow())]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = t.apply(e, r);

                            function i(e) {
                                c8(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                c8(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                }, N = function(e, t) {
                    var r;
                    return null != (r = e.get(c9(t))) ? r : {
                        state: "Error"
                    }
                }, l = C, u = k, s = l.delay, f = l.maxSize, p = [], d = c5(), h = function() {
                    var e = d.resolve,
                        t = d.reject,
                        r = p;
                    p = [], d = c5(), u(r).then(e).catch(t)
                }, D = function(e) {
                    0 === p.length && (c = setTimeout(h, s)), p.push(e);
                    var t = d.promise;
                    return null != f && p.length >= f && (clearTimeout(c), h()), t
                }, function(e) {
                    return D(e).then(function(t) {
                        return N(t, e)
                    })
                }),
                sn = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                        r = Number.parseInt(e, t);
                    return Number.isNaN(r) ? null : r
                };

            function so(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sa = function() {
                    if ("u" < typeof document) return {
                        batchSize: 100,
                        waitMs: 1e3
                    };
                    var e, t, r, n, o, a, i = document.getElementsByName("performance")[0],
                        l = sn(null != (t = null == i ? void 0 : i.getAttribute("data-ui-performance-metrics-batch-size")) ? t : ""),
                        u = function(e) {
                            if (Array.isArray(e)) return e
                        }(e = (null != (r = null == i ? void 0 : i.getAttribute("data-ui-performance-metrics-batch-wait-time")) ? r : "").split(":")) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 3 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(e) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return so(e, 3);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return so(e, 3)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = u[0],
                        s = u[1],
                        f = u[2],
                        p = ((null != (n = sn(null != c ? c : "")) ? n : 0) * 3600 + (null != (o = sn(null != s ? s : "")) ? o : 0) * 60 + (null != (a = sn(null != f ? f : "")) ? a : 0)) * 1e3;
                    return {
                        batchSize: null != l ? l : 100,
                        waitMs: 0 === p ? 1e3 : p
                    }
                },
                si = [],
                sl = !1,
                su = function() {
                    if (sl = !1, 0 !== si.length) {
                        var e = si;
                        si = [], X.postUntyped(J.Url.parse("".concat(Y().beaconApi, "/v1/measurements")).getOrThrow(), e, {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e3)
                        })
                    }
                },
                sc = function(e, t) {
                    var r = rs(t);
                    si.push({
                        metricName: e,
                        jsonData: r.isOk() ? r.value : "{}"
                    });
                    var n = sa(),
                        o = n.batchSize,
                        a = n.waitMs;
                    si.length >= o ? su() : sl || (sl = !0, setTimeout(su, a))
                };

            function ss(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var sf = function(e) {
                var t = e.targetId,
                    r = e.type,
                    n = e.size,
                    o = e.format,
                    a = e.version,
                    i = e.headShape,
                    l = e.includeBackground,
                    u = e.includeProfileFrame,
                    c = e.altName,
                    s = e.imgClassName,
                    f = e.containerClassName,
                    p = e.onLoad,
                    d = (0, q.useRef)(Date.now()),
                    h = (0, q.useRef)(0),
                    y = (0, q.useRef)(!1),
                    m = (0, $.useQuery)({
                        queryKey: ["thumbnail-2d", r, t, n, o, a, i, l, u],
                        staleTime: 1 / 0,
                        retry: c6,
                        queryFn: function() {
                            var e;
                            return (e = function() {
                                var e;
                                return function(e, t) {
                                    var r, n, o, a = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        l = Object.defineProperty;
                                    return l(i, "next", {
                                        value: u(0)
                                    }), l(i, "throw", {
                                        value: u(1)
                                    }), l(i, "return", {
                                        value: u(2)
                                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function u(l) {
                                        return function(u) {
                                            var c = [l, u];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                                if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = c;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: c[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, n = c[1], c = [0];
                                                        continue;
                                                    case 7:
                                                        c = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                            a.label = c[1];
                                                            break
                                                        }
                                                        if (6 === c[0] && a.label < o[1]) {
                                                            a.label = o[1], o = c;
                                                            break
                                                        }
                                                        if (o && a.label < o[2]) {
                                                            a.label = o[2], a.ops.push(c);
                                                            break
                                                        }
                                                        o[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                c = t.call(e, a)
                                            } catch (e) {
                                                c = [6, e], n = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & c[0]) throw c[1];
                                            return {
                                                value: c[0] ? c[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(c) {
                                    switch (c.label) {
                                        case 0:
                                            return [4, sr({
                                                type: r,
                                                targetId: t,
                                                size: n,
                                                format: o,
                                                version: a,
                                                headShape: i,
                                                includeBackground: l,
                                                includeProfileFrame: u
                                            })];
                                        case 1:
                                            if ("Pending" === (e = c.sent()).state) throw h.current += 1, c3;
                                            return [2, e]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, o) {
                                    var a = e.apply(t, r);

                                    function i(e) {
                                        ss(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        ss(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }
                    }),
                    b = m.data,
                    v = m.isError,
                    g = m.error,
                    w = m.isPending,
                    O = m.isLoading;
                (0, q.useEffect)(function() {
                    d.current = Date.now(), h.current = 0, y.current = !1
                }, [r, t, n, o, a, i, l, u]), (0, q.useEffect)(function() {
                    if (!y.current) {
                        var e = "".concat(r, "_2d");
                        if (b) {
                            if (y.current = !0, sc("ThumbnailStatusCountWebapp", {
                                    Status: b.state,
                                    ThumbnailType: e
                                }), "Completed" === b.state) {
                                var t = h.current;
                                sc("ThumbnailLoadDurationWebapp", {
                                    Status: "Success",
                                    ThumbnailType: e,
                                    Value: String(Date.now() - d.current)
                                }), sc(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                                    ThumbnailType: e
                                } : {
                                    ThumbnailType: e,
                                    Value: String(t)
                                })
                            }
                        } else v && g === c3 && (y.current = !0, sc("ThumbnailTimeoutWebapp", {
                            ThumbnailType: e
                        }))
                    }
                }, [b, v, g, r]);
                var S = (null == b ? void 0 : b.state) === "Completed" ? b.imageUrl : null,
                    P = ["thumbnail-2d-container float-left overflow-hidden", void 0 === f ? "" : f, (null == b ? void 0 : b.state) === "Blocked" ? "icon-blocked" : (null == b ? void 0 : b.state) === "InReview" ? "icon-in-review" : (null == b ? void 0 : b.state) === "Error" ? "icon-broken" : v ? g === c3 ? "icon-pending" : "icon-broken" : ""].filter(Boolean).join(" ");
                return (0, ne.jsxs)("span", {
                    className: P,
                    children: [(null != w ? w : O) && (0, ne.jsx)(c2, {
                        variant: "Rectangle",
                        width: "100%",
                        height: "100%"
                    }), null != S && (0, ne.jsx)("img", {
                        className: ["size-full", void 0 === s ? "" : s].filter(Boolean).join(" "),
                        src: S,
                        alt: void 0 === c ? "" : c,
                        onLoad: p
                    })]
                })
            };

            function sp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sd = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.price.toString()) ? t : ""
                },
                sh = function(e) {
                    var t, r = e.universeId,
                        n = e.iconClassName,
                        o = e.buttonWidth,
                        a = e.buttonClassName,
                        i = e.hideButtonText,
                        l = e.redirectPurchaseUrl,
                        u = e.productDetails,
                        c = e.productInfo,
                        s = e.translate,
                        f = e.refetchPlayabilityStatus,
                        p = (0, q.useRef)(void 0);
                    null != p.current || (p.current = (0, cZ.createItemPurchase)());
                    var d = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = p.current) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return sp(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sp(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        h = d[0],
                        y = d[1],
                        m = (0, q.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), y.start()
                        }, [y]);
                    return (0, ne.jsxs)(K().Fragment, {
                        children: [(0, ne.jsx)(cW, {
                            buttonWidth: o,
                            buttonClassName: a,
                            iconClassName: n,
                            hideButtonText: i,
                            buttonContent: sd(c),
                            onClick: l ? void 0 : m,
                            redirectUrl: l
                        }), (0, ne.jsx)(h, {
                            translate: s,
                            productId: c.productId,
                            expectedPrice: c.price,
                            thumbnail: (0, ne.jsx)(sf, {
                                type: "GameIcon",
                                size: "150x150",
                                targetId: r,
                                imgClassName: "game-card-thumb"
                            }),
                            assetName: u.name,
                            assetType: "Place",
                            sellerName: u.builder,
                            expectedCurrency: 1,
                            expectedSellerId: c.sellerId,
                            onPurchaseSuccess: f,
                            isPlace: !0
                        })]
                    })
                },
                sy = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.iconClassName,
                        o = void 0 === n ? "icon-robux-white" : n,
                        a = e.buttonWidth,
                        i = void 0 === a ? nV : a,
                        l = e.buttonClassName,
                        u = void 0 === l ? "btn-economy-robux-white-lg" : l,
                        c = e.refetchPlayabilityStatus,
                        s = e.hideButtonText,
                        f = void 0 !== s && s,
                        p = e.redirectPurchaseUrl,
                        d = e.playabilityStatus,
                        h = e.showDefaultPurchaseText,
                        y = e.pageContext,
                        m = a7(),
                        b = cV(t, r),
                        v = b.productInfo,
                        g = b.productDetails;
                    return b.isLoading ? (0, ne.jsx)(it, {
                        buttonClassName: u,
                        buttonWidth: i
                    }) : "Fiat" == (d === eh.FiatPurchaseRequired && (null == g ? void 0 : g.fiatPurchaseData) ? "Fiat" : "Robux") ? (0, ne.jsx)(c$, {
                        universeId: t,
                        placeId: r,
                        iconClassName: o,
                        buttonWidth: i,
                        buttonClassName: u,
                        hideButtonText: f,
                        redirectPurchaseUrl: p,
                        productDetails: g,
                        translate: m,
                        showDefaultPurchaseText: void 0 !== h && h,
                        pageContext: y
                    }) : (0, ne.jsx)(sh, {
                        universeId: t,
                        iconClassName: o,
                        buttonWidth: i,
                        buttonClassName: u,
                        hideButtonText: f,
                        redirectPurchaseUrl: p,
                        productDetails: g,
                        productInfo: v,
                        translate: m,
                        refetchPlayabilityStatus: c
                    })
                },
                sm = function(e) {
                    var t, r, n = new URLSearchParams(window.location.search);
                    return {
                        launchData: null != (t = n.get("launchData")) ? t : e,
                        eventId: null != (r = n.get("eventId")) ? r : void 0
                    }
                },
                sb = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.rootPlaceId,
                        o = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        i = e.eventProperties,
                        l = e.appsFlyerReferralProperties,
                        u = a7(),
                        c = (0, q.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), r4(r, t);
                            var u = sm((null == i ? void 0 : i.launchData) != null ? String(i.launchData) : void 0);
                            r3(r, n, o, a, i, u, l, "DemoPlayButtonClick")
                        }, [t, r, n, o, a, i, l]),
                        s = u(eO) || "Play Demo";
                    return (0, ne.jsx)("button", {
                        type: "button",
                        "data-testid": "demo-play-button",
                        className: "btn-control-lg btn-full-width demo-play-button",
                        onClick: c,
                        children: s
                    })
                },
                sv = function(e) {
                    var t = e.placeId,
                        r = a5("Feature.ExperienceDetails");
                    return (0, ne.jsx)(nF, {
                        "data-testid": "play-on-web-button",
                        as: "a",
                        variant: "Standard",
                        size: "Large",
                        style: nq,
                        className: "btn-full-width btn-control-lg play-on-web-button",
                        href: "".concat(Y().playWebsite, "/games/start?placeId=").concat(t),
                        target: "_blank",
                        children: r.dynamic(eS, void 0, "Play on Web")
                    })
                },
                sg = function(e, t) {
                    if (void 0 === t) return null;
                    var r, n = e.find(function(e) {
                        var r = e.isEnabled,
                            n = e.primaryStatuses;
                        return r && n.has(t)
                    });
                    return null != (r = null == n ? void 0 : n.render()) ? r : null
                },
                sw = function(e) {
                    var t = e.primaryButton,
                        r = e.secondaryButton,
                        n = e.isPrimaryButtonLoading;
                    return r ? (0, ne.jsxs)("div", {
                        className: "stacked-play-buttons-container",
                        children: [(0, ne.jsx)("div", {
                            className: "stacked-play-button-primary",
                            "data-testid": "stacked-play-button-primary",
                            children: t
                        }), !(void 0 !== n && n) && r]
                    }) : t
                },
                sO = function(e) {
                    var t = e.iconClassName,
                        r = e.buttonWidth,
                        n = e.buttonClassName,
                        o = e.hideButtonText,
                        a = a7();
                    return (0, ne.jsxs)(nF, {
                        "data-testid": "play-unplayable-button",
                        variant: "Emphasis",
                        style: nq,
                        className: nr()(nW(void 0 === r ? nV : r), void 0 === n ? "btn-common-play-game-unplayable-lg" : n),
                        isDisabled: !0,
                        onClick: function() {
                            return null
                        },
                        children: [(0, ne.jsx)("span", {
                            className: void 0 === t ? "icon-status-unavailable-secondary" : t
                        }), !(void 0 !== o && o) && (0, ne.jsx)("span", {
                            className: "btn-text",
                            children: a(eg)
                        })]
                    })
                },
                sS = function(e) {
                    var t = e.treatmentData,
                        r = e.isModalOpen,
                        n = e.onConfirm,
                        o = e.onDismiss,
                        a = a7();
                    return (0, ne.jsx)(cT, {
                        titleText: t.titleText,
                        bodyText: t.bodyText,
                        primaryButtonText: t.primaryActionText,
                        secondaryButtonText: t.secondaryActionText,
                        closeLabelText: a("Action.Close"),
                        onPrimaryButtonClick: n,
                        onSecondaryButtonClick: o,
                        isModalOpen: r,
                        onCloseModal: o
                    })
                };

            function sP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sE = function(e) {
                    return !!e && "string" == typeof e.titleText && e.titleText.length > 0 && "string" == typeof e.bodyText && e.bodyText.length > 0 && "string" == typeof e.primaryActionText && e.primaryActionText.length > 0 && "string" == typeof e.secondaryActionText && e.secondaryActionText.length > 0
                },
                sA = function(e, t, r) {
                    var n, o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = (0, q.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return sP(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sP(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        a = o[0],
                        i = o[1],
                        l = ek(e),
                        u = l.playabilityStatus,
                        c = l.playableUxTreatment,
                        s = l.isFetchingPlayability,
                        f = (0, q.useCallback)(function(t) {
                            r9(e, t, eh.Playable, r)
                        }, [e, r]);
                    return {
                        doGameLaunchWithPlayableUxTreatment: (0, q.useCallback)(function() {
                            if (s) {
                                t(), et(eE.PlayableUxTreatmentPlayabilityStatusStillLoading), f(eA.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (u !== eh.Playable || !(null == c ? void 0 : c.treatment)) return void t();
                            if ("reconfirmLaunchModal" !== c.treatment) {
                                t(), et(eE.PlayableUxTreatmentUnknownTreatment), f(eA.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (!sE(c.data)) {
                                t(), et(eE.PlayableUxTreatmentMalformedData), f(eA.gameLaunchFallbackUpsellName);
                                return
                            }
                            i(!0), f(eA.reconfirmLaunchModalUpsellName)
                        }, [s, u, c, t, f]),
                        playableUxTreatmentModal: (0, q.useMemo)(function() {
                            return a && c && sE(c.data) ? (0, ne.jsx)(sS, {
                                treatmentData: c.data,
                                isModalOpen: a,
                                onConfirm: function() {
                                    i(!1), t()
                                },
                                onDismiss: function() {
                                    i(!1)
                                }
                            }) : null
                        }, [c, a, t])
                    }
                };

            function sj(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var sI = function(e) {
                var t = e.universeId,
                    r = e.buttonClassName,
                    n = e.playabilityStatus,
                    o = e.pageContext;
                return (0, ne.jsx)(a9, {
                    onButtonClick: function(e) {
                        var r;
                        return (r = function() {
                            return function(e, t) {
                                var r, n, o, a = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    l = Object.defineProperty;
                                return l(i, "next", {
                                    value: u(0)
                                }), l(i, "throw", {
                                    value: u(1)
                                }), l(i, "return", {
                                    value: u(2)
                                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), i;

                                function u(l) {
                                    return function(u) {
                                        var c = [l, u];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                case 0:
                                                case 1:
                                                    o = c;
                                                    break;
                                                case 4:
                                                    return a.label++, {
                                                        value: c[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    a.label++, n = c[1], c = [0];
                                                    continue;
                                                case 7:
                                                    c = a.ops.pop(), a.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                        a = 0;
                                                        continue
                                                    }
                                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                        a.label = c[1];
                                                        break
                                                    }
                                                    if (6 === c[0] && a.label < o[1]) {
                                                        a.label = o[1], o = c;
                                                        break
                                                    }
                                                    if (o && a.label < o[2]) {
                                                        a.label = o[2], a.ops.push(c);
                                                        break
                                                    }
                                                    o[2] && a.ops.pop(), a.trys.pop();
                                                    continue
                                            }
                                            c = t.call(e, a)
                                        } catch (e) {
                                            c = [6, e], n = 0
                                        } finally {
                                            r = o = 0
                                        }
                                        if (5 & c[0]) throw c[1];
                                        return {
                                            value: c[0] ? c[1] : void 0,
                                            done: !0
                                        }
                                    }
                                }
                            }(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        e.preventDefault(), e.stopPropagation(), r.label = 1;
                                    case 1:
                                        return r.trys.push([1, 3, , 4]), r9(t, eA.ageCheckUpsellName, n, o), [4, r8({
                                            context: ej,
                                            pageContext: o
                                        })];
                                    case 2:
                                        return r.sent() && window.location.reload(), [3, 4];
                                    case 3:
                                        return r.sent(), [3, 4];
                                    case 4:
                                        return [2]
                                }
                            })
                        }, function() {
                            var e = this,
                                t = arguments;
                            return new Promise(function(n, o) {
                                var a = r.apply(e, t);

                                function i(e) {
                                    sj(a, n, o, i, l, "next", e)
                                }

                                function l(e) {
                                    sj(a, n, o, i, l, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    },
                    buttonClassName: r
                })
            };

            function sx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sT(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function sC(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            sT(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            sT(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function sk(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sx(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sx(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sN(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var sD = function(e) {
                    var t, r;
                    return {
                        launchData: null != (t = new URLSearchParams(window.location.search).get("launchData")) ? t : e,
                        eventId: null != (r = new URLSearchParams(window.location.search).get("eventId")) ? r : void 0
                    }
                },
                sR = {},
                s_ = new Set([eh.PurchaseRequired, eh.FiatPurchaseRequired, eh.FiatPurchaseDeviceRestricted, eh.ContextualPlayabilityRegionalAvailability]),
                sL = new Set([eh.Playable]),
                sU = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.rootPlaceId,
                        o = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        i = e.status,
                        l = e.eventProperties,
                        u = void 0 === l ? sR : l,
                        c = e.appsFlyerReferralProperties,
                        s = void 0 === c ? sR : c,
                        f = e.iconClassName,
                        p = e.buttonWidth,
                        d = void 0 === p ? nV : p,
                        h = e.buttonClassName,
                        y = void 0 === h ? "btn-common-play-game-lg" : h,
                        m = e.disableLoadingState,
                        b = e.buttonText,
                        v = void 0 === b ? void 0 : b,
                        g = e.hideIcon,
                        w = e.analyticsCallback,
                        O = void 0 === w ? void 0 : w,
                        S = e.pageContext,
                        P = sk((0, q.useState)(void 0), 2),
                        E = P[0],
                        A = P[1],
                        j = sk((0, q.useState)(void 0), 2),
                        I = j[0],
                        x = j[1],
                        T = sk((0, q.useState)(void 0), 2),
                        C = T[0],
                        k = T[1],
                        N = sk((0, q.useState)(void 0), 2),
                        D = N[0],
                        R = N[1],
                        _ = sk((0, q.useState)(void 0), 2),
                        L = _[0],
                        U = _[1],
                        B = sk((0, q.useState)(void 0), 2),
                        M = B[0],
                        F = B[1],
                        H = sk((0, q.useState)(void 0), 2),
                        G = H[0],
                        z = H[1],
                        V = sk((0, q.useState)(void 0), 2),
                        W = V[0],
                        Z = V[1],
                        X = (0, $.useQuery)({
                            queryKey: ["getIsVNGLandingRedirectEnabled"],
                            queryFn: nH.getIsVNGLandingRedirectEnabled,
                            retry: !1
                        }).data;
                    (0, q.useEffect)(function() {
                        sC(function() {
                            var e, r;
                            return sN(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return n.trys.push([0, 2, , 3]), [4, sC(function() {
                                            var e, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b;
                                            return sN(this, function(v) {
                                                switch (v.label) {
                                                    case 0:
                                                        if (e = {
                                                                isUniverseEnabledForVoice: !1,
                                                                isUniverseEnabledForAvatarVideo: !1
                                                            }, void 0 === rB()) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: !0,
                                                            useCameraU13Design: !1,
                                                            useVoiceUpsellV2Design: !1
                                                        }];
                                                        return [4, es()];
                                                    case 1:
                                                        var g;
                                                        if (n = (r = v.sent()).playButtonOverlayWebFlag, o = r.voiceOptInWebFlag, a = r.cameraOptInWebFlag, i = r.cameraOptInWebFlagU13, l = r.requireExplicitVoiceConsent, u = r.useCameraU13Design, c = r.useVoiceUpsellV2Design, !n && !(o || a)) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: l,
                                                            useCameraU13Design: u,
                                                            useVoiceUpsellV2Design: c
                                                        }];
                                                        return [4, (g = t, el(function() {
                                                            var e;
                                                            return eu(this, function(t) {
                                                                switch (t.label) {
                                                                    case 0:
                                                                        return e = {
                                                                            withCredentials: !0,
                                                                            url: "".concat(Y().voiceApi, "/v1/settings/verify/show-age-verification-overlay/").concat(g)
                                                                        }, [4, er.get(e)];
                                                                    case 1:
                                                                        return [2, t.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        if (f = (s = v.sent()).showAgeVerificationOverlay, p = s.showVoiceOptInOverlay, d = s.showAvatarVideoOptInOverlay, h = s.elegibleToSeeVoiceUpsell, y = s.universePlaceVoiceEnabledSettings, m = !1, b = !1, !nz().getAllValuesForLayer) return [3, 5];
                                                        return [4, nz().getAllValuesForLayer("Voice.AvatarChat.Upsell")];
                                                    case 3:
                                                        return m = Boolean.apply(void 0, [v.sent().ShouldShowUpsell]), [4, nz().getAllValuesForLayer("Voice.AvatarChat.U13Upsell")];
                                                    case 4:
                                                        b = Boolean.apply(void 0, [v.sent().ShouldShowUpsell]), v.label = 5;
                                                    case 5:
                                                        return [2, {
                                                            elegibleToSeeVoiceUpsell: h,
                                                            universePlaceVoiceEnabledSettings: y,
                                                            showAgeVerificationOverlay: n && f,
                                                            showVoiceOptInOverlay: o && p,
                                                            showAvatarVideoOptInOverlay: d && (a && m || i && b),
                                                            requireExplicitVoiceConsent: l,
                                                            useCameraU13Design: u,
                                                            useVoiceUpsellV2Design: c
                                                        }]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return A(null != (e = (r = n.sent()).universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice) && e), k(r.elegibleToSeeVoiceUpsell), x(r.showAgeVerificationOverlay), R(r.showVoiceOptInOverlay), U(r.showAvatarVideoOptInOverlay), F(r.requireExplicitVoiceConsent), z(r.useCameraU13Design), Z(r.useVoiceUpsellV2Design), [3, 3];
                                    case 2:
                                        return n.sent(), et(eE.PlayButtonShowIdentificationError), k(!1), A(!1), x(!1), R(!1), U(!1), F(!0), z(!1), Z(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []);
                    var J = (0, q.useCallback)(function() {
                            r4(r, t);
                            var e = sD(null != u.launchData ? String(u.launchData) : void 0);
                            r3(r, n, o, a, u, e, s)
                        }, [r, t, u, s, n, o, a]),
                        Q = sA(t, J, S),
                        ee = Q.doGameLaunchWithPlayableUxTreatment,
                        en = Q.playableUxTreatmentModal;
                    return void 0 !== I || void 0 !== m && m ? (0, ne.jsxs)(K().Fragment, {
                        children: [(0, ne.jsxs)(nF, {
                            "data-testid": "play-button",
                            variant: "Emphasis",
                            style: nq,
                            className: nr()(nW(d), y),
                            onClick: function(e) {
                                return sC(function() {
                                    var t;
                                    return sN(this, function(n) {
                                        var o, a, l, u;
                                        switch (n.label) {
                                            case 0:
                                                if (e.preventDefault(), e.stopPropagation(), i !== eh.Playable) return [3, 7];
                                                if (C && E && nz().getAllValuesForLayer("SocialVoice.VoiceUpsell").then(function() {
                                                        nz().logLayerExposure("SocialVoice.VoiceUpsell")
                                                    }).catch(function() {
                                                        console.error("error logging exposure event in play-join")
                                                    }), !I) return [3, 2];
                                                return [4, rZ(function() {
                                                    var e, t;
                                                    return rJ(this, function(r) {
                                                        try {
                                                            return t = (e = r5()) ? e.startVerificationFlow() : eF("OpenIdentityVerificationModal", function(e) {
                                                                return {
                                                                    successCallback: function(t, r) {
                                                                        e([t, r])
                                                                    }
                                                                }
                                                            }, [!1, !1]), [2, t]
                                                        } catch (e) {
                                                            return [2, [!1, !1]]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return (t = sk.apply(void 0, [n.sent(), 2]))[0], t[1] && x(!1), [3, 6];
                                            case 2:
                                                if (!D) return [3, 4];
                                                return [4, (o = null == M || M, a = null != W && W, rZ(function() {
                                                    var e, t;
                                                    return rJ(this, function(r) {
                                                        try {
                                                            return t = (e = r5()) ? e.showVoiceOptInOverlay(o, a) : eF("OpenVoiceOptInOverlay", function(e) {
                                                                return {
                                                                    closeCallback: function(t) {
                                                                        e(t)
                                                                    },
                                                                    requireExplicitVoiceConsent: o,
                                                                    useVoiceUpsellV2Design: a
                                                                }
                                                            }, !1), [2, t]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 3:
                                                return n.sent() && R(!1), [3, 6];
                                            case 4:
                                                if (!L) return [3, 6];
                                                return [4, (l = null == M || M, u = null == G || G, rZ(function() {
                                                    var e, t;
                                                    return rJ(this, function(r) {
                                                        try {
                                                            return t = (e = r5()) ? e.showAvatarVideoOptInOverlay(l, u) : eF("OpenCameraOptInOverlay", function(e) {
                                                                return {
                                                                    closeCallback: function(t) {
                                                                        e(t)
                                                                    },
                                                                    requireExplicitCameraConsent: l,
                                                                    useCameraU13Design: u
                                                                }
                                                            }, !1), [2, t]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 5:
                                                n.sent() && U(!1), n.label = 6;
                                            case 6:
                                                return ee(), [3, 8];
                                            case 7:
                                                i === eh.GuestProhibited && (X ? nH.navigateToLoginWithRedirect() : r6(r, s)), n.label = 8;
                                            case 8:
                                                return O && O(), [2]
                                        }
                                    })
                                })()
                            },
                            children: [!(void 0 !== g && g) && (0, ne.jsx)("span", {
                                className: void 0 === f ? "icon-common-play" : f
                            }), v && (0, ne.jsx)("span", {
                                className: "play-button-text",
                                children: v
                            })]
                        }), (0, ne.jsx)("div", {
                            id: "id-verification-container"
                        }), en]
                    }) : (0, ne.jsx)(it, {
                        buttonClassName: y,
                        buttonWidth: d
                    })
                },
                sB = function(e, t) {
                    var r = t.playabilityStatus,
                        n = t.shouldShowVpcPlayButtonUpsells,
                        o = t.shouldShowNoticeAgreementIfPlayable,
                        a = t.unplayableDisplayText;
                    if (void 0 !== r) {
                        if (r === eh.Playable && o) return {
                            message: e(eb),
                            testId: "play-contextual-message"
                        };
                        if (a) return {
                            message: a,
                            testId: "play-server-message"
                        };
                        if (r !== eh.ContextualPlayabilityCoreGated && r7(r, n)) return {
                            message: e(Object.hasOwn(em, r) ? em[r] : em[eh.UnplayableOtherReason]),
                            testId: "play-error"
                        }
                    }
                },
                sM = window.Roblox["core-scripts"].util.elementVisibility,
                sF = function(e, t) {
                    var r = t.universeId,
                        n = t.playabilityStatus,
                        o = t.pageContext,
                        a = t.attributionId,
                        i = t.contextualMessage,
                        l = (0, q.useRef)(!1);
                    (0, q.useEffect)(function() {
                        l.current = !1
                    }, [r, n, o, a, i]), (0, q.useEffect)(function() {
                        if (e.current && !l.current && i) {
                            var t = null;
                            return t = (0, sM.observeVisibility)({
                                    element: e.current,
                                    threshold: .5
                                }, function(e) {
                                    e && !l.current && (l.current = !0, (0, eR.sendEventWithTarget)("playButtonContextualMessageImpression", o, {
                                        universeId: r,
                                        playabilityStatus: n,
                                        contextualMessage: i,
                                        attributionId: a
                                    }), null == t || t(), t = null)
                                }),
                                function() {
                                    null == t || t()
                                }
                        }
                    }, [e, r, n, o, a, i])
                };

            function sH(e) {
                var t = new(V()).Deferred;
                return W.Hybrid.Game.launchGame(e, function() {
                    t.resolve(e)
                }), t
            }
            var sG = {
                isJoinAttemptIdEnabled: !1,
                joinMultiplayerGame: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        r = {
                            requestType: W.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                            placeId: e.placeId.toString(),
                            isPlayTogetherGame: t,
                            browserTrackerId: W.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (r.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (r.joinAttemptOrigin = e.joinAttemptOrigin), sH(r)
                },
                followPlayerIntoGame: function(e) {
                    var t = {
                        requestType: W.Hybrid.Game.LAUNCH_MODES.FOLLOW_USER,
                        userId: e.userId.toString(),
                        browserTrackerId: W.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), sH(t)
                },
                joinGameInstance: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        r = {
                            requestType: W.Hybrid.Game.LAUNCH_MODES.GAME_INSTANCE,
                            placeId: e.placeId.toString(),
                            instanceId: e.gameId,
                            isPlayTogetherGame: t,
                            browserTrackerId: W.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (r.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (r.joinAttemptOrigin = e.joinAttemptOrigin), sH(r)
                },
                joinPrivateGame: function(e) {
                    var t = {
                        requestType: W.Hybrid.Game.LAUNCH_MODES.PRIVATE_SERVER,
                        placeId: e.placeId.toString(),
                        accessCode: e.accessCode,
                        browserTrackerId: W.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), sH(t)
                },
                playTogetherGame: function(e) {
                    var t = {
                        requestType: W.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                        placeId: e.placeId.toString(),
                        conversationId: e.conversationId.toString(),
                        browserTrackerId: W.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), sH(t)
                }
            };
            V()(document).ready(function() {
                F = new W.TranslationResourceProvider().getTranslationResource("Feature.GameLaunchGuestMode")
            });
            var sz = {
                    restrictGuests: function(e) {
                        var t = new(V()).Deferred;
                        return W.CurrentUser.isAuthenticated ? t.resolve(e) : W.Dialog.open({
                            titleText: F.get("Heading.Dialog.SignUpOrLogin"),
                            bodyContent: F.get("Description.Dialog.ConnectionsSignUpOrLogin"),
                            cssClass: "soli-modal",
                            acceptColor: W.Dialog.green,
                            acceptText: F.get("Action.Dialog.SignUp"),
                            declineText: F.get("Action.Dialog.Login"),
                            onDecline: function() {
                                W.FormEvents && W.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_login");
                                var e = "/login?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search);
                                window.location.href = W.Endpoints ? W.Endpoints.getAbsoluteUrl(e) : e
                            },
                            onAccept: function() {
                                var e;
                                W.FormEvents && W.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_signup"), e = "/CreateAccount?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search), window.location.href = W.Endpoints ? W.Endpoints.getAbsoluteUrl(e) : e
                            }
                        }), t
                    }
                },
                sV = window.CoreUtilities;

            function sW(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var sq = {
                gameLaunchInterface: null,
                gameLaunchLogger: null,
                initialized: new Promise(function(e) {
                    H = e
                })
            };

            function sK(e, t, r) {
                var n, o, a = (n = function(e) {
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
                }({}, e), o = o = {
                    joinAttemptId: null != t ? t : sV.uuidService.generateRandomUuid()
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n);
                return r && (a.joinAttemptOrigin = r), a
            }

            function s$(e, t, r) {
                var n, o, a = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    l = arguments.length > 5 && void 0 !== arguments[5] && arguments[5],
                    u = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : "",
                    c = arguments.length > 7 && void 0 !== arguments[7] ? arguments[7] : "";
                a && i && (n = {
                    url: "".concat(W.EnvironmentUrls.gameJoinApi, "/v1/team-create-preemptive"),
                    withCredentials: !0,
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json"
                    }
                }, o = {
                    gameJoinAttemptId: sV.uuidService.generateRandomUuid(),
                    placeId: e
                }, sV.httpService.post(n, o)), sq.gameLaunchInterface.editGameInStudio(e, t, r, a && l, u, c)
            }

            function sZ(e, t, r, n, o, a, i) {
                var l = {
                    placeId: e,
                    launchData: null == a ? void 0 : a.launchData,
                    eventId: null == a ? void 0 : a.eventId,
                    isPlayTogetherGame: !0 === r,
                    referredByPlayerId: i
                };
                return sq.gameLaunchInterface.isJoinAttemptIdEnabled && (l = sK(l, n, o)), sz.restrictGuests(l).then(sq.gameLaunchInterface.joinMultiplayerGame)
            }
            V().fn.bindGameLaunch = function() {
                return this.find(".VisitButtonPlayGLI").click(function() {
                    var e = V()(this);
                    sZ(e.attr("placeid"), e.data("is-membership-level-ok"))
                }), this.find(".VisitButtonEditGLI").click(function() {
                    var e = V()(this);
                    s$(e.attr("placeid"), e.data("universeid"), !!e.data("allowupload"))
                }), this
            }, V()(document).ready(function() {
                V()("body").bindGameLaunch()
            }), Object.assign(sq, {
                authenticationChecker: sz,
                joinMultiplayerGame: sZ,
                openStudio: function() {
                    sq.gameLaunchInterface.openStudio()
                },
                openPluginInStudio: function(e) {
                    sq.gameLaunchInterface.openPluginInStudio(e)
                },
                editGameInStudio: s$,
                followPlayerIntoGame: function(e, t, r) {
                    var n = {
                        userId: e
                    };
                    return sq.gameLaunchInterface.isJoinAttemptIdEnabled && (n = sK(n, t, r)), sz.restrictGuests(n).then(sq.gameLaunchInterface.followPlayerIntoGame)
                },
                joinGameInstance: function(e, t, r, n, o, a, i) {
                    var l = {
                        placeId: e,
                        gameId: t,
                        isPlayTogetherGame: !0 === n,
                        referredByPlayerId: i
                    };
                    return sq.gameLaunchInterface.isJoinAttemptIdEnabled && (l = sK(l, o, a)), sz.restrictGuests(l).then(sq.gameLaunchInterface.joinGameInstance)
                },
                joinPrivateGame: function(e, t, r, n, o) {
                    var a;
                    return (a = function() {
                        var a;
                        return function(e, t) {
                            var r, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: u(0)
                            }), l(i, "throw", {
                                value: u(1)
                            }), l(i, "return", {
                                value: u(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function u(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                        switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    a.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && a.label < o[1]) {
                                                    a.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(c);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, a)
                                    } catch (e) {
                                        c = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return [4, sq.initialized];
                                case 1:
                                    return i.sent(), a = {
                                        placeId: e,
                                        accessCode: t,
                                        linkCode: r
                                    }, sq.gameLaunchInterface.isJoinAttemptIdEnabled && (a = sK(a, n, o)), [2, sq.gameLaunchInterface.joinPrivateGame(a)]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, n) {
                            var o = a.apply(e, t);

                            function i(e) {
                                sW(o, r, n, i, l, "next", e)
                            }

                            function l(e) {
                                sW(o, r, n, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                playTogetherGame: function(e, t, r, n) {
                    var o = {
                        placeId: e,
                        conversationId: t
                    };
                    return sq.gameLaunchInterface.isJoinAttemptIdEnabled && (o = sK(o, r, n)), sz.restrictGuests(o).then(sq.gameLaunchInterface.playTogetherGame)
                },
                setGameLaunchInterface: function(e) {
                    sq.gameLaunchInterface = e, H()
                },
                setGameLaunchLogger: function(e) {
                    sq.gameLaunchLogger = e
                },
                tryAssetInStudio: function(e) {
                    sq.gameLaunchInterface.tryAssetInStudio(e)
                },
                isJoinAttemptIdEnabled: function() {
                    var e;
                    return null == (e = sq.gameLaunchInterface) ? void 0 : e.isJoinAttemptIdEnabled
                },
                startClientAttemptedEvent: "startClientAttempted",
                startClientFailedEvent: "startClientFailed",
                startClientSucceededEvent: "startClientSucceeded",
                beginInstallEvent: "beginInstall",
                successfulInstallEvent: "successfulInstall",
                manualDownloadEvent: "manualDownload"
            });
            var sY = function(e) {
                    var t, r = "".concat(e, "="),
                        n = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(r)
                        })) ? void 0 : t.slice(r.length);
                    return null == n ? null : {
                        name: e,
                        value: decodeURIComponent(n)
                    }
                },
                sX = function() {
                    var e = sY("RBXcb");
                    if (null == e || "" === e.value) return !1;
                    var t = e.value.split("&").find(function(e) {
                        return "GoogleAnalytics" === e.split("=")[0]
                    });
                    return "true" === (null == t ? void 0 : t.split("=")[1])
                },
                sJ = {
                    lastContext: "unknown",
                    contextCategories: {
                        joinUser: "JoinUser"
                    }
                };

            function sQ(e, t, r, n, o, a) {
                var i, l, u;
                null !== t && "" !== t && "unknown" !== t && (sJ.lastContext = t), W.EventStream.SendEvent(e, sJ.lastContext, function(e) {
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
                    lType: "protocol",
                    pid: r,
                    refuid: n,
                    pg: (i = window.location.pathname.toLowerCase(), l = "profile", -1 !== (u = i.lastIndexOf(l)) && i.length === u + l.length ? l : 0 === i.indexOf("/develop") ? "develop" : 0 === i.indexOf("/discover") ? "games" : "gameDetail"),
                    joinAttemptId: o
                }, null != a && {
                    actionType: a
                }))
            }
            Object.assign(sJ, {
                SendGamePlayIntent: function(e, t, r, n, o) {
                    sQ("gamePlayIntent", e, t, r, n, o), V()(document).trigger("playButton:gamePlayIntent")
                },
                SendDevelopIntent: function(e, t) {
                    sQ("developIntent", e, t)
                },
                SendInstallBegin: function(e, t) {
                    sQ("installBegin", e, t)
                },
                SendInstallSuccess: function(e, t) {
                    sQ("installSuccess", e, t)
                },
                SendClientStartAttempt: function(e, t) {
                    sQ("clientStartAttempt", e, t)
                },
                SendClientStartSuccessWeb: function(e, t) {
                    sQ("clientStartSuccessWeb", e, t)
                },
                SendManualDownloadClick: function(e, t) {
                    sQ("manualDownload", e, t)
                }
            });
            var s0 = {
                    logToConsoleEnabled: !1,
                    logToGAEnabled: !0,
                    logToEphemeralCountersEnabled: !0
                },
                s1 = {};
            s1[sq.startClientAttemptedEvent] = ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"], s1[sq.startClientSucceededEvent] = ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"];
            var s2 = {};
            W.GaEventSettings.gaLaunchAttemptAndLaunchSuccessEnabled && (s2[sq.startClientAttemptedEvent] = "Launch Attempt", s2[sq.startClientSucceededEvent] = "Launch Success"), s2[sq.beginInstallEvent] = "Install Begin", s2[sq.successfulInstallEvent] = "Install Success", s2[sq.manualDownloadEvent] = "Manual Download";
            var s3 = {};

            function s6(e) {
                s0.logToConsoleEnabled && console.log(e)
            }

            function s5(e, t) {
                if (s0.logToEphemeralCountersEnabled) {
                    var r, n = V()("#PlaceLauncherStatusPanel").data("os-name");
                    "Windows" === n && (n = "Win32");
                    var o = e;
                    o = (o = o.replace("<os>", n)).replace("<launchmethod>", t), (null == (r = window.EventTracker) ? void 0 : r.fireEvent) && window.EventTracker.fireEvent(o)
                }
            }

            function s8(e, t, r, n) {
                sX() && void 0 !== window.GoogleAnalyticsEvents && s0.logToGAEnabled && window.GoogleAnalyticsEvents.FireEvent && window.GoogleAnalyticsEvents.FireEvent([e, t, r, n])
            }

            function s4(e, t) {
                s6("".concat(e.type, ": ").concat(JSON.stringify(t))), s1[e.type] && V().each(s1[e.type], function(e, r) {
                    s5(r, t.launchMethod)
                }), s2[e.type] && s8(t.launchMethod, s2[e.type], t.params.launchMode, 0), s3[e.type] && s3[e.type](null, t.params.placeId)
            }
            s3[sq.startClientAttemptedEvent] = sJ.SendClientStartAttempt, s3[sq.startClientSucceededEvent] = sJ.SendClientStartSuccessWeb, s3[sq.beginInstallEvent] = sJ.SendInstallBegin, s3[sq.successfulInstallEvent] = sJ.SendInstallSuccess, s3[sq.manualDownloadEvent] = sJ.SendManualDownloadClick, Object.assign(s0, {
                logToConsole: s6,
                logToEphemeralCounters: s5,
                logToGA: s8
            }), V()(document).ready(function() {
                var e = [sq.startClientAttemptedEvent, sq.startClientFailedEvent, sq.startClientSucceededEvent, sq.beginInstallEvent, sq.successfulInstallEvent, sq.manualDownloadEvent];
                V()(sq).on(e.join(" "), s4)
            });
            var s7 = function() {
                    var e = "click";
                    V()("body").on(e, ".VisitButtonPlay, .VisitButtonPlayGLI", function() {
                        var e, t = V()(this);
                        if ((t.hasClass("VisitButtonPlay") || t.hasClass("VisitButtonPlayGLI")) && (e = "PlayButton"), e) {
                            var r = V()(this).attr("placeid"),
                                n = W.UrlParser ? W.UrlParser.getParameterValueByName("rbxp") : null;
                            sJ.SendGamePlayIntent(e, r, n)
                        }
                    }), V()("body").on(e, ".VisitButtonEdit, .VisitButtonEditGLI", function() {
                        var e = V()(this).attr("placeid");
                        sJ.SendDevelopIntent("Edit", e)
                    }), V()("#rbx-running-games").on(e, ".rbx-game-server-item .rbx-game-server-join", function() {
                        var e = V()(this).data("placeid");
                        e && sJ.SendGamePlayIntent("JoinInstance", e)
                    }), V()("#rbx-friends-running-games").on(e, ".rbx-friends-game-server-item .rbx-friends-game-server-join", function() {
                        var e = V()(this).data("placeid");
                        e && sJ.SendGamePlayIntent("JoinInstance", e)
                    }), V()("#game-instances").on(e, "#rbx-vip-servers .rbx-vip-server-item .rbx-vip-server-join", function() {
                        var e = V()(this).data("placeid");
                        e && sJ.SendGamePlayIntent("PrivateServer", e)
                    })
                },
                s9 = window.Roblox["core-scripts"].react,
                fe = "u" > typeof window ? window.navigator.userAgent : "",
                ft = /Mac OS X/i.test(fe),
                fr = /Windows NT/i.test(fe);
            /Linux/i.test(fe) && /Android/i.test(fe);
            var fn = /Android/i.test(fe),
                fo = /iPhone|iPad|iPod/i.test(fe),
                fa = function(e) {
                    var t = e.alt,
                        r = void 0 === t ? "App Icon" : t,
                        n = e.className,
                        o = e.title,
                        a = e.style;
                    return K().createElement("div", {
                        className: "app-icon-bluebg app-icon-".concat(ft ? "mac" : fr ? "windows" : fo ? "ios" : fn ? "android" : "windows", " ").concat(void 0 === n ? "" : n),
                        role: "img",
                        "aria-label": r,
                        title: (void 0 === o ? "" : o) || r,
                        style: void 0 === a ? {} : a
                    })
                },
                fi = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding"],
                fl = ["Common.VisitGame", "CommonUI.Controls"];

            function fu(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var fc = {
                    Unknown: 1,
                    WindowsDirectDownload: 2,
                    WindowsStore: 3,
                    MacDirectDownload: 4,
                    AppleAppStore: 5,
                    GooglePlayStore: 6,
                    AmazonAppStore: 7
                },
                fs = {
                    downloadPageHeader: "Heading.DownloadPage",
                    appStoreLinksHeader: "Heading.AppStoreLinks",
                    windowsDownloadLabel: "Action.DownloadWindowsApp",
                    windowsDownloadLink: (0, eN.getAbsoluteUrl)("/download/client?os=win"),
                    macDownloadLabel: "Action.DownloadMacApp",
                    macDownloadLink: (0, eN.getAbsoluteUrl)("/download/client?os=mac"),
                    androidAppDownloadLabel: "Action.DownloadAndroidApp",
                    amazonStoreLink: "Link.AmazonStoreRobloxApp",
                    googlePlayStoreLink: "Link.GooglePlayStoreRobloxApp",
                    iOSDownloadLabel: "Action.DownloadiOSApp",
                    appleAppStoreLink: "Link.AppleAppStoreRobloxApp",
                    downloadConfirmationHeader: "Heading.DownloadConfirmation",
                    followInstallStepsLabel: "Label.FollowInstallSteps",
                    retryDownloadLabel: "Label.RetryDownload",
                    installInstructionsHeader: "Heading.InstallInstructions",
                    mobileAppDownloadOptionHeading: "Heading.MobileAppDownloadOption",
                    mobileAppQrCodeLabel: "Label.MobileAppQrCode"
                },
                ff = (fu(G = {}, fc.WindowsDirectDownload, {
                    href: fs.windowsDownloadLink,
                    title: fs.windowsDownloadLabel,
                    name: "windows",
                    icon: "icon-filled-microsoft",
                    legacyIcon: "icon-logo-win",
                    isDirectDownload: !0
                }), fu(G, fc.MacDirectDownload, {
                    href: fs.macDownloadLink,
                    title: fs.macDownloadLabel,
                    name: "mac",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !0
                }), fu(G, fc.AmazonAppStore, {
                    href: fs.amazonStoreLink,
                    title: fs.androidAppDownloadLabel,
                    name: "amazonStore",
                    icon: "icon-filled-amazon",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), fu(G, fc.GooglePlayStore, {
                    href: fs.googlePlayStoreLink,
                    title: fs.androidAppDownloadLabel,
                    name: "android",
                    icon: "icon-filled-android",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), fu(G, fc.AppleAppStore, {
                    href: fs.appleAppStoreLink,
                    title: fs.iOSDownloadLabel,
                    name: "iOS",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !1
                }), G),
                fp = function(e) {
                    var t, r = e.translate;
                    return (0, ne.jsxs)(K().Fragment, {
                        children: [(0, ne.jsxs)("div", {
                            className: "flex flex-col gap-small",
                            children: [(0, ne.jsx)("h3", {
                                className: "text-label-large content-emphasis padding-none",
                                children: r("Heading.MobileAppDownloadOption")
                            }), (0, ne.jsx)("p", {
                                className: "text-body-medium",
                                children: r("Label.MobileAppQrCode")
                            })]
                        }), (0, ne.jsx)("div", {
                            className: "flex grow justify-center items-center bg-shift-100 radius-medium padding-x-large",
                            children: (0, ne.jsx)("div", {
                                className: "radius-medium padding-small bg-[white]",
                                children: (0, ne.jsx)("img", {
                                    className: "size-2100",
                                    src: "string" == typeof(t = "https://images.rbxcdn.com/6674b8e189bf79c6.png") ? t : t.src,
                                    alt: ""
                                })
                            })
                        })]
                    })
                };

            function fd(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var fh = function() {
                var e;

                function t(e, r) {
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    fd(this, "url", void 0), fd(this, "searchParams", void 0), this.url = e, this.searchParams = r
                }
                return e = [{
                        key: "href",
                        get: function() {
                            return this.url.href
                        }
                    }, {
                        key: "scheme",
                        get: function() {
                            return this.url.protocol
                        }
                    }, {
                        key: "authority",
                        get: function() {
                            return this.url.host
                        }
                    }, {
                        key: "host",
                        get: function() {
                            return this.url.hostname
                        }
                    }, {
                        key: "port",
                        get: function() {
                            return this.url.port
                        }
                    }, {
                        key: "path",
                        get: function() {
                            return this.url.pathname
                        }
                    }, {
                        key: "query",
                        get: function() {
                            return this.url.search
                        }
                    }, {
                        key: "fragment",
                        get: function() {
                            return this.url.hash
                        }
                    }, {
                        key: "toMutable",
                        value: function() {
                            return new URL(this.url)
                        }
                    }, {
                        key: "toString",
                        value: function() {
                            return this.url.toString()
                        }
                    }, {
                        key: "toJson",
                        value: function() {
                            return this.url.toJSON()
                        }
                    }],
                    function(e, t) {
                        for (var r = 0; r < t.length; r++) {
                            var n = t[r];
                            n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                        }
                    }(t.prototype, e), t
            }();

            function fy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fm(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function fb(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function fv(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function fg(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || fO(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fw(e) {
                return function(e) {
                    if (Array.isArray(e)) return fy(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || fO(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fO(e, t) {
                if (e) {
                    if ("string" == typeof e) return fy(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fy(e, t)
                }
            }
            var fS = function(e) {
                    return rN(new URLSearchParams(e))
                },
                fP = function(e) {
                    return Array.isArray(e)
                },
                fE = function(e) {
                    return String(e)
                },
                fA = ["__proto__", "prototype", "constructor"],
                fj = function(e) {
                    return fS(fw(e.entries()).filter(function(e) {
                        var t = fg(e, 2),
                            r = t[0],
                            n = t[1];
                        return !fA.includes(r) && !fA.includes(n)
                    }))
                },
                fI = function() {
                    var e, t;

                    function r(e) {
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        fb(this, "searchParams", void 0), this.searchParams = e
                    }
                    return e = [{
                        key: "size",
                        get: function() {
                            return this.searchParams.size
                        }
                    }, {
                        key: "get",
                        value: function(e) {
                            return this.searchParams.get(e)
                        }
                    }, {
                        key: "getAll",
                        value: function(e) {
                            return this.searchParams.getAll(e)
                        }
                    }, {
                        key: "has",
                        value: function(e, t) {
                            return this.searchParams.has(e, void 0 === t ? void 0 : fE(t))
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(e, t) {
                            var n = fS(this.searchParams);
                            return n.append(e, fE(t)), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(e) {
                            var t = fv(e, URLSearchParams) || fv(e, r) || fP(e) ? e : Object.entries(e);
                            return r.new(fw(this.searchParams).concat(fw(t)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(e, t) {
                            var n = fS(this.searchParams);
                            return n.set(e, fE(t)), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(e, t) {
                            var n = void 0 === t ? void 0 : fE(t);
                            if (this.searchParams.has(e, n)) {
                                var o = fS(this.searchParams);
                                return o.delete(e, n), r.fromUnique(o)
                            }
                            return this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var e = fS(this.searchParams);
                            return e.sort(), r.fromUnique(e)
                        }
                    }, {
                        key: "toMutable",
                        value: function() {
                            return new URLSearchParams(this.searchParams)
                        }
                    }, {
                        key: "toString",
                        value: function() {
                            return this.searchParams.toString()
                        }
                    }, {
                        key: Symbol.iterator,
                        value: function() {
                            return this.searchParams[Symbol.iterator]()
                        }
                    }, {
                        key: "entries",
                        value: function() {
                            return this.searchParams.entries()
                        }
                    }, {
                        key: "keys",
                        value: function() {
                            return this.searchParams.keys()
                        }
                    }, {
                        key: "values",
                        value: function() {
                            return this.searchParams.values()
                        }
                    }], t = [{
                        key: "fromUnique",
                        value: function(e) {
                            return new r(e)
                        }
                    }, {
                        key: "internalFromUniqueURLSearchParams",
                        value: function(e) {
                            return r.fromUnique(e)
                        }
                    }, {
                        key: "new",
                        value: function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                            if (fv(e, r)) return e;
                            var n = fS((fP(e) ? e : Object.entries(e)).map(function(e) {
                                var t = fg(e, 2);
                                return [t[0], fE(t[1])]
                            }));
                            return r.fromUnique(t ? fj(n) : n)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return r.fromUnique(t ? fj(e) : fS(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                n = fS(e);
                            return r.fromUnique(t ? fj(n) : n)
                        }
                    }], e && fm(r.prototype, e), t && fm(r, t), r
                }();

            function fx(e, t, r) {
                return (fx = fN() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && fC(o, r.prototype), o
                }).apply(null, arguments)
            }

            function fT(e) {
                return (fT = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function fC(e, t) {
                return (fC = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function fk(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (fk = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return fx(e, arguments, fT(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), fC(r, e)
                })(e)
            }

            function fN() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (fN = function() {
                    return !!e
                })()
            }
            fb(fI, "empty", fI.fromUnique(fS(""))), fk(Error), fk(Error);
            var fD = function(e) {
                return rN(new URL(e))
            };

            function fR(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function f_(e) {
                return (f_ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function fL(e, t) {
                return (fL = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function fU() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (fU = function() {
                    return !!e
                })()
            }
            var fB = function(e) {
                    var t, r;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e, t) {
                        var r, o;
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        return r = n, o = [e, t], r = f_(r),
                            function(e, t) {
                                var r;
                                if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return e
                            }(this, fU() ? Reflect.construct(r, o || [], f_(this).constructor) : r.apply(this, o))
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: n,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && fL(n, e), t = [{
                        key: "with",
                        value: function(e) {
                            var t = e.scheme,
                                r = e.host,
                                o = e.port,
                                a = e.path,
                                i = e.searchParams,
                                l = e.fragment;
                            if (null == t && null == r && null == o && null == a && null == i && null == l) return this;
                            var u = fD(this.url);
                            if (null != t && (u.protocol = t), null != r && (u.hostname = r), null != o && (u.port = "number" == typeof o ? o.toString() : o), null != a && (u.pathname = a), null != l && (u.hash = l), null != i) {
                                var c = fI.new(i);
                                return u.search = c.toString(), new n(u, c)
                            }
                            return new n(u, this.searchParams)
                        }
                    }, {
                        key: "withScheme",
                        value: function(e) {
                            var t = fD(this.url);
                            return t.protocol = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withHost",
                        value: function(e) {
                            var t = fD(this.url);
                            return t.hostname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withPort",
                        value: function(e) {
                            var t = fD(this.url);
                            return t.port = "number" == typeof e ? e.toString() : e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(e) {
                            var t = fD(this.url);
                            return t.pathname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(e) {
                            var t = fI.new(e),
                                r = fD(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(e) {
                            var t = this.searchParams.copyAndAppendAll(e),
                                r = fD(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withFragment",
                        value: function(e) {
                            var t = fD(this.url);
                            return t.hash = e, new n(t, this.searchParams)
                        }
                    }], r = [{
                        key: "new",
                        value: function(e) {
                            e.password = "", e.username = "";
                            var t = fI.internalFromUniqueURLSearchParams(rN(e.searchParams));
                            return new n(e, t)
                        }
                    }, {
                        key: "fromURL",
                        value: function(e) {
                            return n.new(fD(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            try {
                                return rr(n.new(rN(new URL(e))))
                            } catch (e) {
                                return rn(e)
                            }
                        }
                    }], t && fR(n.prototype, t), r && fR(n, r), n
                }(fh),
                fM = function(e) {
                    var t, r = new URLSearchParams(document.location.search).get("downloadType");
                    if (null != r) {
                        var n = fc[r];
                        if (null != n) return n
                    }
                    if (!e) return fc.Unknown;
                    var o = eM.getDeviceMeta();
                    return (null == o ? void 0 : o.isIosDevice) ? fc.AppleAppStore : (t = e, /Kindle|Silk|KFAPW|KFARWI|KFASWI|KFFOWI|KFJW|KFMEWI|KFOT|KFSAW|KFSOWI|KFTBW|KFTHW|KFTT|WFFOWI|KFAPWI/i.test(t)) ? fc.AmazonAppStore : (null == o ? void 0 : o.isAndroidDevice) ? fc.GooglePlayStore : eM.isMac() ? fc.MacDirectDownload : eM.isWindows() ? fc.WindowsDirectDownload : fc.Unknown
                },
                fF = function(e) {
                    (0, eR.sendEventWithTarget)(eR.eventTypes.formInteraction, "downloadV2", {
                        field: "".concat(e, "DownloadLink"),
                        aType: "click"
                    })
                },
                fH = function(e) {
                    return Object.values(fc).some(function(t) {
                        return t === e
                    })
                },
                fG = function(e) {
                    if (null != e) {
                        if ("number" == typeof e) return fH(e) && ff[e] ? e : void 0;
                        var t = fc[e];
                        if (null != t && ff[t]) return t;
                        var r = Number(e);
                        if (Number.isInteger(r) && fH(r) && ff[r]) return r
                    }
                },
                fz = function() {
                    var e, t, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = r.downloadTypeOverride,
                        o = r.translate,
                        a = null != (e = fG(n)) ? e : fM(navigator.userAgent),
                        i = ff[a];
                    if (i) {
                        var l = i.isDirectDownload ? i.href : null != (t = null == o ? void 0 : o(i.href)) ? t : i.href,
                            u = fB.parse(l);
                        if (!u.isErr()) return {
                            downloadType: a,
                            link: i,
                            isDirectDownload: i.isDirectDownload,
                            href: u.value,
                            icon: i.icon,
                            legacyIcon: i.legacyIcon
                        }
                    }
                };

            function fV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fW(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function fq(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            fW(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            fW(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function fK(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return fV(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fV(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function f$(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var fZ = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, ne.jsxs)(K().Fragment, {
                        children: [(0, ne.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, ne.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                fY = "\x01LINK_START\x01",
                fX = "\x01LINK_END\x01",
                fJ = new RegExp("".concat(fY, "|").concat(fX)),
                fQ = function() {
                    var e = fK(fi, 5),
                        t = e[0],
                        r = e[1],
                        n = e[2],
                        o = e[3],
                        a = e[4],
                        i = a5(t),
                        l = a5(r),
                        u = a5(n),
                        c = a5(o),
                        s = a5(a);
                    return (0, q.useMemo)(function() {
                        var e;
                        return e = [s, c, u, l, i],
                            function(t, r, n) {
                                var o = r && Object.fromEntries(Object.entries(r).filter(function(e) {
                                        var t, r;
                                        return "string" == typeof e[1] || "number" == typeof e[1] || (t = e[1], null != (r = Date) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r)
                                    })),
                                    a = e.find(function(e) {
                                        return e.has(t)
                                    });
                                return a ? a.dynamic(t, o) : null != n ? n : ""
                            }
                    }, [s, c, u, l, i])
                },
                f0 = Error("client not started"),
                f1 = 0,
                f2 = function(e) {
                    var t = fK((0, q.useState)(function() {
                            return f1 += 1
                        }), 1)[0],
                        r = (0, $.useQuery)({
                            queryKey: ["client-status", t],
                            queryFn: function() {
                                return fq(function() {
                                    return f$(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, rp(function() {
                                                    var e, t;
                                                    return rd(this, function(r) {
                                                        switch (r.label) {
                                                            case 0:
                                                                return [4, X.get(rh(Y().matchmakingApi, "/v1/client-status"), ry, {
                                                                    credentials: "include"
                                                                })];
                                                            case 1:
                                                                return t = r.sent().getOrThrow().status, [2, null != (e = rm.find(function(e) {
                                                                    return e === t
                                                                })) ? e : "Unknown"]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                if ("Unknown" === t.sent()) throw f0;
                                                return e(), [2, !0]
                                        }
                                    })
                                })()
                            },
                            retry: 2,
                            retryDelay: 2500
                        }),
                        n = r.data,
                        o = r.isError;
                    return void 0 === n && !o
                },
                f3 = function(e) {
                    var t = e.download,
                        r = e.launchGame,
                        n = e.unmount,
                        o = fK((0, q.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = fQ(),
                        u = f2(n);
                    if (!a) {
                        var c = l(u ? "Label.RobloxLoadingToPlay" : "Label.RobloxExciteToDownload");
                        return (0, ne.jsx)(uE, {
                            hasCloseAffordance: !0,
                            closeLabel: l("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: n,
                            children: (0, ne.jsxs)(uA, {
                                className: "download-dialog",
                                children: [(0, ne.jsxs)(uj, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, ne.jsx)(fa, {
                                        className: "size-1600"
                                    }), (0, ne.jsx)(uI, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? fZ(c) : c
                                    })]
                                }), (0, ne.jsx)(ux, {
                                    className: "flex",
                                    children: u ? (0, ne.jsx)(nF, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, ne.jsx)(nF, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return fq(function() {
                                                var e;
                                                return f$(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            try {
                                                                (e = fz()) && fF(e.link.name)
                                                            } catch (e) {}
                                                            return i(!0), [4, t()];
                                                        case 1:
                                                            return r.sent(), [2]
                                                    }
                                                })
                                            })()
                                        },
                                        children: l("Title.DownloadPage")
                                    })
                                })]
                            })
                        })
                    }
                    var s = (0, eM.isMac)(),
                        f = s ? (0, eN.getAbsoluteUrl)("/download/client?os=mac") : (0, eN.getAbsoluteUrl)("/download/client?os=win");
                    return (0, ne.jsx)(uE, {
                        hasCloseAffordance: !0,
                        closeLabel: l("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: n,
                        children: (0, ne.jsx)(uA, {
                            className: "install-dialog",
                            children: (0, ne.jsx)(uj, {
                                className: "content-default",
                                children: (0, ne.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, ne.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, ne.jsx)(uI, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: l("Heading.DownloadConfirmation")
                                        }), (0, ne.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(l("Label.FollowInstallSteps"), " ").concat(l("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(f, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, ne.jsx)("div", {}), " ", (0, ne.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, ne.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, ne.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: l("Heading.InstallInstructions")
                                            }), (0, ne.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, ne.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l(s ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ne.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ne.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: l("Response.Dialog.ThirdInstruction")
                                                }), (0, ne.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = l("Response.Dialog.FourthInstruction", {
                                                                startLink: fY,
                                                                endLink: fX
                                                            }),
                                                            t = e.split(fJ);
                                                        if (t.length < 3) return e;
                                                        var n = fK(t, 3),
                                                            o = n[0],
                                                            a = n[1],
                                                            i = n[2];
                                                        return (0, ne.jsxs)(K().Fragment, {
                                                            children: [o, (0, ne.jsx)("button", {
                                                                type: "button",
                                                                className: "download-link-underline",
                                                                onClick: function() {
                                                                    return null == r ? void 0 : r()
                                                                },
                                                                children: a
                                                            }), i]
                                                        })
                                                    }()
                                                })]
                                            })]
                                        }), (0, ne.jsx)("div", {}), " ", (0, ne.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, ne.jsx)("div", {}), " ", (0, ne.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, ne.jsx)(fp, {
                                                translate: l
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                };

            function f6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var f5 = function(e) {
                    var t = e.unmount,
                        r = function(e) {
                            if (Array.isArray(e)) return e
                        }(fl) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(fl) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return f6(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return f6(e, 2)
                            }
                        }(fl) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        n = r[0],
                        o = r[1],
                        a = a5(n),
                        i = a5(o);
                    return (0, ne.jsx)(uE, {
                        hasCloseAffordance: !1,
                        isModal: !0,
                        open: !0,
                        size: "Small",
                        onOpenChange: function(e) {
                            e || t()
                        },
                        children: (0, ne.jsxs)(uA, {
                            children: [(0, ne.jsxs)(uj, {
                                className: "flex flex-col gap-small",
                                children: [(0, ne.jsx)(uI, {
                                    className: "text-heading-small content-emphasis padding-none",
                                    children: a("Heading.ErrorStartingGame")
                                }), (0, ne.jsx)("p", {
                                    className: "text-body-medium content-default",
                                    children: a("Response.Dialog.ErrorLaunching")
                                })]
                            }), (0, ne.jsx)(ux, {
                                className: "flex",
                                children: (0, ne.jsx)(nF, {
                                    className: "grow",
                                    variant: "Emphasis",
                                    size: "Medium",
                                    onClick: t,
                                    children: i.has("Action.OK") ? i("Action.OK") : "OK"
                                })
                            })]
                        })
                    })
                },
                f8 = window.Roblox["core-lib"].index;

            function f4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function f7(e) {
                return function(e) {
                    if (Array.isArray(e)) return f4(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return f4(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return f4(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            f7(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(f7(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "nl-nl", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var f9 = f7(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(f7(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "nl_nl", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                pe = f7(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(f7(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "nl-NL", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));

            function pt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            f7(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "pl", "pt", "th", "tr", "vi"]).concat(f7(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var pr = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                pn = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var o = [],
                                        a = !0,
                                        i = !1;
                                    try {
                                        for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                    } catch (e) {
                                        i = !0, r = e
                                    } finally {
                                        try {
                                            a || null == n.return || n.return()
                                        } finally {
                                            if (i) throw r
                                        }
                                    }
                                    return o
                                }
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return pt(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return pt(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [ad(r), n]
                        ]
                    }))
                },
                po = function(e) {
                    var t = pr(),
                        r = t.Lang,
                        n = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [ad(e), function(e) {
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
                        }({}, pn(null == o ? void 0 : o[e]), pn(null == r ? void 0 : r[e]), pn(null == n ? void 0 : n[e]))]
                    }))
                },
                pa = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        a = e.children,
                        i = n.join(","),
                        l = (0, q.useMemo)(function() {
                            return po(n)
                        }, [i]);
                    return (0, ne.jsx)(an, {
                        locale: null != o ? o : null != (t = null != (r = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, f8.arrayIncludes)(pe, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? r : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                                var r = t.dataset.languageCode;
                                if (r && (0, f8.arrayIncludes)(f9, r)) return r.replace("_", "-")
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: a
                    })
                },
                pi = JSON.parse('{"P":["Feature.GameLaunchGuestMode","Common.VisitGame","CommonUI.Controls","Feature.ExperienceDetails","Feature.DownloadLanding"]}'),
                pl = window.Roblox["core-scripts"].meta.user,
                pu = function() {
                    var e, t, r;
                    return null != (e = null == (r = sY("RBXEventTrackerV2")) || null == (t = r.value.match(/browserid=([^&]*)/i)) ? void 0 : t[1]) && e
                };

            function pc(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var ps = function() {
                var e;
                return (e = function() {
                    var e;
                    return function(e, t) {
                        var r, n, o, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(i, "next", {
                            value: u(0)
                        }), l(i, "throw", {
                            value: u(1)
                        }), l(i, "return", {
                            value: u(2)
                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function u(l) {
                            return function(u) {
                                var c = [l, u];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                        case 0:
                                        case 1:
                                            o = c;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: c[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = c[1], c = [0];
                                            continue;
                                        case 7:
                                            c = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                a.label = c[1];
                                                break
                                            }
                                            if (6 === c[0] && a.label < o[1]) {
                                                a.label = o[1], o = c;
                                                break
                                            }
                                            if (o && a.label < o[2]) {
                                                a.label = o[2], a.ops.push(c);
                                                break
                                            }
                                            o[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    c = t.call(e, a)
                                } catch (e) {
                                    c = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & c[0]) throw c[1];
                                return {
                                    value: c[0] ? c[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(t) {
                        switch (t.label) {
                            case 0:
                                if (null == (0, pl.authenticatedUser)()) return [3, 2];
                                return [4, rb()];
                            case 1:
                                return e = t.sent(), [3, 3];
                            case 2:
                                e = void 0, t.label = 3;
                            case 3:
                                return [2, {
                                    authTicket: e,
                                    btId: pu() || void 0
                                }]
                        }
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            pc(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            pc(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };
            ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
            });
            var pf = "Website.DownloadFunnel",
                pp = "deeplink",
                pd = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                    return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
                }),
                ph = ["/share-links"],
                py = ["ExperienceAffiliate"],
                pm = function(e) {
                    var t;
                    return ph.includes(e.pathname) && py.includes(null != (t = e.searchParams.get("type")) ? t : "")
                },
                pb = function(e) {
                    try {
                        var t = new URL(e).searchParams.get("referralUrl");
                        if (!t) return null;
                        var r = new URL(decodeURIComponent(t));
                        if (pm(r)) return r.href;
                        return null
                    } catch (e) {
                        return null
                    }
                },
                pv = function(e, t, r) {
                    var n;
                    try {
                        null == (n = window.Roblox.EventStream) || n.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: t,
                            group: pp,
                            action: "create-token-attempt",
                            status_code: r,
                            token: null != e ? e : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (e) {}
                };

            function pg(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var pw = "".concat(Y().apiGatewayUrl, "/deferred-deep-link/token-api"),
                pO = function(e) {
                    var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return (t = function() {
                        var t, n, o, a, i, l, u, c, s;
                        return function(e, t) {
                            var r, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: u(0)
                            }), l(i, "throw", {
                                value: u(1)
                            }), l(i, "return", {
                                value: u(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function u(l) {
                                return function(u) {
                                    var c = [l, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                        switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                o = c;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                    a.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && a.label < o[1]) {
                                                    a.label = o[1], o = c;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(c);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, a)
                                    } catch (e) {
                                        c = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(f) {
                            switch (f.label) {
                                case 0:
                                    t = r.authTicket, n = r.btId, o = r.downloadSource, a = r.launchContext, i = {
                                        linkId: e,
                                        group: pp
                                    }, t && (i.authTicket = t), n && (i.btId = n), o && (i.downloadSource = o), a && (i.launchContext = a), l = {
                                        withCredentials: !0,
                                        url: "".concat(pw, "/create-token")
                                    }, f.label = 1;
                                case 1:
                                    return f.trys.push([1, 3, , 4]), [4, er.post(l, i)];
                                case 2:
                                    return pv(s = null != (u = (c = f.sent()).data.token) ? u : null, e, c.status), [2, s];
                                case 3:
                                    return f.sent(), [2, null];
                                case 4:
                                    return [2]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = t.apply(e, r);

                            function i(e) {
                                pg(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                pg(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                pS = aJ("Download"),
                pP = function(e) {
                    pS("GameJoinDeeplinkToken", {
                        outcome: e
                    })
                };

            function pE(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function pA(e) {
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

            function pj(e, t) {
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
            var pI = new TextEncoder,
                px = function(e) {
                    var t;
                    return rN((t = e, rN(btoa(Array.from(pI.encode(t), function(e) {
                        return String.fromCodePoint(e)
                    }).join("")))).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, ""))
                };
            new TextDecoder;
            var pT = ["joinAttemptOrigin", "accessCode", "linkCode", "gameId", "launchData", "eventId", "conversationId"],
                pC = function(e, t, r) {
                    var n = null == (h = fB.parse(e).getOrNull()) ? void 0 : h.searchParams;
                    if (null == n) return null;
                    var o = sn(null != (f = n.get("placeId")) ? f : "");
                    if (null == o || o <= 0) return null;
                    var a = sn(String(null != r ? r : "")),
                        i = {
                            v: 1,
                            joinType: "GameJoin",
                            placeId: o,
                            isPlayTogetherGame: "true" === n.get("isPlayTogetherGame"),
                            referredByPlayerId: null != a && a > 0 ? a : null != (p = sn(null != (d = n.get("referredByPlayerId")) ? d : "0")) ? p : 0
                        },
                        l = n.get("request");
                    l && (i.requestType = l);
                    var u = !0,
                        c = !1,
                        s = void 0;
                    try {
                        for (var f, p, d, h, y, m = pT[Symbol.iterator](); !(u = (y = m.next()).done); u = !0) {
                            var b = y.value,
                                v = n.get(b);
                            v && (i[b] = v)
                        }
                    } catch (e) {
                        c = !0, s = e
                    } finally {
                        try {
                            u || null == m.return || m.return()
                        } finally {
                            if (c) throw s
                        }
                    }
                    return t && (i.launchExp = t), px(rs(i).value)
                };

            function pk(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function pN(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            pk(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            pk(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function pD(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function pR(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function p_(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            pR(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            pR(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function pL(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function pU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function pB(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function pM(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            pB(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            pB(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function pF(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return pU(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return pU(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function pH(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var pG = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, ne.jsxs)(K().Fragment, {
                        children: [(0, ne.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, ne.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                pz = "\x01LINK_START\x01",
                pV = "\x01LINK_END\x01",
                pW = new RegExp("".concat(pz, "|").concat(pV)),
                pq = function(e) {
                    var t = e.download,
                        r = e.launchGame,
                        n = e.unmount,
                        o = pF((0, q.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = (0, s9.useTranslation)().translate,
                        u = (0, $.useQuery)({
                            queryKey: ["client-status"],
                            queryFn: function() {
                                return pM(function() {
                                    return pH(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, p_(function() {
                                                    return pL(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return [4, er.get({
                                                                    url: "".concat(Y().matchmakingApi, "/v1/client-status"),
                                                                    withCredentials: !0
                                                                })];
                                                            case 1:
                                                                return [2, e.sent().data]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                if ("Unknown" === e.sent().status) throw Error();
                                                return n(), [2, !0]
                                        }
                                    })
                                })()
                            },
                            retry: 2,
                            retryDelay: 2500,
                            cacheTime: 0
                        }).isLoading;
                    if (!a) {
                        var c = l(u ? "Label.RobloxLoadingToPlay" : "Label.RobloxExciteToDownload");
                        return (0, ne.jsx)(uE, {
                            hasCloseAffordance: !0,
                            closeLabel: l("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: n,
                            children: (0, ne.jsxs)(uA, {
                                className: "download-dialog",
                                children: [(0, ne.jsxs)(uj, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, ne.jsx)(fa, {
                                        className: "size-1600"
                                    }), (0, ne.jsx)(uI, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? pG(c) : c
                                    })]
                                }), (0, ne.jsx)(ux, {
                                    className: "flex",
                                    children: u ? (0, ne.jsx)(nF, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, ne.jsx)(nF, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return pM(function() {
                                                var e;
                                                return pH(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            try {
                                                                (e = fz()) && fF(e.link.name)
                                                            } catch (e) {}
                                                            return i(!0), [4, t()];
                                                        case 1:
                                                            return r.sent(), [2]
                                                    }
                                                })
                                            })()
                                        },
                                        children: l("Title.DownloadPage")
                                    })
                                })]
                            })
                        })
                    }
                    var s = (0, eM.isMac)(),
                        f = s ? (0, eN.getAbsoluteUrl)("/download/client?os=mac") : (0, eN.getAbsoluteUrl)("/download/client?os=win");
                    return (0, ne.jsx)(uE, {
                        hasCloseAffordance: !0,
                        closeLabel: l("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: n,
                        children: (0, ne.jsx)(uA, {
                            className: "install-dialog",
                            children: (0, ne.jsx)(uj, {
                                className: "content-default",
                                children: (0, ne.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, ne.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, ne.jsx)(uI, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: l("Heading.DownloadConfirmation")
                                        }), (0, ne.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(l("Label.FollowInstallSteps"), " ").concat(l("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(f, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, ne.jsx)("div", {}), " ", (0, ne.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, ne.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, ne.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: l("Heading.InstallInstructions")
                                            }), (0, ne.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, ne.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l(s ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ne.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ne.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: l("Response.Dialog.ThirdInstruction")
                                                }), (0, ne.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = l("Response.Dialog.FourthInstruction", {
                                                                startLink: pz,
                                                                endLink: pV
                                                            }),
                                                            t = e.split(pW);
                                                        if (t.length < 3) return e;
                                                        var n = pF(t, 3),
                                                            o = n[0],
                                                            a = n[1],
                                                            i = n[2];
                                                        return (0, ne.jsxs)(K().Fragment, {
                                                            children: [o, (0, ne.jsx)("button", {
                                                                type: "button",
                                                                className: "download-link-underline",
                                                                onClick: function() {
                                                                    return null == r ? void 0 : r()
                                                                },
                                                                children: a
                                                            }), i]
                                                        })
                                                    }()
                                                })]
                                            })]
                                        }), (0, ne.jsx)("div", {}), " ", (0, ne.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, ne.jsx)("div", {}), " ", (0, ne.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, ne.jsx)(fp, {
                                                translate: l
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                },
                pK = function(e) {
                    var t = e.state,
                        r = e.getPlaceLauncherBaseUrl,
                        n = e.triggerEvent,
                        o = e.logToConsole,
                        a = e.showDialog,
                        i = e.closeDialog,
                        l = e.showLaunchFailureDialog,
                        u = e.openProtocolUrl;
                    return {
                        getConfig: function() {
                            return {
                                placeLauncherUrl: r(),
                                robloxLocale: t.robloxLocale,
                                gameLocale: t.gameLocale,
                                playerChannel: t.playerChannel,
                                studioChannel: t.studioChannel,
                                isDuarAutoOptInEnabled: !!t.isDuarAutoOptInEnabled,
                                isDuarOptOutDisabled: !!t.isDuarOptOutDisabled,
                                isOmitPlayerChannelForWinAndMacEnabled: !!t.isOmitPlayerChannelForWinAndMacEnabled
                            }
                        },
                        getBrowserTrackerId: pu,
                        isAuthenticated: pl.isAuthenticated,
                        getUserId: pl.userId,
                        isWindowsOrMac: function() {
                            return (0, eM.isWindows)() || (0, eM.isMac)()
                        },
                        onEvent: n,
                        installState: {
                            get: function() {
                                return t.isInstalling
                            },
                            set: function(e) {
                                t.isInstalling = e
                            }
                        },
                        onLaunchStarted: a,
                        onLaunchSucceeded: i,
                        onLaunchFailed: function(e) {
                            console.error(e), l()
                        },
                        openProtocolUrl: function(e) {
                            o("launchProtocolUrl: ".concat(JSON.stringify({
                                url: e
                            }))), u(e)
                        }
                    }
                };

            function p$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function pZ(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function pY(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            pZ(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            pZ(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function pX(e) {
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

            function pJ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return p$(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return p$(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function pQ(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: u(0)
                }), l(i, "throw", {
                    value: u(1)
                }), l(i, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function u(l) {
                    return function(u) {
                        var c = [l, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < o[1]) {
                                        a.label = o[1], o = c;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(c);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var p0 = {
                isInstalling: !1,
                robloxLocale: "",
                gameLocale: "",
                protocolUrlSeparator: "+",
                protocolDetectionEnabled: !1,
                isSharedGameLauncherEnabled: !1,
                avatarParamEnabled: !0,
                separateScriptParamsEnabled: !1,
                waitTimeBeforeFailure: 300,
                protocolNameForStudio: "roblox-studio",
                protocolNameForClient: "roblox-client",
                logger: null,
                channel: "",
                studioChannel: "",
                playerChannel: "",
                isDuarAutoOptInEnabled: !1,
                isDuarOptOutDisabled: !1,
                isJoinAttemptIdEnabled: !1,
                isOmitPlayerChannelForWinAndMacEnabled: !1
            };

            function p1(e) {
                return "edit" === e || "plugin" === e || "asset" === e
            }

            function p2() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "react-dialog-container",
                    t = document.getElementById(e);
                return t ? (ij().unmountComponentAtNode(t), t.innerHTML = "") : ((t = document.createElement("div")).id = e, document.body.appendChild(t)), t
            }

            function p3() {
                V().modal.close();
                var e = new W.TranslationResourceProvider,
                    t = e.getTranslationResource("Common.VisitGame"),
                    r = e.getTranslationResource("CommonUI.Controls");
                W.Dialog.open({
                    titleText: t.get("Heading.ErrorStartingGame"),
                    bodyContent: t.get("Response.Dialog.ErrorLaunching"),
                    acceptText: r.get("Action.OK") || "OK",
                    showDecline: !1
                })
            }

            function p6() {
                V().modal.close();
                var e = p2("react-launch-failure-dialog-container");
                (0, s9.renderWithErrorBoundary)((0, ne.jsx)(pa, {
                    namespaces: pi.P,
                    children: (0, ne.jsx)(f5, {
                        unmount: function() {
                            return ij().unmountComponentAtNode(e)
                        }
                    })
                }), e)
            }

            function p5(e) {
                V().modal.close();
                var t = {
                    launchMethod: "Protocol",
                    params: e
                };
                V()(sq).trigger(sq.startClientSucceededEvent, t), p0.isInstalling && (V()(sq).trigger(sq.successfulInstallEvent, t), p0.isInstalling = !1)
            }

            function p8(e) {
                var t = V()("iframe#gamelaunch");
                t.length > 0 && t.remove(), t = V()("<iframe id='gamelaunch' class='hidden'></iframe>").attr("src", e), V()("body").append(t);
                var r = new Event("ProtocolLaunchStartSelenium");
                window.dispatchEvent(r)
            }

            function p4(e) {
                return pY(function() {
                    var t, r, n;
                    return pQ(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (o.trys.push([0, 5, , 6]), t = p1(null == e ? void 0 : e.launchMode), r = p_(function() {
                                        return pL(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, er.post({
                                                        url: "".concat(Y().matchmakingApi, "/v1/client-status"),
                                                        withCredentials: !0
                                                    }, {
                                                        status: "Unknown"
                                                    })];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    })(), !(W.CurrentUser.isAuthenticated && !t)) return [3, 2];
                                return [4, Promise.all([p_(function() {
                                    var e, t, r;
                                    return pL(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return n.trys.push([0, 2, , 3]), [4, er.get({
                                                    url: "".concat(Y().authApi, "/v1/client-assertion/"),
                                                    withCredentials: !0
                                                })];
                                            case 1:
                                                return e = n.sent().data, [3, 3];
                                            case 2:
                                                return n.sent(), [3, 3];
                                            case 3:
                                                return n.trys.push([3, 5, , 6]), [4, er.post({
                                                    url: "".concat(Y().authApi, "/v1/authentication-ticket/"),
                                                    withCredentials: !0
                                                }, null != e ? e : {})];
                                            case 4:
                                                if (null != (t = n.sent().headers) && (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) == "object" && "string" == typeof(r = t["rbx-authentication-ticket"]) && r.length > 0) return [2, r];
                                                return [2, void 0];
                                            case 5:
                                                return n.sent(), [2, void 0];
                                            case 6:
                                                return [2]
                                        }
                                    })
                                })(), r])];
                            case 1:
                                return n = pJ.apply(void 0, [o.sent(), 1])[0], [3, 4];
                            case 2:
                                return [4, r];
                            case 3:
                                o.sent(), o.label = 4;
                            case 4:
                                var a, i, l, u, c, s, f;
                                return a = n, u = p1(null == e ? void 0 : e.launchMode), c = p0.protocolUrlSeparator, s = "".concat(e.protocolName, ":"), (f = []).push(1), f.push("launchmode:".concat(e.launchMode)), a && (e.protocolName !== p0.protocolNameForStudio || 0 !== a.indexOf("Guest:")) && f.push("gameinfo:".concat(encodeURIComponent(a))), f.push("launchtime:".concat(e.launchTime)), u && W.CurrentUser.isAuthenticated && (f.push("distributorType:".concat("Global")), f.push("userId:".concat(W.CurrentUser.userId))), u && f.push("browser:".concat((0, sV.getCurrentBrowser)())), V().each(e.otherParams, function(e, t) {
                                    e === t ? f.push(e) : f.push("".concat(e, ":").concat(encodeURIComponent(t)))
                                }), s += f.join(c), null == (l = sq.gameLaunchLogger) || null == (i = l.logToConsole) || i.call(l, "launchProtocolUrl: ".concat(JSON.stringify({
                                    url: s,
                                    params: e
                                }))), p8(s), p5(e), [3, 6];
                            case 5:
                                return console.error(o.sent()), p3(), [3, 6];
                            case 6:
                                return [2]
                        }
                    })
                })()
            }

            function p7(e) {
                var t = pX({}, e);
                t.launchTime = Date.now(), t.otherParams.browsertrackerid = W.Cookies.getBrowserTrackerId(), t.otherParams.robloxLocale = p0.robloxLocale, t.otherParams.gameLocale = p0.gameLocale, t.protocolName === p0.protocolNameForStudio ? t.otherParams.channel = p0.studioChannel : p0.isOmitPlayerChannelForWinAndMacEnabled && ((0, eM.isWindows)() || (0, eM.isMac)()) || (t.otherParams.channel = p0.playerChannel), p0.isDuarAutoOptInEnabled && t.protocolName === p0.protocolNameForClient && !t.otherParams.LaunchExp && (p0.isDuarOptOutDisabled ? t.otherParams.LaunchExp = "InApp" : t.otherParams.LaunchExp = "PreferInApp"), V()(sq).trigger(sq.startClientAttemptedEvent, {
                    launchMethod: "Protocol",
                    params: t
                });
                var r = p4(t);
                return p0.showDialog(t), r
            }

            function p9(e) {
                return p0.isSharedGameLauncherEnabled ? (0, ne.jsx)(pa, {
                    namespaces: pi.P,
                    children: (0, ne.jsx)($.QueryClientProvider, {
                        client: s9.queryClient,
                        children: (0, ne.jsx)(f3, pX({}, e))
                    })
                }) : (0, ne.jsx)(s9.TranslationProvider, {
                    config: pi.P,
                    children: (0, ne.jsx)($.QueryClientProvider, {
                        client: s9.queryClient,
                        children: (0, ne.jsx)(pq, pX({}, e))
                    })
                })
            }

            function de() {
                var e = " ";
                return W.Endpoints && W.Endpoints.Urls && (e = W.Endpoints.getAbsoluteUrl("/Game/PlaceLauncher.ashx")), "h" !== e[0] && (e = "http://".concat(window.location.host, "/Game/PlaceLauncher.ashx")), e.replace("placelauncher", "PlaceLauncher")
            }

            function dt(e, t) {
                var r = {
                    request: e,
                    browserTrackerId: W.Cookies.getBrowserTrackerId()
                };
                return V().extend(r, t), "".concat(de(), "?").concat(V().param(r))
            }

            function dr(e) {
                return pY(function() {
                    var t, r, n;
                    return pQ(this, function(o) {
                        switch (o.label) {
                            case 0:
                                var a, i;
                                return t = document.getElementById("downloadInstallerIFrame"), r = "/download/client", t.referrerPolicy = "no-referrer", [4, (a = window.location.toString(), (i = function() {
                                    var t, r, n, o, i;
                                    return function(e, t) {
                                        var r, n, o, a = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & o[0]) throw o[1];
                                                    return o[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                            l = Object.defineProperty;
                                        return l(i, "next", {
                                            value: u(0)
                                        }), l(i, "throw", {
                                            value: u(1)
                                        }), l(i, "return", {
                                            value: u(2)
                                        }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                            value: function() {
                                                return this
                                            }
                                        }), i;

                                        function u(l) {
                                            return function(u) {
                                                var c = [l, u];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; i && (i = 0, c[0] && (a = 0)), a;) try {
                                                    if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                                    switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                        case 0:
                                                        case 1:
                                                            o = c;
                                                            break;
                                                        case 4:
                                                            return a.label++, {
                                                                value: c[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            a.label++, n = c[1], c = [0];
                                                            continue;
                                                        case 7:
                                                            c = a.ops.pop(), a.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                                a = 0;
                                                                continue
                                                            }
                                                            if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                                a.label = c[1];
                                                                break
                                                            }
                                                            if (6 === c[0] && a.label < o[1]) {
                                                                a.label = o[1], o = c;
                                                                break
                                                            }
                                                            if (o && a.label < o[2]) {
                                                                a.label = o[2], a.ops.push(c);
                                                                break
                                                            }
                                                            o[2] && a.ops.pop(), a.trys.pop();
                                                            continue
                                                    }
                                                    c = t.call(e, a)
                                                } catch (e) {
                                                    c = [6, e], n = 0
                                                } finally {
                                                    r = o = 0
                                                }
                                                if (5 & c[0]) throw c[1];
                                                return {
                                                    value: c[0] ? c[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(l) {
                                        switch (l.label) {
                                            case 0:
                                                if (t = "", !(r = function(e) {
                                                        var t = pb(e);
                                                        if (t) return t;
                                                        var r = new URL(e);
                                                        return (r.search = "", r.hash = "", pd.some(function(e) {
                                                            return e.test(r.pathname)
                                                        })) ? r.toString() : null
                                                    }(a))) return e && pP("unsupportedPage"), [2, t];
                                                return o = [r], i = [{}], [4, ps()];
                                            case 1:
                                                return [4, pO.apply(void 0, o.concat([pA.apply(void 0, [pj.apply(void 0, [pA.apply(void 0, i.concat([l.sent()])), {
                                                    downloadSource: "installer"
                                                }]), e ? {
                                                    launchContext: e
                                                } : {}])]))];
                                            case 2:
                                                return n = l.sent(), e && pP(n ? "minted" : "tokenFailed"), n && (t = "?".concat("token", "=").concat(n)), [2, t]
                                        }
                                    })
                                }, function() {
                                    var e = this,
                                        t = arguments;
                                    return new Promise(function(r, n) {
                                        var o = i.apply(e, t);

                                        function a(e) {
                                            pE(o, r, n, a, l, "next", e)
                                        }

                                        function l(e) {
                                            pE(o, r, n, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })())];
                            case 1:
                                return n = o.sent(), t.src = "".concat(r).concat(n), [2]
                        }
                    })
                })()
            }

            function dn() {
                p0.isSharedGameLauncherEnabled = !0;
                var e = rk(pK({
                    state: p0,
                    getPlaceLauncherBaseUrl: de,
                    triggerEvent: function(e, t) {
                        return V()(sq).trigger(sq["".concat(e, "Event")], t)
                    },
                    logToConsole: function(e) {
                        var t, r;
                        return null == (r = sq.gameLaunchLogger) || null == (t = r.logToConsole) ? void 0 : t.call(r, e)
                    },
                    showDialog: function(e, t) {
                        return p0.showDialog(e, t)
                    },
                    closeDialog: function() {
                        return V().modal.close()
                    },
                    showLaunchFailureDialog: p6,
                    openProtocolUrl: p8
                }));
                Object.assign(p0, {
                    joinMultiplayerGame: e.joinMultiplayerGame,
                    followPlayerIntoGame: e.followPlayerIntoGame,
                    joinGameInstance: e.joinGameInstance,
                    joinPrivateGame: e.joinPrivateGame,
                    playTogetherGame: e.playTogetherGame,
                    openStudio: e.openStudio,
                    tryAssetInStudio: function(t) {
                        return e.tryAssetInStudio({
                            assetId: t
                        })
                    },
                    openPluginInStudio: function(t) {
                        return e.openPluginInStudio({
                            pluginId: t
                        })
                    },
                    editGameInStudio: function(t, r, n, o, a, i) {
                        return e.editGameInStudio({
                            placeId: t,
                            universeId: r,
                            startTeamTest: o,
                            instanceId: a,
                            annotationId: i
                        })
                    },
                    startDeepLinkFlow: e.startDeepLinkFlow,
                    startGameWithDeepLinkUrl: e.startGameWithDeepLinkUrl
                })
            }

            function da() {
                return pY(function() {
                    return pQ(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return V()(sq).trigger(sq.manualDownloadEvent, {
                                    launchMethod: "Protocol",
                                    params: {}
                                }), [4, dr()];
                            case 1:
                                return e.sent(), [2]
                        }
                    })
                })()
            }

            function di(e) {
                switch (W.EnvironmentUrls.domain) {
                    case "sitetest1.robloxlabs.com":
                        return "".concat(e, "-sitetest1");
                    case "sitetest2.robloxlabs.com":
                        return "".concat(e, "-sitetest2");
                    case "sitetest3.robloxlabs.com":
                        return "".concat(e, "-sitetest3");
                    default:
                        return e
                }
            }
            Object.assign(p0, {
                joinMultiplayerGame: function(e) {
                    var t = p0.protocolNameForClient,
                        r = dt("RequestGame", e),
                        n = !0 === e.isPlayTogetherGame;
                    return p7({
                        protocolName: t,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: r
                        },
                        placeId: e.placeId,
                        isPlayTogetherGame: n,
                        launchData: e.launchData,
                        eventId: e.eventId
                    })
                },
                openStudio: function() {
                    var e = {};
                    return p0.avatarParamEnabled && (e.avatar = "avatar"), p7({
                        protocolName: p0.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: e
                    })
                },
                tryAssetInStudio: function(e) {
                    var t = {
                        assetid: e
                    };
                    return p0.avatarParamEnabled && (t.avatar = "avatar"), p7({
                        protocolName: p0.protocolNameForStudio,
                        launchMode: "asset",
                        otherParams: t
                    })
                },
                openPluginInStudio: function(e) {
                    var t = {
                        pluginid: e
                    };
                    p0.avatarParamEnabled && (t.avatar = "avatar"), p7({
                        protocolName: p0.protocolNameForStudio,
                        launchMode: "plugin",
                        otherParams: t
                    })
                },
                editGameInStudio: function(e, t, r) {
                    var n, o, a, i, l, u, c = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                        s = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : "",
                        f = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : "";
                    p0.separateScriptParamsEnabled ? (u = {
                        task: c ? "StartTeamTest" : "EditPlace",
                        placeId: e,
                        universeId: t
                    }, !c && (s && (u.targetInstanceId = s), f && (u.annotationId = f))) : u = {
                        script: (n = e, o = t, a = r, i = "Edit.ashx", l = " ", W.Endpoints && W.Endpoints.Urls && (l = "".concat(W.Endpoints.getAbsoluteUrl("/Game/".concat(i)), "?")), "h" !== l[0] && (l = "http://".concat(window.location.host) + "/Game/".concat(i, "?")), l + V().param({
                            placeId: n,
                            upload: a ? n : "",
                            universeId: o,
                            testMode: !1
                        }))
                    }, p0.avatarParamEnabled && (u.avatar = "avatar"), p7({
                        protocolName: p0.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: u,
                        placeId: e
                    })
                },
                followPlayerIntoGame: function(e) {
                    return p7({
                        protocolName: p0.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: dt("RequestFollowUser", e)
                        }
                    })
                },
                joinGameInstance: function(e) {
                    var t = p0.protocolNameForClient,
                        r = dt("RequestGameJob", e),
                        n = !0 === e.isPlayTogetherGame;
                    return p7({
                        protocolName: t,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: r
                        },
                        placeId: e.placeId,
                        isPlayTogetherGame: n
                    })
                },
                joinPrivateGame: function(e) {
                    return p7({
                        protocolName: p0.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: dt("RequestPrivateGame", e)
                        },
                        placeId: e.placeId
                    })
                },
                playTogetherGame: function(e) {
                    return p7({
                        protocolName: p0.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: dt("RequestPlayTogetherGame", e)
                        },
                        placeId: e.placeId,
                        conversationId: e.conversationId
                    })
                },
                manualDownload: da,
                attachManualDownloadToLink: function() {
                    return pY(function() {
                        return pQ(this, function(e) {
                            return V()("body #GameLaunchManualInstallLink").click(function() {
                                return pY(function() {
                                    return pQ(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, da()];
                                            case 1:
                                                return e.sent(), [2, !1]
                                        }
                                    })
                                })()
                            }), [2]
                        })
                    })()
                },
                startDownload: dr,
                setLocationHref: p8,
                openDesktopUniversalApp: function() {
                    var e = {};
                    e.protocolName = p0.protocolNameForClient, e.launchTime = Date.now(), e.launchMode = "app", e.otherParams = {}, e.otherParams.browsertrackerid = W.Cookies.getBrowserTrackerId(), e.otherParams.robloxLocale = p0.robloxLocale, e.otherParams.gameLocale = p0.gameLocale, e.otherParams.LaunchExp = "InApp", V()(sq).trigger(sq.startClientAttemptedEvent, {
                        launchMethod: "Protocol",
                        params: e
                    });
                    var t = p4(e);
                    return p0.showDialog(e), t
                },
                startDeepLinkFlow: function(e) {
                    var t = p2();
                    (0, s9.renderWithErrorBoundary)(p9({
                        download: function() {
                            return pY(function() {
                                return pQ(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return V()(sq).trigger(sq.beginInstallEvent, {
                                                launchMethod: "Protocol",
                                                params: {}
                                            }), p0.isInstalling = !0, [4, dr()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        },
                        launchGame: function() {
                            return pY(function() {
                                return pQ(this, function(t) {
                                    return p8(e), [2]
                                })
                            })()
                        },
                        unmount: function() {
                            return ij().unmountComponentAtNode(t)
                        }
                    }), t), p8(e)
                },
                showDialog: function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : function() {
                            return p4(e)
                        },
                        r = p2(),
                        n = function() {
                            return ij().unmountComponentAtNode(r)
                        },
                        o = p1(null == e ? void 0 : e.launchMode);
                    (0, s9.renderWithErrorBoundary)(p9({
                        download: function() {
                            return pY(function() {
                                var t, r, a, i;
                                return pQ(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            if (e.placeId && null != (t = window.localStorage.getItem("ref_info"))) {
                                                window.localStorage.removeItem("ref_info"), r = {};
                                                try {
                                                    r = JSON.parse(atob(t))
                                                } catch (e) {}
                                                e.referredByPlayerId = r[e.placeId]
                                            }
                                            if (V()(sq).trigger(sq.beginInstallEvent, {
                                                    launchMethod: "Protocol",
                                                    params: e
                                                }), p0.isInstalling = !0, !o) return [3, 1];
                                            return document.getElementById("downloadInstallerIFrame").src = "/download/studio", n(), [3, 4];
                                        case 1:
                                            var u, c, s;
                                            return [4, (u = null == e || null == (a = e.otherParams) ? void 0 : a.placelauncherurl, c = null == e || null == (i = e.otherParams) ? void 0 : i.LaunchExp, s = null == e ? void 0 : e.referredByPlayerId, pN(function() {
                                                var e;
                                                return pD(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            if (null == (e = pC(null != u ? u : "", c, s))) return pP("noLaunchContext"), [2, void 0];
                                                            return [4, pN(function() {
                                                                var e;
                                                                return pD(this, function(t) {
                                                                    switch (t.label) {
                                                                        case 0:
                                                                            return t.trys.push([0, 2, , 3]), [4, nz().getAllValuesForLayer(pf)];
                                                                        case 1:
                                                                            return e = t.sent(), nz().logLayerExposure(pf), [2, !0 === e.IsGameJoinDeeplinkEnabled];
                                                                        case 2:
                                                                            return t.sent(), [2, !1];
                                                                        case 3:
                                                                            return [2]
                                                                    }
                                                                })
                                                            })()];
                                                        case 1:
                                                            if (!t.sent()) return pP("ixpOff"), [2, void 0];
                                                            return [2, e]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            return [4, dr(l.sent())];
                                        case 3:
                                            l.sent(), l.label = 4;
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        launchGame: function() {
                            return pY(function() {
                                return pQ(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, t()];
                                        case 1:
                                            return [2, e.sent()]
                                    }
                                })
                            })()
                        },
                        unmount: n
                    }), r)
                },
                showLaunchFailureDialog: p3,
                cleanUpAndLogSuccess: p5,
                startGameWithDeepLinkUrl: function(e, t) {
                    var r = {
                        launchMode: "play",
                        protocolName: p0.protocolNameForClient,
                        placeId: t
                    };
                    p0.showDialog(r), p8(e)
                },
                enableSharedGameLauncher: dn
            }), V()(document).ready(function() {
                sq.setGameLaunchInterface(p0);
                var e = V()("#PlaceLauncherStatusPanel");
                p0.protocolNameForClient = di("roblox-player"), p0.protocolNameForStudio = di("roblox-studio"), p0.protocolDetectionEnabled = !0, p0.separateScriptParamsEnabled = !0, p0.avatarParamEnabled = !0, p0.isJoinAttemptIdEnabled = !0, p0.robloxLocale = e.data("protocol-roblox-locale"), p0.gameLocale = e.data("protocol-game-locale");
                var t = e.data("protocol-channel-name");
                "string" == typeof t && "LIVE" !== t.toUpperCase() && (p0.channel = t);
                var r = e.data("protocol-studio-channel-name");
                "string" == typeof r && "LIVE" !== r.toUpperCase() && (p0.studioChannel = r);
                var n = e.data("protocol-player-channel-name");
                "string" == typeof n && "LIVE" !== n.toUpperCase() && (p0.playerChannel = n), p0.logger || void 0 === window.Roblox.ProtocolHandlerLogger || (p0.logger = window.Roblox.ProtocolHandlerLogger), p0.isDuarAutoOptInEnabled = e.data("is-duar-auto-opt-in-enabled"), p0.isDuarOptOutDisabled = e.data("is-duar-opt-out-disabled"), p0.isOmitPlayerChannelForWinAndMacEnabled = e.data("is-omit-player-channel-for-win-and-mac-enabled"), !0 === e.data("is-www-common-game-launcher-enabled") && dn()
            }), Object.assign(window.Roblox, {
                AuthenticationChecker: sz,
                GameLauncher: sq,
                GameLaunchLogger: s0,
                GamePlayEvents: sJ,
                ProtocolHandlerClientInterface: p0,
                PlayButton: {
                    usePlayabilityStatus: ek,
                    PlayabilityStatuses: eh,
                    launchGame: r3,
                    launchLogin: r6,
                    shouldShowUnplayableButton: r7,
                    DefaultPlayButton: function(e) {
                        var t, r = e.placeId,
                            n = e.rootPlaceId,
                            o = e.universeId,
                            a = e.privateServerLinkCode,
                            i = e.gameInstanceId,
                            l = e.refetchPlayabilityStatus,
                            u = e.playabilityStatus,
                            c = e.demoModeAvailable,
                            s = e.hideButtonText,
                            f = e.eventProperties,
                            p = void 0 === f ? sR : f,
                            d = e.appsFlyerReferralProperties,
                            h = void 0 === d ? sR : d,
                            y = e.disableLoadingState,
                            m = e.buttonClassName,
                            b = e.redirectPurchaseUrl,
                            v = e.showDefaultPurchaseText,
                            g = e.shouldShowVpcPlayButtonUpsells,
                            w = e.playabilityStatusCtaOverrides,
                            O = e.pageContext,
                            S = e.playOnWebEnabled,
                            P = cV(o, r, u === eh.PurchaseRequired || u === eh.FiatPurchaseRequired),
                            E = P.isLoading,
                            A = P.productInfo,
                            j = P.productDetails,
                            I = [{
                                isEnabled: !!c,
                                primaryStatuses: s_,
                                render: function() {
                                    return (0, ne.jsx)(sb, {
                                        universeId: o,
                                        placeId: r,
                                        rootPlaceId: n,
                                        privateServerLinkCode: a,
                                        gameInstanceId: i,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: h
                                    })
                                }
                            }, {
                                isEnabled: !!S,
                                primaryStatuses: sL,
                                render: function() {
                                    return (0, ne.jsx)(sv, {
                                        placeId: r
                                    })
                                }
                            }],
                            x = !1;
                        switch (u) {
                            case void 0:
                                if (!y) {
                                    t = (0, ne.jsx)(it, {
                                        buttonClassName: m
                                    });
                                    break
                                }
                                t = (0, ne.jsx)(sU, {
                                    universeId: o,
                                    placeId: r,
                                    rootPlaceId: n,
                                    privateServerLinkCode: a,
                                    gameInstanceId: i,
                                    status: eh.Playable,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: h,
                                    disableLoadingState: y,
                                    buttonClassName: m,
                                    pageContext: O
                                });
                                break;
                            case eh.GuestProhibited:
                            case eh.Playable:
                                var T = null == w ? void 0 : w[u];
                                if (void 0 !== T) {
                                    t = T;
                                    break
                                }
                                t = (0, ne.jsx)(sU, {
                                    universeId: o,
                                    placeId: r,
                                    rootPlaceId: n,
                                    privateServerLinkCode: a,
                                    gameInstanceId: i,
                                    status: u,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: h,
                                    disableLoadingState: y,
                                    buttonClassName: m,
                                    pageContext: O
                                });
                                break;
                            case eh.ContextualPlayabilityUnverifiedSeventeenPlusUser:
                            case eh.ContextualPlayabilityAgeCheckRequired:
                                et(eE.ActionNeeded), t = (0, ne.jsx)(sI, {
                                    universeId: o,
                                    buttonClassName: m,
                                    playabilityStatus: u,
                                    pageContext: O
                                });
                                break;
                            case eh.PurchaseRequired:
                            case eh.FiatPurchaseRequired:
                                var C = u === eh.FiatPurchaseRequired ? !!(null == j ? void 0 : j.fiatPurchaseData) : !!(null == A ? void 0 : A.isForSale);
                                if (!E && !C) {
                                    et(eE.Unplayable), t = (0, ne.jsx)(sO, {
                                        hideButtonText: s,
                                        buttonClassName: m
                                    });
                                    break
                                }
                                t = (0, ne.jsx)(sy, {
                                    refetchPlayabilityStatus: l,
                                    universeId: o,
                                    placeId: r,
                                    hideButtonText: s,
                                    buttonClassName: m,
                                    redirectPurchaseUrl: b,
                                    playabilityStatus: u,
                                    showDefaultPurchaseText: v,
                                    pageContext: O
                                }), x = E;
                                break;
                            case eh.FiatPurchaseDeviceRestricted:
                            case eh.ContextualPlayabilityRegionalAvailability:
                                et(eE.Unplayable), t = (0, ne.jsx)(sO, {
                                    hideButtonText: s,
                                    buttonClassName: m
                                });
                                break;
                            case eh.ContextualPlayabilityAgeRecommendationParentalControls:
                                if (g) {
                                    et(eE.ActionNeeded), t = (0, ne.jsx)(cF, {
                                        universeId: o,
                                        buttonClassName: m,
                                        placeId: r,
                                        rootPlaceId: n,
                                        privateServerLinkCode: a,
                                        gameInstanceId: i,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: h,
                                        pageContext: O
                                    });
                                    break
                                }
                                et(eE.Unplayable), t = (0, ne.jsx)(sO, {
                                    hideButtonText: s,
                                    buttonClassName: m
                                });
                                break;
                            case eh.ContextualPlayabilityRequireParentApproval:
                                if (g) {
                                    et(eE.ActionNeeded), t = (0, ne.jsx)(ie, {
                                        universeId: o,
                                        buttonClassName: m,
                                        pageContext: O
                                    });
                                    break
                                }
                                et(eE.Unplayable), t = (0, ne.jsx)(sO, {
                                    hideButtonText: s,
                                    buttonClassName: m
                                });
                                break;
                            case eh.UnplayableOtherReason:
                            case eh.GameUnapproved:
                            case eh.IncorrectConfiguration:
                            case eh.UniverseRootPlaceIsPrivate:
                            case eh.InsufficientPermissionFriendsOnly:
                            case eh.InsufficientPermissionGroupOnly:
                            case eh.DeviceRestricted:
                            case eh.UnderReview:
                            case eh.AccountRestricted:
                            case eh.TemporarilyUnavailable:
                            case eh.ComplianceBlocked:
                            case eh.ContextualPlayabilityRegionalCompliance:
                            case eh.ContextualPlayabilityAgeGated:
                            case eh.PlaceHasNoPublishedVersion:
                            case eh.ContextualPlayabilityUnrated:
                            case eh.ContextualPlayabilityAgeGatedByDescriptor:
                            case eh.ContextualPlayabilityExperienceBlockedParentalControls:
                            case eh.ContextualPlayabilityCoreGated:
                            case eh.ContextualPlayabilityPlaytestDisabled:
                            case eh.ContextualPlayabilityTrustedFriendRequired:
                            default:
                                et(eE.Unplayable), t = (0, ne.jsx)(sO, {
                                    hideButtonText: s,
                                    buttonClassName: m
                                })
                        }
                        return (0, ne.jsx)(sw, {
                            primaryButton: t,
                            secondaryButton: sg(I, u),
                            isPrimaryButtonLoading: x
                        })
                    },
                    PlayButton: sU,
                    PurchaseButton: sy,
                    Error: function(e) {
                        var t = e.playabilityStatus,
                            r = e.errorClassName,
                            n = e.containerRef,
                            o = a7()(Object.hasOwn(em, t) ? em[t] : em[eh.UnplayableOtherReason]);
                        return (0, ne.jsx)("span", {
                            "data-testid": "play-error",
                            className: void 0 === r ? "error-message" : r,
                            ref: n,
                            children: o
                        })
                    },
                    ContextualMessage: function(e) {
                        var t = e.playabilityStatus,
                            r = e.shouldShowVpcPlayButtonUpsells,
                            n = e.unplayableDisplayText,
                            o = e.shouldShowNoticeAgreementIfPlayable,
                            a = e.contextualMessageClassName,
                            i = e.analyticsConfig,
                            l = a7(),
                            u = (0, q.useRef)(null),
                            c = sB(l, {
                                playabilityStatus: t,
                                shouldShowVpcPlayButtonUpsells: r,
                                shouldShowNoticeAgreementIfPlayable: o,
                                unplayableDisplayText: n
                            });
                        return (sF(u, {
                            universeId: i.universeId,
                            playabilityStatus: t,
                            pageContext: i.pageContext,
                            attributionId: i.attributionId,
                            contextualMessage: null == c ? void 0 : c.message
                        }), c) ? (0, ne.jsx)("span", {
                            ref: u,
                            "data-testid": c.testId,
                            className: void 0 === a ? "contextual-message" : a,
                            children: c.message
                        }) : null
                    }
                }
            }), V()(document).ready(function() {
                s7();
                var e = (0, W.DeviceMeta)();
                (e.isUWPApp || e.isUniversalApp) && (sG.isJoinAttemptIdEnabled = !0, window.Roblox.AppHybridClientInterface = sG, sq.setGameLaunchInterface(sG)), sq.setGameLaunchLogger(s0)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "GameLaunch");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/gameLaunch-52e22bb13e751ccb.js.map