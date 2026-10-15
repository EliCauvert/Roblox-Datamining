! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "d44d8a1dea533fa2d8418629f42c0608cae32163"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "fcc5cb0c-27ca-4a8e-806d-638bffe92eba", e._sentryDebugIdIdentifier = "sentry-dbid-fcc5cb0c-27ca-4a8e-806d-638bffe92eba")
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
                        var i = 0 | h(o, a),
                            c = l(i),
                            s = c.write(o, a);
                        return s !== i && (c = c.slice(0, s)), c
                    }
                    if (ArrayBuffer.isView(e)) {
                        var f = e;
                        if (T(f, Uint8Array)) {
                            var m = new Uint8Array(f);
                            return d(m.buffer, m.byteOffset, m.byteLength)
                        }
                        return p(f)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)));
                    if (T(e, ArrayBuffer) || e && T(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (T(e, SharedArrayBuffer) || e && T(e.buffer, SharedArrayBuffer))) return d(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var b = e.valueOf && e.valueOf();
                    if (null != b && b !== e) return u.from(b, t, r);
                    var v = function(e) {
                        if (u.isBuffer(e)) {
                            var t = 0 | y(e.length),
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
                    return s(e), l(e < 0 ? 0 : 0 | y(e))
                }

                function p(e) {
                    for (var t = e.length < 0 ? 0 : 0 | y(e.length), r = l(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
                }

                function d(e, t, r) {
                    var n;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), u.prototype), n
                }

                function y(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function h(e, t) {
                    if (u.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || T(e, ArrayBuffer)) return e.byteLength;
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
                            return j(e).length;
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
                    for (var y = "", h = 0; h < d;) y += String.fromCharCode.apply(String, p.slice(h, h += 4096));
                    return y
                }

                function O(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function P(e, t, r, n, o, a) {
                    if (!u.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > o || t < a) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function S(e, t, r, n, o, a) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function x(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || S(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), a.write(e, t, r, n, 23, 4), r + 4
                }

                function A(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || S(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), a.write(e, t, r, n, 52, 8), r + 8
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
                    if (T(e, Uint8Array) && (e = u.from(e, e.offset, e.byteLength)), T(t, Uint8Array) && (t = u.from(t, t.offset, t.byteLength)), !u.isBuffer(e) || !u.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
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
                        if (T(a, Uint8Array)) o + a.length > n.length ? u.from(a).copy(n, o) : Uint8Array.prototype.set.call(n, a, o);
                        else if (u.isBuffer(a)) a.copy(n, o);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        o += a.length
                    }
                    return n
                }, u.byteLength = h, u.prototype._isBuffer = !0, u.prototype.swap16 = function() {
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
                    if (T(e, Uint8Array) && (e = u.from(e, e.offset, e.byteLength)), !u.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : n(e)));
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
                            return o = t, a = r, C(I(e, this.length - o), this, o, a);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return i = t, l = r, C(function(e) {
                                for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                                return t
                            }(e), this, i, l);
                        case "base64":
                            return u = t, c = r, C(j(e), this, u, c);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return s = t, f = r, C(function(e, t) {
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
                        P(this, e, t, r, o, 0)
                    }
                    var a = 1,
                        i = 0;
                    for (this[t] = 255 & e; ++i < r && (a *= 256);) this[t + i] = e / a & 255;
                    return t + r
                }, u.prototype.writeUintBE = u.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        P(this, e, t, r, o, 0)
                    }
                    var a = r - 1,
                        i = 1;
                    for (this[t + a] = 255 & e; --a >= 0 && (i *= 256);) this[t + a] = e / i & 255;
                    return t + r
                }, u.prototype.writeUint8 = u.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, u.prototype.writeUint16LE = u.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, u.prototype.writeUint16BE = u.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, u.prototype.writeUint32LE = u.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, u.prototype.writeUint32BE = u.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, u.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        P(this, e, t, r, o - 1, -o)
                    }
                    var a = 0,
                        i = 1,
                        l = 0;
                    for (this[t] = 255 & e; ++a < r && (i *= 256);) e < 0 && 0 === l && 0 !== this[t + a - 1] && (l = 1), this[t + a] = (e / i | 0) - l & 255;
                    return t + r
                }, u.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        P(this, e, t, r, o - 1, -o)
                    }
                    var a = r - 1,
                        i = 1,
                        l = 0;
                    for (this[t + a] = 255 & e; --a >= 0 && (i *= 256);) e < 0 && 0 === l && 0 !== this[t + a + 1] && (l = 1), this[t + a] = (e / i | 0) - l & 255;
                    return t + r
                }, u.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, u.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, u.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, u.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, u.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || P(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, u.prototype.writeFloatLE = function(e, t, r) {
                    return x(this, e, t, !0, r)
                }, u.prototype.writeFloatBE = function(e, t, r) {
                    return x(this, e, t, !1, r)
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
                var E = /[^+/0-9A-Za-z-_]/g;

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

                function j(e) {
                    return o.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(E, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function C(e, t, r, n) {
                    for (var o = 0; o < n && !(o + r >= t.length) && !(o >= e.length); ++o) t[o + r] = e[o];
                    return o
                }

                function T(e, t) {
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
                        y = n ? 1 : -1,
                        h = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (l = +!!isNaN(t), i = s) : (i = Math.floor(Math.log(t) / Math.LN2), t * (u = Math.pow(2, -i)) < 1 && (i--, u *= 2), i + f >= 1 ? t += p / u : t += p * Math.pow(2, 1 - f), t * u >= 2 && (i++, u /= 2), i + f >= s ? (l = 0, i = s) : i + f >= 1 ? (l = (t * u - 1) * Math.pow(2, o), i += f) : (l = t * Math.pow(2, f - 1) * Math.pow(2, o), i = 0)); o >= 8; e[r + d] = 255 & l, d += y, l /= 256, o -= 8);
                    for (i = i << o | l, c += o; c > 0; e[r + d] = 255 & i, d += y, i /= 256, c -= 8);
                    e[r + d - y] |= 128 * h
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
                    f && o && (f = !1, o.length ? s = o.concat(s) : p = -1, s.length && y())
                }

                function y() {
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

                function h(e, t) {
                    this.fun = e, this.array = t
                }

                function m() {}

                function b() {}
                i.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new h(e, t)), 1 !== s.length || f || c(y)
                }, h.prototype.run = function() {
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
                    P = "browser",
                    S = "browser",
                    x = [],
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
                        arch: P,
                        execPath: S,
                        execArgv: x
                    };
                t.addListener = a.exports.addListener, t.arch = P, t.argv = a.exports.argv, t.binding = g, t.browser = v, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = A, t.dlopen = b, t.emit = a.exports.emit, t.emitWarning = b, t.env = a.exports.env, t.execArgv = x, t.execPath = S, t.exit = b, t.features = w, t.kill = b, t.listeners = a.exports.listeners, t.memoryUsage = b, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = O, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = b, t.uvCounters = b, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = A
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
                            for (var d, y = c[Symbol.iterator](); !(s = (d = y.next()).done); s = !0) {
                                var h = d.value;
                                if ("ignore" !== n && Object.prototype.hasOwnProperty.call(h, "__proto__")) {
                                    if (!0 === l) return null;
                                    if ("error" === n) throw SyntaxError("Object contains forbidden prototype property");
                                    delete h.__proto__
                                }
                                if ("ignore" !== i && Object.prototype.hasOwnProperty.call(h, "constructor") && null !== h.constructor && "object" === o(h.constructor) && Object.prototype.hasOwnProperty.call(h.constructor, "prototype")) {
                                    if (!0 === l) return null;
                                    if ("error" === i) throw SyntaxError("Object contains forbidden prototype property");
                                    delete h.constructor
                                }
                                for (var m in h) {
                                    var b = h[m];
                                    b && (void 0 === b ? "undefined" : o(b)) === "object" && u.push(b)
                                }
                            }
                        } catch (e) {
                            f = !0, p = e
                        } finally {
                            try {
                                s || null == y.return || y.return()
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
            var e, t, n, o, a, i, l, u, c, s, f, p, d, y, h, m, b, v, g, w, O = window.jQuery,
                P = r.n(O),
                S = window.Roblox,
                x = window.React,
                A = r.n(x),
                E = window.TanstackQuery,
                I = window.Roblox["core-scripts"].environmentUrls,
                j = r.n(I),
                C = window.Roblox["core-lib"].http.index,
                T = window.Roblox["core-lib"].url.index,
                k = function() {
                    return T.Url.parse(j().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                U = function(e, t, r) {
                    try {
                        C.postUntyped(e().withSearchParams(function(e) {
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
                D = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    t.forEach(function(e) {
                        U(k, e)
                    })
                },
                R = window.Roblox["core-scripts"].http.http,
                N = window.Roblox["core-scripts"].dataStore,
                L = r.n(N),
                M = window.Roblox["core-scripts"].guac;

            function _(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function B(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            _(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            _(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function F(e, t) {
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
            var G = L().gamesDataStore,
                W = function() {
                    return B(function() {
                        return F(this, function(e) {
                            return [2, (0, M.callBehaviour)("play-button-ui")]
                        })
                    })()
                },
                V = function() {
                    var e = {
                        url: "".concat(j().apiGatewayUrl, "/user-settings-api/v1/user-settings/settings-and-options"),
                        withCredentials: !0
                    };
                    return R.get(e).then(function(e) {
                        return e.data
                    })
                },
                z = function(e) {
                    var t = {
                        url: "".concat(j().apiGatewayUrl, "/experience-guidelines-api/experience-guidelines/get-age-recommendation"),
                        withCredentials: !0
                    };
                    return R.post(t, {
                        universeId: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                q = function(e, t) {
                    var r = {
                        url: "".concat(j().apiGatewayUrl, "/fiat-paid-access-service/v1/purchase"),
                        withCredentials: !0,
                        retryable: !0
                    };
                    return R.post(r, {
                        rootPlaceId: e,
                        expectedBasePriceId: t
                    }).then(function(e) {
                        var t, r;
                        return null != (r = JSON.parse(null != (t = e.data.checkoutUrl) ? t : "").checkoutUrl) ? r : ""
                    })
                },
                H = {
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

            function K(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var $ = (K(y = {}, H.UnplayableOtherReason, "UnplayableError.UnplayableOther"), K(y, H.TemporarilyUnavailable, "UnplayableError.TemporarilyUnavailable"), K(y, H.GameUnapproved, "UnplayableError.GameUnapproved"), K(y, H.IncorrectConfiguration, "UnplayableError.IncorrectConfiguration"), K(y, H.UniverseRootPlaceIsPrivate, "UnplayableError.CreatorHasntMadeAvailable"), K(y, H.InsufficientPermissionFriendsOnly, "UnplayableError.CreatorHasntMadeAvailable"), K(y, H.InsufficientPermissionGroupOnly, "UnplayableError.CreatorHasntMadeAvailable"), K(y, H.DeviceRestricted, "UnplayableError.DeviceRestrictedDefault"), K(y, H.FiatPurchaseDeviceRestricted, "UnplayableError.FiatPurchaseDeviceRestricted"), K(y, H.UnderReview, "UnplayableError.Moderated"), K(y, H.AccountRestricted, "UnplayableError.AccountRestricted"), K(y, H.ComplianceBlocked, "UnplayableError.ComplianceBlocked"), K(y, H.ContextualPlayabilityRegionalAvailability, "UnplayableError.ContextualPlayabilityRegionalAvailability"), K(y, H.ContextualPlayabilityRegionalCompliance, "UnplayableError.ContextualPlayabilityRegionalCompliance"), K(y, H.ContextualPlayabilityAgeRecommendationParentalControls, "UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls"), K(y, H.ContextualPlayabilityAgeGated, "UnplayableError.ContextualPlayabilityAgeGated"), K(y, H.PlaceHasNoPublishedVersion, "UnplayableError.CreatorHasntMadeAvailable"), K(y, H.ContextualPlayabilityUnrated, "UnplayableError.ContextualPlayabilityUnrated"), K(y, H.ContextualPlayabilityAgeGatedByDescriptor, "UnplayableError.ContextualPlayabilityAgeGatedByDescriptor"), K(y, H.ContextualPlayabilityExperienceBlockedParentalControls, "UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls"), K(y, H.ContextualPlayabilityRequireParentApproval, "UnplayableError.ContextualPlayabilityRequireParentApproval"), y),
                J = "PlayButtonMessage.AgreeToNotice",
                Y = "PlayButtonText.Unlock",
                X = "PlayButtonText.Unavailable",
                Q = "PlayButtonText.Buy",
                Z = "PlayButtonText.PlayDemo",
                ee = "PlayButtonText.PlayOnWeb",
                et = function(e, t) {
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
                                    K(e, t, r[t])
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
                er = {
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
                en = {
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
                eo = "gameJoinAgeCheckRequired",
                ea = "gameJoinContentMaturityLock",
                ei = {
                    settingChange: "account_management/SettingsChange",
                    accountManagement: "account_management/AccountManagement"
                };

            function el(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var eu = {
                    playabilityStatus: H.TemporarilyUnavailable,
                    isPlayable: void 0,
                    unplayableDisplayText: void 0,
                    playableUxTreatment: void 0,
                    upsellUxTreatment: void 0,
                    demoModeAvailable: void 0,
                    privatePlaytestInfo: void 0
                },
                ec = function(e) {
                    var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                        r = (0, E.useQuery)({
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
                                                if (!e) throw D(er.PlayabilityStatusFetchInvalidUniverseId), Error("Invalid universe ID for playability status fetch");
                                                n.label = 1;
                                            case 1:
                                                var o;
                                                return n.trys.push([1, 3, , 4]), [4, (o = [e], B(function() {
                                                    var e;
                                                    return F(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, G.getPlayabilityStatus(o)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())];
                                            case 2:
                                                return r = n.sent(), [3, 4];
                                            case 3:
                                                throw n.sent(), D(er.PlayabilityStatusFetchFailed), Error("Playability status fetch failed");
                                            case 4:
                                                if (!(null == r ? void 0 : r.playabilityStatus) || void 0 === r.isPlayable) throw D(er.PlayabilityStatusFetchInvalidResponse), Error("Invalid playability status response");
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
                                            el(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            el(a, n, o, i, l, "throw", e)
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
                        l = (0, x.useCallback)(function() {
                            i()
                        }, [i]);
                    return (0, x.useEffect)(function() {
                        var e = function(e) {
                            e.persisted && t && l()
                        };
                        return window.addEventListener("pageshow", e),
                            function() {
                                window.removeEventListener("pageshow", e)
                            }
                    }, [l, t]), (0, x.useMemo)(function() {
                        return a ? {
                            playabilityStatus: eu.playabilityStatus,
                            isPlayable: eu.isPlayable,
                            unplayableDisplayText: eu.unplayableDisplayText,
                            playableUxTreatment: eu.playableUxTreatment,
                            upsellUxTreatment: eu.upsellUxTreatment,
                            demoModeAvailable: eu.demoModeAvailable,
                            privatePlaytestInfo: eu.privatePlaytestInfo,
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
                es = window.Roblox["core-scripts"].endpoints,
                ef = window.Roblox["core-scripts"].game,
                ep = window.Roblox["core-scripts"].eventStream,
                ed = window.Roblox["core-scripts"].util.url,
                ey = "function" == typeof crypto.randomUUID,
                eh = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                em = window.Roblox["core-scripts"].meta.device;

            function eb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ev(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function eg(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ev(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ev(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ew(e) {
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

            function eO(e, t) {
                if (e) {
                    if ("string" == typeof e) return eb(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eb(e, t)
                }
            }

            function eP(e, t) {
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
            var eS = {
                    pid: "experiencestart_mobileweb",
                    is_retargeting: "false"
                },
                ex = function() {
                    var e, t, r;
                    return null != (e = null == (r = window.Roblox) || null == (t = r.GameLauncher) ? void 0 : t.isJoinAttemptIdEnabled()) && e
                };

            function eA(e) {
                if (!ex()) return {};
                var t = e.joinAttemptOrigin,
                    r = e.joinAttemptId;
                return {
                    joinAttemptId: r = "string" == typeof r ? r : ey ? crypto.randomUUID() : eh(),
                    joinAttemptOrigin: t
                }
            }

            function eE(e, t, r, n) {
                var o = ew({
                    placeId: t
                }, e, eA(e), r, null == n ? {} : {
                    actionType: n
                });
                return (0, ep.sendEventWithTarget)("playGameClicked", "click", o), o
            }

            function eI(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = "".concat(j().websiteUrl, "/games/start?placeid=").concat(e);
                if (ex()) {
                    var n = eA(t),
                        o = n.joinAttemptId,
                        a = n.joinAttemptOrigin;
                    "string" == typeof o && o.length > 0 && (r += "&joinAttemptId=".concat(o), "string" == typeof a && a.length > 0 && (r += "&joinAttemptOrigin=".concat(a)))
                }
                var i = t.launchData,
                    l = t.eventId;
                return "string" == typeof i && i.length > 0 && (r += "&launchData=".concat(i)), "string" == typeof l && l.length > 0 && (r += "&eventId=".concat(l)), encodeURIComponent(r)
            }
            var ej = function(e, t, r, n) {
                    var o = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : {},
                        a = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {},
                        i = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : {},
                        l = arguments.length > 7 ? arguments[7] : void 0,
                        u = (0, em.getDeviceMeta)();
                    if ((null == u ? void 0 : u.isIosDevice) || (null == u ? void 0 : u.isAndroidDevice) || (0, em.isIos13Ipad)() || (null == u ? void 0 : u.isChromeOs)) {
                        var c = eE(o, e, a, l),
                            s = eI(e, c),
                            f = (0, ed.composeQueryString)(ew({}, eS, i));
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
                        }()[e]), (0, ef.launchGame)((0, ef.buildPlayGameProperties)(t, e, n, void 0, r, p, a), et(e, o), l), window.localStorage.getItem("ref_info") && window.localStorage.removeItem("ref_info")
                    }
                },
                eC = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = (0, em.getDeviceMeta)();
                    if ((null == r ? void 0 : r.isIosDevice) || (null == r ? void 0 : r.isAndroidDevice) || (0, em.isIos13Ipad)() || (null == r ? void 0 : r.isChromeOs)) {
                        var n = eE({}, e, {}),
                            o = eI(e, n),
                            a = (0, ed.composeQueryString)(ew({}, eS, t));
                        window.open("https://ro.blox.com/Ebh5?".concat(a, "&af_dp=").concat(o, "&af_web_dp=").concat(o, "&deep_link_value=").concat(o), "_self")
                    } else(0, ef.launchGame)((0, ef.buildPlayGameProperties)(void 0, e), et(e, {}))
                },
                eT = function(e) {
                    var t = e.context,
                        r = e.pageContext;
                    return eg(function() {
                        var e, n, o, a;
                        return eP(this, function(i) {
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
                                    }, [4, null == (n = window.Roblox.AccessManagementUpsellV2Service) ? void 0 : n.startAccessManagementUpsell(o)];
                                case 1:
                                    return [2, null != (e = i.sent()) && e];
                                case 2:
                                    throw a = i.sent(), D(er.PlayButtonUpsellAgeRestrictionVerificationError), a;
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                ek = function(e, t) {
                    try {
                        var r, n, o = null == (n = (r = new URLSearchParams(window.location.search), function(e) {
                            if (Array.isArray(e)) return eb(e)
                        }(r) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || eO(r) || function() {
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
                            }(e) || eO(e, 1) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0];
                            return "sharelinksourcetype" === t.toLowerCase()
                        })) ? void 0 : n[1];
                        if ((null == o ? void 0 : o.toLowerCase()) !== "experiencedetails") return;
                        (0, ep.sendEventWithTarget)("shareLinkGameJoin", "GamePlayButtonWeb", {
                            placeId: e,
                            universeId: t
                        }, ep.targetTypes.WWW)
                    } catch (e) {}
                },
                eU = function(e, t) {
                    return void 0 !== e && e !== H.Playable && e !== H.GuestProhibited && e !== H.PurchaseRequired && e !== H.ContextualPlayabilityUnverifiedSeventeenPlusUser && e !== H.FiatPurchaseRequired && e !== H.ContextualPlayabilityAgeCheckRequired && (e !== H.ContextualPlayabilityAgeRecommendationParentalControls && e !== H.ContextualPlayabilityRequireParentApproval || !t) && !0
                },
                eD = function(e, t, r, n) {
                    (0, ep.sendEvent)({
                        name: en.eventName,
                        type: en.eventName,
                        context: ep.eventTypes.formInteraction
                    }, {
                        universeId: e,
                        upsellName: t,
                        playabilityStatus: r,
                        pg: n
                    })
                },
                eR = window.ReactJSX,
                eN = r(611),
                eL = r.n(eN),
                eM = function(e) {
                    return e
                },
                e_ = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                eB = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? eM(e.toString()) : null
                },
                eF = function(e) {
                    var t = e_(e);
                    return null == t ? null : eB(t)
                },
                eG = "blackbird",
                eW = function(e) {
                    var t, r, n, o, a = null != (t = e.userid) ? t : e.user,
                        i = null == a ? void 0 : null != (r = eF(a)) ? r : void 0;
                    if ("string" == typeof i) return {
                        isAuthenticated: !0,
                        id: i,
                        userName: null != (n = e.name) ? n : e.userName,
                        displayName: null != (o = e.displayname) ? o : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === eG || e.userMembership === eG ? eG : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                eV = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return eW(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                },
                ez = function() {
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
                eq = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                eH = function(e) {
                    var t = e.className;
                    return A().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: ez("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                eK = function(e) {
                    var t = e.width,
                        r = e.height;
                    return A().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, A().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function e$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eJ(e) {
                if (Array.isArray(e)) return e
            }

            function eY() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function eX(e, t) {
                if (e) {
                    if ("string" == typeof e) return e$(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e$(e, t)
                }
            }
            var eQ = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                eZ = A().forwardRef(function(e, t) {
                    var r, n = eJ(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || eX(r) || eY(),
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
                        s = (eJ(a) || function(e) {
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
                        }(a) || eX(a, 1) || eY())[0];
                    return A().createElement("span", function(e) {
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
                        className: ez("grow-0 shrink-0 basis-auto icon", i, eQ[void 0 === l ? "Medium" : l], u)
                    }, c))
                });

            function e0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e1(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function e2() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = e1(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : e1(t[e], null)
                        }
                    }
                }
            }

            function e3() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return x.useCallback(e2.apply(void 0, function(e) {
                    if (Array.isArray(e)) return e0(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return e0(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e0(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function e6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
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

            function e4(e, t) {
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

            function e7(e) {
                return function(e) {
                    if (Array.isArray(e)) return e6(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return e6(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e6(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e9(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            eZ.displayName = "Icon";
            var te = Symbol.for("react.lazy"),
                tt = x[" use ".trim().toString()];

            function tr(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : e9(e)) === "object" && "$$typeof" in e && e.$$typeof === te && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : e9(t)) === "object" && null !== t && "then" in t
            }
            var tn = ((e = x.forwardRef(function(e, t) {
                    var r = e.children,
                        n = e4(e, ["children"]);
                    if (tr(r) && "function" == typeof tt && (r = tt(r._payload)), x.isValidElement(r)) {
                        var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = e5({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, e7(t));
                                        return o.apply(void 0, e7(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = e5({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return e5({}, e, r)
                            }(n, r.props);
                        return r.type !== x.Fragment && (s.ref = t ? e2(t, c) : c), x.cloneElement(r, s)
                    }
                    return x.Children.count(r) > 1 ? x.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), n = e, (o = x.forwardRef(function(e, t) {
                    var r = e.children,
                        o = e4(e, ["children"]);
                    tr(r) && "function" == typeof tt && (r = tt(r._payload));
                    var a = x.Children.toArray(r),
                        i = a.find(ta);
                    if (i) {
                        var l = i.props.children,
                            u = a.map(function(e) {
                                return e !== i ? e : x.Children.count(l) > 1 ? x.Children.only(null) : x.isValidElement(l) ? l.props.children : null
                            });
                        return (0, eR.jsx)(n, e8(e5({}, o), {
                            ref: t,
                            children: x.isValidElement(l) ? x.cloneElement(l, void 0, u) : null
                        }))
                    }
                    return (0, eR.jsx)(n, e8(e5({}, o), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), o),
                to = Symbol("radix.slottable");

            function ta(e) {
                return x.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === to
            }

            function ti(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tl(e) {
                if (Array.isArray(e)) return e
            }

            function tu() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tc(e) {
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

            function ts(e, t) {
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

            function tf(e, t) {
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

            function tp(e, t) {
                if (e) {
                    if ("string" == typeof e) return ti(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ti(e, t)
                }
            }
            var td = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                ty = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                th = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tm = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                tb = (0, x.forwardRef)(function(e, t) {
                    var r, n = tl(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tp(r) || tu(),
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
                        y = o.size,
                        h = void 0 === y ? "Large" : y,
                        m = o.variant,
                        b = void 0 === m ? "Emphasis" : m,
                        v = o.asChild,
                        g = tf(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (tl(a) || function(e) {
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
                        }(a) || tp(a, 1) || tu())[0],
                        O = ez("foundation-web-button", s ? "opacity-[0.5]" : [eq, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", ty[h], s ? tm[b] : th[b], l),
                        P = tc({
                            textDecoration: "none"
                        }, u),
                        S = function(e) {
                            return A().createElement(A().Fragment, null, A().createElement(eH, null), p && A().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, A().createElement(eK, {
                                width: td[h],
                                height: td[h]
                            })), A().createElement("span", {
                                className: ez("flex items-center min-width-0", "Large" === h || "Medium" === h ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && A().createElement(eZ, {
                                name: d,
                                size: h
                            }), A().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var x = tf(g, ["as"]),
                            E = A().Children.only(i);
                        return A().createElement(tn, ts(tc({
                            ref: w
                        }, x), {
                            className: O,
                            style: P,
                            "aria-disabled": s || void 0
                        }), A().cloneElement(E, {}, S(E.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var I = g.href,
                            j = tf(g, ["as", "href"]);
                        return A().createElement("a", ts(tc({
                            ref: w
                        }, j), {
                            "aria-disabled": s,
                            href: s ? void 0 : I,
                            className: O,
                            style: P
                        }), S(i))
                    }
                    g.as;
                    var C = tf(g, ["as"]);
                    return A().createElement("button", ts(tc({
                        ref: w,
                        type: "button"
                    }, C), {
                        disabled: s,
                        className: O,
                        style: P
                    }), S(i))
                }),
                tv = window.Roblox["core-scripts"].react,
                tg = window.Roblox.NavigationService,
                tw = window.Roblox.ExperimentationService,
                tO = r.n(tw),
                tP = "full",
                tS = function(e) {
                    return e === tP && "btn-full-width"
                },
                tx = {
                    display: "flex"
                },
                tA = window.ReactUtilities,
                tE = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding", "Feature.Build", "Feature.Friends"],
                tI = (0, tA.withTranslations)(function(e) {
                    var t = e.onButtonClick,
                        r = e.buttonWidth,
                        n = e.buttonClassName,
                        o = e.translate;
                    return (0, eR.jsxs)(A().Fragment, {
                        children: [(0, eR.jsx)(tb, {
                            "data-testid": "play-action-needed-button",
                            variant: "Emphasis",
                            style: tx,
                            className: eL()(tS(void 0 === r ? tP : r), void 0 === n ? "btn-common-play-game-action-needed-lg" : n),
                            onClick: t,
                            children: o(Y)
                        }), (0, eR.jsx)("div", {
                            id: "access-management-upsell-container-v1"
                        })]
                    })
                }, tE),
                tj = function(e) {
                    var t = e.universeId,
                        r = e.buttonClassName,
                        n = e.pageContext,
                        o = (0, x.useCallback)(function(e) {
                            (e.preventDefault(), e.stopPropagation(), D(er.PlayButtonUpsellExperienceApprovalTriggered), eD(t, en.experienceApprovalUpsellName, H.ContextualPlayabilityRequireParentApproval, n), window.Roblox.AccessManagementUpsellV2Service) ? window.Roblox.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                featureName: "CanApproveExperience",
                                namespace: ei.accountManagement,
                                isAsyncCall: !1,
                                usePrologue: !0,
                                ampRecourseData: {
                                    universeId: t,
                                    experienceManagementAction: "Approve"
                                }
                            }).catch(function() {
                                D(er.PlayButtonUpsellExperienceApprovalError)
                            }): D(er.PlayButtonUpsellExperienceApprovalError)
                        }, [t, n]);
                    return (0, eR.jsx)(tI, {
                        onButtonClick: o,
                        buttonClassName: r
                    })
                };
            tj.defaultProps = {
                buttonClassName: void 0
            };
            var tC = function(e) {
                    var t = e.buttonClassName,
                        r = e.buttonWidth;
                    return (0, eR.jsx)(tb, {
                        "data-testid": "play-button-loading",
                        variant: "Emphasis",
                        isLoading: !0,
                        "aria-label": "Loading",
                        style: tx,
                        className: eL()(tS(void 0 === r ? tP : r), void 0 === t ? "btn-common-play-game-lg" : t)
                    })
                },
                tT = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                tk = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                tU = function(e) {
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
                    return A().createElement("button", function(e) {
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
                        className: ez("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", eq, tk[t], tT[r], n && "radius-circle", o)
                    }, a), A().createElement(eH, null), A().createElement(eZ, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function tD(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function tR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tN(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tL(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tN(e, t, r[t])
                    })
                }
                return e
            }

            function tM(e, t) {
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

            function t_(e) {
                return function(e) {
                    if (Array.isArray(e)) return tR(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tR(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tR(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tB() {
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
                            return tL({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return x.useMemo(function() {
                            return tN({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var tF = (null == (h = globalThis) ? void 0 : h.document) ? x.useLayoutEffect : function() {};

            function tG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tW = x[" useId ".trim().toString()] || function() {},
                tV = 0;

            function tz(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = x.useState(tW())) || function(e) {
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
                            if ("string" == typeof e) return tG(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tG(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return tF(function() {
                    e || o(function(e) {
                        return null != e ? e : String(tV++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function tq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tH(e) {
                var t = x.useRef(e);
                return x.useEffect(function() {
                    t.current = e
                }), x.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return tq(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return tq(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tq(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function tK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t$(e, t) {
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
                        if ("string" == typeof e) return tK(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tJ = window.RadixUI["react-dismissable-layer"],
                tY = window.RadixUI["react-focus-scope"],
                tX = window.ReactDOM,
                tQ = r.n(tX);

            function tZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t0(e) {
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

            function t2(e, t) {
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

            function t3(e) {
                return function(e) {
                    if (Array.isArray(e)) return tZ(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tZ(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tZ(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t6(e) {
                var t, r, n = (t = e, (r = x.forwardRef(function(e, t) {
                        var r = e.children,
                            n = t2(e, ["children"]);
                        if (x.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = t0({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            a.apply(void 0, t3(t)), o.apply(void 0, t3(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = t0({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return t0({}, e, r)
                                }(n, r.props);
                            return r.type !== x.Fragment && (s.ref = t ? e2(t, c) : c), x.cloneElement(r, s)
                        }
                        return x.Children.count(r) > 1 ? x.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = x.forwardRef(function(e, t) {
                        var r = e.children,
                            o = t2(e, ["children"]),
                            a = x.Children.toArray(r),
                            i = a.find(t8);
                        if (i) {
                            var l = i.props.children,
                                u = a.map(function(e) {
                                    return e !== i ? e : x.Children.count(l) > 1 ? x.Children.only(null) : x.isValidElement(l) ? l.props.children : null
                                });
                            return (0, eR.jsx)(n, t1(t0({}, o), {
                                ref: t,
                                children: x.isValidElement(l) ? x.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, eR.jsx)(n, t1(t0({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var t5 = Symbol("radix.slottable");

            function t8(e) {
                return x.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === t5
            }

            function t4(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function t7(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        t4(e, t, r[t])
                    })
                }
                return e
            }

            function t9(e, t) {
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
            var re = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = t6("Primitive.".concat(t)),
                    n = x.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eR.jsx)(i, t9(t7({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), t9(t7({}, e), t4({}, t, n))
            }, {});

            function rt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rr = x.forwardRef(function(e, t) {
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
                    }(r = x.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return rt(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rt(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    f = c[1];
                tF(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return p ? tQ().createPortal((0, eR.jsx)(re.div, (n = function(e) {
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

            function rn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ro(e, t) {
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
                        if ("string" == typeof e) return rn(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rn(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            rr.displayName = "Portal";
            var ra = function(e) {
                var t, r, n, o, a, i, l, u, c, s, f, p, d, y, h, m, b, v = e.present,
                    g = e.children,
                    w = (t = v, a = (o = ro(x.useState(), 2))[0], i = o[1], l = x.useRef({}), u = x.useRef(t), c = x.useRef("none"), f = (s = ro((r = t ? "mounted" : "unmounted", n = {
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
                    }, x.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], x.useEffect(function() {
                        var e = ri(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), tF(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                o = ri(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = t
                        }
                    }, [t, p]), tF(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = ri(l.current).includes(e.animationName);
                                    if (e.target === a && n && (p("ANIMATION_END"), !u.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (c.current = ri(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: x.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : x.Children.only(g),
                    P = e3(w.ref, (b = (m = null == (y = Object.getOwnPropertyDescriptor((d = O).props, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? d.ref : (b = (m = null == (h = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || w.isPresent ? x.cloneElement(O, {
                    ref: P
                }) : null
            };

            function ri(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            ra.displayName = "Presence";
            var rl = window.RadixUI["react-focus-guards"],
                ru = function() {
                    return (ru = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function rc(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var rs = "right-scroll-bar-position",
                rf = "width-before-scroll-bar";

            function rp(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var rd = "u" > typeof window ? x.useLayoutEffect : x.useEffect,
                ry = new WeakMap,
                rh = (void 0 === a && (a = {}), (void 0 === i && (i = function(e) {
                    return e
                }), l = [], u = !1, c = {
                    read: function() {
                        if (u) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return l.length ? l[l.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = i(e, u);
                        return l.push(t),
                            function() {
                                l = l.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (u = !0; l.length;) {
                            var t = l;
                            l = [], t.forEach(e)
                        }
                        l = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return l
                            }
                        }
                    },
                    assignMedium: function(e) {
                        u = !0;
                        var t = [];
                        if (l.length) {
                            var r = l;
                            l = [], r.forEach(e), t = l
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), l = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), l
                            }
                        }
                    }
                }).options = ru({
                    async: !0,
                    ssr: !1
                }, a), c),
                rm = function() {},
                rb = x.forwardRef(function(e, t) {
                    var r, n, o, a, i = x.useRef(null),
                        l = x.useState({
                            onScrollCapture: rm,
                            onWheelCapture: rm,
                            onTouchMoveCapture: rm
                        }),
                        u = l[0],
                        c = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        p = e.className,
                        d = e.removeScrollBar,
                        y = e.enabled,
                        h = e.shards,
                        m = e.sideCar,
                        b = e.noRelative,
                        v = e.noIsolation,
                        g = e.inert,
                        w = e.allowPinchZoom,
                        O = e.as,
                        P = e.gapMode,
                        S = rc(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        A = (r = [i, t], n = function(e) {
                            return r.forEach(function(t) {
                                return rp(t, e)
                            })
                        }, (o = (0, x.useState)(function() {
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
                        })[0]).callback = n, a = o.facade, rd(function() {
                            var e = ry.get(a);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = a.current;
                                t.forEach(function(e) {
                                    n.has(e) || rp(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || rp(e, o)
                                })
                            }
                            ry.set(a, r)
                        }, [r]), a),
                        E = ru(ru({}, S), u);
                    return x.createElement(x.Fragment, null, y && x.createElement(m, {
                        sideCar: rh,
                        removeScrollBar: d,
                        shards: h,
                        noRelative: b,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: c,
                        allowPinchZoom: !!w,
                        lockRef: i,
                        gapMode: P
                    }), s ? x.cloneElement(x.Children.only(f), ru(ru({}, E), {
                        ref: A
                    })) : x.createElement(void 0 === O ? "div" : O, ru({}, E, {
                        className: p,
                        ref: A
                    }), f))
                });
            rb.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, rb.classNames = {
                fullWidth: rf,
                zeroRight: rs
            };
            var rv = function(e) {
                var t = e.sideCar,
                    r = rc(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return x.createElement(n, ru({}, r))
            };
            rv.isSideCarExport = !0;
            var rg = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = m || r.nc;
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
                rw = function() {
                    var e = rg();
                    return function(t, r) {
                        x.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                rO = function() {
                    var e = rw();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                rP = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                rS = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                rx = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [rS(r), rS(n), rS(o)]
                },
                rA = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return rP;
                    var t = rx(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                rE = rO(),
                rI = "data-scroll-locked",
                rj = function(e, t, r, n) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(rI, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(rs, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(rf, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(rs, " .").concat(rs, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(rf, " .").concat(rf, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(rI, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                rC = function() {
                    var e = parseInt(document.body.getAttribute(rI) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                rT = function() {
                    x.useEffect(function() {
                        return document.body.setAttribute(rI, (rC() + 1).toString()),
                            function() {
                                var e = rC() - 1;
                                e <= 0 ? document.body.removeAttribute(rI) : document.body.setAttribute(rI, e.toString())
                            }
                    }, [])
                },
                rk = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    rT();
                    var a = x.useMemo(function() {
                        return rA(o)
                    }, [o]);
                    return x.createElement(rE, {
                        styles: rj(a, !t, o, r ? "" : "!important")
                    })
                },
                rU = !1;
            if ("u" > typeof window) try {
                var rD = Object.defineProperty({}, "passive", {
                    get: function() {
                        return rU = !0, !0
                    }
                });
                window.addEventListener("test", rD, rD), window.removeEventListener("test", rD, rD)
            } catch (e) {
                rU = !1
            }
            var rR = !!rU && {
                passive: !1
            };

            function rN(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var rL = function(e, t) {
                    if (!rN(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                rM = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && rN(n, ShadowRoot) && (n = n.host), r_(e, n)) {
                            var o = rB(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                r_ = function(e, t) {
                    return "v" === e ? rL(t, "overflowY") : rL(t, "overflowX")
                },
                rB = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                rF = function(e, t, r, n, o) {
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
                        var y = rB(e, u),
                            h = y[0],
                            m = y[1] - y[2] - i * h;
                        (h || m) && r_(e, u) && (p += m, d += h);
                        var b = u.parentNode;
                        u = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
                },
                rG = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                rW = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                rV = function(e) {
                    return e && "current" in e ? e.current : e
                },
                rz = 0,
                rq = [],
                rH = (s = function(e) {
                    var t = x.useRef([]),
                        r = x.useRef([0, 0]),
                        n = x.useRef(),
                        o = x.useState(rz++)[0],
                        a = x.useState(rO)[0],
                        i = x.useRef(e);
                    x.useEffect(function() {
                        i.current = e
                    }, [e]), x.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(rV), !0).filter(Boolean);
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
                    var l = x.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                            var o, a = rG(e),
                                l = r.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                s = e.target,
                                f = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = rM(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = rM(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (u || c) && (n.current = o), !o) return !0;
                            var d = n.current || o;
                            return rF(d, t, e, "h" === d ? u : c, !0)
                        }, []),
                        u = x.useCallback(function(e) {
                            if (rq.length && rq[rq.length - 1] === a) {
                                var r = "deltaY" in e ? rW(e) : rG(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (i.current.shards || []).map(rV).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = x.useCallback(function(e, r, n, o) {
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
                        s = x.useCallback(function(e) {
                            r.current = rG(e), n.current = void 0
                        }, []),
                        f = x.useCallback(function(t) {
                            c(t.type, rW(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = x.useCallback(function(t) {
                            c(t.type, rG(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    x.useEffect(function() {
                        return rq.push(a), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", u, rR), document.addEventListener("touchmove", u, rR), document.addEventListener("touchstart", s, rR),
                            function() {
                                rq = rq.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", u, rR), document.removeEventListener("touchmove", u, rR), document.removeEventListener("touchstart", s, rR)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        y = e.inert;
                    return x.createElement(x.Fragment, null, y ? x.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, d ? x.createElement(rk, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, rh.useMedium(s), rv),
                rK = x.forwardRef(function(e, t) {
                    return x.createElement(rb, ru({}, e, {
                        ref: t,
                        sideCar: rH
                    }))
                });
            rK.classNames = rb.classNames;
            var r$ = new WeakMap,
                rJ = new WeakMap,
                rY = {},
                rX = 0,
                rQ = function(e) {
                    return e && (e.host || rQ(e.parentNode))
                },
                rZ = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = rQ(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    rY[r] || (rY[r] = new WeakMap);
                    var a = rY[r],
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
                                    u = (r$.get(e) || 0) + 1,
                                    c = (a.get(e) || 0) + 1;
                                r$.set(e, u), a.set(e, c), i.push(e), 1 === u && o && rJ.set(e, !0), 1 === c && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), rX++,
                        function() {
                            i.forEach(function(e) {
                                var t = r$.get(e) - 1,
                                    o = a.get(e) - 1;
                                r$.set(e, t), a.set(e, o), t || (rJ.has(e) || e.removeAttribute(n), rJ.delete(e)), o || e.removeAttribute(r)
                            }), --rX || (r$ = new WeakMap, r$ = new WeakMap, rJ = new WeakMap, rY = {})
                        }
                },
                r0 = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), rZ(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function r1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
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

            function r3(e, t) {
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

            function r6(e, t) {
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

            function r5(e, t) {
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
                        if ("string" == typeof e) return r1(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r1(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r8 = "Dialog",
                r4 = r5(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return x.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return x.useMemo(function() {
                                    var t, o;
                                    return tN({}, "__scope".concat(e), (t = tL({}, r), o = null != (o = tN({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                        var o = x.createContext(n),
                            a = r.length;
                        r = t_(r).concat([n]);
                        var i = function(t) {
                            var r, n = t.scope,
                                i = t.children,
                                l = tM(t, ["scope", "children"]),
                                u = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                                c = x.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, eR.jsx)(u.Provider, {
                                value: c,
                                children: i
                            })
                        };
                        return i.displayName = t + "Provider", [i, function(r, i) {
                            var l, u = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                                c = x.useContext(u);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, tB.apply(void 0, [n].concat(t_(t)))]
                }(r8), 2),
                r7 = r4[0];
            r4[1];
            var r9 = r5(r7(r8), 2),
                ne = r9[0],
                nt = r9[1],
                nr = function(e) {
                    var t, r, n, o, a, i, l, u, c, s, f, p, d, y, h, m, b, v = e.__scopeDialog,
                        g = e.children,
                        w = e.open,
                        O = e.defaultOpen,
                        P = e.onOpenChange,
                        S = e.modal,
                        A = x.useRef(null),
                        E = x.useRef(null),
                        I = r5((c = (u = {
                            prop: w,
                            defaultProp: O,
                            onChange: P
                        }).prop, d = (p = t$((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: f = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, a = t$(o = x.useState(r), 1)[0], i = x.useRef(a), l = tH(n), x.useEffect(function() {
                            i.current !== a && (l(a), i.current = a)
                        }, [a, i, l]), o), 2))[0], y = p[1], m = (h = void 0 !== c) ? c : d, b = tH(f), [m, x.useCallback(function(e) {
                            if (h) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && b(t)
                            } else y(e)
                        }, [h, c, y, b])]), 2),
                        j = I[0],
                        C = I[1];
                    return (0, eR.jsx)(ne, {
                        scope: v,
                        triggerRef: A,
                        contentRef: E,
                        contentId: tz(),
                        titleId: tz(),
                        descriptionId: tz(),
                        open: void 0 !== j && j,
                        onOpenChange: C,
                        onOpenToggle: x.useCallback(function() {
                            return C(function(e) {
                                return !e
                            })
                        }, [C]),
                        modal: void 0 === S || S,
                        children: g
                    })
                };
            nr.displayName = r8;
            var nn = "DialogTrigger";
            x.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = r6(e, ["__scopeDialog"]),
                    o = nt(nn, r),
                    a = e3(t, o.triggerRef);
                return (0, eR.jsx)(re.button, r3(r2({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": nS(o.open)
                }, n), {
                    ref: a,
                    onClick: tD(e.onClick, o.onOpenToggle)
                }))
            }).displayName = nn;
            var no = "DialogPortal",
                na = r5(r7(no, {
                    forceMount: void 0
                }), 2),
                ni = na[0],
                nl = na[1],
                nu = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = nt(no, t);
                    return (0, eR.jsx)(ni, {
                        scope: t,
                        forceMount: r,
                        children: x.Children.map(n, function(e) {
                            return (0, eR.jsx)(ra, {
                                present: r || a.open,
                                children: (0, eR.jsx)(rr, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            nu.displayName = no;
            var nc = "DialogOverlay",
                ns = x.forwardRef(function(e, t) {
                    var r = nl(nc, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = r6(e, ["forceMount"]),
                        i = nt(nc, e.__scopeDialog);
                    return i.modal ? (0, eR.jsx)(ra, {
                        present: o || i.open,
                        children: (0, eR.jsx)(np, r3(r2({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            ns.displayName = nc;
            var nf = t6("DialogOverlay.RemoveScroll"),
                np = x.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = r6(e, ["__scopeDialog"]),
                        o = nt(nc, r);
                    return (0, eR.jsx)(rK, {
                        as: nf,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, eR.jsx)(re.div, r3(r2({
                            "data-state": nS(o.open)
                        }, n), {
                            ref: t,
                            style: r2({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                nd = "DialogContent",
                ny = x.forwardRef(function(e, t) {
                    var r = nl(nd, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = r6(e, ["forceMount"]),
                        i = nt(nd, e.__scopeDialog);
                    return (0, eR.jsx)(ra, {
                        present: o || i.open,
                        children: i.modal ? (0, eR.jsx)(nh, r3(r2({}, a), {
                            ref: t
                        })) : (0, eR.jsx)(nm, r3(r2({}, a), {
                            ref: t
                        }))
                    })
                });
            ny.displayName = nd;
            var nh = x.forwardRef(function(e, t) {
                    var r = nt(nd, e.__scopeDialog),
                        n = x.useRef(null),
                        o = e3(t, r.contentRef, n);
                    return x.useEffect(function() {
                        var e = n.current;
                        if (e) return r0(e)
                    }, []), (0, eR.jsx)(nb, r3(r2({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: tD(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: tD(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: tD(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                nm = x.forwardRef(function(e, t) {
                    var r = nt(nd, e.__scopeDialog),
                        n = x.useRef(!1),
                        o = x.useRef(!1);
                    return (0, eR.jsx)(nb, r3(r2({}, e), {
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
                nb = x.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = r6(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = nt(nd, r),
                        u = x.useRef(null),
                        c = e3(t, u);
                    return (0, rl.useFocusGuards)(), (0, eR.jsxs)(eR.Fragment, {
                        children: [(0, eR.jsx)(tY.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: a,
                            children: (0, eR.jsx)(tJ.DismissableLayer, r3(r2({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": nS(l.open)
                            }, i), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, eR.jsxs)(eR.Fragment, {
                            children: [(0, eR.jsx)(nI, {
                                titleId: l.titleId
                            }), (0, eR.jsx)(nj, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                nv = "DialogTitle",
                ng = x.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = r6(e, ["__scopeDialog"]),
                        o = nt(nv, r);
                    return (0, eR.jsx)(re.h2, r3(r2({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            ng.displayName = nv;
            var nw = "DialogDescription";
            x.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = r6(e, ["__scopeDialog"]),
                    o = nt(nw, r);
                return (0, eR.jsx)(re.p, r3(r2({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = nw;
            var nO = "DialogClose",
                nP = x.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = r6(e, ["__scopeDialog"]),
                        o = nt(nO, r);
                    return (0, eR.jsx)(re.button, r3(r2({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: tD(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function nS(e) {
                return e ? "open" : "closed"
            }
            nP.displayName = nO;
            var nx = "DialogTitleWarning",
                nA = r5((f = {
                    contentName: nd,
                    titleName: nv,
                    docsSlug: "dialog"
                }, p = x.createContext(f), (d = function(e) {
                    var t = e.children,
                        r = tM(e, ["children"]),
                        n = x.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, eR.jsx)(p.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = nx + "Provider", [d, function(e) {
                    var t = x.useContext(p);
                    if (t) return t;
                    if (void 0 !== f) return f;
                    throw Error("`".concat(e, "` must be used within `").concat(nx, "`"))
                }]), 2),
                nE = (nA[0], nA[1]),
                nI = function(e) {
                    var t = e.titleId,
                        r = nE(nx),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return x.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                nj = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = nE("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return x.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function nC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nT(e) {
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

            function nk(e, t) {
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

            function nU(e, t) {
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

            function nD(e) {
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
            var nR = Symbol("radix.slottable");

            function nN(e) {
                return x.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nR
            }

            function nL(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nM(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nL(e, t, r[t])
                    })
                }
                return e
            }

            function n_(e, t) {
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
            var nB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, o, a, i, l = (r = o = "Primitive.".concat(t), (n = x.forwardRef(function(e, t) {
                        var r = e.children,
                            n = nU(e, ["children"]);
                        if (x.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = nT({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, nD(t));
                                            return o.apply(void 0, nD(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = nT({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return nT({}, e, r)
                                }(n, r.props);
                            return r.type !== x.Fragment && (s.ref = t ? e2(t, c) : c), x.cloneElement(r, s)
                        }
                        return x.Children.count(r) > 1 ? x.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), a = n, (i = x.forwardRef(function(e, t) {
                        var r = e.children,
                            n = nU(e, ["children"]),
                            o = x.Children.toArray(r),
                            i = o.find(nN);
                        if (i) {
                            var l = i.props.children,
                                u = o.map(function(e) {
                                    return e !== i ? e : x.Children.count(l) > 1 ? x.Children.only(null) : x.isValidElement(l) ? l.props.children : null
                                });
                            return (0, eR.jsx)(a, nk(nT({}, n), {
                                ref: t,
                                children: x.isValidElement(l) ? x.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, eR.jsx)(a, nk(nT({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(o, ".Slot"), i),
                    u = x.forwardRef(function(e, r) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eR.jsx)(a, n_(nM({}, o), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), n_(nM({}, e), nL({}, t, u))
            }, {});

            function nF(e) {
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
            var nG = Object.freeze({
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
                nW = x.forwardRef(function(e, t) {
                    var r, n;
                    return (0, eR.jsx)(nB.span, (r = nF({}, e), n = n = {
                        ref: t,
                        style: nF({}, nG, e.style)
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

            function nV(e) {
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

            function nz(e, t) {
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
            nW.displayName = "VisuallyHidden";
            var nq = (0, x.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                nH = function() {
                    var e = (0, x.useContext)(nq);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                nK = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                n$ = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                nJ = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                nY = function(e) {
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
                        y = e.hasDescription,
                        h = void 0 !== y && y,
                        m = e.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== m && m,
                        v = (0, x.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: i,
                                hasCloseAffordance: u,
                                closeLabel: c,
                                hasMarginTop: f,
                                hasMarginBottom: d,
                                hasDescription: h
                            }
                        }, [o, l, i, u, c, f, d, h]);
                    return (0, x.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), A().createElement(nq.Provider, {
                        value: v
                    }, A().createElement(nr, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            nY.displayName = "Dialog";
            var nX = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    a = e.overlayStyle,
                    i = e.onOpenAutoFocus,
                    l = nz(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = nH(),
                    c = u.size,
                    s = u.isModal,
                    f = u.hasCloseAffordance,
                    p = u.closeLabel,
                    d = u.hasDescription,
                    y = ez("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    h = ez("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return A().createElement(nu, null, A().createElement(ns, {
                    className: y,
                    style: a
                }, A().createElement(ny, nV({
                    className: h,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: i
                }, !d && {
                    "aria-describedby": void 0
                }, l), f && A().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, A().createElement(nP, {
                    asChild: !0
                }, A().createElement(tU, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            nX.displayName = "DialogContent";
            var nQ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nz(e, ["children", "className"]),
                    o = nH(),
                    a = o.size,
                    i = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    u = ez(nK[a], i && n$[a], l && nJ[a], r);
                return A().createElement("div", nV({
                    className: u
                }, n), t)
            };
            nQ.displayName = "DialogBody";
            var nZ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = nz(e, ["children", "className", "hidden"]),
                    a = A().createElement(ng, nV({
                        className: r
                    }, o), t);
                return n ? A().createElement(nW, null, a) : a
            };
            nZ.displayName = "DialogTitle";
            var n0 = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nz(e, ["children", "className"]),
                    o = nH().size,
                    a = ez(nK[o], nJ[o], r);
                return A().createElement("div", nV({
                    className: a
                }, n), t)
            };

            function n1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n2(e, t, r) {
                return (n2 = n7() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && n6(o, r.prototype), o
                }).apply(null, arguments)
            }

            function n3(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function n6(e, t) {
                return (n6 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function n5(e) {
                return function(e) {
                    if (Array.isArray(e)) return n1(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || n4(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n8(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function n4(e, t) {
                if (e) {
                    if ("string" == typeof e) return n1(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n1(e, t)
                }
            }

            function n7() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (n7 = function() {
                    return !!e
                })()
            }
            n0.displayName = "DialogFooter"; /*! @license DOMPurify 3.3.1 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.3.1/LICENSE */
            var n9 = Object.entries,
                oe = Object.setPrototypeOf,
                ot = Object.isFrozen,
                or = Object.getPrototypeOf,
                on = Object.getOwnPropertyDescriptor,
                oo = Object.freeze,
                oa = Object.seal,
                oi = Object.create,
                ol = "u" > typeof Reflect && Reflect,
                ou = ol.apply,
                oc = ol.construct;
            oo || (oo = function(e) {
                return e
            }), oa || (oa = function(e) {
                return e
            }), ou || (ou = function(e, t) {
                for (var r = arguments.length, n = Array(r > 2 ? r - 2 : 0), o = 2; o < r; o++) n[o - 2] = arguments[o];
                return e.apply(t, n)
            }), oc || (oc = function(e) {
                for (var t = arguments.length, r = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) r[n - 1] = arguments[n];
                return n2(e, n5(r))
            });
            var os = ox(Array.prototype.forEach),
                of = ox(Array.prototype.lastIndexOf),
                op = ox(Array.prototype.pop),
                od = ox(Array.prototype.push),
                oy = ox(Array.prototype.splice),
                oh = ox(String.prototype.toLowerCase),
                om = ox(String.prototype.toString),
                ob = ox(String.prototype.match),
                ov = ox(String.prototype.replace),
                og = ox(String.prototype.indexOf),
                ow = ox(String.prototype.trim),
                oO = ox(Object.prototype.hasOwnProperty),
                oP = ox(RegExp.prototype.test),
                oS = (t = TypeError, function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    return oc(t, r)
                });

            function ox(e) {
                return function(t) {
                    n3(t, RegExp) && (t.lastIndex = 0);
                    for (var r = arguments.length, n = Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
                    return ou(e, t, n)
                }
            }

            function oA(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : oh;
                oe && oe(e, null);
                for (var n = t.length; n--;) {
                    var o = t[n];
                    if ("string" == typeof o) {
                        var a = r(o);
                        a !== o && (ot(t) || (t[n] = a), o = a)
                    }
                    e[o] = !0
                }
                return e
            }

            function oE(e) {
                var t = oi(null),
                    r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var a, i = n9(e)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
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
                            }(l) || n4(l, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            c = u[0],
                            s = u[1];
                        oO(e, c) && (Array.isArray(s) ? t[c] = function(e) {
                            for (var t = 0; t < e.length; t++) oO(e, t) || (e[t] = null);
                            return e
                        }(s) : s && (void 0 === s ? "undefined" : n8(s)) === "object" && s.constructor === Object ? t[c] = oE(s) : t[c] = s)
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

            function oI(e, t) {
                for (; null !== e;) {
                    var r = on(e, t);
                    if (r) {
                        if (r.get) return ox(r.get);
                        if ("function" == typeof r.value) return ox(r.value)
                    }
                    e = or(e)
                }
                return function() {
                    return null
                }
            }
            var oj = oo(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
                oC = oo(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
                oT = oo(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
                ok = oo(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
                oU = oo(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
                oD = oo(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
                oR = oo(["#text"]),
                oN = oo(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns", "slot"]),
                oL = oo(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
                oM = oo(["accent", "accentunder", "align", "bevelled", "close", "columnsalign", "columnlines", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lspace", "lquote", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
                o_ = oo(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
                oB = oa(/\{\{[\w\W]*|[\w\W]*\}\}/gm),
                oF = oa(/<%[\w\W]*|[\w\W]*%>/gm),
                oG = oa(/\$\{[\w\W]*/gm),
                oW = oa(/^data-[\-\w.\u00B7-\uFFFF]+$/),
                oV = oa(/^aria-[\-\w]+$/),
                oz = oa(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
                oq = oa(/^(?:\w+script|data):/i),
                oH = oa(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
                oK = oa(/^html$/i),
                o$ = Object.freeze({
                    __proto__: null,
                    ARIA_ATTR: oV,
                    ATTR_WHITESPACE: oH,
                    CUSTOM_ELEMENT: oa(/^[a-z][.\w]*(-[.\w]+)+$/i),
                    DATA_ATTR: oW,
                    DOCTYPE_NAME: oK,
                    ERB_EXPR: oF,
                    IS_ALLOWED_URI: oz,
                    IS_SCRIPT_OR_DATA: oq,
                    MUSTACHE_EXPR: oB,
                    TMPLIT_EXPR: oG
                }),
                oJ = function(e, t) {
                    if ((void 0 === e ? "undefined" : n8(e)) !== "object" || "function" != typeof e.createPolicy) return null;
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
                oY = function() {
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
                oX = function e() {
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
                        y = r.HTMLFormElement,
                        h = r.DOMParser,
                        m = r.trustedTypes,
                        b = s.prototype,
                        v = oI(b, "cloneNode"),
                        g = oI(b, "remove"),
                        w = oI(b, "nextSibling"),
                        O = oI(b, "childNodes"),
                        P = oI(b, "parentNode");
                    if ("function" == typeof u) {
                        var S = o.createElement("template");
                        S.content && S.content.ownerDocument && (o = S.content.ownerDocument)
                    }
                    var x = "",
                        A = o.implementation,
                        E = o.createNodeIterator,
                        I = o.createDocumentFragment,
                        j = o.getElementsByTagName,
                        C = a.importNode,
                        T = oY();
                    n.isSupported = "function" == typeof n9 && "function" == typeof P && A && void 0 !== A.createHTMLDocument;
                    var k = o$.MUSTACHE_EXPR,
                        U = o$.ERB_EXPR,
                        D = o$.TMPLIT_EXPR,
                        R = o$.DATA_ATTR,
                        N = o$.ARIA_ATTR,
                        L = o$.IS_SCRIPT_OR_DATA,
                        M = o$.ATTR_WHITESPACE,
                        _ = o$.CUSTOM_ELEMENT,
                        B = o$.IS_ALLOWED_URI,
                        F = null,
                        G = oA({}, n5(oj).concat(n5(oC), n5(oT), n5(oU), n5(oR))),
                        W = null,
                        V = oA({}, n5(oN).concat(n5(oL), n5(oM), n5(o_))),
                        z = Object.seal(oi(null, {
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
                        q = null,
                        H = null,
                        K = Object.seal(oi(null, {
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
                        J = !0,
                        Y = !1,
                        X = !0,
                        Q = !1,
                        Z = !0,
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
                        ep = oA({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "style", "svg", "template", "thead", "title", "video", "xmp"]),
                        ed = null,
                        ey = oA({}, ["audio", "video", "img", "source", "image", "track"]),
                        eh = null,
                        em = oA({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
                        eb = "http://www.w3.org/1998/Math/MathML",
                        ev = "http://www.w3.org/2000/svg",
                        eg = "http://www.w3.org/1999/xhtml",
                        ew = eg,
                        eO = !1,
                        eP = null,
                        eS = oA({}, [eb, ev, eg], om),
                        ex = oA({}, ["mi", "mo", "mn", "ms", "mtext"]),
                        eA = oA({}, ["annotation-xml"]),
                        eE = oA({}, ["title", "style", "font", "a", "script"]),
                        eI = null,
                        ej = ["application/xhtml+xml", "text/html"],
                        eC = null,
                        eT = null,
                        ek = o.createElement("form"),
                        eU = function(e) {
                            return n3(e, RegExp) || n3(e, Function)
                        },
                        eD = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            if (!eT || eT !== e) {
                                if (e && (void 0 === e ? "undefined" : n8(e)) === "object" || (e = {}), e = oE(e), eC = "application/xhtml+xml" === (eI = -1 === ej.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? om : oh, F = oO(e, "ALLOWED_TAGS") ? oA({}, e.ALLOWED_TAGS, eC) : G, W = oO(e, "ALLOWED_ATTR") ? oA({}, e.ALLOWED_ATTR, eC) : V, eP = oO(e, "ALLOWED_NAMESPACES") ? oA({}, e.ALLOWED_NAMESPACES, om) : eS, eh = oO(e, "ADD_URI_SAFE_ATTR") ? oA(oE(em), e.ADD_URI_SAFE_ATTR, eC) : em, ed = oO(e, "ADD_DATA_URI_TAGS") ? oA(oE(ey), e.ADD_DATA_URI_TAGS, eC) : ey, ef = oO(e, "FORBID_CONTENTS") ? oA({}, e.FORBID_CONTENTS, eC) : ep, q = oO(e, "FORBID_TAGS") ? oA({}, e.FORBID_TAGS, eC) : oE({}), H = oO(e, "FORBID_ATTR") ? oA({}, e.FORBID_ATTR, eC) : oE({}), es = !!oO(e, "USE_PROFILES") && e.USE_PROFILES, $ = !1 !== e.ALLOW_ARIA_ATTR, J = !1 !== e.ALLOW_DATA_ATTR, Y = e.ALLOW_UNKNOWN_PROTOCOLS || !1, X = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, Q = e.SAFE_FOR_TEMPLATES || !1, Z = !1 !== e.SAFE_FOR_XML, ee = e.WHOLE_DOCUMENT || !1, en = e.RETURN_DOM || !1, eo = e.RETURN_DOM_FRAGMENT || !1, ea = e.RETURN_TRUSTED_TYPE || !1, er = e.FORCE_BODY || !1, ei = !1 !== e.SANITIZE_DOM, el = e.SANITIZE_NAMED_PROPS || !1, eu = !1 !== e.KEEP_CONTENT, ec = e.IN_PLACE || !1, B = e.ALLOWED_URI_REGEXP || oz, ew = e.NAMESPACE || eg, ex = e.MATHML_TEXT_INTEGRATION_POINTS || ex, eA = e.HTML_INTEGRATION_POINTS || eA, z = e.CUSTOM_ELEMENT_HANDLING || {}, e.CUSTOM_ELEMENT_HANDLING && eU(e.CUSTOM_ELEMENT_HANDLING.tagNameCheck) && (z.tagNameCheck = e.CUSTOM_ELEMENT_HANDLING.tagNameCheck), e.CUSTOM_ELEMENT_HANDLING && eU(e.CUSTOM_ELEMENT_HANDLING.attributeNameCheck) && (z.attributeNameCheck = e.CUSTOM_ELEMENT_HANDLING.attributeNameCheck), e.CUSTOM_ELEMENT_HANDLING && "boolean" == typeof e.CUSTOM_ELEMENT_HANDLING.allowCustomizedBuiltInElements && (z.allowCustomizedBuiltInElements = e.CUSTOM_ELEMENT_HANDLING.allowCustomizedBuiltInElements), Q && (J = !1), eo && (en = !0), es && (F = oA({}, oR), W = [], !0 === es.html && (oA(F, oj), oA(W, oN)), !0 === es.svg && (oA(F, oC), oA(W, oL), oA(W, o_)), !0 === es.svgFilters && (oA(F, oT), oA(W, oL), oA(W, o_)), !0 === es.mathMl && (oA(F, oU), oA(W, oM), oA(W, o_))), e.ADD_TAGS && ("function" == typeof e.ADD_TAGS ? K.tagCheck = e.ADD_TAGS : (F === G && (F = oE(F)), oA(F, e.ADD_TAGS, eC))), e.ADD_ATTR && ("function" == typeof e.ADD_ATTR ? K.attributeCheck = e.ADD_ATTR : (W === V && (W = oE(W)), oA(W, e.ADD_ATTR, eC))), e.ADD_URI_SAFE_ATTR && oA(eh, e.ADD_URI_SAFE_ATTR, eC), e.FORBID_CONTENTS && (ef === ep && (ef = oE(ef)), oA(ef, e.FORBID_CONTENTS, eC)), e.ADD_FORBID_CONTENTS && (ef === ep && (ef = oE(ef)), oA(ef, e.ADD_FORBID_CONTENTS, eC)), eu && (F["#text"] = !0), ee && oA(F, ["html", "head", "body"]), F.table && (oA(F, ["tbody"]), delete q.tbody), e.TRUSTED_TYPES_POLICY) {
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw oS('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw oS('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                                    x = (t = e.TRUSTED_TYPES_POLICY).createHTML("")
                                } else void 0 === t && (t = oJ(m, i)), null !== t && "string" == typeof x && (x = t.createHTML(""));
                                oo && oo(e), eT = e
                            }
                        },
                        eR = oA({}, n5(oC).concat(n5(oT), n5(ok))),
                        eN = oA({}, n5(oU).concat(n5(oD))),
                        eL = function(e) {
                            var t = P(e);
                            t && t.tagName || (t = {
                                namespaceURI: ew,
                                tagName: "template"
                            });
                            var r = oh(e.tagName),
                                n = oh(t.tagName);
                            return !!eP[e.namespaceURI] && (e.namespaceURI === ev ? t.namespaceURI === eg ? "svg" === r : t.namespaceURI === eb ? "svg" === r && ("annotation-xml" === n || ex[n]) : !!eR[r] : e.namespaceURI === eb ? t.namespaceURI === eg ? "math" === r : t.namespaceURI === ev ? "math" === r && eA[n] : !!eN[r] : e.namespaceURI === eg ? (t.namespaceURI !== ev || !!eA[n]) && (t.namespaceURI !== eb || !!ex[n]) && !eN[r] && (eE[r] || !eR[r]) : "application/xhtml+xml" === eI && !!eP[e.namespaceURI])
                        },
                        eM = function(e) {
                            od(n.removed, {
                                element: e
                            });
                            try {
                                P(e).removeChild(e)
                            } catch (t) {
                                g(e)
                            }
                        },
                        e_ = function(e, t) {
                            try {
                                od(n.removed, {
                                    attribute: t.getAttributeNode(e),
                                    from: t
                                })
                            } catch (e) {
                                od(n.removed, {
                                    attribute: null,
                                    from: t
                                })
                            }
                            if (t.removeAttribute(e), "is" === e)
                                if (en || eo) try {
                                    eM(t)
                                } catch (e) {} else try {
                                    t.setAttribute(e, "")
                                } catch (e) {}
                        },
                        eB = function(e) {
                            var r = null,
                                n = null;
                            if (er) e = "<remove></remove>" + e;
                            else {
                                var a = ob(e, /^[\r\n\t ]+/);
                                n = a && a[0]
                            }
                            "application/xhtml+xml" === eI && ew === eg && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                            var i = t ? t.createHTML(e) : e;
                            if (ew === eg) try {
                                r = new h().parseFromString(i, eI)
                            } catch (e) {}
                            if (!r || !r.documentElement) {
                                r = A.createDocument(ew, "template", null);
                                try {
                                    r.documentElement.innerHTML = eO ? x : i
                                } catch (e) {}
                            }
                            var l = r.body || r.documentElement;
                            return (e && n && l.insertBefore(o.createTextNode(n), l.childNodes[0] || null), ew === eg) ? j.call(r, ee ? "html" : "body")[0] : ee ? r.documentElement : l
                        },
                        eF = function(e) {
                            return E.call(e.ownerDocument || e, e, f.SHOW_ELEMENT | f.SHOW_COMMENT | f.SHOW_TEXT | f.SHOW_PROCESSING_INSTRUCTION | f.SHOW_CDATA_SECTION, null)
                        },
                        eG = function(e) {
                            return n3(e, y) && ("string" != typeof e.nodeName || "string" != typeof e.textContent || "function" != typeof e.removeChild || !n3(e.attributes, d) || "function" != typeof e.removeAttribute || "function" != typeof e.setAttribute || "string" != typeof e.namespaceURI || "function" != typeof e.insertBefore || "function" != typeof e.hasChildNodes)
                        },
                        eW = function(e) {
                            return "function" == typeof c && n3(e, c)
                        };

                    function eV(e, t, r) {
                        os(e, function(e) {
                            e.call(n, t, r, eT)
                        })
                    }
                    var ez = function(e) {
                            var t = null;
                            if (eV(T.beforeSanitizeElements, e, null), eG(e)) return eM(e), !0;
                            var r = eC(e.nodeName);
                            if (eV(T.uponSanitizeElement, e, {
                                    tagName: r,
                                    allowedTags: F
                                }), Z && e.hasChildNodes() && !eW(e.firstElementChild) && oP(/<[/\w!]/g, e.innerHTML) && oP(/<[/\w!]/g, e.textContent) || 7 === e.nodeType || Z && 8 === e.nodeType && oP(/<[/\w]/g, e.data)) return eM(e), !0;
                            if (!(n3(K.tagCheck, Function) && K.tagCheck(r)) && (!F[r] || q[r])) {
                                if (!q[r] && eH(r) && (n3(z.tagNameCheck, RegExp) && oP(z.tagNameCheck, r) || n3(z.tagNameCheck, Function) && z.tagNameCheck(r))) return !1;
                                if (eu && !ef[r]) {
                                    var o = P(e) || e.parentNode,
                                        a = O(e) || e.childNodes;
                                    if (a && o)
                                        for (var i = a.length, l = i - 1; l >= 0; --l) {
                                            var u = v(a[l], !0);
                                            u.__removalCount = (e.__removalCount || 0) + 1, o.insertBefore(u, w(e))
                                        }
                                }
                                return eM(e), !0
                            }
                            return n3(e, s) && !eL(e) || ("noscript" === r || "noembed" === r || "noframes" === r) && oP(/<\/no(script|embed|frames)/i, e.innerHTML) ? (eM(e), !0) : (Q && 3 === e.nodeType && (t = e.textContent, os([k, U, D], function(e) {
                                t = ov(t, e, " ")
                            }), e.textContent !== t && (od(n.removed, {
                                element: e.cloneNode()
                            }), e.textContent = t)), eV(T.afterSanitizeElements, e, null), !1)
                        },
                        eq = function(e, t, r) {
                            if (ei && ("id" === t || "name" === t) && (r in o || r in ek)) return !1;
                            if (J && !H[t] && oP(R, t));
                            else if ($ && oP(N, t));
                            else if (n3(K.attributeCheck, Function) && K.attributeCheck(t, e));
                            else if (!W[t] || H[t]) {
                                if (!(eH(e) && (n3(z.tagNameCheck, RegExp) && oP(z.tagNameCheck, e) || n3(z.tagNameCheck, Function) && z.tagNameCheck(e)) && (n3(z.attributeNameCheck, RegExp) && oP(z.attributeNameCheck, t) || n3(z.attributeNameCheck, Function) && z.attributeNameCheck(t, e)) || "is" === t && z.allowCustomizedBuiltInElements && (n3(z.tagNameCheck, RegExp) && oP(z.tagNameCheck, r) || n3(z.tagNameCheck, Function) && z.tagNameCheck(r)))) return !1
                            } else if (eh[t]);
                            else if (oP(B, ov(r, M, "")));
                            else if (("src" === t || "xlink:href" === t || "href" === t) && "script" !== e && 0 === og(r, "data:") && ed[e]);
                            else if (Y && !oP(L, ov(r, M, "")));
                            else if (r) return !1;
                            return !0
                        },
                        eH = function(e) {
                            return "annotation-xml" !== e && ob(e, _)
                        },
                        eK = function(e) {
                            eV(T.beforeSanitizeAttributes, e, null);
                            var r = e.attributes;
                            if (!(!r || eG(e))) {
                                for (var o = {
                                        attrName: "",
                                        attrValue: "",
                                        keepAttr: !0,
                                        allowedAttributes: W,
                                        forceKeepAttr: void 0
                                    }, a = r.length; a--;) ! function() {
                                    var i = r[a],
                                        l = i.name,
                                        u = i.namespaceURI,
                                        c = i.value,
                                        s = eC(l),
                                        f = "value" === l ? c : ow(c);
                                    if (o.attrName = s, o.attrValue = f, o.keepAttr = !0, o.forceKeepAttr = void 0, eV(T.uponSanitizeAttribute, e, o), f = o.attrValue, el && ("id" === s || "name" === s) && (e_(l, e), f = "user-content-" + f), Z && oP(/((--!?|])>)|<\/(style|title|textarea)/i, f) || "attributename" === s && ob(f, "href")) return e_(l, e);
                                    if (!o.forceKeepAttr) {
                                        if (!o.keepAttr || !X && oP(/\/>/i, f)) return e_(l, e);
                                        Q && os([k, U, D], function(e) {
                                            f = ov(f, e, " ")
                                        });
                                        var p = eC(e.nodeName);
                                        if (!eq(p, s, f)) return e_(l, e);
                                        if (t && (void 0 === m ? "undefined" : n8(m)) === "object" && "function" == typeof m.getAttributeType)
                                            if (u);
                                            else switch (m.getAttributeType(p, s)) {
                                                case "TrustedHTML":
                                                    f = t.createHTML(f);
                                                    break;
                                                case "TrustedScriptURL":
                                                    f = t.createScriptURL(f)
                                            }
                                        if (f !== c) try {
                                            u ? e.setAttributeNS(u, l, f) : e.setAttribute(l, f), eG(e) ? eM(e) : op(n.removed)
                                        } catch (t) {
                                            e_(l, e)
                                        }
                                    }
                                }();
                                eV(T.afterSanitizeAttributes, e, null)
                            }
                        },
                        e$ = function e(t) {
                            var r = null,
                                n = eF(t);
                            for (eV(T.beforeSanitizeShadowDOM, t, null); r = n.nextNode();) eV(T.uponSanitizeShadowNode, r, null), ez(r), eK(r), n3(r.content, l) && e(r.content);
                            eV(T.afterSanitizeShadowDOM, t, null)
                        };
                    return n.sanitize = function(e) {
                        var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            o = null,
                            i = null,
                            u = null,
                            s = null;
                        if ((eO = !e) && (e = "\x3c!--\x3e"), "string" != typeof e && !eW(e))
                            if ("function" == typeof e.toString) {
                                if ("string" != typeof(e = e.toString())) throw oS("dirty is not a string, aborting")
                            } else throw oS("toString is not a function");
                        if (!n.isSupported) return e;
                        if (et || eD(r), n.removed = [], "string" == typeof e && (ec = !1), ec) {
                            if (e.nodeName) {
                                var f = eC(e.nodeName);
                                if (!F[f] || q[f]) throw oS("root node is forbidden and cannot be sanitized in-place")
                            }
                        } else if (n3(e, c)) 1 === (i = (o = eB("\x3c!----\x3e")).ownerDocument.importNode(e, !0)).nodeType && "BODY" === i.nodeName || "HTML" === i.nodeName ? o = i : o.appendChild(i);
                        else {
                            if (!en && !Q && !ee && -1 === e.indexOf("<")) return t && ea ? t.createHTML(e) : e;
                            if (!(o = eB(e))) return en ? null : ea ? x : ""
                        }
                        o && er && eM(o.firstChild);
                        for (var p = eF(ec ? e : o); u = p.nextNode();) ez(u), eK(u), n3(u.content, l) && e$(u.content);
                        if (ec) return e;
                        if (en) {
                            if (eo)
                                for (s = I.call(o.ownerDocument); o.firstChild;) s.appendChild(o.firstChild);
                            else s = o;
                            return (W.shadowroot || W.shadowrootmode) && (s = C.call(a, s, !0)), s
                        }
                        var d = ee ? o.outerHTML : o.innerHTML;
                        return ee && F["!doctype"] && o.ownerDocument && o.ownerDocument.doctype && o.ownerDocument.doctype.name && oP(oK, o.ownerDocument.doctype.name) && (d = "<!DOCTYPE " + o.ownerDocument.doctype.name + ">\n" + d), Q && os([k, U, D], function(e) {
                            d = ov(d, e, " ")
                        }), t && ea ? t.createHTML(d) : d
                    }, n.setConfig = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        eD(e), et = !0
                    }, n.clearConfig = function() {
                        eT = null, et = !1
                    }, n.isValidAttribute = function(e, t, r) {
                        return eT || eD({}), eq(eC(e), eC(t), r)
                    }, n.addHook = function(e, t) {
                        "function" == typeof t && od(T[e], t)
                    }, n.removeHook = function(e, t) {
                        if (void 0 !== t) {
                            var r = of(T[e], t);
                            return -1 === r ? void 0 : oy(T[e], r, 1)[0]
                        }
                        return op(T[e])
                    }, n.removeHooks = function(e) {
                        T[e] = []
                    }, n.removeAllHooks = function() {
                        T = oY()
                    }, n
                }(),
                oQ = {
                    ADD_ATTR: ["target"]
                },
                oZ = oX();
            oZ.addHook("afterSanitizeAttributes", function(e) {
                "A" === e.nodeName && (e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer"))
            });
            var o0 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = t.shouldOpenLinksInNewTab;
                    return (0, x.useMemo)(function() {
                        return (r ? oZ : oX).sanitize(e, oQ)
                    }, [e, r])
                },
                o1 = function(e) {
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
                        d = o0(r, {
                            shouldOpenLinksInNewTab: !0
                        }),
                        y = n && i ? (0, eR.jsx)(tb, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: i,
                            className: "grow basis-0",
                            children: n
                        }) : null,
                        h = o && l ? (0, eR.jsx)(tb, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: l,
                            className: "grow basis-0",
                            children: o
                        }) : null;
                    return (0, eR.jsx)(nY, {
                        open: u,
                        onOpenChange: function(e) {
                            e || c()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: void 0 === s || s,
                        closeLabel: a,
                        children: (0, eR.jsxs)(nX, {
                            children: [(0, eR.jsxs)(nQ, {
                                className: "flex flex-col gap-large",
                                children: [(0, eR.jsx)(nZ, {
                                    children: t
                                }), (0, eR.jsx)("span", {
                                    className: "[&_a]:[font-weight:700] [&_a]:underline",
                                    dangerouslySetInnerHTML: {
                                        __html: d
                                    }
                                })]
                            }), (0, eR.jsx)(n0, {
                                className: p ? "flex flex-col gap-small" : "flex gap-x-medium",
                                children: p ? (0, eR.jsxs)(x.Fragment, {
                                    children: [y, h]
                                }) : (0, eR.jsxs)(x.Fragment, {
                                    children: [h, y]
                                })
                            })]
                        })
                    })
                },
                o2 = function(e) {
                    var t = e.isModalOpen,
                        r = e.navigateToAccountSettings,
                        n = e.closeModal,
                        o = e.translate;
                    return (0, eR.jsx)(o1, {
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
                o3 = function(e) {
                    var t = e.isModalOpen,
                        r = e.closeModal,
                        n = e.translate;
                    return (0, eR.jsx)(o1, {
                        titleText: n("RestrictedUnplayableModal.Label.Title"),
                        bodyText: n("RestrictedUnplayableModal.Label.Body"),
                        secondaryButtonText: n("RestrictedUnplayableModal.Action.Ok"),
                        closeLabelText: n("Action.Close"),
                        onSecondaryButtonClick: r,
                        isModalOpen: t,
                        onCloseModal: r
                    })
                },
                o6 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = !!e && !t,
                        n = (0, E.useQuery)({
                            queryKey: ["ageRecommendation", e],
                            queryFn: function() {
                                return z(e)
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

            function o5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o8(e, t) {
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
                        if ("string" == typeof e) return o5(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o5(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var o4 = function(e) {
                var t, r, n = o8((0, x.useState)(void 0), 2),
                    o = n[0],
                    a = n[1],
                    i = o8((0, x.useState)(!1), 2),
                    l = i[0],
                    u = i[1],
                    c = o8((0, x.useState)(!1), 2),
                    s = c[0],
                    f = c[1];
                (0, x.useEffect)(function() {
                    f(!1), u(!0), V().then(function(e) {
                        a(e.contentAgeRestriction)
                    }).catch(function() {
                        f(!0)
                    }).finally(function() {
                        u(!1)
                    })
                }, []);
                var p = o6(e),
                    d = p.ageRecommendationData,
                    y = p.hasError,
                    h = p.isLoading;
                return {
                    contentAgeRestriction: o,
                    contentMaturityRating: null == d || null == (r = d.ageRecommendationDetails) || null == (t = r.summary.ageRecommendation) ? void 0 : t.contentMaturity,
                    isFetching: l || h,
                    hasError: s || y
                }
            };

            function o7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o9(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function ae(e, t) {
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
                        if ("string" == typeof e) return o7(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o7(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var at = function(e, t, r, n, o, a, i, l) {
                    var u = (0, E.useQuery)({
                            queryKey: ["guacPlayButtonUI"],
                            queryFn: function() {
                                return W()
                            },
                            staleTime: 6e4
                        }).data,
                        c = ae((0, x.useState)(!1), 2),
                        s = c[0],
                        f = c[1],
                        p = ae((0, x.useState)(!1), 2),
                        d = p[0],
                        y = p[1],
                        h = (0, x.useCallback)(function() {
                            ej(e, n, o, a, i, void 0, l)
                        }, [i, a, e, o, n, l]),
                        m = (0, x.useCallback)(function(e, n, o) {
                            var a;
                            return (a = function() {
                                var a, i, l, c, s;
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
                                }(this, function(p) {
                                    switch (p.label) {
                                        case 0:
                                            if (a = function(e) {
                                                    eD(t, e, H.ContextualPlayabilityAgeRecommendationParentalControls, r)
                                                }, o || void 0 === e || void 0 === n) return h(), D(er.PlayButtonUpsellUnknownSettingOrAge), a(en.gameLaunchFallbackUpsellName), [2];
                                            if ("minimal" === n) return h(), D(er.PlayButtonUpsellMinimalMaturityRating), a(en.gameLaunchFallbackUpsellName), [2];
                                            if (!(i = ({
                                                    mild: "NinePlus",
                                                    moderate: "ThirteenPlus",
                                                    restricted: "SeventeenPlus",
                                                    unrated: "ThirteenPlus"
                                                })[n])) return h(), D(er.PlayButtonUpsellAgeNotInMapping), a(en.gameLaunchFallbackUpsellName), [2];
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
                                            return f(!0), D(er.PlayButtonUpsellSelfUpdateSettingTriggered), a(c), [3, 12];
                                        case 2:
                                            if (D(er.PlayButtonUpsellAskYourParentTriggered), a(c), !window.Roblox.AccessManagementUpsellV2Service) return D(er.PlayButtonUpsellParentalConsentError), [3, 12];
                                            p.label = 3;
                                        case 3:
                                            return p.trys.push([3, 5, , 6]), s = (null == u ? void 0 : u.useExperienceApprovalForParentalConsent) ? {
                                                featureName: "CanApproveExperience",
                                                namespace: ei.accountManagement,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    universeId: t,
                                                    experienceManagementAction: "Approve"
                                                }
                                            } : {
                                                featureName: "CanChangeSetting",
                                                namespace: ei.settingChange,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    contentAgeRestriction: l.option.optionValue
                                                }
                                            }, [4, window.Roblox.AccessManagementUpsellV2Service.startAccessManagementUpsell(s)];
                                        case 4:
                                            return p.sent(), [3, 6];
                                        case 5:
                                            return p.sent(), h(), D(er.PlayButtonUpsellParentalConsentError), a(en.gameLaunchFallbackUpsellName), [3, 6];
                                        case 6:
                                        case 10:
                                            return [3, 12];
                                        case 7:
                                            return p.trys.push([7, 9, , 10]), D(er.PlayButtonUpsellAgeRestrictionVerificationTriggered), a(c), [4, eT({
                                                context: ea,
                                                pageContext: r
                                            })];
                                        case 8:
                                            return p.sent() && window.location.reload(), [3, 10];
                                        case 9:
                                            return p.sent(), h(), a(en.gameLaunchFallbackUpsellName), [3, 10];
                                        case 11:
                                            h(), D(er.PlayButtonUpsellUnknownRequirement), a(en.gameLaunchFallbackUpsellName), p.label = 12;
                                        case 12:
                                            return [3, 14];
                                        case 13:
                                            y(!0), D(er.PlayButtonUpsellRestrictedUnplayableTriggered), a(en.restrictedUnplayableUpsellName), p.label = 14;
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
                                        o9(o, r, n, i, l, "next", e)
                                    }

                                    function l(e) {
                                        o9(o, r, n, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [u, h, t, r]),
                        b = (0, x.useCallback)(function() {
                            f(!1)
                        }, []),
                        v = (0, x.useCallback)(function() {
                            y(!1)
                        }, []);
                    return {
                        launchPlayButtonUpsell: m,
                        isSelfUpdateSettingModalOpen: s,
                        navigateToAccountSettings: (0, x.useCallback)(function() {
                            var e = (0, es.getAbsoluteUrl)("/my/account#!/privacy");
                            "u" > typeof window && (window.location.href = e, f(!1))
                        }, []),
                        closeSelfUpdateSettingModal: b,
                        isRestrictedUnplayableModalOpen: d,
                        closeRestrictedUnplayableModal: v
                    }
                },
                ar = function(e) {
                    var t = e.universeId,
                        r = e.buttonClassName,
                        n = e.placeId,
                        o = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        l = e.eventProperties,
                        u = e.appsFlyerReferralProperties,
                        c = e.pageContext,
                        s = e.translate,
                        f = o4(t),
                        p = f.contentAgeRestriction,
                        d = f.contentMaturityRating,
                        y = f.isFetching,
                        h = f.hasError,
                        m = at(n, t, c, o, a, i, l, u),
                        b = m.launchPlayButtonUpsell,
                        v = m.isSelfUpdateSettingModalOpen,
                        g = m.navigateToAccountSettings,
                        w = m.closeSelfUpdateSettingModal,
                        O = m.isRestrictedUnplayableModalOpen,
                        P = m.closeRestrictedUnplayableModal,
                        S = (0, x.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), b(p, d, h)
                        }, [b, p, d, h]);
                    return !h && y ? (0, eR.jsx)(tC, {
                        buttonClassName: null != r ? r : "btn-common-play-game-action-needed-lg"
                    }) : (0, eR.jsxs)(A().Fragment, {
                        children: [(0, eR.jsx)(tI, {
                            onButtonClick: S,
                            buttonClassName: r
                        }), v && (0, eR.jsx)(o2, {
                            isModalOpen: v,
                            navigateToAccountSettings: g,
                            closeModal: w,
                            translate: s
                        }), O && (0, eR.jsx)(o3, {
                            isModalOpen: O,
                            closeModal: P,
                            translate: s
                        })]
                    })
                };
            ar.defaultProps = {
                buttonClassName: void 0,
                rootPlaceId: void 0,
                privateServerLinkCode: void 0,
                gameInstanceId: void 0,
                eventProperties: {},
                appsFlyerReferralProperties: {}
            };
            var an = (0, tA.withTranslations)(ar, tE);

            function ao(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aa(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function ai(e, t) {
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
                        if ("string" == typeof e) return ao(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ao(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var al = function(e, t) {
                    var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                        n = (0, E.useQuery)({
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
                                                return [4, Promise.all([(o = [e], B(function() {
                                                    var e;
                                                    return F(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, G.getProductInfo(o)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data.data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })()), (a = [t], B(function() {
                                                    var e;
                                                    return F(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, G.getPlaceDetails(a)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())])];
                                            case 1:
                                                return [2, {
                                                    productInfo: (r = ai.apply(void 0, [n.sent(), 2]))[0],
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
                                            aa(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            aa(a, n, o, i, l, "throw", e)
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
                au = function(e) {
                    var t = e.buttonWidth,
                        r = e.buttonClassName,
                        n = e.iconClassName,
                        o = e.hideButtonText,
                        a = e.hideButtonIcon,
                        i = e.buttonContent,
                        l = e.onClick,
                        u = e.isPurchasing,
                        c = e.redirectUrl;
                    return c ? (0, eR.jsx)("a", {
                        href: c,
                        className: "purchase-button-link",
                        children: (0, eR.jsxs)(tb, {
                            "data-testid": "play-purchase-button",
                            variant: "Emphasis",
                            style: tx,
                            className: eL()(tS(t), r),
                            onClick: function() {
                                return null
                            },
                            isDisabled: u,
                            children: [!a && (0, eR.jsx)("span", {
                                className: n
                            }), !o && (0, eR.jsx)("span", {
                                className: "btn-text",
                                children: i
                            })]
                        })
                    }) : (0, eR.jsxs)(tb, {
                        "data-testid": "play-purchase-button",
                        variant: "Emphasis",
                        style: tx,
                        className: eL()(tS(t), r),
                        onClick: function(e) {
                            l && !u && l(e)
                        },
                        isDisabled: u,
                        children: [!a && (0, eR.jsx)("span", {
                            className: n
                        }), !o && (0, eR.jsx)("span", {
                            className: "btn-text",
                            children: i
                        })]
                    })
                };

            function ac(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function as(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            au.defaultProps = {
                hideButtonText: !1,
                buttonWidth: tP,
                buttonClassName: "btn-economy-robux-white-lg",
                iconClassName: "icon-robux-white",
                hideButtonIcon: !1,
                isPurchasing: !1,
                onClick: void 0,
                redirectUrl: void 0
            };
            var af = function(e) {
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
                        y = e.pageContext,
                        h = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, x.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return ac(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ac(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        m = h[0],
                        b = h[1],
                        v = (0, x.useCallback)(function(e) {
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
                                            return l.trys.push([1, 3, 4, 5]), eD(o, en.fiatPurchaseUpsellName, H.FiatPurchaseRequired, y), [4, q(a, r)];
                                        case 2:
                                            return (n = l.sent()) && (0, ed.isValidStripeCheckoutUrl)(n) && (window.location.href = n), [3, 5];
                                        case 3:
                                            return l.sent(), D(er.PreparePurchaseUrlError), console.error("Error preparing purchase url"), [3, 5];
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
                                        as(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        as(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [a, i, o, y]);
                    return (0, eR.jsx)(au, {
                        buttonWidth: c,
                        buttonClassName: s,
                        iconClassName: u,
                        hideButtonText: f,
                        hideButtonIcon: !0,
                        buttonContent: void 0 !== d && d ? l(Q) : null != (r = null == (n = i.fiatPurchaseData) ? void 0 : n.localizedFiatPrice) ? r : "",
                        onClick: p ? void 0 : v,
                        redirectUrl: p,
                        isPurchasing: m
                    })
                },
                ap = window.RobloxItemPurchase,
                ad = window.RobloxThumbnails;

            function ay(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ah = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.price.toString()) ? t : ""
                },
                am = function(e) {
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
                        p = (0, x.useRef)();
                    null != p.current || (p.current = (0, ap.createItemPurchase)());
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
                                if ("string" == typeof e) return ay(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ay(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        y = d[0],
                        h = d[1],
                        m = (0, x.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), h.start()
                        }, [h]);
                    return (0, eR.jsxs)(A().Fragment, {
                        children: [(0, eR.jsx)(au, {
                            buttonWidth: o,
                            buttonClassName: a,
                            iconClassName: n,
                            hideButtonText: i,
                            buttonContent: ah(c),
                            onClick: l ? void 0 : m,
                            redirectUrl: l
                        }), (0, eR.jsx)(y, {
                            translate: s,
                            productId: c.productId,
                            expectedPrice: c.price,
                            thumbnail: (0, eR.jsx)(ad.Thumbnail2d, {
                                type: ad.ThumbnailTypes.gameIcon,
                                size: ad.DefaultThumbnailSize,
                                targetId: parseInt(r, 10),
                                imgClassName: "game-card-thumb",
                                format: ad.ThumbnailFormat.jpeg
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
                ab = (0, tA.withTranslations)(function(e) {
                    var t = e.translate,
                        r = e.universeId,
                        n = e.placeId,
                        o = e.iconClassName,
                        a = void 0 === o ? "icon-robux-white" : o,
                        i = e.buttonWidth,
                        l = void 0 === i ? tP : i,
                        u = e.buttonClassName,
                        c = void 0 === u ? "btn-economy-robux-white-lg" : u,
                        s = e.refetchPlayabilityStatus,
                        f = e.hideButtonText,
                        p = void 0 !== f && f,
                        d = e.redirectPurchaseUrl,
                        y = e.playabilityStatus,
                        h = e.showDefaultPurchaseText,
                        m = e.pageContext,
                        b = al(r, n),
                        v = b.productInfo,
                        g = b.productDetails;
                    return b.isLoading ? (0, eR.jsx)(tC, {
                        buttonClassName: c,
                        buttonWidth: l
                    }) : "Fiat" == (y === H.FiatPurchaseRequired && (null == g ? void 0 : g.fiatPurchaseData) ? "Fiat" : "Robux") ? (0, eR.jsx)(af, {
                        universeId: r,
                        placeId: n,
                        iconClassName: a,
                        buttonWidth: l,
                        buttonClassName: c,
                        hideButtonText: p,
                        redirectPurchaseUrl: d,
                        productDetails: g,
                        translate: t,
                        showDefaultPurchaseText: void 0 !== h && h,
                        pageContext: m
                    }) : (0, eR.jsx)(am, {
                        universeId: r,
                        iconClassName: a,
                        buttonWidth: l,
                        buttonClassName: c,
                        hideButtonText: p,
                        redirectPurchaseUrl: d,
                        productDetails: g,
                        productInfo: v,
                        translate: t,
                        refetchPlayabilityStatus: s
                    })
                }, tE),
                av = function(e) {
                    var t, r, n = new URLSearchParams(window.location.search);
                    return {
                        launchData: null != (t = n.get("launchData")) ? t : e,
                        eventId: null != (r = n.get("eventId")) ? r : void 0
                    }
                },
                ag = (0, tv.withTranslations)(function(e) {
                    var t = e.translate,
                        r = e.universeId,
                        n = e.placeId,
                        o = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        l = e.eventProperties,
                        u = e.appsFlyerReferralProperties,
                        c = (0, x.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), ek(n, r);
                            var t = av((null == l ? void 0 : l.launchData) != null ? String(l.launchData) : void 0);
                            ej(n, o, a, i, l, t, u, "DemoPlayButtonClick")
                        }, [r, n, o, a, i, l, u]),
                        s = t(Z) || "Play Demo";
                    return (0, eR.jsx)("button", {
                        type: "button",
                        "data-testid": "demo-play-button",
                        className: "btn-control-lg btn-full-width demo-play-button",
                        onClick: c,
                        children: s
                    })
                }, tE),
                aw = (0, tv.withTranslations)(function(e) {
                    var t = e.translate,
                        r = e.placeId;
                    return (0, eR.jsx)(tb, {
                        "data-testid": "play-on-web-button",
                        as: "a",
                        variant: "Standard",
                        size: "Large",
                        style: tx,
                        className: "btn-full-width btn-control-lg play-on-web-button",
                        href: "".concat(j().playWebsite, "/games/start?placeId=").concat(r),
                        target: "_blank",
                        children: t(ee) || "Play on Web"
                    })
                }, ["Feature.ExperienceDetails"]),
                aO = (0, tA.withTranslations)(function(e) {
                    var t = e.translate,
                        r = e.iconClassName,
                        n = e.buttonWidth,
                        o = e.buttonClassName,
                        a = e.hideButtonText;
                    return (0, eR.jsxs)(tb, {
                        "data-testid": "play-unplayable-button",
                        variant: "Emphasis",
                        style: tx,
                        className: eL()(tS(void 0 === n ? tP : n), void 0 === o ? "btn-common-play-game-unplayable-lg" : o),
                        isDisabled: !0,
                        onClick: function() {
                            return null
                        },
                        children: [(0, eR.jsx)("span", {
                            className: void 0 === r ? "icon-status-unavailable-secondary" : r
                        }), !(void 0 !== a && a) && (0, eR.jsx)("span", {
                            className: "btn-text",
                            children: t(X)
                        })]
                    })
                }, tE),
                aP = (0, tA.withTranslations)(function(e) {
                    var t = e.treatmentData,
                        r = e.isModalOpen,
                        n = e.onConfirm,
                        o = e.onDismiss,
                        a = e.translate;
                    return (0, eR.jsx)(o1, {
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
                }, tE);

            function aS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ax = function(e) {
                    return !!e && "string" == typeof e.titleText && e.titleText.length > 0 && "string" == typeof e.bodyText && e.bodyText.length > 0 && "string" == typeof e.primaryActionText && e.primaryActionText.length > 0 && "string" == typeof e.secondaryActionText && e.secondaryActionText.length > 0
                },
                aA = function(e, t, r) {
                    var n, o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = (0, x.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return aS(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aS(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        a = o[0],
                        i = o[1],
                        l = ec(e),
                        u = l.playabilityStatus,
                        c = l.playableUxTreatment,
                        s = l.isFetchingPlayability,
                        f = (0, x.useCallback)(function(t) {
                            eD(e, t, H.Playable, r)
                        }, [e, r]);
                    return {
                        doGameLaunchWithPlayableUxTreatment: (0, x.useCallback)(function() {
                            if (s) {
                                t(), D(er.PlayableUxTreatmentPlayabilityStatusStillLoading), f(en.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (u !== H.Playable || !(null == c ? void 0 : c.treatment)) return void t();
                            if ("reconfirmLaunchModal" !== c.treatment) {
                                t(), D(er.PlayableUxTreatmentUnknownTreatment), f(en.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (!ax(c.data)) {
                                t(), D(er.PlayableUxTreatmentMalformedData), f(en.gameLaunchFallbackUpsellName);
                                return
                            }
                            i(!0), f(en.reconfirmLaunchModalUpsellName)
                        }, [s, u, c, t, f]),
                        playableUxTreatmentModal: (0, x.useMemo)(function() {
                            return a && c && ax(c.data) ? (0, eR.jsx)(aP, {
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

            function aE(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var aI = function(e) {
                var t = e.universeId,
                    r = e.buttonClassName,
                    n = e.playabilityStatus,
                    o = e.pageContext;
                return (0, eR.jsx)(tI, {
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
                                        return r.trys.push([1, 3, , 4]), eD(t, en.ageCheckUpsellName, n, o), [4, eT({
                                            context: eo,
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
                                    aE(a, n, o, i, l, "next", e)
                                }

                                function l(e) {
                                    aE(a, n, o, i, l, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    },
                    buttonClassName: r
                })
            };

            function aj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aC(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function aT(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            aC(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            aC(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ak(e, t) {
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
                        if ("string" == typeof e) return aj(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aj(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aU(e, t) {
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
            var aD = function(e) {
                    var t, r;
                    return {
                        launchData: null != (t = new URLSearchParams(window.location.search).get("launchData")) ? t : e,
                        eventId: null != (r = new URLSearchParams(window.location.search).get("eventId")) ? r : void 0
                    }
                },
                aR = function(e, t) {
                    var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                    return t ? (0, eR.jsxs)("div", {
                        className: "stacked-play-buttons-container",
                        children: [e, r && t]
                    }) : e
                },
                aN = {},
                aL = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.rootPlaceId,
                        o = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        i = e.status,
                        l = e.eventProperties,
                        u = void 0 === l ? aN : l,
                        c = e.appsFlyerReferralProperties,
                        s = void 0 === c ? aN : c,
                        f = e.iconClassName,
                        p = e.buttonWidth,
                        d = void 0 === p ? tP : p,
                        y = e.buttonClassName,
                        h = void 0 === y ? "btn-common-play-game-lg" : y,
                        m = e.disableLoadingState,
                        b = e.buttonText,
                        v = void 0 === b ? void 0 : b,
                        g = e.hideIcon,
                        w = e.analyticsCallback,
                        O = void 0 === w ? void 0 : w,
                        P = e.pageContext,
                        S = ak((0, x.useState)(void 0), 2),
                        I = S[0],
                        C = S[1],
                        T = ak((0, x.useState)(void 0), 2),
                        k = T[0],
                        U = T[1],
                        N = ak((0, x.useState)(void 0), 2),
                        L = N[0],
                        M = N[1],
                        _ = ak((0, x.useState)(void 0), 2),
                        G = _[0],
                        V = _[1],
                        z = ak((0, x.useState)(void 0), 2),
                        q = z[0],
                        K = z[1],
                        $ = ak((0, x.useState)(void 0), 2),
                        J = $[0],
                        Y = $[1],
                        X = ak((0, x.useState)(void 0), 2),
                        Q = X[0],
                        Z = X[1],
                        ee = ak((0, x.useState)(void 0), 2),
                        et = ee[0],
                        en = ee[1],
                        eo = (0, E.useQuery)({
                            queryKey: ["getIsVNGLandingRedirectEnabled"],
                            queryFn: tg.getIsVNGLandingRedirectEnabled,
                            retry: !1
                        }).data;
                    (0, x.useEffect)(function() {
                        aT(function() {
                            var e, r;
                            return aU(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return n.trys.push([0, 2, , 3]), [4, aT(function() {
                                            var e, r, n, o, a, i, l, u, c, s, f, p, d, y, h, m, b;
                                            return aU(this, function(v) {
                                                switch (v.label) {
                                                    case 0:
                                                        if (e = {
                                                                isUniverseEnabledForVoice: !1,
                                                                isUniverseEnabledForAvatarVideo: !1
                                                            }, void 0 === eV()) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: !0,
                                                            useCameraU13Design: !1,
                                                            useVoiceUpsellV2Design: !1
                                                        }];
                                                        return [4, W()];
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
                                                        return [4, (g = t, B(function() {
                                                            var e;
                                                            return F(this, function(t) {
                                                                switch (t.label) {
                                                                    case 0:
                                                                        return e = {
                                                                            withCredentials: !0,
                                                                            url: "".concat(j().voiceApi, "/v1/settings/verify/show-age-verification-overlay/").concat(g)
                                                                        }, [4, R.get(e)];
                                                                    case 1:
                                                                        return [2, t.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        if (f = (s = v.sent()).showAgeVerificationOverlay, p = s.showVoiceOptInOverlay, d = s.showAvatarVideoOptInOverlay, y = s.elegibleToSeeVoiceUpsell, h = s.universePlaceVoiceEnabledSettings, m = !1, b = !1, !tO().getAllValuesForLayer) return [3, 5];
                                                        return [4, tO().getAllValuesForLayer("Voice.AvatarChat.Upsell")];
                                                    case 3:
                                                        return m = Boolean.apply(void 0, [v.sent().ShouldShowUpsell]), [4, tO().getAllValuesForLayer("Voice.AvatarChat.U13Upsell")];
                                                    case 4:
                                                        b = Boolean.apply(void 0, [v.sent().ShouldShowUpsell]), v.label = 5;
                                                    case 5:
                                                        return [2, {
                                                            elegibleToSeeVoiceUpsell: y,
                                                            universePlaceVoiceEnabledSettings: h,
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
                                        return C(null != (e = (r = n.sent()).universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice) && e), M(r.elegibleToSeeVoiceUpsell), U(r.showAgeVerificationOverlay), V(r.showVoiceOptInOverlay), K(r.showAvatarVideoOptInOverlay), Y(r.requireExplicitVoiceConsent), Z(r.useCameraU13Design), en(r.useVoiceUpsellV2Design), [3, 3];
                                    case 2:
                                        return n.sent(), D(er.PlayButtonShowIdentificationError), M(!1), C(!1), U(!1), V(!1), K(!1), Y(!0), Z(!1), en(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []);
                    var ea = (0, x.useCallback)(function() {
                            ek(r, t);
                            var e = aD(null != u.launchData ? String(u.launchData) : void 0);
                            ej(r, n, o, a, u, e, s)
                        }, [r, t, u, s, n, o, a]),
                        ei = aA(t, ea, P),
                        el = ei.doGameLaunchWithPlayableUxTreatment,
                        eu = ei.playableUxTreatmentModal;
                    return void 0 !== k || void 0 !== m && m ? (0, eR.jsxs)(A().Fragment, {
                        children: [(0, eR.jsxs)(tb, {
                            "data-testid": "play-button",
                            variant: "Emphasis",
                            style: tx,
                            className: eL()(tS(d), h),
                            onClick: function(e) {
                                return aT(function() {
                                    var t;
                                    return aU(this, function(n) {
                                        var o, a, l, u;
                                        switch (n.label) {
                                            case 0:
                                                if (e.preventDefault(), e.stopPropagation(), i !== H.Playable) return [3, 7];
                                                if (L && I && tO().getAllValuesForLayer("SocialVoice.VoiceUpsell").then(function() {
                                                        tO().logLayerExposure("SocialVoice.VoiceUpsell")
                                                    }).catch(function() {
                                                        console.error("error logging exposure event in play-join")
                                                    }), !k) return [3, 2];
                                                return [4, eg(function() {
                                                    return eP(this, function(e) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.startVerificationFlow()]
                                                        } catch (e) {
                                                            return [2, [!1, !1]]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return (t = ak.apply(void 0, [n.sent(), 2]))[0], t[1] && U(!1), [3, 6];
                                            case 2:
                                                if (!G) return [3, 4];
                                                return [4, (o = null == J || J, a = null != et && et, eg(function() {
                                                    return eP(this, function(e) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.showVoiceOptInOverlay(o, a)]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 3:
                                                return n.sent() && V(!1), [3, 6];
                                            case 4:
                                                if (!q) return [3, 6];
                                                return [4, (l = null == J || J, u = null == Q || Q, eg(function() {
                                                    return eP(this, function(e) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.showAvatarVideoOptInOverlay(l, u)]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 5:
                                                n.sent() && K(!1), n.label = 6;
                                            case 6:
                                                return el(), [3, 8];
                                            case 7:
                                                i === H.GuestProhibited && (eo ? tg.navigateToLoginWithRedirect() : eC(r, s)), n.label = 8;
                                            case 8:
                                                return O && O(), [2]
                                        }
                                    })
                                })()
                            },
                            children: [!(void 0 !== g && g) && (0, eR.jsx)("span", {
                                className: void 0 === f ? "icon-common-play" : f
                            }), v && (0, eR.jsx)("span", {
                                className: "play-button-text",
                                children: v
                            })]
                        }), (0, eR.jsx)("div", {
                            id: "id-verification-container"
                        }), eu]
                    }) : (0, eR.jsx)(tC, {
                        buttonClassName: h,
                        buttonWidth: d
                    })
                },
                aM = function(e) {
                    return (0, eR.jsx)(E.QueryClientProvider, {
                        client: tv.queryClient,
                        children: (0, eR.jsx)(aL, function(e) {
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
                        }({}, e))
                    })
                },
                a_ = (0, tA.withTranslations)(function(e) {
                    var t = e.translate,
                        r = e.playabilityStatus,
                        n = e.errorClassName,
                        o = e.containerRef,
                        a = t(Object.hasOwn($, r) ? $[r] : $[H.UnplayableOtherReason]);
                    return (0, eR.jsx)("span", {
                        "data-testid": "play-error",
                        className: void 0 === n ? "error-message" : n,
                        ref: o,
                        children: a
                    })
                }, tE),
                aB = function(e, t) {
                    var r = t.playabilityStatus,
                        n = t.shouldShowVpcPlayButtonUpsells,
                        o = t.shouldShowNoticeAgreementIfPlayable,
                        a = t.unplayableDisplayText;
                    if (void 0 !== r) {
                        if (r === H.Playable && o) return {
                            message: e(J),
                            testId: "play-contextual-message"
                        };
                        if (a) return {
                            message: a,
                            testId: "play-server-message"
                        };
                        if (r !== H.ContextualPlayabilityCoreGated && eU(r, n)) return {
                            message: e(Object.hasOwn($, r) ? $[r] : $[H.UnplayableOtherReason]),
                            testId: "play-error"
                        }
                    }
                },
                aF = window.Roblox["core-scripts"].util.elementVisibility,
                aG = function(e, t) {
                    var r = t.universeId,
                        n = t.playabilityStatus,
                        o = t.pageContext,
                        a = t.attributionId,
                        i = t.contextualMessage,
                        l = (0, x.useRef)(!1);
                    (0, x.useEffect)(function() {
                        l.current = !1
                    }, [r, n, o, a, i]), (0, x.useEffect)(function() {
                        if (e.current && !l.current && i) {
                            var t = null;
                            return t = (0, aF.observeVisibility)({
                                    element: e.current,
                                    threshold: .5
                                }, function(e) {
                                    e && !l.current && (l.current = !0, (0, ep.sendEventWithTarget)("playButtonContextualMessageImpression", o, {
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
                },
                aW = (0, tA.withTranslations)(function(e) {
                    var t = e.translate,
                        r = e.playabilityStatus,
                        n = e.shouldShowVpcPlayButtonUpsells,
                        o = e.unplayableDisplayText,
                        a = e.shouldShowNoticeAgreementIfPlayable,
                        i = e.contextualMessageClassName,
                        l = e.analyticsConfig,
                        u = (0, x.useRef)(null),
                        c = aB(t, {
                            playabilityStatus: r,
                            shouldShowVpcPlayButtonUpsells: n,
                            shouldShowNoticeAgreementIfPlayable: a,
                            unplayableDisplayText: o
                        });
                    return (aG(u, {
                        universeId: l.universeId,
                        playabilityStatus: r,
                        pageContext: l.pageContext,
                        attributionId: l.attributionId,
                        contextualMessage: null == c ? void 0 : c.message
                    }), c) ? (0, eR.jsx)("span", {
                        ref: u,
                        "data-testid": c.testId,
                        className: void 0 === i ? "contextual-message" : i,
                        children: c.message
                    }) : null
                }, tE);

            function aV(e) {
                var t = new(P()).Deferred;
                return S.Hybrid.Game.launchGame(e, function() {
                    t.resolve(e)
                }), t
            }
            var az = {
                isJoinAttemptIdEnabled: !1,
                joinMultiplayerGame: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        r = {
                            requestType: S.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                            placeId: e.placeId.toString(),
                            isPlayTogetherGame: t,
                            browserTrackerId: S.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (r.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (r.joinAttemptOrigin = e.joinAttemptOrigin), aV(r)
                },
                followPlayerIntoGame: function(e) {
                    var t = {
                        requestType: S.Hybrid.Game.LAUNCH_MODES.FOLLOW_USER,
                        userId: e.userId.toString(),
                        browserTrackerId: S.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), aV(t)
                },
                joinGameInstance: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        r = {
                            requestType: S.Hybrid.Game.LAUNCH_MODES.GAME_INSTANCE,
                            placeId: e.placeId.toString(),
                            instanceId: e.gameId,
                            isPlayTogetherGame: t,
                            browserTrackerId: S.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (r.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (r.joinAttemptOrigin = e.joinAttemptOrigin), aV(r)
                },
                joinPrivateGame: function(e) {
                    var t = {
                        requestType: S.Hybrid.Game.LAUNCH_MODES.PRIVATE_SERVER,
                        placeId: e.placeId.toString(),
                        accessCode: e.accessCode,
                        browserTrackerId: S.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), aV(t)
                },
                playTogetherGame: function(e) {
                    var t = {
                        requestType: S.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                        placeId: e.placeId.toString(),
                        conversationId: e.conversationId.toString(),
                        browserTrackerId: S.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), aV(t)
                }
            };
            P()(document).ready(function() {
                b = new S.TranslationResourceProvider().getTranslationResource("Feature.GameLaunchGuestMode")
            });
            var aq = {
                    restrictGuests: function(e) {
                        var t = new(P()).Deferred;
                        return S.CurrentUser.isAuthenticated ? t.resolve(e) : S.Dialog.open({
                            titleText: b.get("Heading.Dialog.SignUpOrLogin"),
                            bodyContent: b.get("Description.Dialog.ConnectionsSignUpOrLogin"),
                            cssClass: "soli-modal",
                            acceptColor: S.Dialog.green,
                            acceptText: b.get("Action.Dialog.SignUp"),
                            declineText: b.get("Action.Dialog.Login"),
                            onDecline: function() {
                                S.FormEvents && S.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_login");
                                var e = "/login?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search);
                                window.location.href = S.Endpoints ? S.Endpoints.getAbsoluteUrl(e) : e
                            },
                            onAccept: function() {
                                var e;
                                S.FormEvents && S.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_signup"), e = "/CreateAccount?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search), window.location.href = S.Endpoints ? S.Endpoints.getAbsoluteUrl(e) : e
                            }
                        }), t
                    }
                },
                aH = window.CoreUtilities;

            function aK(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var a$ = {
                gameLaunchInterface: null,
                gameLaunchLogger: null,
                initialized: new Promise(function(e) {
                    v = e
                })
            };

            function aJ(e, t, r) {
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
                    joinAttemptId: null != t ? t : aH.uuidService.generateRandomUuid()
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

            function aY(e, t, r) {
                var n, o, a = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    l = arguments.length > 5 && void 0 !== arguments[5] && arguments[5],
                    u = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : "",
                    c = arguments.length > 7 && void 0 !== arguments[7] ? arguments[7] : "";
                a && i && (n = {
                    url: "".concat(S.EnvironmentUrls.gameJoinApi, "/v1/team-create-preemptive"),
                    withCredentials: !0,
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json"
                    }
                }, o = {
                    gameJoinAttemptId: aH.uuidService.generateRandomUuid(),
                    placeId: e
                }, aH.httpService.post(n, o)), a$.gameLaunchInterface.editGameInStudio(e, t, r, a && l, u, c)
            }

            function aX(e, t, r, n, o, a, i) {
                var l = {
                    placeId: e,
                    launchData: null == a ? void 0 : a.launchData,
                    eventId: null == a ? void 0 : a.eventId,
                    isPlayTogetherGame: !0 === r,
                    referredByPlayerId: i
                };
                return a$.gameLaunchInterface.isJoinAttemptIdEnabled && (l = aJ(l, n, o)), aq.restrictGuests(l).then(a$.gameLaunchInterface.joinMultiplayerGame)
            }
            P().fn.bindGameLaunch = function() {
                return this.find(".VisitButtonPlayGLI").click(function() {
                    var e = P()(this);
                    aX(e.attr("placeid"), e.data("is-membership-level-ok"))
                }), this.find(".VisitButtonEditGLI").click(function() {
                    var e = P()(this);
                    aY(e.attr("placeid"), e.data("universeid"), !!e.data("allowupload"))
                }), this
            }, P()(document).ready(function() {
                P()("body").bindGameLaunch()
            }), Object.assign(a$, {
                authenticationChecker: aq,
                joinMultiplayerGame: aX,
                openStudio: function() {
                    a$.gameLaunchInterface.openStudio()
                },
                openPluginInStudio: function(e) {
                    a$.gameLaunchInterface.openPluginInStudio(e)
                },
                editGameInStudio: aY,
                followPlayerIntoGame: function(e, t, r) {
                    var n = {
                        userId: e
                    };
                    return a$.gameLaunchInterface.isJoinAttemptIdEnabled && (n = aJ(n, t, r)), aq.restrictGuests(n).then(a$.gameLaunchInterface.followPlayerIntoGame)
                },
                joinGameInstance: function(e, t, r, n, o, a, i) {
                    var l = {
                        placeId: e,
                        gameId: t,
                        isPlayTogetherGame: !0 === n,
                        referredByPlayerId: i
                    };
                    return a$.gameLaunchInterface.isJoinAttemptIdEnabled && (l = aJ(l, o, a)), aq.restrictGuests(l).then(a$.gameLaunchInterface.joinGameInstance)
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
                                    return [4, a$.initialized];
                                case 1:
                                    return i.sent(), a = {
                                        placeId: e,
                                        accessCode: t,
                                        linkCode: r
                                    }, a$.gameLaunchInterface.isJoinAttemptIdEnabled && (a = aJ(a, n, o)), [2, a$.gameLaunchInterface.joinPrivateGame(a)]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, n) {
                            var o = a.apply(e, t);

                            function i(e) {
                                aK(o, r, n, i, l, "next", e)
                            }

                            function l(e) {
                                aK(o, r, n, i, l, "throw", e)
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
                    return a$.gameLaunchInterface.isJoinAttemptIdEnabled && (o = aJ(o, r, n)), aq.restrictGuests(o).then(a$.gameLaunchInterface.playTogetherGame)
                },
                setGameLaunchInterface: function(e) {
                    a$.gameLaunchInterface = e, v()
                },
                setGameLaunchLogger: function(e) {
                    a$.gameLaunchLogger = e
                },
                tryAssetInStudio: function(e) {
                    a$.gameLaunchInterface.tryAssetInStudio(e)
                },
                isJoinAttemptIdEnabled: function() {
                    var e;
                    return null == (e = a$.gameLaunchInterface) ? void 0 : e.isJoinAttemptIdEnabled
                },
                startClientAttemptedEvent: "startClientAttempted",
                startClientFailedEvent: "startClientFailed",
                startClientSucceededEvent: "startClientSucceeded",
                beginInstallEvent: "beginInstall",
                successfulInstallEvent: "successfulInstall",
                manualDownloadEvent: "manualDownload"
            });
            var aQ = function(e) {
                    var t, r = "".concat(e, "="),
                        n = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(r)
                        })) ? void 0 : t.slice(r.length);
                    return null == n ? null : {
                        name: e,
                        value: decodeURIComponent(n)
                    }
                },
                aZ = function() {
                    var e = aQ("RBXcb");
                    if (null == e || "" === e.value) return !1;
                    var t = e.value.split("&").find(function(e) {
                        return "GoogleAnalytics" === e.split("=")[0]
                    });
                    return "true" === (null == t ? void 0 : t.split("=")[1])
                },
                a0 = {
                    lastContext: "unknown",
                    contextCategories: {
                        joinUser: "JoinUser"
                    }
                };

            function a1(e, t, r, n, o, a) {
                var i, l, u;
                null !== t && "" !== t && "unknown" !== t && (a0.lastContext = t), S.EventStream.SendEvent(e, a0.lastContext, function(e) {
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
            Object.assign(a0, {
                SendGamePlayIntent: function(e, t, r, n, o) {
                    a1("gamePlayIntent", e, t, r, n, o), P()(document).trigger("playButton:gamePlayIntent")
                },
                SendDevelopIntent: function(e, t) {
                    a1("developIntent", e, t)
                },
                SendInstallBegin: function(e, t) {
                    a1("installBegin", e, t)
                },
                SendInstallSuccess: function(e, t) {
                    a1("installSuccess", e, t)
                },
                SendClientStartAttempt: function(e, t) {
                    a1("clientStartAttempt", e, t)
                },
                SendClientStartSuccessWeb: function(e, t) {
                    a1("clientStartSuccessWeb", e, t)
                },
                SendManualDownloadClick: function(e, t) {
                    a1("manualDownload", e, t)
                }
            });
            var a2 = {
                    logToConsoleEnabled: !1,
                    logToGAEnabled: !0,
                    logToEphemeralCountersEnabled: !0
                },
                a3 = {};
            a3[a$.startClientAttemptedEvent] = ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"], a3[a$.startClientSucceededEvent] = ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"];
            var a6 = {};
            S.GaEventSettings.gaLaunchAttemptAndLaunchSuccessEnabled && (a6[a$.startClientAttemptedEvent] = "Launch Attempt", a6[a$.startClientSucceededEvent] = "Launch Success"), a6[a$.beginInstallEvent] = "Install Begin", a6[a$.successfulInstallEvent] = "Install Success", a6[a$.manualDownloadEvent] = "Manual Download";
            var a5 = {};

            function a8(e) {
                a2.logToConsoleEnabled && console.log(e)
            }

            function a4(e, t) {
                if (a2.logToEphemeralCountersEnabled) {
                    var r, n = P()("#PlaceLauncherStatusPanel").data("os-name");
                    "Windows" === n && (n = "Win32");
                    var o = e;
                    o = (o = o.replace("<os>", n)).replace("<launchmethod>", t), (null == (r = window.EventTracker) ? void 0 : r.fireEvent) && window.EventTracker.fireEvent(o)
                }
            }

            function a7(e, t, r, n) {
                aZ() && void 0 !== window.GoogleAnalyticsEvents && a2.logToGAEnabled && window.GoogleAnalyticsEvents.FireEvent && window.GoogleAnalyticsEvents.FireEvent([e, t, r, n])
            }

            function a9(e, t) {
                a8("".concat(e.type, ": ").concat(JSON.stringify(t))), a3[e.type] && P().each(a3[e.type], function(e, r) {
                    a4(r, t.launchMethod)
                }), a6[e.type] && a7(t.launchMethod, a6[e.type], t.params.launchMode, 0), a5[e.type] && a5[e.type](null, t.params.placeId)
            }
            a5[a$.startClientAttemptedEvent] = a0.SendClientStartAttempt, a5[a$.startClientSucceededEvent] = a0.SendClientStartSuccessWeb, a5[a$.beginInstallEvent] = a0.SendInstallBegin, a5[a$.successfulInstallEvent] = a0.SendInstallSuccess, a5[a$.manualDownloadEvent] = a0.SendManualDownloadClick, Object.assign(a2, {
                logToConsole: a8,
                logToEphemeralCounters: a4,
                logToGA: a7
            }), P()(document).ready(function() {
                var e = [a$.startClientAttemptedEvent, a$.startClientFailedEvent, a$.startClientSucceededEvent, a$.beginInstallEvent, a$.successfulInstallEvent, a$.manualDownloadEvent];
                P()(a$).on(e.join(" "), a9)
            });
            var ie = function() {
                var e = "click";
                P()("body").on(e, ".VisitButtonPlay, .VisitButtonPlayGLI", function() {
                    var e, t = P()(this);
                    if ((t.hasClass("VisitButtonPlay") || t.hasClass("VisitButtonPlayGLI")) && (e = "PlayButton"), e) {
                        var r = P()(this).attr("placeid"),
                            n = S.UrlParser ? S.UrlParser.getParameterValueByName("rbxp") : null;
                        a0.SendGamePlayIntent(e, r, n)
                    }
                }), P()("body").on(e, ".VisitButtonEdit, .VisitButtonEditGLI", function() {
                    var e = P()(this).attr("placeid");
                    a0.SendDevelopIntent("Edit", e)
                }), P()("#rbx-running-games").on(e, ".rbx-game-server-item .rbx-game-server-join", function() {
                    var e = P()(this).data("placeid");
                    e && a0.SendGamePlayIntent("JoinInstance", e)
                }), P()("#rbx-friends-running-games").on(e, ".rbx-friends-game-server-item .rbx-friends-game-server-join", function() {
                    var e = P()(this).data("placeid");
                    e && a0.SendGamePlayIntent("JoinInstance", e)
                }), P()("#game-instances").on(e, "#rbx-vip-servers .rbx-vip-server-item .rbx-vip-server-join", function() {
                    var e = P()(this).data("placeid");
                    e && a0.SendGamePlayIntent("PrivateServer", e)
                })
            };

            function it(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ir(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function io(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ir(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ir(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ia(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function ii(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function il(e, t, r) {
                return t && ii(e.prototype, t), r && ii(e, r), e
            }

            function iu(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ic(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function is(e, t) {
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
            var ip = function() {
                    function e(t) {
                        ia(this, e), iu(this, "value", void 0), this.value = t
                    }
                    return il(e, [{
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
                            return iy.fromResult(this.cast())
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
                id = function() {
                    function e(t) {
                        ia(this, e), iu(this, "error", void 0), this.error = t
                    }
                    return il(e, [{
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
                            return iy.fromResult(this.cast())
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
            (g || (g = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new ip(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var iy = function() {
                    function e(t) {
                        ia(this, e), iu(this, "promise", void 0), this.promise = t
                    }
                    return il(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return io(function() {
                                    var r, n;
                                    return is(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return n = ip.bind, [4, t(e.value)];
                                            case 1:
                                                return r = new(n.apply(ip, [void 0, o.sent()])), [3, 3];
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
                                return io(function() {
                                    var r, n;
                                    return is(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return n = id.bind, [4, t(e.error)];
                                            case 1:
                                                return r = new(n.apply(id, [void 0, o.sent()])), [3, 3];
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
                                return ic(n, e) ? n.promise : n
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(r) {
                                if (r.isOk()) return r.cast();
                                var n = t(r.error);
                                return ic(n, e) ? n.promise : n
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
                                return new ip(e)
                            }).catch(function(e) {
                                return new id(r(e))
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
                            return ic(t, e) ? t : ic(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                                return e.fromPromiseResult(t.apply(void 0, function(e) {
                                    if (Array.isArray(e)) return it(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return it(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return it(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(g.all))
                        }
                    }]), e
                }(),
                ih = function(e) {
                    return new ip(e)
                },
                im = function(e) {
                    return new id(e)
                };

            function ib(e, t, r) {
                return (ib = iO() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && ig(o, r.prototype), o
                }).apply(null, arguments)
            }

            function iv(e) {
                return (iv = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ig(e, t) {
                return (ig = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function iw(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (iw = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return ib(e, arguments, iv(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), ig(r, e)
                })(e)
            }

            function iO() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (iO = function() {
                    return !!e
                })()
            }
            iw(Error);
            var iP = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e) {
                        var r, n, o, a, i;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return n = t, o = [e.message, {
                            cause: e
                        }], n = iv(n), r = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, iO() ? Reflect.construct(n, o || [], iv(this).constructor) : n.apply(this, o)), i = void 0, (a = "cause") in r ? Object.defineProperty(r, a, {
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
                    }), e && ig(t, e), t
                }(iw(Error)),
                iS = function(e, t) {
                    try {
                        return ih(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return im(new iP(e))
                    }
                };

            function ix(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function iA(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ix(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ix(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function iE(e, t) {
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
            var iI = function(e, t) {
                return T.Url.parse("".concat(e.replace(/\/+$/, "")).concat(t)).getOrThrow()
            };

            function ij(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iC(e, t) {
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
                        if ("string" == typeof e) return ij(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ij(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iT = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
                ik = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : j().domain;
                    return iT.includes(t) ? "".concat(e, "-").concat(t.split(".")[0]) : e
                },
                iU = function(e, t) {
                    var r = ["1", "launchmode:".concat(e.launchMode)];
                    return t && r.push("gameinfo:".concat(encodeURIComponent(t))), r.push("launchtime:".concat(String(e.launchTime))), Object.entries(e.otherParams).forEach(function(e) {
                        var t = iC(e, 2),
                            n = t[0],
                            o = t[1];
                        r.push(n === o ? n : "".concat(n, ":").concat(encodeURIComponent(String(o))))
                    }), "".concat(e.protocolName, ":").concat(r.join("+"))
                };

            function iD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iR(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function iN(e, t) {
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
                        if ("string" == typeof e) return iD(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iD(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iL = function(e) {
                    null == (t = document.querySelector("iframe#gamelaunch")) || t.remove();
                    var t, r = document.createElement("iframe");
                    r.id = "gamelaunch", r.className = "hidden", r.src = e, document.body.appendChild(r), window.dispatchEvent(new Event("ProtocolLaunchStartSelenium"))
                },
                iM = function() {
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
                i_ = function(e) {
                    var t, r, n = null != (t = e.installState) ? t : iM(),
                        o = null != (r = e.openProtocolUrl) ? r : iL,
                        a = function(e) {
                            return {
                                launchMethod: "Protocol",
                                params: e
                            }
                        },
                        i = function(t) {
                            var r;
                            return (r = function() {
                                var r, i, l;
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
                                }(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            if (u.trys.push([0, 5, , 6]), r = iA(function() {
                                                    return iE(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return [4, C.fetch(iI(j().matchmakingApi, "/v1/client-status"), {
                                                                    method: "POST",
                                                                    credentials: "include",
                                                                    headers: {
                                                                        "content-type": "application/json"
                                                                    },
                                                                    body: iS({
                                                                        status: "Unknown"
                                                                    }).value
                                                                })];
                                                            case 1:
                                                                return e.sent().getOrThrow(), [2]
                                                        }
                                                    })
                                                })(), !e.isAuthenticated()) return [3, 2];
                                            return [4, Promise.all([iA(function() {
                                                var e, t, r, n;
                                                return iE(this, function(o) {
                                                    switch (o.label) {
                                                        case 0:
                                                            return [4, C.getUntyped(iI(j().authApi, "/v1/client-assertion/"), {
                                                                credentials: "include"
                                                            })];
                                                        case 1:
                                                            return t = o.sent(), [4, C.fetch(iI(j().authApi, "/v1/authentication-ticket/"), {
                                                                method: "POST",
                                                                credentials: "include",
                                                                headers: {
                                                                    "content-type": "application/json"
                                                                },
                                                                body: iS(null != (e = t.isOk() ? t.value : null) ? e : {}).getOrThrow()
                                                            })];
                                                        case 2:
                                                            if ((r = o.sent()).isErr() || !(n = r.value.headers.get("rbx-authentication-ticket"))) return [2, void 0];
                                                            return [2, n]
                                                    }
                                                })
                                            })(), r])];
                                        case 1:
                                            return i = iN.apply(void 0, [u.sent(), 1])[0], [3, 4];
                                        case 2:
                                            return [4, r];
                                        case 3:
                                            u.sent(), u.label = 4;
                                        case 4:
                                            return o(iU(t, i)), e.onLaunchSucceeded(), e.onEvent("startClientSucceeded", a(t)), n.get() && (e.onEvent("successfulInstall", a(t)), n.set(!1)), [3, 6];
                                        case 5:
                                            return l = u.sent(), e.onLaunchFailed(l), [3, 6];
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
                                        iR(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        iR(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        },
                        l = function(t) {
                            var r, n, o = e.getConfig(),
                                l = (r = function(e) {
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
                                }({}, t), n = n = {
                                    protocolName: ik("roblox-player"),
                                    launchMode: "play",
                                    launchTime: Date.now()
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
                                u = l.otherParams;
                            u.browsertrackerid = e.getBrowserTrackerId(), u.robloxLocale = o.robloxLocale, u.gameLocale = o.gameLocale, o.isOmitPlayerChannelForWinAndMacEnabled && e.isWindowsOrMac() || (u.channel = o.playerChannel), o.isDuarAutoOptInEnabled && !u.LaunchExp && (u.LaunchExp = o.isDuarOptOutDisabled ? "InApp" : "PreferInApp"), e.onEvent("startClientAttempted", a(l));
                            var c = i(l);
                            return e.onLaunchStarted(l, function() {
                                return i(l)
                            }), c
                        },
                        u = function(t, r) {
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
                                return void 0 !== iC(e, 2)[1]
                            })))).map(function(e) {
                                var t = iC(e, 2),
                                    r = t[0],
                                    n = t[1];
                                return "".concat(encodeURIComponent(r), "=").concat(encodeURIComponent(null != n ? n : ""))
                            }).join("&").replace(/%20/g, "+"))
                        };
                    return {
                        joinMultiplayerGame: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: u("RequestGame", e)
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
                                    placelauncherurl: u("RequestFollowUser", e)
                                }
                            })
                        },
                        joinGameInstance: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: u("RequestGameJob", e)
                                },
                                placeId: e.placeId,
                                isPlayTogetherGame: !0 === e.isPlayTogetherGame
                            })
                        },
                        joinPrivateGame: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: u("RequestPrivateGame", e)
                                },
                                placeId: e.placeId
                            })
                        },
                        playTogetherGame: function(e) {
                            return l({
                                otherParams: {
                                    placelauncherurl: u("RequestPlayTogetherGame", e)
                                },
                                placeId: e.placeId,
                                conversationId: e.conversationId
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
                iB = JSON.parse('{"P":["Feature.GameLaunchGuestMode","Common.VisitGame","CommonUI.Controls","Feature.ExperienceDetails","Feature.DownloadLanding"]}');

            function iF(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var iG = {
                    Unknown: 1,
                    WindowsDirectDownload: 2,
                    WindowsStore: 3,
                    MacDirectDownload: 4,
                    AppleAppStore: 5,
                    GooglePlayStore: 6,
                    AmazonAppStore: 7
                },
                iW = {
                    downloadPageHeader: "Heading.DownloadPage",
                    appStoreLinksHeader: "Heading.AppStoreLinks",
                    windowsDownloadLabel: "Action.DownloadWindowsApp",
                    windowsDownloadLink: (0, es.getAbsoluteUrl)("/download/client?os=win"),
                    macDownloadLabel: "Action.DownloadMacApp",
                    macDownloadLink: (0, es.getAbsoluteUrl)("/download/client?os=mac"),
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
                iV = (iF(w = {}, iG.WindowsDirectDownload, {
                    href: iW.windowsDownloadLink,
                    title: iW.windowsDownloadLabel,
                    name: "windows",
                    icon: "icon-filled-microsoft",
                    legacyIcon: "icon-logo-win",
                    isDirectDownload: !0
                }), iF(w, iG.MacDirectDownload, {
                    href: iW.macDownloadLink,
                    title: iW.macDownloadLabel,
                    name: "mac",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !0
                }), iF(w, iG.AmazonAppStore, {
                    href: iW.amazonStoreLink,
                    title: iW.androidAppDownloadLabel,
                    name: "amazonStore",
                    icon: "icon-filled-amazon",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), iF(w, iG.GooglePlayStore, {
                    href: iW.googlePlayStoreLink,
                    title: iW.androidAppDownloadLabel,
                    name: "android",
                    icon: "icon-filled-android",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), iF(w, iG.AppleAppStore, {
                    href: iW.appleAppStoreLink,
                    title: iW.iOSDownloadLabel,
                    name: "iOS",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !1
                }), w),
                iz = function(e) {
                    var t, r = new URLSearchParams(document.location.search).get("downloadType");
                    if (null != r) {
                        var n = iG[r];
                        if (null != n) return n
                    }
                    if (!e) return iG.Unknown;
                    var o = em.getDeviceMeta();
                    return (null == o ? void 0 : o.isIosDevice) ? iG.AppleAppStore : (t = e, /Kindle|Silk|KFAPW|KFARWI|KFASWI|KFFOWI|KFJW|KFMEWI|KFOT|KFSAW|KFSOWI|KFTBW|KFTHW|KFTT|WFFOWI|KFAPWI/i.test(t)) ? iG.AmazonAppStore : (null == o ? void 0 : o.isAndroidDevice) ? iG.GooglePlayStore : em.isMac() ? iG.MacDirectDownload : em.isWindows() ? iG.WindowsDirectDownload : iG.Unknown
                },
                iq = function(e) {
                    (0, ep.sendEventWithTarget)(ep.eventTypes.formInteraction, "downloadV2", {
                        field: "".concat(e, "DownloadLink"),
                        aType: "click"
                    })
                };

            function iH(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var iK = function() {
                var e;

                function t(e, r) {
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    iH(this, "url", void 0), iH(this, "searchParams", void 0), this.url = e, this.searchParams = r
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

            function i$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iJ(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function iY(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iX(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function iQ(e, t) {
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
                }(e, t) || i0(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iZ(e) {
                return function(e) {
                    if (Array.isArray(e)) return i$(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || i0(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i0(e, t) {
                if (e) {
                    if ("string" == typeof e) return i$(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i$(e, t)
                }
            }
            var i1 = function(e) {
                    return eM(new URLSearchParams(e))
                },
                i2 = function(e) {
                    return Array.isArray(e)
                },
                i3 = function(e) {
                    return String(e)
                },
                i6 = ["__proto__", "prototype", "constructor"],
                i5 = function(e) {
                    return i1(iZ(e.entries()).filter(function(e) {
                        var t = iQ(e, 2),
                            r = t[0],
                            n = t[1];
                        return !i6.includes(r) && !i6.includes(n)
                    }))
                },
                i8 = function() {
                    var e, t;

                    function r(e) {
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        iY(this, "searchParams", void 0), this.searchParams = e
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
                            return this.searchParams.has(e, void 0 === t ? void 0 : i3(t))
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(e, t) {
                            var n = i1(this.searchParams);
                            return n.append(e, i3(t)), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(e) {
                            var t = iX(e, URLSearchParams) || iX(e, r) || i2(e) ? e : Object.entries(e);
                            return r.new(iZ(this.searchParams).concat(iZ(t)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(e, t) {
                            var n = i1(this.searchParams);
                            return n.set(e, i3(t)), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(e, t) {
                            var n = void 0 === t ? void 0 : i3(t);
                            if (this.searchParams.has(e, n)) {
                                var o = i1(this.searchParams);
                                return o.delete(e, n), r.fromUnique(o)
                            }
                            return this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var e = i1(this.searchParams);
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
                            if (iX(e, r)) return e;
                            var n = i1((i2(e) ? e : Object.entries(e)).map(function(e) {
                                var t = iQ(e, 2);
                                return [t[0], i3(t[1])]
                            }));
                            return r.fromUnique(t ? i5(n) : n)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return r.fromUnique(t ? i5(e) : i1(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                n = i1(e);
                            return r.fromUnique(t ? i5(n) : n)
                        }
                    }], e && iJ(r.prototype, e), t && iJ(r, t), r
                }();

            function i4(e, t, r) {
                return (i4 = lt() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && i9(o, r.prototype), o
                }).apply(null, arguments)
            }

            function i7(e) {
                return (i7 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function i9(e, t) {
                return (i9 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function le(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (le = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return i4(e, arguments, i7(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), i9(r, e)
                })(e)
            }

            function lt() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (lt = function() {
                    return !!e
                })()
            }
            iY(i8, "empty", i8.fromUnique(i1(""))), le(Error), le(Error);
            var lr = function(e) {
                return eM(new URL(e))
            };

            function ln(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function lo(e) {
                return (lo = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function la(e, t) {
                return (la = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function li() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (li = function() {
                    return !!e
                })()
            }
            var ll = function(e) {
                    var t, r;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e, t) {
                        var r, o;
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        return r = n, o = [e, t], r = lo(r),
                            function(e, t) {
                                var r;
                                if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return e
                            }(this, li() ? Reflect.construct(r, o || [], lo(this).constructor) : r.apply(this, o))
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: n,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && la(n, e), t = [{
                        key: "with",
                        value: function(e) {
                            var t = e.scheme,
                                r = e.host,
                                o = e.port,
                                a = e.path,
                                i = e.searchParams,
                                l = e.fragment;
                            if (null == t && null == r && null == o && null == a && null == i && null == l) return this;
                            var u = lr(this.url);
                            if (null != t && (u.protocol = t), null != r && (u.hostname = r), null != o && (u.port = "number" == typeof o ? o.toString() : o), null != a && (u.pathname = a), null != l && (u.hash = l), null != i) {
                                var c = i8.new(i);
                                return u.search = c.toString(), new n(u, c)
                            }
                            return new n(u, this.searchParams)
                        }
                    }, {
                        key: "withScheme",
                        value: function(e) {
                            var t = lr(this.url);
                            return t.protocol = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withHost",
                        value: function(e) {
                            var t = lr(this.url);
                            return t.hostname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withPort",
                        value: function(e) {
                            var t = lr(this.url);
                            return t.port = "number" == typeof e ? e.toString() : e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(e) {
                            var t = lr(this.url);
                            return t.pathname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(e) {
                            var t = i8.new(e),
                                r = lr(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(e) {
                            var t = this.searchParams.copyAndAppendAll(e),
                                r = lr(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withFragment",
                        value: function(e) {
                            var t = lr(this.url);
                            return t.hash = e, new n(t, this.searchParams)
                        }
                    }], r = [{
                        key: "new",
                        value: function(e) {
                            e.password = "", e.username = "";
                            var t = i8.internalFromUniqueURLSearchParams(eM(e.searchParams));
                            return new n(e, t)
                        }
                    }, {
                        key: "fromURL",
                        value: function(e) {
                            return n.new(lr(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            try {
                                return ih(n.new(eM(new URL(e))))
                            } catch (e) {
                                return im(e)
                            }
                        }
                    }], t && ln(n.prototype, t), r && ln(n, r), n
                }(iK),
                lu = function(e) {
                    return Object.values(iG).some(function(t) {
                        return t === e
                    })
                },
                lc = function(e) {
                    if (null != e) {
                        if ("number" == typeof e) return lu(e) && iV[e] ? e : void 0;
                        var t = iG[e];
                        if (null != t && iV[t]) return t;
                        var r = Number(e);
                        if (Number.isInteger(r) && lu(r) && iV[r]) return r
                    }
                },
                ls = function() {
                    var e, t, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = r.downloadTypeOverride,
                        o = r.translate,
                        a = null != (e = lc(n)) ? e : iz(navigator.userAgent),
                        i = iV[a];
                    if (i) {
                        var l = i.isDirectDownload ? i.href : null != (t = null == o ? void 0 : o(i.href)) ? t : i.href,
                            u = ll.parse(l);
                        if (!u.isErr()) return {
                            downloadType: a,
                            link: i,
                            isDirectDownload: i.isDirectDownload,
                            href: u.value,
                            icon: i.icon,
                            legacyIcon: i.legacyIcon
                        }
                    }
                },
                lf = r(773);
            j().apiGatewayUrl, lf.env.NEXT_PUBLIC_IS_NEXTJS;
            var lp = window.Roblox["core-scripts"].meta.user,
                ld = function() {
                    var e, t, r;
                    return null != (e = null == (r = aQ("RBXEventTrackerV2")) || null == (t = r.value.match(/browserid=([^&]*)/i)) ? void 0 : t[1]) && e
                };

            function ly(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var lh = function(e) {
                return T.Url.parse("".concat(j().authApi.replace(/\/+$/, "")).concat(e)).getOrThrow()
            };

            function lm(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var lb = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? function() {
                var e;
                return (e = function() {
                    var e, t, r, n;
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
                    }(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return [4, C.getUntyped(lh("/v1/client-assertion/"), {
                                    credentials: "include"
                                })];
                            case 1:
                                return t = o.sent(), [4, C.fetch(lh("/v1/authentication-ticket/"), {
                                    method: "POST",
                                    credentials: "include",
                                    headers: {
                                        "content-type": "application/json"
                                    },
                                    body: iS(null != (e = t.isOk() ? t.value : null) ? e : {}).getOrThrow()
                                })];
                            case 2:
                                if ((r = o.sent()).isErr() || !(n = r.value.headers.get("rbx-authentication-ticket"))) return [2, void 0];
                                return [2, n]
                        }
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ly(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ly(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            } : function() {
                var e;
                return (e = function() {
                    var e, t, r;
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
                                return n.trys.push([0, 2, , 3]), [4, R.get({
                                    url: "".concat(j().authApi, "/v1/client-assertion/"),
                                    withCredentials: !0
                                })];
                            case 1:
                                return e = n.sent().data, [3, 3];
                            case 2:
                                return n.sent(), [3, 3];
                            case 3:
                                return n.trys.push([3, 5, , 6]), [4, R.post({
                                    url: "".concat(j().authApi, "/v1/authentication-ticket/"),
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
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            lm(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            lm(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };

            function lv(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var lg = function() {
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
                                    if (null == (0, lp.authenticatedUser)()) return [3, 2];
                                    return [4, lb()];
                                case 1:
                                    return e = t.sent(), [3, 3];
                                case 2:
                                    e = void 0, t.label = 3;
                                case 3:
                                    return [2, {
                                        authTicket: e,
                                        btId: ld() || void 0
                                    }]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = e.apply(t, r);

                            function i(e) {
                                lv(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                lv(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                lw = function(e) {
                    var t, r = e.translate;
                    return (0, eR.jsxs)(A().Fragment, {
                        children: [(0, eR.jsxs)("div", {
                            className: "flex flex-col gap-small",
                            children: [(0, eR.jsx)("h3", {
                                className: "text-label-large content-emphasis padding-none",
                                children: r("Heading.MobileAppDownloadOption")
                            }), (0, eR.jsx)("p", {
                                className: "text-body-medium",
                                children: r("Label.MobileAppQrCode")
                            })]
                        }), (0, eR.jsx)("div", {
                            className: "flex grow justify-center items-center bg-shift-100 radius-medium padding-x-large",
                            children: (0, eR.jsx)("div", {
                                className: "radius-medium padding-small bg-[white]",
                                children: (0, eR.jsx)("img", {
                                    className: "size-2100",
                                    src: "string" == typeof(t = "https://images.rbxcdn.com/6674b8e189bf79c6.png") ? t : t.src,
                                    alt: ""
                                })
                            })
                        })]
                    })
                },
                lO = "deeplink",
                lP = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                    return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
                }),
                lS = ["/share-links"],
                lx = ["ExperienceAffiliate"],
                lA = function(e) {
                    var t;
                    return lS.includes(e.pathname) && lx.includes(null != (t = e.searchParams.get("type")) ? t : "")
                },
                lE = function(e) {
                    try {
                        var t = new URL(e).searchParams.get("referralUrl");
                        if (!t) return null;
                        var r = new URL(decodeURIComponent(t));
                        if (lA(r)) return r.href;
                        return null
                    } catch (e) {
                        return null
                    }
                },
                lI = function(e, t, r) {
                    var n;
                    try {
                        null == (n = window.Roblox.EventStream) || n.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: t,
                            group: lO,
                            action: "create-token-attempt",
                            status_code: r,
                            token: null != e ? e : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (e) {}
                };

            function lj(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var lC = "".concat(j().apiGatewayUrl, "/deferred-deep-link/token-api"),
                lT = function(e) {
                    var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return (t = function() {
                        var t, n, o, a, i, l, u, c;
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
                                    t = r.authTicket, n = r.btId, o = r.downloadSource, a = {
                                        linkId: e,
                                        group: lO
                                    }, t && (a.authTicket = t), n && (a.btId = n), o && (a.downloadSource = o), i = {
                                        withCredentials: !0,
                                        url: "".concat(lC, "/create-token")
                                    }, s.label = 1;
                                case 1:
                                    return s.trys.push([1, 3, , 4]), [4, R.post(i, a)];
                                case 2:
                                    return lI(c = null != (l = (u = s.sent()).data.token) ? l : null, e, u.status), [2, c];
                                case 3:
                                    return s.sent(), [2, null];
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
                                lj(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                lj(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                };

            function lk(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function lU(e) {
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

            function lD(e, t) {
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
            var lR = "u" > typeof window ? window.navigator.userAgent : "",
                lN = /Mac OS X/i.test(lR),
                lL = /Windows NT/i.test(lR);
            /Linux/i.test(lR) && /Android/i.test(lR);
            var lM = /Android/i.test(lR),
                l_ = /iPhone|iPad|iPod/i.test(lR),
                lB = function(e) {
                    var t = e.alt,
                        r = void 0 === t ? "App Icon" : t,
                        n = e.className,
                        o = e.title,
                        a = e.style;
                    return A().createElement("div", {
                        className: "app-icon-bluebg app-icon-".concat(lN ? "mac" : lL ? "windows" : l_ ? "ios" : lM ? "android" : "windows", " ").concat(void 0 === n ? "" : n),
                        role: "img",
                        "aria-label": r,
                        title: (void 0 === o ? "" : o) || r,
                        style: void 0 === a ? {} : a
                    })
                };

            function lF(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function lG(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            lF(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            lF(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function lW(e, t) {
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

            function lV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lz(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function lq(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            lz(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            lz(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function lH(e, t) {
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
                        if ("string" == typeof e) return lV(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lV(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lK(e, t) {
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
            var l$ = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, eR.jsxs)(A().Fragment, {
                        children: [(0, eR.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, eR.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                lJ = "\x01LINK_START\x01",
                lY = "\x01LINK_END\x01",
                lX = new RegExp("".concat(lJ, "|").concat(lY)),
                lQ = function(e) {
                    var t = e.download,
                        r = e.launchGame,
                        n = e.unmount,
                        o = lH((0, x.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = (0, tv.useTranslation)().translate,
                        u = (0, E.useQuery)({
                            queryKey: ["client-status"],
                            queryFn: function() {
                                return lq(function() {
                                    return lK(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, lG(function() {
                                                    return lW(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return [4, R.get({
                                                                    url: "".concat(j().matchmakingApi, "/v1/client-status"),
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
                        return (0, eR.jsx)(nY, {
                            hasCloseAffordance: !0,
                            closeLabel: l("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: n,
                            children: (0, eR.jsxs)(nX, {
                                className: "download-dialog",
                                children: [(0, eR.jsxs)(nQ, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, eR.jsx)(lB, {
                                        className: "size-1600"
                                    }), (0, eR.jsx)(nZ, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? l$(c) : c
                                    })]
                                }), (0, eR.jsx)(n0, {
                                    className: "flex",
                                    children: u ? (0, eR.jsx)(tb, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, eR.jsx)(tb, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return lq(function() {
                                                var e;
                                                return lK(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            try {
                                                                (e = ls()) && iq(e.link.name)
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
                    var s = (0, em.isMac)(),
                        f = s ? (0, es.getAbsoluteUrl)("/download/client?os=mac") : (0, es.getAbsoluteUrl)("/download/client?os=win");
                    return (0, eR.jsx)(nY, {
                        hasCloseAffordance: !0,
                        closeLabel: l("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: n,
                        children: (0, eR.jsx)(nX, {
                            className: "install-dialog",
                            children: (0, eR.jsx)(nQ, {
                                className: "content-default",
                                children: (0, eR.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, eR.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, eR.jsx)(nZ, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: l("Heading.DownloadConfirmation")
                                        }), (0, eR.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(l("Label.FollowInstallSteps"), " ").concat(l("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(f, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, eR.jsx)("div", {}), " ", (0, eR.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, eR.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, eR.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: l("Heading.InstallInstructions")
                                            }), (0, eR.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, eR.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l(s ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, eR.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, eR.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: l("Response.Dialog.ThirdInstruction")
                                                }), (0, eR.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = l("Response.Dialog.FourthInstruction", {
                                                                startLink: lJ,
                                                                endLink: lY
                                                            }),
                                                            t = e.split(lX);
                                                        if (t.length < 3) return e;
                                                        var n = lH(t, 3),
                                                            o = n[0],
                                                            a = n[1],
                                                            i = n[2];
                                                        return (0, eR.jsxs)(A().Fragment, {
                                                            children: [o, (0, eR.jsx)("button", {
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
                                        }), (0, eR.jsx)("div", {}), " ", (0, eR.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, eR.jsx)("div", {}), " ", (0, eR.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, eR.jsx)(lw, {
                                                translate: l
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                },
                lZ = function(e) {
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
                                isDuarAutoOptInEnabled: !!t.isDuarAutoOptInEnabled,
                                isDuarOptOutDisabled: !!t.isDuarOptOutDisabled,
                                isOmitPlayerChannelForWinAndMacEnabled: !!t.isOmitPlayerChannelForWinAndMacEnabled
                            }
                        },
                        getBrowserTrackerId: ld,
                        isAuthenticated: lp.isAuthenticated,
                        isWindowsOrMac: function() {
                            return (0, em.isWindows)() || (0, em.isMac)()
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

            function l0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l1(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function l2(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            l1(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            l1(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function l3(e, t) {
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
                        if ("string" == typeof e) return l0(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l6(e, t) {
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
            var l5 = {
                isInstalling: !1,
                robloxLocale: "",
                gameLocale: "",
                protocolUrlSeparator: "+",
                protocolDetectionEnabled: !1,
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

            function l8(e) {
                return "edit" === e || "plugin" === e || "asset" === e
            }

            function l4() {
                var e = "react-dialog-container",
                    t = document.getElementById(e);
                return t ? (tQ().unmountComponentAtNode(t), t.innerHTML = "") : ((t = document.createElement("div")).id = e, document.body.appendChild(t)), t
            }

            function l7() {
                P().modal.close();
                var e = new S.TranslationResourceProvider,
                    t = e.getTranslationResource("Common.VisitGame"),
                    r = e.getTranslationResource("CommonUI.Controls");
                S.Dialog.open({
                    titleText: t.get("Heading.ErrorStartingGame"),
                    bodyContent: t.get("Response.Dialog.ErrorLaunching"),
                    acceptText: r.get("Action.OK") || "OK",
                    showDecline: !1
                })
            }

            function l9(e) {
                P().modal.close();
                var t = {
                    launchMethod: "Protocol",
                    params: e
                };
                P()(a$).trigger(a$.startClientSucceededEvent, t), l5.isInstalling && (P()(a$).trigger(a$.successfulInstallEvent, t), l5.isInstalling = !1)
            }

            function ue(e) {
                var t = P()("iframe#gamelaunch");
                t.length > 0 && t.remove(), t = P()("<iframe id='gamelaunch' class='hidden'></iframe>").attr("src", e), P()("body").append(t);
                var r = new Event("ProtocolLaunchStartSelenium");
                window.dispatchEvent(r)
            }

            function ut(e) {
                return l2(function() {
                    var t, r, n;
                    return l6(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (o.trys.push([0, 5, , 6]), t = l8(null == e ? void 0 : e.launchMode), r = lG(function() {
                                        return lW(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, R.post({
                                                        url: "".concat(j().matchmakingApi, "/v1/client-status"),
                                                        withCredentials: !0
                                                    }, {
                                                        status: "Unknown"
                                                    })];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    })(), !(S.CurrentUser.isAuthenticated && !t)) return [3, 2];
                                return [4, Promise.all([lG(function() {
                                    var e, t, r;
                                    return lW(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return n.trys.push([0, 2, , 3]), [4, R.get({
                                                    url: "".concat(j().authApi, "/v1/client-assertion/"),
                                                    withCredentials: !0
                                                })];
                                            case 1:
                                                return e = n.sent().data, [3, 3];
                                            case 2:
                                                return n.sent(), [3, 3];
                                            case 3:
                                                return n.trys.push([3, 5, , 6]), [4, R.post({
                                                    url: "".concat(j().authApi, "/v1/authentication-ticket/"),
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
                                return n = l3.apply(void 0, [o.sent(), 1])[0], [3, 4];
                            case 2:
                                return [4, r];
                            case 3:
                                o.sent(), o.label = 4;
                            case 4:
                                var a, i, l, u, c, s, f;
                                return a = n, u = l8(null == e ? void 0 : e.launchMode), c = l5.protocolUrlSeparator, s = "".concat(e.protocolName, ":"), (f = []).push(1), f.push("launchmode:".concat(e.launchMode)), a && (e.protocolName !== l5.protocolNameForStudio || 0 !== a.indexOf("Guest:")) && f.push("gameinfo:".concat(encodeURIComponent(a))), f.push("launchtime:".concat(e.launchTime)), u && S.CurrentUser.isAuthenticated && (f.push("distributorType:".concat("Global")), f.push("userId:".concat(S.CurrentUser.userId))), u && f.push("browser:".concat((0, aH.getCurrentBrowser)())), P().each(e.otherParams, function(e, t) {
                                    e === t ? f.push(e) : f.push("".concat(e, ":").concat(encodeURIComponent(t)))
                                }), s += f.join(c), null == (l = a$.gameLaunchLogger) || null == (i = l.logToConsole) || i.call(l, "launchProtocolUrl: ".concat(JSON.stringify({
                                    url: s,
                                    params: e
                                }))), ue(s), l9(e), [3, 6];
                            case 5:
                                return console.error(o.sent()), l7(), [3, 6];
                            case 6:
                                return [2]
                        }
                    })
                })()
            }

            function ur(e) {
                var t = function(e) {
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
                }({}, e);
                t.launchTime = new Date().getTime(), t.otherParams.browsertrackerid = S.Cookies.getBrowserTrackerId(), t.otherParams.robloxLocale = l5.robloxLocale, t.otherParams.gameLocale = l5.gameLocale, t.protocolName === l5.protocolNameForStudio ? t.otherParams.channel = l5.studioChannel : l5.isOmitPlayerChannelForWinAndMacEnabled && ((0, em.isWindows)() || (0, em.isMac)()) || (t.otherParams.channel = l5.playerChannel), l5.isDuarAutoOptInEnabled && t.protocolName === l5.protocolNameForClient && !t.otherParams.LaunchExp && (l5.isDuarOptOutDisabled ? t.otherParams.LaunchExp = "InApp" : t.otherParams.LaunchExp = "PreferInApp"), P()(a$).trigger(a$.startClientAttemptedEvent, {
                    launchMethod: "Protocol",
                    params: t
                });
                var r = ut(t);
                return l5.showDialog(t), r
            }

            function un() {
                var e = " ";
                return S.Endpoints && S.Endpoints.Urls && (e = S.Endpoints.getAbsoluteUrl("/Game/PlaceLauncher.ashx")), "h" !== e[0] && (e = "http://".concat(window.location.host, "/Game/PlaceLauncher.ashx")), e.replace("placelauncher", "PlaceLauncher")
            }

            function uo(e, t) {
                var r = {
                    request: e,
                    browserTrackerId: S.Cookies.getBrowserTrackerId()
                };
                return P().extend(r, t), "".concat(un(), "?").concat(P().param(r))
            }

            function ua() {
                return l2(function() {
                    var e, t, r;
                    return l6(this, function(n) {
                        switch (n.label) {
                            case 0:
                                var o, a;
                                return e = document.getElementById("downloadInstallerIFrame"), t = "/download/client", e.referrerPolicy = "no-referrer", [4, (o = window.location.toString(), (a = function() {
                                    var e, t, r, n, a;
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
                                                if (e = "", !(t = function(e) {
                                                        var t = lE(e);
                                                        if (t) return t;
                                                        var r = new URL(e);
                                                        return (r.search = "", r.hash = "", lP.some(function(e) {
                                                            return e.test(r.pathname)
                                                        })) ? r.toString() : null
                                                    }(o))) return [2, e];
                                                return n = [t], a = [{}], [4, lg()];
                                            case 1:
                                                return [4, lT.apply(void 0, n.concat([lD.apply(void 0, [lU.apply(void 0, a.concat([i.sent()])), {
                                                    downloadSource: "installer"
                                                }])]))];
                                            case 2:
                                                return (r = i.sent()) && (e = "?".concat("token", "=").concat(r)), [2, e]
                                        }
                                    })
                                }, function() {
                                    var e = this,
                                        t = arguments;
                                    return new Promise(function(r, n) {
                                        var o = a.apply(e, t);

                                        function i(e) {
                                            lk(o, r, n, i, l, "next", e)
                                        }

                                        function l(e) {
                                            lk(o, r, n, i, l, "throw", e)
                                        }
                                        i(void 0)
                                    })
                                })())];
                            case 1:
                                return r = n.sent(), e.src = "".concat(t).concat(r), [2]
                        }
                    })
                })()
            }

            function ui() {
                var e = i_(lZ({
                    state: l5,
                    getPlaceLauncherBaseUrl: un,
                    triggerEvent: function(e, t) {
                        return P()(a$).trigger(a$["".concat(e, "Event")], t)
                    },
                    logToConsole: function(e) {
                        var t, r;
                        return null == (r = a$.gameLaunchLogger) || null == (t = r.logToConsole) ? void 0 : t.call(r, e)
                    },
                    showDialog: function(e, t) {
                        return l5.showDialog(e, t)
                    },
                    closeDialog: function() {
                        return P().modal.close()
                    },
                    showLaunchFailureDialog: l7,
                    openProtocolUrl: ue
                }));
                Object.assign(l5, {
                    joinMultiplayerGame: e.joinMultiplayerGame,
                    followPlayerIntoGame: e.followPlayerIntoGame,
                    joinGameInstance: e.joinGameInstance,
                    joinPrivateGame: e.joinPrivateGame,
                    playTogetherGame: e.playTogetherGame
                })
            }

            function ul() {
                return l2(function() {
                    return l6(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return P()(a$).trigger(a$.manualDownloadEvent, {
                                    launchMethod: "Protocol",
                                    params: {}
                                }), [4, ua()];
                            case 1:
                                return e.sent(), [2]
                        }
                    })
                })()
            }

            function uu(e) {
                switch (S.EnvironmentUrls.domain) {
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
            Object.assign(l5, {
                joinMultiplayerGame: function(e) {
                    var t = l5.protocolNameForClient,
                        r = uo("RequestGame", e),
                        n = !0 === e.isPlayTogetherGame;
                    return ur({
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
                    return l5.avatarParamEnabled && (e.avatar = "avatar"), ur({
                        protocolName: l5.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: e
                    })
                },
                tryAssetInStudio: function(e) {
                    var t = {
                        assetid: e
                    };
                    return l5.avatarParamEnabled && (t.avatar = "avatar"), ur({
                        protocolName: l5.protocolNameForStudio,
                        launchMode: "asset",
                        otherParams: t
                    })
                },
                openPluginInStudio: function(e) {
                    var t = {
                        pluginid: e
                    };
                    l5.avatarParamEnabled && (t.avatar = "avatar"), ur({
                        protocolName: l5.protocolNameForStudio,
                        launchMode: "plugin",
                        otherParams: t
                    })
                },
                editGameInStudio: function(e, t, r) {
                    var n, o, a, i, l, u, c = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                        s = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : "",
                        f = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : "";
                    l5.separateScriptParamsEnabled ? (u = {
                        task: c ? "StartTeamTest" : "EditPlace",
                        placeId: e,
                        universeId: t
                    }, !c && (s && (u.targetInstanceId = s), f && (u.annotationId = f))) : u = {
                        script: (n = e, o = t, a = r, i = "Edit.ashx", l = " ", S.Endpoints && S.Endpoints.Urls && (l = "".concat(S.Endpoints.getAbsoluteUrl("/Game/".concat(i)), "?")), "h" !== l[0] && (l = "http://".concat(window.location.host) + "/Game/".concat(i, "?")), l + P().param({
                            placeId: n,
                            upload: a ? n : "",
                            universeId: o,
                            testMode: !1
                        }))
                    }, l5.avatarParamEnabled && (u.avatar = "avatar"), ur({
                        protocolName: l5.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: u,
                        placeId: e
                    })
                },
                followPlayerIntoGame: function(e) {
                    return ur({
                        protocolName: l5.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: uo("RequestFollowUser", e)
                        }
                    })
                },
                joinGameInstance: function(e) {
                    var t = l5.protocolNameForClient,
                        r = uo("RequestGameJob", e),
                        n = !0 === e.isPlayTogetherGame;
                    return ur({
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
                    return ur({
                        protocolName: l5.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: uo("RequestPrivateGame", e)
                        },
                        placeId: e.placeId
                    })
                },
                playTogetherGame: function(e) {
                    return ur({
                        protocolName: l5.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: uo("RequestPlayTogetherGame", e)
                        },
                        placeId: e.placeId,
                        conversationId: e.conversationId
                    })
                },
                manualDownload: ul,
                attachManualDownloadToLink: function() {
                    return l2(function() {
                        return l6(this, function(e) {
                            return P()("body #GameLaunchManualInstallLink").click(function() {
                                return l2(function() {
                                    return l6(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, ul()];
                                            case 1:
                                                return e.sent(), [2, !1]
                                        }
                                    })
                                })()
                            }), [2]
                        })
                    })()
                },
                startDownload: ua,
                setLocationHref: ue,
                openDesktopUniversalApp: function() {
                    var e = {};
                    e.protocolName = l5.protocolNameForClient, e.launchTime = new Date().getTime(), e.launchMode = "app", e.otherParams = {}, e.otherParams.browsertrackerid = S.Cookies.getBrowserTrackerId(), e.otherParams.robloxLocale = l5.robloxLocale, e.otherParams.gameLocale = l5.gameLocale, e.otherParams.LaunchExp = "InApp", P()(a$).trigger(a$.startClientAttemptedEvent, {
                        launchMethod: "Protocol",
                        params: e
                    });
                    var t = ut(e);
                    return l5.showDialog(e), t
                },
                startDeepLinkFlow: function(e) {
                    var t = l4();
                    (0, tv.renderWithErrorBoundary)((0, eR.jsx)(tv.TranslationProvider, {
                        config: iB.P,
                        children: (0, eR.jsx)(E.QueryClientProvider, {
                            client: tv.queryClient,
                            children: (0, eR.jsx)(lQ, {
                                download: function() {
                                    return l2(function() {
                                        return l6(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return P()(a$).trigger(a$.beginInstallEvent, {
                                                        launchMethod: "Protocol",
                                                        params: {}
                                                    }), l5.isInstalling = !0, [4, ua()];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    })()
                                },
                                launchGame: function() {
                                    return l2(function() {
                                        return l6(this, function(t) {
                                            return ue(e), [2]
                                        })
                                    })()
                                },
                                unmount: function() {
                                    return tQ().unmountComponentAtNode(t)
                                }
                            })
                        })
                    }), t), ue(e)
                },
                showDialog: function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : function() {
                            return ut(e)
                        },
                        r = l4(),
                        n = function() {
                            return tQ().unmountComponentAtNode(r)
                        },
                        o = l8(null == e ? void 0 : e.launchMode);
                    (0, tv.renderWithErrorBoundary)((0, eR.jsx)(tv.TranslationProvider, {
                        config: iB.P,
                        children: (0, eR.jsx)(E.QueryClientProvider, {
                            client: tv.queryClient,
                            children: (0, eR.jsx)(lQ, {
                                download: function() {
                                    return l2(function() {
                                        var t, r;
                                        return l6(this, function(a) {
                                            switch (a.label) {
                                                case 0:
                                                    if (e.placeId && null != (t = window.localStorage.getItem("ref_info"))) {
                                                        window.localStorage.removeItem("ref_info"), r = {};
                                                        try {
                                                            r = JSON.parse(atob(t))
                                                        } catch (e) {}
                                                        e.referredByPlayerId = r[e.placeId]
                                                    }
                                                    if (P()(a$).trigger(a$.beginInstallEvent, {
                                                            launchMethod: "Protocol",
                                                            params: e
                                                        }), l5.isInstalling = !0, !o) return [3, 1];
                                                    return document.getElementById("downloadInstallerIFrame").src = "/download/studio", n(), [3, 3];
                                                case 1:
                                                    return [4, ua()];
                                                case 2:
                                                    a.sent(), a.label = 3;
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                launchGame: function() {
                                    return l2(function() {
                                        return l6(this, function(e) {
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
                            })
                        })
                    }), r)
                },
                showLaunchFailureDialog: l7,
                cleanUpAndLogSuccess: l9,
                startGameWithDeepLinkUrl: function(e, t) {
                    var r = {
                        launchMode: "play",
                        protocolName: l5.protocolNameForClient,
                        placeId: t
                    };
                    l5.showDialog(r), ue(e)
                },
                enableSharedGameLauncher: ui
            }), P()(document).ready(function() {
                a$.setGameLaunchInterface(l5);
                var e = P()("#PlaceLauncherStatusPanel");
                l5.protocolNameForClient = uu("roblox-player"), l5.protocolNameForStudio = uu("roblox-studio"), l5.protocolDetectionEnabled = !0, l5.separateScriptParamsEnabled = !0, l5.avatarParamEnabled = !0, l5.isJoinAttemptIdEnabled = !0, l5.robloxLocale = e.data("protocol-roblox-locale"), l5.gameLocale = e.data("protocol-game-locale");
                var t = e.data("protocol-channel-name");
                "string" == typeof t && "LIVE" !== t.toUpperCase() && (l5.channel = t);
                var r = e.data("protocol-studio-channel-name");
                "string" == typeof r && "LIVE" !== r.toUpperCase() && (l5.studioChannel = r);
                var n = e.data("protocol-player-channel-name");
                "string" == typeof n && "LIVE" !== n.toUpperCase() && (l5.playerChannel = n), l5.logger || void 0 === window.Roblox.ProtocolHandlerLogger || (l5.logger = window.Roblox.ProtocolHandlerLogger), l5.isDuarAutoOptInEnabled = e.data("is-duar-auto-opt-in-enabled"), l5.isDuarOptOutDisabled = e.data("is-duar-opt-out-disabled"), l5.isOmitPlayerChannelForWinAndMacEnabled = e.data("is-omit-player-channel-for-win-and-mac-enabled"), !0 === e.data("is-www-common-game-launcher-enabled") && ui()
            }), Object.assign(window.Roblox, {
                AuthenticationChecker: aq,
                GameLauncher: a$,
                GameLaunchLogger: a2,
                GamePlayEvents: a0,
                ProtocolHandlerClientInterface: l5,
                PlayButton: {
                    usePlayabilityStatus: ec,
                    PlayabilityStatuses: H,
                    launchGame: ej,
                    launchLogin: eC,
                    shouldShowUnplayableButton: eU,
                    DefaultPlayButton: function(e) {
                        var t = e.placeId,
                            r = e.rootPlaceId,
                            n = e.universeId,
                            o = e.privateServerLinkCode,
                            a = e.gameInstanceId,
                            i = e.refetchPlayabilityStatus,
                            l = e.playabilityStatus,
                            u = e.demoModeAvailable,
                            c = e.hideButtonText,
                            s = e.eventProperties,
                            f = void 0 === s ? aN : s,
                            p = e.appsFlyerReferralProperties,
                            d = void 0 === p ? aN : p,
                            y = e.disableLoadingState,
                            h = e.buttonClassName,
                            m = e.redirectPurchaseUrl,
                            b = e.showDefaultPurchaseText,
                            v = e.shouldShowVpcPlayButtonUpsells,
                            g = e.playabilityStatusCtaOverrides,
                            w = e.pageContext,
                            O = e.playOnWebEnabled,
                            P = al(n, t, l === H.PurchaseRequired || l === H.FiatPurchaseRequired),
                            S = P.isLoading,
                            x = P.productInfo,
                            A = P.productDetails,
                            E = u ? (0, eR.jsx)(ag, {
                                universeId: n,
                                placeId: t,
                                rootPlaceId: r,
                                privateServerLinkCode: o,
                                gameInstanceId: a,
                                eventProperties: f,
                                appsFlyerReferralProperties: d
                            }) : null,
                            I = O ? (0, eR.jsx)(aw, {
                                placeId: t
                            }) : null;
                        switch (l) {
                            case void 0:
                                if (!y) return (0, eR.jsx)(tC, {
                                    buttonClassName: h
                                });
                                return (0, eR.jsx)(aM, {
                                    universeId: n,
                                    placeId: t,
                                    rootPlaceId: r,
                                    privateServerLinkCode: o,
                                    gameInstanceId: a,
                                    status: H.Playable,
                                    eventProperties: f,
                                    appsFlyerReferralProperties: d,
                                    disableLoadingState: y,
                                    buttonClassName: h,
                                    pageContext: w
                                });
                            case H.GuestProhibited:
                            case H.Playable:
                                var j = null == g ? void 0 : g[l];
                                if (void 0 !== j) return O ? aR(j, I) : j;
                                var C = (0, eR.jsx)(aM, {
                                    universeId: n,
                                    placeId: t,
                                    rootPlaceId: r,
                                    privateServerLinkCode: o,
                                    gameInstanceId: a,
                                    status: l,
                                    eventProperties: f,
                                    appsFlyerReferralProperties: d,
                                    disableLoadingState: y,
                                    buttonClassName: h,
                                    pageContext: w
                                });
                                return O ? aR(C, I) : C;
                            case H.ContextualPlayabilityUnverifiedSeventeenPlusUser:
                            case H.ContextualPlayabilityAgeCheckRequired:
                                return D(er.ActionNeeded), (0, eR.jsx)(aI, {
                                    universeId: n,
                                    buttonClassName: h,
                                    playabilityStatus: l,
                                    pageContext: w
                                });
                            case H.PurchaseRequired:
                            case H.FiatPurchaseRequired:
                                var T = l === H.FiatPurchaseRequired ? !!(null == A ? void 0 : A.fiatPurchaseData) : !!(null == x ? void 0 : x.isForSale);
                                if (!S && !T) return D(er.Unplayable), aR((0, eR.jsx)(aO, {
                                    hideButtonText: c,
                                    buttonClassName: h
                                }), E);
                                return aR((0, eR.jsx)(ab, {
                                    refetchPlayabilityStatus: i,
                                    universeId: n,
                                    placeId: t,
                                    hideButtonText: c,
                                    buttonClassName: h,
                                    redirectPurchaseUrl: m,
                                    playabilityStatus: l,
                                    showDefaultPurchaseText: b,
                                    pageContext: w
                                }), E, !S);
                            case H.FiatPurchaseDeviceRestricted:
                            case H.ContextualPlayabilityRegionalAvailability:
                                return D(er.Unplayable), aR((0, eR.jsx)(aO, {
                                    hideButtonText: c,
                                    buttonClassName: h
                                }), E);
                            case H.ContextualPlayabilityAgeRecommendationParentalControls:
                                if (v) return D(er.ActionNeeded), (0, eR.jsx)(an, {
                                    universeId: n,
                                    buttonClassName: h,
                                    placeId: t,
                                    rootPlaceId: r,
                                    privateServerLinkCode: o,
                                    gameInstanceId: a,
                                    eventProperties: f,
                                    appsFlyerReferralProperties: d,
                                    pageContext: w
                                });
                                return D(er.Unplayable), (0, eR.jsx)(aO, {
                                    hideButtonText: c,
                                    buttonClassName: h
                                });
                            case H.ContextualPlayabilityRequireParentApproval:
                                if (v) return D(er.ActionNeeded), (0, eR.jsx)(tj, {
                                    universeId: n,
                                    buttonClassName: h,
                                    pageContext: w
                                });
                                return D(er.Unplayable), (0, eR.jsx)(aO, {
                                    hideButtonText: c,
                                    buttonClassName: h
                                });
                            case H.UnplayableOtherReason:
                            case H.GameUnapproved:
                            case H.IncorrectConfiguration:
                            case H.UniverseRootPlaceIsPrivate:
                            case H.InsufficientPermissionFriendsOnly:
                            case H.InsufficientPermissionGroupOnly:
                            case H.DeviceRestricted:
                            case H.UnderReview:
                            case H.AccountRestricted:
                            case H.TemporarilyUnavailable:
                            case H.ComplianceBlocked:
                            case H.ContextualPlayabilityRegionalCompliance:
                            case H.ContextualPlayabilityAgeGated:
                            case H.PlaceHasNoPublishedVersion:
                            case H.ContextualPlayabilityUnrated:
                            case H.ContextualPlayabilityAgeGatedByDescriptor:
                            case H.ContextualPlayabilityExperienceBlockedParentalControls:
                            case H.ContextualPlayabilityCoreGated:
                            case H.ContextualPlayabilityPlaytestDisabled:
                            case H.ContextualPlayabilityTrustedFriendRequired:
                            default:
                                return D(er.Unplayable), (0, eR.jsx)(aO, {
                                    hideButtonText: c,
                                    buttonClassName: h
                                })
                        }
                    },
                    PlayButton: aM,
                    PurchaseButton: ab,
                    Error: a_,
                    ContextualMessage: aW
                }
            }), P()(document).ready(function() {
                ie();
                var e = (0, S.DeviceMeta)();
                (e.isUWPApp || e.isUniversalApp) && (az.isJoinAttemptIdEnabled = !0, window.Roblox.AppHybridClientInterface = az, a$.setGameLaunchInterface(az)), a$.setGameLaunchLogger(a2)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("GameLaunch");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/gameLaunch-e73fbed2147b9893.js.map