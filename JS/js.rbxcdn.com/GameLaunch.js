! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "557c09d1652583bb1bb6f243410e22a843f5ba1d"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "9c60989b-5a20-4fdb-83ad-cd3bf7dbcdfb", e._sentryDebugIdIdentifier = "sentry-dbid-9c60989b-5a20-4fdb-83ad-cd3bf7dbcdfb")
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
                            return x(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return I(e).length;
                        default:
                            if (a) return o ? -1 : x(e).length;
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

                function P(e, t, r, n, o, a) {
                    if (!u.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > o || t < a) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function S(e, t, r, n, o, a) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function E(e, t, r, n, o) {
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
                            return o = t, a = r, T(x(e, this.length - o), this, o, a);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return i = t, l = r, T(function(e) {
                                for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                                return t
                            }(e), this, i, l);
                        case "base64":
                            return u = t, c = r, T(I(e), this, u, c);
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

                function x(e, t) {
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

                function I(e) {
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
                    P = "browser",
                    S = "browser",
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
                        arch: P,
                        execPath: S,
                        execArgv: E
                    };
                t.addListener = a.exports.addListener, t.arch = P, t.argv = a.exports.argv, t.binding = g, t.browser = v, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = A, t.dlopen = b, t.emit = a.exports.emit, t.emitWarning = b, t.env = a.exports.env, t.execArgv = E, t.execPath = S, t.exit = b, t.features = w, t.kill = b, t.listeners = a.exports.listeners, t.memoryUsage = b, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = O, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = b, t.uvCounters = b, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = A
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
            var e, t, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v, g, w, O, P, S, E, A, j, x, I, T = window.jQuery,
                C = r.n(T),
                k = window.Roblox,
                N = window.React,
                D = r.n(N),
                R = window.TanstackQuery,
                _ = window.Roblox["core-scripts"].environmentUrls,
                L = r.n(_),
                U = window.Roblox["core-lib"].http.index,
                B = window.Roblox["core-lib"].url.index,
                M = function() {
                    return B.Url.parse(L().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                F = function(e, t, r) {
                    try {
                        U.postUntyped(e().withSearchParams(function(e) {
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
                H = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    t.forEach(function(e) {
                        F(M, e)
                    })
                },
                G = window.Roblox["core-scripts"].http.http,
                V = window.Roblox["core-scripts"].dataStore,
                z = r.n(V),
                W = window.Roblox["core-scripts"].guac;

            function q(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function K(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            q(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            q(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function $(e, t) {
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
            var Z = z().gamesDataStore,
                Y = function() {
                    return K(function() {
                        return $(this, function(e) {
                            return [2, (0, W.callBehaviour)("play-button-ui")]
                        })
                    })()
                },
                X = function() {
                    var e = {
                        url: "".concat(L().apiGatewayUrl, "/user-settings-api/v1/user-settings/settings-and-options"),
                        withCredentials: !0
                    };
                    return G.get(e).then(function(e) {
                        return e.data
                    })
                },
                J = function(e) {
                    var t = {
                        url: "".concat(L().apiGatewayUrl, "/experience-guidelines-api/experience-guidelines/get-age-recommendation"),
                        withCredentials: !0
                    };
                    return G.post(t, {
                        universeId: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                Q = function(e, t) {
                    var r = {
                        url: "".concat(L().apiGatewayUrl, "/fiat-paid-access-service/v1/purchase"),
                        withCredentials: !0,
                        retryable: !0
                    };
                    return G.post(r, {
                        rootPlaceId: e,
                        expectedBasePriceId: t
                    }).then(function(e) {
                        var t, r;
                        return null != (r = JSON.parse(null != (t = e.data.checkoutUrl) ? t : "").checkoutUrl) ? r : ""
                    })
                },
                ee = {
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

            function et(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var er = (et(w = {}, ee.UnplayableOtherReason, "UnplayableError.UnplayableOther"), et(w, ee.TemporarilyUnavailable, "UnplayableError.TemporarilyUnavailable"), et(w, ee.GameUnapproved, "UnplayableError.GameUnapproved"), et(w, ee.IncorrectConfiguration, "UnplayableError.IncorrectConfiguration"), et(w, ee.UniverseRootPlaceIsPrivate, "UnplayableError.CreatorHasntMadeAvailable"), et(w, ee.InsufficientPermissionFriendsOnly, "UnplayableError.CreatorHasntMadeAvailable"), et(w, ee.InsufficientPermissionGroupOnly, "UnplayableError.CreatorHasntMadeAvailable"), et(w, ee.DeviceRestricted, "UnplayableError.DeviceRestrictedDefault"), et(w, ee.FiatPurchaseDeviceRestricted, "UnplayableError.FiatPurchaseDeviceRestricted"), et(w, ee.UnderReview, "UnplayableError.Moderated"), et(w, ee.AccountRestricted, "UnplayableError.AccountRestricted"), et(w, ee.ComplianceBlocked, "UnplayableError.ComplianceBlocked"), et(w, ee.ContextualPlayabilityRegionalAvailability, "UnplayableError.ContextualPlayabilityRegionalAvailability"), et(w, ee.ContextualPlayabilityRegionalCompliance, "UnplayableError.ContextualPlayabilityRegionalCompliance"), et(w, ee.ContextualPlayabilityAgeRecommendationParentalControls, "UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls"), et(w, ee.ContextualPlayabilityAgeGated, "UnplayableError.ContextualPlayabilityAgeGated"), et(w, ee.PlaceHasNoPublishedVersion, "UnplayableError.CreatorHasntMadeAvailable"), et(w, ee.ContextualPlayabilityUnrated, "UnplayableError.ContextualPlayabilityUnrated"), et(w, ee.ContextualPlayabilityAgeGatedByDescriptor, "UnplayableError.ContextualPlayabilityAgeGatedByDescriptor"), et(w, ee.ContextualPlayabilityExperienceBlockedParentalControls, "UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls"), et(w, ee.ContextualPlayabilityRequireParentApproval, "UnplayableError.ContextualPlayabilityRequireParentApproval"), w),
                en = "PlayButtonMessage.AgreeToNotice",
                eo = "PlayButtonText.Unlock",
                ea = "PlayButtonText.Unavailable",
                ei = "PlayButtonText.Buy",
                el = "PlayButtonText.PlayDemo",
                eu = "PlayButtonText.PlayOnWeb",
                ec = function(e, t) {
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
                                    et(e, t, r[t])
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
                es = {
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
                ef = {
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
                ep = "gameJoinAgeCheckRequired",
                ed = "gameJoinContentMaturityLock",
                eh = {
                    settingChange: "account_management/SettingsChange",
                    accountManagement: "account_management/AccountManagement"
                };

            function ey(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var em = {
                    playabilityStatus: ee.TemporarilyUnavailable,
                    isPlayable: void 0,
                    unplayableDisplayText: void 0,
                    playableUxTreatment: void 0,
                    upsellUxTreatment: void 0,
                    demoModeAvailable: void 0,
                    privatePlaytestInfo: void 0
                },
                eb = function(e) {
                    var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                        r = (0, R.useQuery)({
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
                                                if (!e) throw H(es.PlayabilityStatusFetchInvalidUniverseId), Error("Invalid universe ID for playability status fetch");
                                                n.label = 1;
                                            case 1:
                                                var o;
                                                return n.trys.push([1, 3, , 4]), [4, (o = [e], K(function() {
                                                    var e;
                                                    return $(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, Z.getPlayabilityStatus(o)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())];
                                            case 2:
                                                return r = n.sent(), [3, 4];
                                            case 3:
                                                throw n.sent(), H(es.PlayabilityStatusFetchFailed), Error("Playability status fetch failed");
                                            case 4:
                                                if (!(null == r ? void 0 : r.playabilityStatus) || void 0 === r.isPlayable) throw H(es.PlayabilityStatusFetchInvalidResponse), Error("Invalid playability status response");
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
                                            ey(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            ey(a, n, o, i, l, "throw", e)
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
                        l = (0, N.useCallback)(function() {
                            i()
                        }, [i]);
                    return (0, N.useEffect)(function() {
                        var e = function(e) {
                            e.persisted && t && l()
                        };
                        return window.addEventListener("pageshow", e),
                            function() {
                                window.removeEventListener("pageshow", e)
                            }
                    }, [l, t]), (0, N.useMemo)(function() {
                        return a ? {
                            playabilityStatus: em.playabilityStatus,
                            isPlayable: em.isPlayable,
                            unplayableDisplayText: em.unplayableDisplayText,
                            playableUxTreatment: em.playableUxTreatment,
                            upsellUxTreatment: em.upsellUxTreatment,
                            demoModeAvailable: em.demoModeAvailable,
                            privatePlaytestInfo: em.privatePlaytestInfo,
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
                ev = window.Roblox["core-scripts"].endpoints,
                eg = window.Roblox["core-scripts"].game,
                ew = window.Roblox["core-scripts"].eventStream,
                eO = window.Roblox["core-scripts"].util.url,
                eP = "function" == typeof crypto.randomUUID,
                eS = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                eE = function() {
                    return eP ? crypto.randomUUID() : eS()
                },
                eA = window.Roblox["core-scripts"].meta.device,
                ej = function() {
                    return null
                };

            function ex(e, t, r) {
                return t = eC(t),
                    function(e, t) {
                        var r;
                        if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, eR() ? Reflect.construct(t, r || [], eC(e).constructor) : t.apply(e, r))
            }

            function eI(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function eT(e, t, r) {
                return (eT = eR() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && eN(o, r.prototype), o
                }).apply(null, arguments)
            }

            function eC(e) {
                return (eC = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ek(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && eN(e, t)
            }

            function eN(e, t) {
                return (eN = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function eD(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (eD = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return eT(e, arguments, eC(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), eN(r, e)
                })(e)
            }

            function eR() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eR = function() {
                    return !!e
                })()
            }

            function e_(e, t, r) {
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
                        return eI(this, t), ex(this, t, arguments)
                    }
                    return ek(t, e), t
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
            var eL = function(e) {
                function t() {
                    return eI(this, t), ex(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                }
                return ek(t, e), t
            }(eD(Error));
            eD(Error);
            var eU = {};

            function eB(e) {
                return e && Object.assign(eU, e), eU
            }

            function eM(e) {
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

            function eH(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eG(e, t) {
                return (void 0 === t ? "undefined" : eH(t)) === "bigint" ? t.toString() : t
            }

            function eV(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }
            var ez = Symbol("evaluating");

            function eW(e, t, r) {
                var n = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (n !== ez) return void 0 === n && (n = ez, n = r()), n
                    },
                    set: function(r) {
                        Object.defineProperty(e, t, {
                            value: r
                        })
                    },
                    configurable: !0
                })
            }
            var eq = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r]
            };

            function eK(e) {
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
                return (delete e.message, "string" == typeof e.error) ? eF(eM({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function e$(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var n = r; n < e.issues.length; n++)
                    if ((null == (t = e.issues[n]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function eZ(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function eY(e, t, r) {
                var n, o, a, i, l, u, c, s, f, p, d, h = eF(eM({}, e), {
                    path: null != (n = e.path) ? n : []
                });
                return e.message || (h.message = null != (o = null != (a = null != (i = null != (l = eZ(null == (s = e.inst) || null == (c = s._zod.def) || null == (u = c.error) ? void 0 : u.call(c, e))) ? l : eZ(null == t || null == (f = t.error) ? void 0 : f.call(t, e))) ? i : eZ(null == (p = r.customError) ? void 0 : p.call(r, e))) ? a : eZ(null == (d = r.localeError) ? void 0 : d.call(r, e))) ? o : "Invalid input"), delete h.inst, delete h.continue, (null == t ? void 0 : t.reportInput) || delete h.input, h
            }
            eV(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var eX = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, eG, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                eJ = e_("$ZodError", eX),
                eQ = e_("$ZodError", eX, {
                    Parent: Error
                });

            function e0(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function e1(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            e0(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            e0(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function e2(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function e3(e, t) {
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
            var e6 = (e = eQ, function(t, r, n, o) {
                    var a = n ? Object.assign(n, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        i = t._zod.run({
                            value: r,
                            issues: []
                        }, a);
                    if (e2(i, Promise)) throw new eL;
                    if (i.issues.length) {
                        var l, u = new(null != (l = null == o ? void 0 : o.Err) ? l : e)(i.issues.map(function(e) {
                            return eY(e, a, eB())
                        }));
                        throw eq(u, null == o ? void 0 : o.callee), u
                    }
                    return i.value
                }),
                e5 = (t = eQ, function(e, r, n, o) {
                    return e1(function() {
                        var a, i, l, u;
                        return e3(this, function(c) {
                            switch (c.label) {
                                case 0:
                                    if (a = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, !e2(i = e._zod.run({
                                            value: r,
                                            issues: []
                                        }, a), Promise)) return [3, 2];
                                    return [4, i];
                                case 1:
                                    i = c.sent(), c.label = 2;
                                case 2:
                                    if (i.issues.length) throw eq(u = new(null != (l = null == o ? void 0 : o.Err) ? l : t)(i.issues.map(function(e) {
                                        return eY(e, a, eB())
                                    })), null == o ? void 0 : o.callee), u;
                                    return [2, i.value]
                            }
                        })
                    })()
                }),
                e8 = (n = eQ, function(e, t, r) {
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
                    if (e2(l, Promise)) throw new eL;
                    return l.issues.length ? {
                        success: !1,
                        error: new(null != n ? n : eJ)(l.issues.map(function(e) {
                            return eY(e, i, eB())
                        }))
                    } : {
                        success: !0,
                        data: l.value
                    }
                }),
                e4 = (o = eQ, function(e, t, r) {
                    return e1(function() {
                        var n, a;
                        return e3(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (n = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, !e2(a = e._zod.run({
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
                                            return eY(e, n, eB())
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
            var e7 = function(e) {
                    var t, r, n = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (r = null == e ? void 0 : e.maximum) ? r : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(n, "$"))
                },
                e9 = {
                    major: 4,
                    minor: 1,
                    patch: 11
                };

            function te(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tt(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tr(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function tn(e) {
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

            function to(e, t) {
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

            function ta(e) {
                return function(e) {
                    if (Array.isArray(e)) return te(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return te(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return te(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ti = e_("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = e9;
                    var r, n = ta(null != (l = e._zod.def.checks) ? l : []);
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
                                var n = e$(e),
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
                                        if (tr(a, Promise) && (null == r ? void 0 : r.async) === !1) throw new eL;
                                        if (l || tr(a, Promise)) l = (null != l ? l : Promise.resolve()).then(function() {
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
                                                            return n || (n = e$(e, o)), [2]
                                                    }
                                                })
                                            }, function() {
                                                var e = this,
                                                    r = arguments;
                                                return new Promise(function(n, o) {
                                                    var a = t.apply(e, r);

                                                    function i(e) {
                                                        tt(a, n, o, i, l, "next", e)
                                                    }

                                                    function l(e) {
                                                        tt(a, n, o, i, l, "throw", e)
                                                    }
                                                    i(void 0)
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === o) return;
                                            n || (n = e$(e, o))
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
                                if (e$(t)) return t.aborted = !0, t;
                                var a = b(r, n, o);
                                if (tr(a, Promise)) {
                                    if (!1 === o.async) throw new eL;
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
                                }, to(tn({}, r), {
                                    skipChecks: !0
                                }));
                                return tr(o, Promise) ? o.then(function(e) {
                                    return v(e, t, r)
                                }) : v(o, t, r)
                            }
                            var a = e._zod.parse(t, r);
                            if (tr(a, Promise)) {
                                if (!1 === r.async) throw new eL;
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
                                var r, n = e8(e, t);
                                return n.success ? {
                                    value: n.data
                                } : {
                                    issues: null == (r = n.error) ? void 0 : r.issues
                                }
                            } catch (r) {
                                return e4(e, t).then(function(e) {
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
                tl = e_("$ZodString", function(e, t) {
                    var r, n, o;
                    ti.init(e, t), e._zod.pattern = null != (r = ta(null != (n = null == e || null == (o = e._zod.bag) ? void 0 : o.patterns) ? n : []).pop()) ? r : e7(e._zod.bag), e._zod.parse = function(r, n) {
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

            function tu(e, t, r, n) {
                if (e.issues.length) {
                    var o;
                    (o = t.issues).push.apply(o, ta(e.issues.map(function(e) {
                        return null != e.path || (e.path = []), e.path.unshift(r), e
                    })))
                }
                void 0 === e.value ? r in n && (t.value[r] = void 0) : t.value[r] = e.value
            }
            var tc = e_("$ZodObject", function(e, t) {
                ti.init(e, t);
                var r, n = Object.getOwnPropertyDescriptor(t, "shape");
                if (!(null == n ? void 0 : n.get)) {
                    var o = t.shape;
                    Object.defineProperty(t, "shape", {
                        get: function() {
                            var e = tn({}, o);
                            return Object.defineProperty(t, "shape", {
                                value: e
                            }), e
                        }
                    })
                }
                var a = eV(function() {
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
                        return to(tn({}, e), {
                            keys: r,
                            keySet: new Set(r),
                            numKeys: r.length,
                            optionalKeys: new Set(d)
                        })
                    }(t)
                });
                eW(e._zod, "propValues", function() {
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
                    if (!((void 0 === (p = o) ? "undefined" : eH(p)) === "object" && null !== p && !Array.isArray(p))) return t.issues.push({
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
                            tr(r, Promise) ? l.push(r.then(function(r) {
                                return tu(r, t, e, o)
                            })) : tu(r, t, e, o)
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
                                    tr(a, Promise) ? e.push(a.then(function(e) {
                                        return tu(e, r, o, t)
                                    })) : tu(a, r, o, t)
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
            });

            function ts(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tf(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tp(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            tf(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            tf(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function td(e) {
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

            function th(e) {
                return function(e) {
                    if (Array.isArray(e)) return ts(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ts(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ts(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ty(e, t) {
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
            var tm = e_("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    ti.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, r) {
                        return e6(e, t, r, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, r) {
                        return e8(e, t, r)
                    }, e.parseAsync = function(t, r) {
                        return tp(function() {
                            return ty(this, function(n) {
                                return [2, e5(e, t, r, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, r) {
                        return tp(function() {
                            return ty(this, function(n) {
                                return [2, e4(e, t, r)]
                            })
                        })()
                    }, e.check = function() {
                        for (var r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
                        return e.clone((r = td({}, t), n = n = {
                            checks: th(null != (o = t.checks) ? o : []).concat(th(i.map(function(e) {
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
                tb = e_("ZodMiniString", function(e, t) {
                    tl.init(e, t), tm.init(e, t)
                }),
                tv = e_("ZodMiniObject", function(e, t) {
                    tc.init(e, t), tm.init(e, t), eW(e, "shape", function() {
                        return t.shape
                    })
                });

            function tg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tw(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tO(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            tw(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            tw(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function tP(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function tS(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function tE(e, t, r) {
                return t && tS(e.prototype, t), r && tS(e, r), e
            }

            function tA(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tj(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function tx(e, t) {
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
            var tI = function() {
                    function e(t) {
                        tP(this, e), tA(this, "value", void 0), this.value = t
                    }
                    return tE(e, [{
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
                            return tC.fromResult(this.cast())
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
                tT = function() {
                    function e(t) {
                        tP(this, e), tA(this, "error", void 0), this.error = t
                    }
                    return tE(e, [{
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
                            return tC.fromResult(this.cast())
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
            (O || (O = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new tI(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var tC = function() {
                    function e(t) {
                        tP(this, e), tA(this, "promise", void 0), this.promise = t
                    }
                    return tE(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return tO(function() {
                                    var r, n;
                                    return tx(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return n = tI.bind, [4, t(e.value)];
                                            case 1:
                                                return r = new(n.apply(tI, [void 0, o.sent()])), [3, 3];
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
                                return tO(function() {
                                    var r, n;
                                    return tx(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return n = tT.bind, [4, t(e.error)];
                                            case 1:
                                                return r = new(n.apply(tT, [void 0, o.sent()])), [3, 3];
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
                                return tj(n, e) ? n.promise : n
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(r) {
                                if (r.isOk()) return r.cast();
                                var n = t(r.error);
                                return tj(n, e) ? n.promise : n
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
                                return new tI(e)
                            }).catch(function(e) {
                                return new tT(r(e))
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
                            return tj(t, e) ? t : tj(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                                return e.fromPromiseResult(t.apply(void 0, function(e) {
                                    if (Array.isArray(e)) return tg(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return tg(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tg(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(O.all))
                        }
                    }]), e
                }(),
                tk = function(e) {
                    return new tI(e)
                },
                tN = function(e) {
                    return new tT(e)
                };

            function tD(e, t, r) {
                return (tD = tU() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && t_(o, r.prototype), o
                }).apply(null, arguments)
            }

            function tR(e) {
                return (tR = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function t_(e, t) {
                return (t_ = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function tL(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (tL = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return tD(e, arguments, tR(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), t_(r, e)
                })(e)
            }

            function tU() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (tU = function() {
                    return !!e
                })()
            }
            tL(Error);
            var tB = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e) {
                        var r, n, o, a, i;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return n = t, o = [e.message, {
                            cause: e
                        }], n = tR(n), r = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, tU() ? Reflect.construct(n, o || [], tR(this).constructor) : n.apply(this, o)), i = void 0, (a = "cause") in r ? Object.defineProperty(r, a, {
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
                    }), e && t_(t, e), t
                }(tL(Error)),
                tM = function(e, t) {
                    try {
                        return tk(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return tN(new tB(e))
                    }
                };

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

            function tG(e, t) {
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
            var tV = function(e, t) {
                    return B.Url.parse("".concat(e.replace(/\/+$/, "")).concat(t)).getOrThrow()
                },
                tz = new tv(td({
                    type: "object",
                    shape: {
                        status: new tb(function(e) {
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
                        }, eK(void 0)))
                    }
                }, eK(void 0))),
                tW = ["Unknown", "BootstrapperInstalling", "AppStarted", "AcquiringGame", "JoiningGame", "InGame", "LeftGame"],
                tq = function() {
                    return tH(function() {
                        var e, t, r, n;
                        return tG(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return [4, U.getUntyped(tV(L().authApi, "/v1/client-assertion/"), {
                                        credentials: "include"
                                    })];
                                case 1:
                                    return t = o.sent(), [4, U.fetch(tV(L().authApi, "/v1/authentication-ticket/"), {
                                        method: "POST",
                                        credentials: "include",
                                        headers: {
                                            "content-type": "application/json"
                                        },
                                        body: tM(null != (e = t.isOk() ? t.value : null) ? e : {}).getOrThrow()
                                    })];
                                case 2:
                                    if ((r = o.sent()).isErr() || !(n = r.value.headers.get("rbx-authentication-ticket"))) return [2, void 0];
                                    return [2, n]
                            }
                        })
                    })()
                };

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
            var tZ = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
                tY = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : L().domain;
                    return tZ.includes(t) ? "".concat(e, "-").concat(t.split(".")[0]) : e
                },
                tX = function(e, t) {
                    var r = ["1", "launchmode:".concat(e.launchMode)];
                    return t && r.push("gameinfo:".concat(encodeURIComponent(t))), r.push("launchtime:".concat(String(e.launchTime))), Object.entries(e.otherParams).forEach(function(e) {
                        var t = t$(e, 2),
                            n = t[0],
                            o = t[1];
                        r.push(n === o ? n : "".concat(n, ":").concat(encodeURIComponent(String(o))))
                    }), "".concat(e.protocolName, ":").concat(r.join("+"))
                };

            function tJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tQ(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
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
                        if ("string" == typeof e) return tJ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tJ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var t3 = function(e) {
                    null == (t = document.querySelector("iframe#gamelaunch")) || t.remove();
                    var t, r = document.createElement("iframe");
                    r.id = "gamelaunch", r.className = "hidden", r.src = e, document.body.appendChild(r), window.dispatchEvent(new Event("ProtocolLaunchStartSelenium"))
                },
                t6 = function() {
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
                t5 = function(e) {
                    var t, r, n = null != (t = e.installState) ? t : t6(),
                        o = null != (r = e.openProtocolUrl) ? r : t3,
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
                                            if (u.trys.push([0, 5, , 6]), r = tH(function() {
                                                    return tG(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return [4, U.fetch(tV(L().matchmakingApi, "/v1/client-status"), {
                                                                    method: "POST",
                                                                    credentials: "include",
                                                                    headers: {
                                                                        "content-type": "application/json"
                                                                    },
                                                                    body: tM({
                                                                        status: "Unknown"
                                                                    }).value
                                                                })];
                                                            case 1:
                                                                return e.sent().getOrThrow(), [2]
                                                        }
                                                    })
                                                })(), !e.isAuthenticated()) return [3, 2];
                                            return [4, Promise.all([tq(), r])];
                                        case 1:
                                            return i = t2.apply(void 0, [u.sent(), 1])[0], [3, 4];
                                        case 2:
                                            return [4, r];
                                        case 3:
                                            u.sent(), u.label = 4;
                                        case 4:
                                            return o(tX(t, i)), e.onLaunchSucceeded(), e.onEvent("startClientSucceeded", a(t)), n.get() && (e.onEvent("successfulInstall", a(t)), n.set(!1)), [3, 6];
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
                                        tQ(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        tQ(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        },
                        l = function(t) {
                            var r = e.getConfig(),
                                n = t1(t0({}, t), {
                                    protocolName: tY("roblox-player"),
                                    launchMode: "play",
                                    launchTime: Date.now()
                                }),
                                o = n.otherParams;
                            o.browsertrackerid = e.getBrowserTrackerId(), o.robloxLocale = r.robloxLocale, o.gameLocale = r.gameLocale, r.isOmitPlayerChannelForWinAndMacEnabled && e.isWindowsOrMac() || (o.channel = r.playerChannel), r.isDuarAutoOptInEnabled && !o.LaunchExp && (o.LaunchExp = r.isDuarOptOutDisabled ? "InApp" : "PreferInApp"), e.onEvent("startClientAttempted", a(n));
                            var l = i(n);
                            return e.onLaunchStarted(n, function() {
                                return i(n)
                            }), l
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
                                return void 0 !== t$(e, 2)[1]
                            })))).map(function(e) {
                                var t = t$(e, 2),
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
                t8 = function(e) {
                    return e
                },
                t4 = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                t7 = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? t8(e.toString()) : null
                },
                t9 = function(e) {
                    var t = t4(e);
                    return null == t ? null : t7(t)
                },
                re = "blackbird",
                rt = function(e) {
                    var t, r, n, o, a = null != (t = e.userid) ? t : e.user,
                        i = null == a ? void 0 : null != (r = t9(a)) ? r : void 0;
                    if ("string" == typeof i) return {
                        isAuthenticated: !0,
                        id: i,
                        userName: null != (n = e.name) ? n : e.userName,
                        displayName: null != (o = e.displayname) ? o : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === re || e.userMembership === re ? re : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                rr = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return rt(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                };

            function rn(e) {
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
            var ro = function() {
                    var e, t, r;
                    return null != ej() || null != (e = null == (r = window.Roblox) || null == (t = r.GameLauncher) ? void 0 : t.isJoinAttemptIdEnabled()) && e
                },
                ra = function() {
                    var e = window.location.href;
                    window.location.href = "/login?".concat(new URLSearchParams({
                        returnUrl: e
                    }).toString())
                },
                ri = function(e, t, r, n) {
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
                        if (void 0 === rr()) return void ra();
                        var y = eE(),
                            m = function(e) {
                                return t0(t1(t0({}, e), {
                                    joinAttemptId: null != y ? y : eE()
                                }), i ? {
                                    joinAttemptOrigin: i
                                } : {})
                            },
                            b = function(e) {
                                var t, r, u = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                (0, ew.sendEventWithTarget)(o, a, rn((t = rn({}, l), r = r = {
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
                                })), (0, ew.sendGamePlayEvent)(i, e, void 0, y, n)
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
                rl = function(e, t, r) {
                    var n = ej();
                    null == n ? (0, eg.launchGame)(e, t, r) : ri(n, e, t, r)
                },
                ru = globalThis.window,
                rc = void 0 === ru ? void 0 : ru,
                rs = function(e) {
                    var t, r = e.featureName,
                        n = e.redirectLink,
                        o = e.ampFeatureCheckData,
                        a = void 0 === o ? [] : o,
                        i = e.isAsyncCall,
                        l = void 0 === i || i,
                        u = e.usePrologue,
                        c = void 0 !== u && u,
                        s = e.ampRecourseData,
                        f = void 0 === s ? null : s,
                        p = e.featureSpecificData,
                        d = e.namespace,
                        h = e.wizardIntent;
                    return t = function(e) {
                        return {
                            featureName: r,
                            redirectLink: null != n ? n : null,
                            ampFeatureCheckData: a,
                            isAsyncCall: l,
                            usePrologue: c,
                            ampRecourseData: f,
                            featureSpecificData: null != p ? p : null,
                            namespace: null != d ? d : null,
                            wizardIntent: null != h ? h : null,
                            closeCallback: function(t) {
                                e("Granted" === t)
                            }
                        }
                    }, new Promise(function(e) {
                        var r = new CustomEvent("StartAccessManagementUpsell", {
                            cancelable: !0,
                            detail: t(e)
                        });
                        window.dispatchEvent(r) && e(!1)
                    })
                },
                rf = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS,
                rp = function() {
                    if (rf) return rs;
                    var e = null == rc ? void 0 : rc.Roblox.AccessManagementUpsellV2Service;
                    return e && function(t) {
                        return e.startAccessManagementUpsell(t)
                    }
                };

            function rd(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rh(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function ry(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            rh(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            rh(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function rm(e) {
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
                if (e) {
                    if ("string" == typeof e) return rd(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rd(e, t)
                }
            }

            function rv(e, t) {
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
            var rg = {
                pid: "experiencestart_mobileweb",
                is_retargeting: "false"
            };

            function rw(e) {
                if (!ro()) return {};
                var t = e.joinAttemptOrigin,
                    r = e.joinAttemptId;
                return {
                    joinAttemptId: r = "string" == typeof r ? r : eE(),
                    joinAttemptOrigin: t
                }
            }

            function rO(e, t, r, n) {
                var o = rm({
                    placeId: t
                }, e, rw(e), r, null == n ? {} : {
                    actionType: n
                });
                return (0, ew.sendEventWithTarget)("playGameClicked", "click", o), o
            }

            function rP(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = "".concat(L().websiteUrl, "/games/start?placeid=").concat(e);
                if (ro()) {
                    var n = rw(t),
                        o = n.joinAttemptId,
                        a = n.joinAttemptOrigin;
                    "string" == typeof o && o.length > 0 && (r += "&joinAttemptId=".concat(o), "string" == typeof a && a.length > 0 && (r += "&joinAttemptOrigin=".concat(a)))
                }
                var i = t.launchData,
                    l = t.eventId;
                return "string" == typeof i && i.length > 0 && (r += "&launchData=".concat(i)), "string" == typeof l && l.length > 0 && (r += "&eventId=".concat(l)), encodeURIComponent(r)
            }
            var rS = function(e, t, r, n) {
                    var o = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : {},
                        a = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {},
                        i = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : {},
                        l = arguments.length > 7 ? arguments[7] : void 0,
                        u = (0, eA.getDeviceMeta)();
                    if ((null == u ? void 0 : u.isIosDevice) || (null == u ? void 0 : u.isAndroidDevice) || (0, eA.isIos13Ipad)() || (null == u ? void 0 : u.isChromeOs)) {
                        var c = rO(o, e, a, l),
                            s = rP(e, c),
                            f = (0, eO.composeQueryString)(rm({}, rg, i));
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
                        }()[e]), rl((0, eg.buildPlayGameProperties)(t, e, n, void 0, r, p, a), ec(e, o), l), window.localStorage.getItem("ref_info") && window.localStorage.removeItem("ref_info")
                    }
                },
                rE = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = (0, eA.getDeviceMeta)();
                    if ((null == r ? void 0 : r.isIosDevice) || (null == r ? void 0 : r.isAndroidDevice) || (0, eA.isIos13Ipad)() || (null == r ? void 0 : r.isChromeOs)) {
                        var n = rO({}, e, {}),
                            o = rP(e, n),
                            a = (0, eO.composeQueryString)(rm({}, rg, t));
                        window.open("https://ro.blox.com/Ebh5?".concat(a, "&af_dp=").concat(o, "&af_web_dp=").concat(o, "&deep_link_value=").concat(o), "_self")
                    } else rl((0, eg.buildPlayGameProperties)(void 0, e), ec(e, {}))
                },
                rA = function(e) {
                    var t = e.context,
                        r = e.pageContext;
                    return ry(function() {
                        var e, n, o, a;
                        return rv(this, function(i) {
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
                                    }, [4, null == (n = rp()) ? void 0 : n(o)];
                                case 1:
                                    return [2, null != (e = i.sent()) && e];
                                case 2:
                                    throw a = i.sent(), H(es.PlayButtonUpsellAgeRestrictionVerificationError), a;
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                rj = function(e, t) {
                    try {
                        var r, n, o = null == (n = (r = new URLSearchParams(window.location.search), function(e) {
                            if (Array.isArray(e)) return rd(e)
                        }(r) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rb(r) || function() {
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
                            }(e) || rb(e, 1) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0];
                            return "sharelinksourcetype" === t.toLowerCase()
                        })) ? void 0 : n[1];
                        if ((null == o ? void 0 : o.toLowerCase()) !== "experiencedetails") return;
                        (0, ew.sendEventWithTarget)("shareLinkGameJoin", "GamePlayButtonWeb", {
                            placeId: e,
                            universeId: t
                        }, ew.targetTypes.WWW)
                    } catch (e) {}
                },
                rx = function(e, t) {
                    return void 0 !== e && e !== ee.Playable && e !== ee.GuestProhibited && e !== ee.PurchaseRequired && e !== ee.ContextualPlayabilityUnverifiedSeventeenPlusUser && e !== ee.FiatPurchaseRequired && e !== ee.ContextualPlayabilityAgeCheckRequired && (e !== ee.ContextualPlayabilityAgeRecommendationParentalControls && e !== ee.ContextualPlayabilityRequireParentApproval || !t) && !0
                },
                rI = function(e, t, r, n) {
                    (0, ew.sendEvent)({
                        name: ef.eventName,
                        type: ef.eventName,
                        context: ew.eventTypes.formInteraction
                    }, {
                        universeId: e,
                        upsellName: t,
                        playabilityStatus: r,
                        pg: n
                    })
                },
                rT = window.ReactJSX,
                rC = r(611),
                rk = r.n(rC),
                rN = function() {
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
                rD = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                rR = function(e) {
                    var t = e.className;
                    return D().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: rN("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                r_ = function(e) {
                    var t = e.width,
                        r = e.height;
                    return D().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, D().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function rL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rU(e) {
                if (Array.isArray(e)) return e
            }

            function rB() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rM(e, t) {
                if (e) {
                    if ("string" == typeof e) return rL(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rL(e, t)
                }
            }
            var rF = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                rH = D().forwardRef(function(e, t) {
                    var r, n = rU(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rM(r) || rB(),
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
                        s = (rU(a) || function(e) {
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
                        }(a) || rM(a, 1) || rB())[0];
                    return D().createElement("span", function(e) {
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
                        className: rN("grow-0 shrink-0 basis-auto icon", i, rF[void 0 === l ? "Medium" : l], u)
                    }, c))
                });

            function rG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rV(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rz() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = rV(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : rV(t[e], null)
                        }
                    }
                }
            }

            function rW() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return N.useCallback(rz.apply(void 0, function(e) {
                    if (Array.isArray(e)) return rG(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rG(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rG(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function rq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rK(e) {
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

            function r$(e, t) {
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

            function rZ(e, t) {
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

            function rY(e) {
                return function(e) {
                    if (Array.isArray(e)) return rq(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rq(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rq(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rX(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            rH.displayName = "Icon";
            var rJ = Symbol.for("react.lazy"),
                rQ = N[" use ".trim().toString()];

            function r0(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : rX(e)) === "object" && "$$typeof" in e && e.$$typeof === rJ && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : rX(t)) === "object" && null !== t && "then" in t
            }
            var r1 = ((a = N.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rZ(e, ["children"]);
                    if (r0(r) && "function" == typeof rQ && (r = rQ(r._payload)), N.isValidElement(r)) {
                        var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = rK({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, rY(t));
                                        return o.apply(void 0, rY(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = rK({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return rK({}, e, r)
                            }(n, r.props);
                        return r.type !== N.Fragment && (s.ref = t ? rz(t, c) : c), N.cloneElement(r, s)
                    }
                    return N.Children.count(r) > 1 ? N.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), l = a, (u = N.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rZ(e, ["children"]);
                    r0(r) && "function" == typeof rQ && (r = rQ(r._payload));
                    var o = N.Children.toArray(r),
                        a = o.find(r3);
                    if (a) {
                        var i = a.props.children,
                            u = o.map(function(e) {
                                return e !== a ? e : N.Children.count(i) > 1 ? N.Children.only(null) : N.isValidElement(i) ? i.props.children : null
                            });
                        return (0, rT.jsx)(l, r$(rK({}, n), {
                            ref: t,
                            children: N.isValidElement(i) ? N.cloneElement(i, void 0, u) : null
                        }))
                    }
                    return (0, rT.jsx)(l, r$(rK({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), u),
                r2 = Symbol("radix.slottable");

            function r3(e) {
                return N.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === r2
            }

            function r6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r5(e) {
                if (Array.isArray(e)) return e
            }

            function r8() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function r4(e) {
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

            function r7(e, t) {
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

            function r9(e, t) {
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

            function ne(e, t) {
                if (e) {
                    if ("string" == typeof e) return r6(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r6(e, t)
                }
            }
            var nt = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                nr = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                nn = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                no = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                na = (0, N.forwardRef)(function(e, t) {
                    var r, n = r5(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ne(r) || r8(),
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
                        g = r9(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (r5(a) || function(e) {
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
                        }(a) || ne(a, 1) || r8())[0],
                        O = rN("foundation-web-button", s ? "opacity-[0.5]" : [rD, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nr[y], s ? no[b] : nn[b], l),
                        P = r4({
                            textDecoration: "none"
                        }, u),
                        S = function(e) {
                            return D().createElement(D().Fragment, null, D().createElement(rR, null), p && D().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, D().createElement(r_, {
                                width: nt[y],
                                height: nt[y]
                            })), D().createElement("span", {
                                className: rN("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && D().createElement(rH, {
                                name: d,
                                size: y
                            }), D().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var E = r9(g, ["as"]),
                            A = D().Children.only(i);
                        return D().createElement(r1, r7(r4({
                            ref: w
                        }, E), {
                            className: O,
                            style: P,
                            "aria-disabled": s || void 0
                        }), D().cloneElement(A, {}, S(A.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var j = g.href,
                            x = r9(g, ["as", "href"]);
                        return D().createElement("a", r7(r4({
                            ref: w
                        }, x), {
                            "aria-disabled": s,
                            href: s ? void 0 : j,
                            className: O,
                            style: P
                        }), S(i))
                    }
                    g.as;
                    var I = r9(g, ["as"]);
                    return D().createElement("button", r7(r4({
                        ref: w,
                        type: "button"
                    }, I), {
                        disabled: s,
                        className: O,
                        style: P
                    }), S(i))
                }),
                ni = window.Roblox.NavigationService,
                nl = window.Roblox.ExperimentationService,
                nu = r.n(nl),
                nc = "full",
                ns = function(e) {
                    return e === nc && "btn-full-width"
                },
                nf = {
                    display: "flex"
                };

            function np(e, t) {
                var r = t && t.cache ? t.cache : nb,
                    n = t && t.serializer ? t.serializer : ny;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var r, n, o = 1 === e.length ? nd : nh;
                    return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
                })(e, {
                    cache: r,
                    serializer: n
                })
            }

            function nd(e, t, r, n) {
                var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
                    a = t.get(o);
                return void 0 === a && (a = e.call(this, n), t.set(o, a)), a
            }

            function nh(e, t, r) {
                var n = Array.prototype.slice.call(arguments, 3),
                    o = r(n),
                    a = t.get(o);
                return void 0 === a && (a = e.apply(this, n), t.set(o, a)), a
            }
            var ny = function() {
                    return JSON.stringify(arguments)
                },
                nm = function() {
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
                nb = {
                    create: function() {
                        return new nm
                    }
                },
                nv = {
                    variadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, nh.bind(this, e, r, n)
                    },
                    monadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, nd.bind(this, e, r, n)
                    }
                };

            function ng(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nw(e, t, r) {
                return (nw = nE() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && nP(o, r.prototype), o
                }).apply(null, arguments)
            }

            function nO(e) {
                return (nO = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function nP(e, t) {
                return (nP = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function nS(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (nS = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return nw(e, arguments, nO(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), nP(r, e)
                })(e)
            }

            function nE() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (nE = function() {
                    return !!e
                })()
            }
            var nA = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        var n, o, a, i = e;
                        return r && (i += ": " + r), n = t, o = [i], n = nO(n), (a = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, nE() ? Reflect.construct(n, o || [], nO(this).constructor) : n.apply(this, o))).code = e, r && (a.originalMessage = r), a
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && nP(t, e), t
                }(nS(Error)),
                nj = ((c = nj || {}).MISSING_MESSAGE = "MISSING_MESSAGE", c.MISSING_FORMAT = "MISSING_FORMAT", c.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", c.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", c.INVALID_MESSAGE = "INVALID_MESSAGE", c.INVALID_KEY = "INVALID_KEY", c.FORMATTING_ERROR = "FORMATTING_ERROR", c);

            function nx(e, t) {
                return np(e, {
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
                    strategy: nv.variadic
                })
            }

            function nI(e, t) {
                return nx(function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return nw(e, function(e) {
                        if (Array.isArray(e)) return ng(e)
                    }(r) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return ng(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ng(e, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())
                }, t)
            }

            function nT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nC(e) {
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
            var nN = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                nD = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                nR = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                n_ = /^(@+)?(\+|#+)?[rs]?$/g,
                nL = /(\*)(0+)|(#+)(0+)|(0+)/g,
                nU = /^(0+)$/;

            function nB(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(n_, function(e, r, n) {
                    return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
                }), t
            }

            function nM(e) {
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

            function nF(e) {
                var t = nM(e);
                return t || {}
            }

            function nH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nG(e) {
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

            function nV(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function nz(e, t) {
                if (e) {
                    if ("string" == typeof e) return nH(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nH(e, t)
                }
            }
            var nW = ((s = {})[s.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", s[s.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", s[s.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", s[s.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", s[s.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", s[s.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", s[s.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", s[s.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", s[s.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", s[s.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", s[s.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", s[s.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", s[s.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", s[s.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", s[s.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", s[s.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", s[s.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", s[s.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", s[s.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", s[s.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", s[s.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", s[s.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", s[s.INVALID_TAG = 23] = "INVALID_TAG", s[s.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", s[s.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", s[s.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", s);

            function nq(e) {
                return !!(e && (void 0 === e ? "undefined" : nV(e)) === "object" && 0 === e.type)
            }

            function nK(e) {
                return !!(e && (void 0 === e ? "undefined" : nV(e)) === "object" && 1 === e.type)
            }
            var n$ = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                nZ = {
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
                nY = new RegExp("^".concat(n$.source, "*")),
                nX = new RegExp("".concat(n$.source, "*$"));

            function nJ(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var nQ = !!Object.fromEntries,
                n0 = !!String.prototype.trimStart,
                n1 = !!String.prototype.trimEnd,
                n2 = nQ ? Object.fromEntries : function(e) {
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
                                }(l) || nz(l, 2) || function() {
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
                n3 = n0 ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(nY, "")
                },
                n6 = n1 ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(nX, "")
                },
                n5 = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                n8 = function() {
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
                                                    location: nJ(r, this.clonePosition())
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
                                            location: nJ(i, this.clonePosition())
                                        })
                                    } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                        if (60 === o && !this.ignoreTag && n4(this.peek() || 0)) {
                                            var l = this.parseTag(e, t);
                                            if (l.err) return l;
                                            n.push(l.val)
                                        } else {
                                            var u = this.parseLiteral(e, t);
                                            if (u.err) return u;
                                            n.push(u.val)
                                        }
                                    else if (!r) return this.error(26, nJ(this.clonePosition(), this.clonePosition()));
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
                                        location: nJ(r, this.clonePosition())
                                    },
                                    err: null
                                };
                                if (!this.bumpIf(">")) return this.error(23, nJ(r, this.clonePosition()));
                                var o = this.parseMessage(e + 1, t, !0);
                                if (o.err) return o;
                                var a = o.val,
                                    i = this.clonePosition();
                                if (!this.bumpIf("</")) return this.error(27, nJ(r, this.clonePosition()));
                                if (this.isEOF() || !n4(this.char())) return this.error(23, nJ(i, this.clonePosition()));
                                var l = this.clonePosition();
                                return n !== this.parseTagName() ? this.error(26, nJ(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                    val: {
                                        type: 8,
                                        value: n,
                                        children: a,
                                        location: nJ(r, this.clonePosition())
                                    },
                                    err: null
                                } : this.error(23, nJ(i, this.clonePosition()))
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
                                        location: nJ(r, this.clonePosition())
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseLeftAngleBracket",
                            value: function() {
                                var e;
                                return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (n4(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                                    if (Array.isArray(e)) return nH(e)
                                }(r) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || nz(r) || function() {
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
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, nJ(r, this.clonePosition()));
                                if (125 === this.char()) return this.bump(), this.error(2, nJ(r, this.clonePosition()));
                                var n = this.parseIdentifierIfPossible().value;
                                if (!n) return this.error(3, nJ(r, this.clonePosition()));
                                if (this.bumpSpace(), this.isEOF()) return this.error(1, nJ(r, this.clonePosition()));
                                switch (this.char()) {
                                    case 125:
                                        return this.bump(), {
                                            val: {
                                                type: 1,
                                                value: n,
                                                location: nJ(r, this.clonePosition())
                                            },
                                            err: null
                                        };
                                    case 44:
                                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, nJ(r, this.clonePosition()));
                                        return this.parseArgumentOptions(e, t, n, r);
                                    default:
                                        return this.error(3, nJ(r, this.clonePosition()))
                                }
                            }
                        }, {
                            key: "parseIdentifierIfPossible",
                            value: function() {
                                var e, t, r = this.clonePosition(),
                                    n = this.offset(),
                                    o = (e = this.message, n5.lastIndex = n, null != (t = n5.exec(e)[1]) ? t : ""),
                                    a = n + o.length;
                                return this.bumpTo(a), {
                                    value: o,
                                    location: nJ(r, this.clonePosition())
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
                                        return this.error(4, nJ(o, i));
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
                                            var f = n6(s.val);
                                            if (0 === f.length) return this.error(6, nJ(this.clonePosition(), this.clonePosition()));
                                            u = {
                                                style: f,
                                                styleLocation: nJ(c, this.clonePosition())
                                            }
                                        }
                                        var p = this.tryParseArgumentClose(n);
                                        if (p.err) return p;
                                        var d = nJ(n, this.clonePosition());
                                        if (u && u.style.startsWith("::")) {
                                            var h = n3(u.style.slice(2));
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
                                                                return "root" !== n && (t = e.maximize().region), (nZ[t || ""] || nZ[n || ""] || nZ["".concat(n, "-001")] || nZ["001"])[0]
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
                                                        parsedOptions: this.shouldParseSkeletons ? (m = {}, b.replace(nN, function(e) {
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
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, nJ(v, nG({}, v)));
                                        this.bumpSpace();
                                        var g = this.parseIdentifierIfPossible(),
                                            w = 0;
                                        if ("select" !== a && "offset" === g.value) {
                                            if (!this.bumpIf(":")) return this.error(13, nJ(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var O = this.tryParseDecimalInteger(13, 14);
                                            if (O.err) return O;
                                            this.bumpSpace(), g = this.parseIdentifierIfPossible(), w = O.val
                                        }
                                        var P = this.tryParsePluralOrSelectOptions(e, a, t, g);
                                        if (P.err) return P;
                                        var S = this.tryParseArgumentClose(n);
                                        if (S.err) return S;
                                        var E = nJ(n, this.clonePosition());
                                        if ("select" === a) return {
                                            val: {
                                                type: 5,
                                                value: r,
                                                options: n2(P.val),
                                                location: E
                                            },
                                            err: null
                                        };
                                        return {
                                            val: {
                                                type: 6,
                                                value: r,
                                                options: n2(P.val),
                                                offset: w,
                                                pluralType: "plural" === a ? "cardinal" : "ordinal",
                                                location: E
                                            }, err: null
                                        };
                                    default:
                                        return this.error(5, nJ(o, i))
                                }
                            }
                        }, {
                            key: "tryParseArgumentClose",
                            value: function(e) {
                                return this.isEOF() || 125 !== this.char() ? this.error(1, nJ(e, this.clonePosition())) : (this.bump(), {
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
                                        if (!this.bumpUntil("'")) return this.error(11, nJ(r, this.clonePosition()));
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
                                        var t = e.split(nD).filter(function(e) {
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
                                                            if ("string" == typeof e) return nT(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nT(e, void 0)
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
                                                            t = nC(nk(nC({}, t), {
                                                                notation: "scientific"
                                                            }), l.options.reduce(function(e, t) {
                                                                return nC({}, e, nF(t))
                                                            }, {}));
                                                            continue;
                                                        case "engineering":
                                                            t = nC(nk(nC({}, t), {
                                                                notation: "engineering"
                                                            }), l.options.reduce(function(e, t) {
                                                                return nC({}, e, nF(t))
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
                                                            l.options[0].replace(nL, function(e, r, n, o, a, i) {
                                                                if (r) t.minimumIntegerDigits = n.length;
                                                                else if (o && a) throw Error("We currently do not support maximum integer digits");
                                                                else if (i) throw Error("We currently do not support exact integer digits");
                                                                return ""
                                                            });
                                                            continue
                                                    }
                                                    if (nU.test(l.stem)) {
                                                        t.minimumIntegerDigits = l.stem.length;
                                                        continue
                                                    }
                                                    if (nR.test(l.stem)) {
                                                        if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                        l.stem.replace(nR, function(e, r, n, o, a, i) {
                                                            return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : a && i ? (t.minimumFractionDigits = a.length, t.maximumFractionDigits = a.length + i.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                        });
                                                        var u = l.options[0];
                                                        "w" === u ? t = nk(nC({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : u && (t = nC({}, t, nB(u)));
                                                        continue
                                                    }
                                                    if (n_.test(l.stem)) {
                                                        t = nC({}, t, nB(l.stem));
                                                        continue
                                                    }
                                                    var c = nM(l.stem);
                                                    c && (t = nC({}, t, c));
                                                    var s = function(e) {
                                                        var t;
                                                        if ("E" === e[0] && "E" === e[1] ? (t = {
                                                                notation: "engineering"
                                                            }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                                notation: "scientific"
                                                            }, e = e.slice(1)), t) {
                                                            var r = e.slice(0, 2);
                                                            if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !nU.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                            t.minimumIntegerDigits = e.length
                                                        }
                                                        return t
                                                    }(l.stem);
                                                    s && (t = nC({}, t, s))
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
                                            u = nJ(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                        } else break
                                    }
                                    if (i.has(l)) return this.error("select" === t ? 21 : 20, u);
                                    "other" === l && (o = !0), this.bumpSpace();
                                    var p = this.clonePosition();
                                    if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, nJ(this.clonePosition(), this.clonePosition()));
                                    var d = this.parseMessage(e + 1, t, r);
                                    if (d.err) return d;
                                    var h = this.tryParseArgumentClose(p);
                                    if (h.err) return h;
                                    a.push([l, {
                                        value: d.val,
                                        location: nJ(p, this.clonePosition())
                                    }]), i.add(l), this.bumpSpace(), l = (c = this.parseIdentifierIfPossible()).value, u = c.location
                                }
                                return 0 === a.length ? this.error("select" === t ? 15 : 16, nJ(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, nJ(this.clonePosition(), this.clonePosition())) : {
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
                                var l = nJ(n, this.clonePosition());
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

            function n4(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }

            function n7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n9(e, t, r) {
                return t = oa(t),
                    function(e, t) {
                        if (t && ("object" === os(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, op() ? Reflect.construct(t, r || [], oa(e).constructor) : t.apply(e, r))
            }

            function oe(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function ot(e, t, r) {
                return (ot = op() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && ou(o, r.prototype), o
                }).apply(null, arguments)
            }

            function or(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function on(e, t, r) {
                return t && or(e.prototype, t), r && or(e, r), e
            }

            function oo() {
                return (oo = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function oa(e) {
                return (oa = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function oi(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && ou(e, t)
            }

            function ol(e) {
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

            function ou(e, t) {
                return (ou = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function oc(e) {
                return function(e) {
                    if (Array.isArray(e)) return n7(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return n7(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n7(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function os(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function of(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (of = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return ot(e, arguments, oa(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), ou(r, e)
                })(e)
            }

            function op() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (op = function() {
                    return !!e
                })()
            }
            var od = function(e) {
                    function t(e, r, n) {
                        var o;
                        return oe(this, t), (o = n9(this, t, [e])).code = r, o.originalMessage = n, o
                    }
                    return oi(t, e), on(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(of(Error)),
                oh = function(e) {
                    function t(e, r, n, o) {
                        return oe(this, t), n9(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return oi(t, e), t
                }(od),
                oy = function(e) {
                    function t(e, r, n) {
                        return oe(this, t), n9(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return oi(t, e), t
                }(od),
                om = function(e) {
                    function t(e, r) {
                        return oe(this, t), n9(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
                    }
                    return oi(t, e), t
                }(od);

            function ob(e) {
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
            var ov = ((P = function() {
                function e(t) {
                    var r, n = this,
                        o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        a = arguments.length > 2 ? arguments[2] : void 0,
                        i = arguments.length > 3 ? arguments[3] : void 0;
                    if (oe(this, e), this.formatterCache = {
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
                                        if (!(a && y in a)) throw new om(y, l);
                                        var m = a[y];
                                        if (1 === h.type) {
                                            m && "string" != typeof m && "number" != typeof m && (void 0 === m ? "undefined" : os(m)) !== "bigint" || (m = "string" == typeof m || "number" == typeof m || (void 0 === m ? "undefined" : os(m)) === "bigint" ? String(m) : ""), u.push({
                                                type: +("string" != typeof m),
                                                value: m
                                            });
                                            continue
                                        }
                                        if (3 === h.type) {
                                            var b = "string" == typeof h.style ? o.date[h.style] : nK(h.style) ? h.style.parsedOptions : void 0;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, b).format(m)
                                            });
                                            continue
                                        }
                                        if (4 === h.type) {
                                            var v = "string" == typeof h.style ? o.time[h.style] : nK(h.style) ? h.style.parsedOptions : o.time.medium;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, v).format(m)
                                            });
                                            continue
                                        }
                                        if (2 === h.type) {
                                            var g = "string" == typeof h.style ? o.number[h.style] : nq(h.style) ? h.style.parsedOptions : void 0;
                                            if (g && g.scale) {
                                                var w = g.scale || 1;
                                                if ((void 0 === m ? "undefined" : os(m)) === "bigint") {
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
                                                P = h.value,
                                                S = a[P];
                                            if ("function" != typeof S) throw new oy(P, "function", l);
                                            var E = S(e(O, r, n, o, a, i).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(E) || (E = [E]), u.push.apply(u, oc(E.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === h.type) {
                                            var A = m,
                                                j = (Object.prototype.hasOwnProperty.call(h.options, A) ? h.options[A] : void 0) || h.options.other;
                                            if (!j) throw new oh(h.value, m, Object.keys(h.options), l);
                                            u.push.apply(u, oc(e(j.value, r, n, o, a)));
                                            continue
                                        }
                                        if (6 === h.type) {
                                            var x = "=".concat(m),
                                                I = Object.prototype.hasOwnProperty.call(h.options, x) ? h.options[x] : void 0;
                                            if (!I) {
                                                if (!Intl.PluralRules) throw new od('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var T = (void 0 === m ? "undefined" : os(m)) === "bigint" ? Number(m) : m,
                                                    C = n.getPluralRules(r, {
                                                        type: h.pluralType
                                                    }).select(T - (h.offset || 0));
                                                I = (Object.prototype.hasOwnProperty.call(h.options, C) ? h.options[C] : void 0) || h.options.other
                                            }
                                            if (!I) throw new oh(h.value, m, Object.keys(h.options), l);
                                            var k = (void 0 === m ? "undefined" : os(m)) === "bigint" ? Number(m) : m;
                                            u.push.apply(u, oc(e(I.value, r, n, o, a, k - (h.offset || 0))));
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
                            }(c), oo({}, c));
                        this.ast = e.__parse(t, (l = ol({}, s), u = u = {
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
                        return e[t] = (n = r[t], (o = a[t]) ? ol({}, n, o, Object.keys(n).reduce(function(e, t) {
                            return e[t] = ol({}, n[t], o[t]), e
                        }, {})) : n), e
                    }, ol({}, r)) : r), this.formatters = i && i.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: np(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ot(Intl.NumberFormat, oc(t))
                            }, {
                                cache: ob(e.number),
                                strategy: nv.variadic
                            }),
                            getDateTimeFormat: np(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ot(Intl.DateTimeFormat, oc(t))
                            }, {
                                cache: ob(e.dateTime),
                                strategy: nv.variadic
                            }),
                            getPluralRules: np(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ot(Intl.PluralRules, oc(t))
                            }, {
                                cache: ob(e.pluralRules),
                                strategy: nv.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return on(e, null, [{
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
                    r = new n8(e, t = nG({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (r.err) {
                    var n = SyntaxError(nW[r.err.kind]);
                    throw n.location = r.err.location, n.originalMessage = r.err.message, n
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                        else 2 === t.type && nq(t.style) || (3 === t.type || 4 === t.type) && nK(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
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

            function og(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ow(e) {
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

            function oO(e, t) {
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

            function oP(e, t) {
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
                        if ("string" == typeof e) return og(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return og(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oS() {
                for (var e, t, r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
                var u = oP(i, 4),
                    c = (u[0], u[1]),
                    s = u[2],
                    f = u[3];
                if (Array.isArray(c)) throw new nA(nj.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === c ? "undefined" : c && "u" > typeof Symbol && c.constructor === Symbol ? "symbol" : typeof c)) throw new nA(nj.INSUFFICIENT_PATH, void 0);
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
                y.getMessageFormat || (y.getMessageFormat = nx(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new ov(t[0], t[1], t[2], ow({
                        formatters: y
                    }, t[3]))
                }, d.message));
                try {
                    o = y.getMessageFormat(c, b, (e = ov.formats.date, t = ov.formats.time, r = ow({}, null == m ? void 0 : m.dateTime, null == h ? void 0 : h.dateTime), n = {
                        date: ow({}, e, r),
                        time: ow({}, t, r),
                        number: ow({}, null == m ? void 0 : m.number, null == h ? void 0 : h.number)
                    }, v && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            a = void 0;
                        try {
                            for (var i, l = Object.entries(t)[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                                var u = oP(i.value, 2),
                                    c = u[0],
                                    s = u[1];
                                t[c] = ow({
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
                        formatters: oO(ow({}, y), {
                            getDateTimeFormat: function(e, t) {
                                var r;
                                return y.getDateTimeFormat(e, oO(ow({}, t), {
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : v
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new nA(nj.INVALID_MESSAGE, void 0)
                }
                var g = o.format(s);
                return (0, N.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
            }

            function oE(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function oA(e) {
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

            function oj(e, t) {
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

            function ox() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return t.filter(Boolean).join(".")
            }

            function oI(e) {
                return ox(e.namespace, e.key)
            }

            function oT(e) {
                console.error(e)
            }

            function oC(e, t, r, n) {
                var o = ox(n, r);
                if (!t) throw Error(o);
                var a = t;
                return r.split(".").forEach(function(t) {
                    var r = a[t];
                    if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
                    a = r
                }), a
            }
            oS.raw = !0;
            var ok = (0, N.createContext)(void 0);

            function oN(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    a = e.messages,
                    i = e.now,
                    l = e.onError,
                    u = e.timeZone,
                    c = (0, N.useContext)(ok),
                    s = (0, N.useMemo)(function() {
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
                    f = (0, N.useMemo)(function() {
                        return (null == c ? void 0 : c.formatters) || {
                            getDateTimeFormat: nI(Intl.DateTimeFormat, s.dateTime),
                            getNumberFormat: nI(Intl.NumberFormat, s.number),
                            getPluralRules: nI(Intl.PluralRules, s.pluralRules),
                            getRelativeTimeFormat: nI(Intl.RelativeTimeFormat, s.relativeTime),
                            getListFormat: nI(Intl.ListFormat, s.list),
                            getDisplayNames: nI(Intl.DisplayNames, s.displayNames)
                        }
                    }, [s, null == c ? void 0 : c.formatters]),
                    p = (0, N.useMemo)(function() {
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
                        }).formats, p = e.getMessageFallback, d = e.messages, h = e.onError, oj(oA({}, function(e, t) {
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
                            onError: h || oT,
                            getMessageFallback: p || oI
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
                return (0, rT.jsx)(ok.Provider, {
                    value: p,
                    children: t
                })
            }

            function oD() {
                var e = (0, N.useContext)(ok);
                if (!e) throw Error(void 0);
                return e
            }
            var oR = !1,
                o_ = "u" < typeof window;

            function oL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oU = "__FN_nvfToKPAOuiV__",
                oB = new RegExp("".concat(oU, "(\\d+)\\|")),
                oM = function(e, t, r) {
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
                            a = "".concat(oU).concat(r, "|"),
                            i = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        n[e.opening] = a, n[e.closing] = i, o[r] = {
                            start: a,
                            end: i,
                            render: e.render,
                            used: !1
                        }
                    });
                    var a = function(e) {
                            var t = [],
                                r = oB.exec(e);
                            if (!r) return [e];
                            r.index > 0 && t.push(e.slice(0, r.index));
                            var n = null == r[1] ? void 0 : o[r[1]];
                            if (null == n) return null;
                            n.used = !0;
                            var i = e.indexOf(n.end);
                            if (i < r.index + r[0].length) return null;
                            var l = a(e.slice(r.index + r[0].length, i));
                            if (null == l) return null;
                            t.push(n.render(l));
                            var u = e.slice(i + n.end.length);
                            if (u.length > 0) {
                                var c = a(u);
                                if (null == c) return null;
                                t.push.apply(t, function(e) {
                                    if (Array.isArray(e)) return oL(e)
                                }(c) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(c) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return oL(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oL(e, void 0)
                                    }
                                }(c) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                            return t
                        },
                        i = a(e(n));
                    return null == i || Object.values(o).some(function(e) {
                        return !e.used
                    }) ? null : i.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, rT.jsx)(N.Fragment, {
                            children: e
                        }, t)
                    })
                },
                oF = function(e) {
                    return e.replaceAll(".", ":")
                };

            function oH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
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

            function oV(e, t) {
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

            function oz(e, t) {
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
                        if ("string" == typeof e) return oH(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oH(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oW(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function oq() {
                return null != S || (S = "".concat(L().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), S
            }
            var oK = function() {};

            function o$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oZ(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var oY = function(e, t) {
                    return e << 3 | t
                },
                oX = oY(1, 2),
                oJ = oY(2, 2),
                oQ = oY(5, 2),
                o0 = oY(6, 2),
                o1 = oY(8, 2),
                o2 = oY(1, 2),
                o3 = oY(2, 1),
                o6 = oY(3, 0),
                o5 = oY(5, 2);
            oY(1, 2), oY(2, 1), oY(3, 0), oY(4, 2), oY(5, 2), oY(6, 0), oY(8, 2);
            var o8 = oY(4, 0),
                o4 = oY(6, 2),
                o7 = oY(7, 2);
            oY(1, 0), oY(2, 2);
            var o9 = oY(1, 2),
                ae = oY(2, 2),
                at = oY(1, 2);
            oY(1, 2), oY(2, 2), oY(1, 2);
            var ar = new TextEncoder,
                an = function() {
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
                                var t = (void 0 === e ? "undefined" : oZ(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = ar.encode(e);
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

            function ao(e, t, r) {
                var n = new an;
                return n.writeVarint(oY(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function aa(e) {
                var t = new an;
                if (t.writeVarint(o2), t.writeString(e.name), t.writeVarint(o3), t.writeDouble(e.value), t.writeVarint(o6), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new an,
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
                                            if ("string" == typeof e) return o$(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o$(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var i = ao(n, oY(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(oQ), t.writeBytes(i)
                                } else if ("boolean" == typeof o) {
                                    var l = ao(n, oY(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(o0), t.writeBytes(l)
                                } else if ((void 0 === o ? "undefined" : oZ(o)) === "bigint") {
                                    var u = ao(n, oY(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(oJ), t.writeBytes(u)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var c = ao(n, oY(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(oX), t.writeBytes(c)
                                        } else if (Number.isInteger(o)) {
                                    var s = ao(n, oY(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(oJ), t.writeBytes(s)
                                } else {
                                    var f = ao(n, oY(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(o1), t.writeBytes(f)
                                } else {
                                    var p = ao(n, oY(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(oQ), t.writeBytes(p)
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
                    t.writeVarint(o5), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function ai(e, t, r) {
                var n = new an;
                n.writeVarint(o8), n.writeVarint(r);
                var o = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var l, u = e[Symbol.iterator](); !(o = (l = u.next()).done); o = !0) {
                        var c = l.value;
                        n.writeVarint(o4), n.writeBytes(c)
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
                        n.writeVarint(o7), n.writeBytes(y)
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

            function al(e) {
                var t = new an;
                t.writeVarint(o9), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(ae), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new an;
                return n.writeVarint(at), n.writeBytes(r), n.toBytes()
            }
            var au = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function ac(e) {
                return au.test(e)
            }
            var as = [],
                af = !1,
                ap = !1;

            function ad(e, t) {
                var r, n, o, a = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    i = BigInt(Date.now());
                !0 === t || ap || "u" > typeof document && "hidden" === document.visibilityState ? (r = al(ai(a.map(aa), [], i)).buffer, fetch("".concat(oq()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(oK)) : (n = al(ai(a.map(aa), [], i)), (o = function() {
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
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(oK), t.close().catch(oK), r = [], [4, (o = e.readable.getReader()).read()];
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
                            oW(a, r, n, i, l, "next", e)
                        }

                        function l(e) {
                            oW(a, r, n, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(oq()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(oK)
            }

            function ah() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = as[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var a = n.value.splice(0);
                        0 !== a.length && ad(a, !0)
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
            var ay = "WwwCommon",
                am = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), oV(oG({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = oz(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = oz(r, 3),
                                i = a[0],
                                l = a[1],
                                u = a[2],
                                c = o(i, oV(oG({}, null != l ? l : {}), {
                                    severity: "error"
                                }), u);
                            t(i, c)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var a = oz(r, 3),
                                i = a[0],
                                l = a[1],
                                u = a[2],
                                c = o(i, oV(oG({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), u);
                            t(i, c)
                        }
                    }
                }({
                    publish: function(e) {
                        var t, r = Math.max(1, 10),
                            n = 250;

                        function o(e, t) {
                            console.error(e, t)
                        }
                        if (!ac(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                                name: e
                            }),
                            function() {};
                        var a = [];
                        return as.push(a), af || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                                "hidden" === document.visibilityState && ah()
                            }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                                ap = !0, ah()
                            }), af = !0),
                            function(i, l, u) {
                                var c = "".concat(e, "_").concat(i);
                                if (! function(e, t) {
                                        if (!ac(e)) return !1;
                                        if (t) {
                                            var r = !0,
                                                n = !1,
                                                o = void 0;
                                            try {
                                                for (var a, i = Object.keys(t)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                                    var l = a.value;
                                                    if (!ac(l)) return !1
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
                                    }(c, l)) return void o("@rbx/web-telemetry: invalid event name or attribute key", {
                                    name: i,
                                    attributes: l
                                });
                                var s = null != u ? u : 1;
                                if (!Number.isFinite(s)) return void o("@rbx/web-telemetry: value must be a finite number", {
                                    name: i,
                                    attributes: l
                                });
                                var f = l && Object.keys(l).length > 0 ? l : void 0;
                                a.push({
                                    name: c,
                                    attributes: f,
                                    value: s,
                                    timestampMs: BigInt(Date.now())
                                }), a.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), ad(a.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                                    for (t = void 0; a.length > 0;) ad(a.splice(0, r))
                                }, n))
                            }
                    }(ay)
                });
            am.trackCounter;
            var ab = am.trackError;
            am.trackCriticalError;
            var av = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                ag = function(e, t, r) {
                    var n;
                    "u" > typeof window && ab(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = av()) ? n : "unknown"
                    })
                },
                aw = function(e) {
                    var t, r, n, o, a, i, l, u, c, s, f, p, d, h = (t = oF(e), r = {
                        "!": oD().messages
                    }, n = t ? "!.".concat(t) : "!", a = (o = oD()).cache, i = o.formats, l = o.formatters, u = o.getMessageFallback, c = o.locale, s = o.onError, f = o.timeZone, p = r["!"], d = "!" === n ? void 0 : n.slice(2), f || oR || !o_ || (oR = !0, s(new nA(nj.ENVIRONMENT_FALLBACK, void 0))), (0, N.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, r) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var n = r ? oC(e, t, r) : t;
                                    if (!n) throw Error(r);
                                    return n
                                } catch (e) {
                                    return new nA(nj.MISSING_MESSAGE, e.message)
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
                                    a = void 0 === o ? oI : o,
                                    i = e.locale,
                                    l = e.messagesOrError,
                                    u = e.namespace,
                                    c = e.onError,
                                    s = e.timeZone,
                                    f = oE(l, nA);

                                function p(e, t, r, n) {
                                    var o = new nA(t, r);
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
                                        y = oC(i, l, e, u)
                                    } catch (t) {
                                        if (!h) return p(e, nj.MISSING_MESSAGE, t.message, h);
                                        y = h
                                    }
                                    try {
                                        var v, g = ox(u, e);
                                        return oS(g, y, o ? (v = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, N.isValidElement)(o) ? (0, N.cloneElement)(o, {
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
                                        return oE(t, nA) ? (m = t.code, b = t.originalMessage) : (m = nj.FORMATTING_ERROR, b = t.message), p(e, m, b, h)
                                    }
                                }

                                function h(e, t, r, n) {
                                    var o = d(e, t, r, n);
                                    return "string" != typeof o ? p(e, nj.INVALID_MESSAGE, void 0) : o
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
                                        return oC(i, l, e, u)
                                    } catch (t) {
                                        return p(e, nj.MISSING_MESSAGE, t.message)
                                    }
                                }, h.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return oC(i, l, e, u), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, h
                            }(oj(oA({}, e), {
                                messagesOrError: t
                            }))
                    }, [a, l, u, p, d, s, i, c, f]));
                    return (0, N.useMemo)(function() {
                        return Object.assign(function(t, r, n) {
                            var o = oF(t);
                            return void 0 === n || h.has(o) ? h(o, r) : (ag("TranslationKeyNotFound", e, o), n)
                        }, {
                            rich: function(e, t) {
                                return h.rich(oF(e), t)
                            },
                            has: function(e) {
                                return h.has(oF(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
                                    o = oF(t),
                                    a = h.has(o);
                                return a || ag("TranslationKeyNotFound", e, o), a ? h(o, r) : n
                            },
                            html: function(t, r, n) {
                                var o = oF(t);
                                if (!h.has(o)) return ag("TranslationKeyNotFound", e, o), null;
                                var a = oM(function(e) {
                                    return h(o, e)
                                }, r, n);
                                return null == a && ag("TranslationMalformed", e, o), a
                            }
                        })
                    }, [h, e])
                },
                aO = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding", "Feature.Build", "Feature.Friends"];

            function aP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aS = function() {
                    var e = function(e) {
                            if (Array.isArray(e)) return e
                        }(aO) || function(e) {
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
                        }(aO) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return aP(e, 7);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aP(e, 7)
                            }
                        }(aO) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        t = e[0],
                        r = e[1],
                        n = e[2],
                        o = e[3],
                        a = e[4],
                        i = e[5],
                        l = e[6],
                        u = aw(t),
                        c = aw(r),
                        s = aw(n),
                        f = aw(o),
                        p = aw(a),
                        d = aw(i),
                        h = aw(l);
                    return (0, N.useMemo)(function() {
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
                aE = function(e) {
                    var t = e.onButtonClick,
                        r = e.buttonWidth,
                        n = e.buttonClassName,
                        o = aS();
                    return (0, rT.jsxs)(D().Fragment, {
                        children: [(0, rT.jsx)(na, {
                            "data-testid": "play-action-needed-button",
                            variant: "Emphasis",
                            style: nf,
                            className: rk()(ns(void 0 === r ? nc : r), void 0 === n ? "btn-common-play-game-action-needed-lg" : n),
                            onClick: t,
                            children: o(eo)
                        }), (0, rT.jsx)("div", {
                            id: "access-management-upsell-container-v1"
                        })]
                    })
                },
                aA = function(e) {
                    var t = e.universeId,
                        r = e.buttonClassName,
                        n = e.pageContext,
                        o = (0, N.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), H(es.PlayButtonUpsellExperienceApprovalTriggered), rI(t, ef.experienceApprovalUpsellName, ee.ContextualPlayabilityRequireParentApproval, n);
                            var r = rp();
                            r ? r({
                                featureName: "CanApproveExperience",
                                namespace: eh.accountManagement,
                                isAsyncCall: !1,
                                usePrologue: !0,
                                ampRecourseData: {
                                    universeId: t,
                                    experienceManagementAction: "Approve"
                                }
                            }).catch(function() {
                                H(es.PlayButtonUpsellExperienceApprovalError)
                            }) : H(es.PlayButtonUpsellExperienceApprovalError)
                        }, [t, n]);
                    return (0, rT.jsx)(aE, {
                        onButtonClick: o,
                        buttonClassName: r
                    })
                };
            aA.defaultProps = {
                buttonClassName: void 0
            };
            var aj = function(e) {
                    var t = e.buttonClassName,
                        r = e.buttonWidth;
                    return (0, rT.jsx)(na, {
                        "data-testid": "play-button-loading",
                        variant: "Emphasis",
                        isLoading: !0,
                        "aria-label": "Loading",
                        style: nf,
                        className: rk()(ns(void 0 === r ? nc : r), void 0 === t ? "btn-common-play-game-lg" : t)
                    })
                },
                ax = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                aI = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                aT = function(e) {
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
                    return D().createElement("button", function(e) {
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
                        className: rN("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", rD, aI[t], ax[r], n && "radius-circle", o)
                    }, a), D().createElement(rR, null), D().createElement(rH, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function aC(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function ak(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aN(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function aD(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        aN(e, t, r[t])
                    })
                }
                return e
            }

            function aR(e, t) {
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

            function a_(e) {
                return function(e) {
                    if (Array.isArray(e)) return ak(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ak(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ak(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aL() {
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
                            return aD({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return N.useMemo(function() {
                            return aN({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var aU = (null == (E = globalThis) ? void 0 : E.document) ? N.useLayoutEffect : function() {};

            function aB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aM = N[" useId ".trim().toString()] || function() {},
                aF = 0;

            function aH(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = N.useState(aM())) || function(e) {
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
                            if ("string" == typeof e) return aB(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aB(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return aU(function() {
                    e || o(function(e) {
                        return null != e ? e : String(aF++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function aG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aV(e) {
                var t = N.useRef(e);
                return N.useEffect(function() {
                    t.current = e
                }), N.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return aG(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return aG(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aG(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function az(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aW(e, t) {
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
                        if ("string" == typeof e) return az(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return az(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aq = window.RadixUI["react-dismissable-layer"],
                aK = window.RadixUI["react-focus-scope"],
                a$ = window.ReactDOM,
                aZ = r.n(a$);

            function aY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aX(e) {
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

            function aJ(e, t) {
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

            function aQ(e, t) {
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

            function a0(e) {
                return function(e) {
                    if (Array.isArray(e)) return aY(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return aY(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aY(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a1(e) {
                var t, r, n = (t = e, (r = N.forwardRef(function(e, t) {
                        var r = e.children,
                            n = aQ(e, ["children"]);
                        if (N.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = aX({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            a.apply(void 0, a0(t)), o.apply(void 0, a0(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = aX({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return aX({}, e, r)
                                }(n, r.props);
                            return r.type !== N.Fragment && (s.ref = t ? rz(t, c) : c), N.cloneElement(r, s)
                        }
                        return N.Children.count(r) > 1 ? N.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = N.forwardRef(function(e, t) {
                        var r = e.children,
                            o = aQ(e, ["children"]),
                            a = N.Children.toArray(r),
                            i = a.find(a3);
                        if (i) {
                            var l = i.props.children,
                                u = a.map(function(e) {
                                    return e !== i ? e : N.Children.count(l) > 1 ? N.Children.only(null) : N.isValidElement(l) ? l.props.children : null
                                });
                            return (0, rT.jsx)(n, aJ(aX({}, o), {
                                ref: t,
                                children: N.isValidElement(l) ? N.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, rT.jsx)(n, aJ(aX({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var a2 = Symbol("radix.slottable");

            function a3(e) {
                return N.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === a2
            }

            function a6(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function a5(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        a6(e, t, r[t])
                    })
                }
                return e
            }

            function a8(e, t) {
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
            var a4 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = a1("Primitive.".concat(t)),
                    n = N.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, rT.jsx)(i, a8(a5({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), a8(a5({}, e), a6({}, t, n))
            }, {});

            function a7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var a9 = N.forwardRef(function(e, t) {
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
                    }(r = N.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return a7(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a7(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    f = c[1];
                aU(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return p ? aZ().createPortal((0, rT.jsx)(a4.div, (n = function(e) {
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

            function ie(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function it(e, t) {
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
                        if ("string" == typeof e) return ie(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ie(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            a9.displayName = "Portal";
            var ir = function(e) {
                var t, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v = e.present,
                    g = e.children,
                    w = (t = v, a = (o = it(N.useState(), 2))[0], i = o[1], l = N.useRef({}), u = N.useRef(t), c = N.useRef("none"), f = (s = it((r = t ? "mounted" : "unmounted", n = {
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
                    }, N.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], N.useEffect(function() {
                        var e = io(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), aU(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                o = io(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = t
                        }
                    }, [t, p]), aU(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = io(l.current).includes(e.animationName);
                                    if (e.target === a && n && (p("ANIMATION_END"), !u.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (c.current = io(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: N.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : N.Children.only(g),
                    P = rW(w.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((d = O).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? d.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || w.isPresent ? N.cloneElement(O, {
                    ref: P
                }) : null
            };

            function io(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            ir.displayName = "Presence";
            var ia = window.RadixUI["react-focus-guards"],
                ii = function() {
                    return (ii = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function il(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var iu = "right-scroll-bar-position",
                ic = "width-before-scroll-bar";

            function is(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var ip = "u" > typeof window ? N.useLayoutEffect : N.useEffect,
                id = new WeakMap,
                ih = (void 0 === f && (f = {}), (void 0 === p && (p = function(e) {
                    return e
                }), d = [], h = !1, y = {
                    read: function() {
                        if (h) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return d.length ? d[d.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = p(e, h);
                        return d.push(t),
                            function() {
                                d = d.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (h = !0; d.length;) {
                            var t = d;
                            d = [], t.forEach(e)
                        }
                        d = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return d
                            }
                        }
                    },
                    assignMedium: function(e) {
                        h = !0;
                        var t = [];
                        if (d.length) {
                            var r = d;
                            d = [], r.forEach(e), t = d
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), d = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), d
                            }
                        }
                    }
                }).options = ii({
                    async: !0,
                    ssr: !1
                }, f), y),
                iy = function() {},
                im = N.forwardRef(function(e, t) {
                    var r, n, o, a, i = N.useRef(null),
                        l = N.useState({
                            onScrollCapture: iy,
                            onWheelCapture: iy,
                            onTouchMoveCapture: iy
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
                        P = e.gapMode,
                        S = il(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        E = (r = [i, t], n = function(e) {
                            return r.forEach(function(t) {
                                return is(t, e)
                            })
                        }, (o = (0, N.useState)(function() {
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
                        })[0]).callback = n, a = o.facade, ip(function() {
                            var e = id.get(a);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = a.current;
                                t.forEach(function(e) {
                                    n.has(e) || is(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || is(e, o)
                                })
                            }
                            id.set(a, r)
                        }, [r]), a),
                        A = ii(ii({}, S), u);
                    return N.createElement(N.Fragment, null, h && N.createElement(m, {
                        sideCar: ih,
                        removeScrollBar: d,
                        shards: y,
                        noRelative: b,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: c,
                        allowPinchZoom: !!w,
                        lockRef: i,
                        gapMode: P
                    }), s ? N.cloneElement(N.Children.only(f), ii(ii({}, A), {
                        ref: E
                    })) : N.createElement(void 0 === O ? "div" : O, ii({}, A, {
                        className: p,
                        ref: E
                    }), f))
                });
            im.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, im.classNames = {
                fullWidth: ic,
                zeroRight: iu
            };
            var ib = function(e) {
                var t = e.sideCar,
                    r = il(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return N.createElement(n, ii({}, r))
            };
            ib.isSideCarExport = !0;
            var iv = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = A || r.nc;
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
                ig = function() {
                    var e = iv();
                    return function(t, r) {
                        N.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                iw = function() {
                    var e = ig();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                iO = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                iP = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                iS = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [iP(r), iP(n), iP(o)]
                },
                iE = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return iO;
                    var t = iS(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                iA = iw(),
                ij = "data-scroll-locked",
                ix = function(e, t, r, n) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(ij, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(iu, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(ic, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(iu, " .").concat(iu, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(ic, " .").concat(ic, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(ij, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                iI = function() {
                    var e = parseInt(document.body.getAttribute(ij) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                iT = function() {
                    N.useEffect(function() {
                        return document.body.setAttribute(ij, (iI() + 1).toString()),
                            function() {
                                var e = iI() - 1;
                                e <= 0 ? document.body.removeAttribute(ij) : document.body.setAttribute(ij, e.toString())
                            }
                    }, [])
                },
                iC = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    iT();
                    var a = N.useMemo(function() {
                        return iE(o)
                    }, [o]);
                    return N.createElement(iA, {
                        styles: ix(a, !t, o, r ? "" : "!important")
                    })
                },
                ik = !1;
            if ("u" > typeof window) try {
                var iN = Object.defineProperty({}, "passive", {
                    get: function() {
                        return ik = !0, !0
                    }
                });
                window.addEventListener("test", iN, iN), window.removeEventListener("test", iN, iN)
            } catch (e) {
                ik = !1
            }
            var iD = !!ik && {
                passive: !1
            };

            function iR(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var i_ = function(e, t) {
                    if (!iR(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                iL = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && iR(n, ShadowRoot) && (n = n.host), iU(e, n)) {
                            var o = iB(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                iU = function(e, t) {
                    return "v" === e ? i_(t, "overflowY") : i_(t, "overflowX")
                },
                iB = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                iM = function(e, t, r, n, o) {
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
                        var h = iB(e, u),
                            y = h[0],
                            m = h[1] - h[2] - i * y;
                        (y || m) && iU(e, u) && (p += m, d += y);
                        var b = u.parentNode;
                        u = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
                },
                iF = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                iH = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                iG = function(e) {
                    return e && "current" in e ? e.current : e
                },
                iV = 0,
                iz = [],
                iW = (m = function(e) {
                    var t = N.useRef([]),
                        r = N.useRef([0, 0]),
                        n = N.useRef(),
                        o = N.useState(iV++)[0],
                        a = N.useState(iw)[0],
                        i = N.useRef(e);
                    N.useEffect(function() {
                        i.current = e
                    }, [e]), N.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(iG), !0).filter(Boolean);
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
                    var l = N.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                            var o, a = iF(e),
                                l = r.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                s = e.target,
                                f = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = iL(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = iL(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (u || c) && (n.current = o), !o) return !0;
                            var d = n.current || o;
                            return iM(d, t, e, "h" === d ? u : c, !0)
                        }, []),
                        u = N.useCallback(function(e) {
                            if (iz.length && iz[iz.length - 1] === a) {
                                var r = "deltaY" in e ? iH(e) : iF(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (i.current.shards || []).map(iG).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = N.useCallback(function(e, r, n, o) {
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
                        s = N.useCallback(function(e) {
                            r.current = iF(e), n.current = void 0
                        }, []),
                        f = N.useCallback(function(t) {
                            c(t.type, iH(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = N.useCallback(function(t) {
                            c(t.type, iF(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    N.useEffect(function() {
                        return iz.push(a), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", u, iD), document.addEventListener("touchmove", u, iD), document.addEventListener("touchstart", s, iD),
                            function() {
                                iz = iz.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", u, iD), document.removeEventListener("touchmove", u, iD), document.removeEventListener("touchstart", s, iD)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        h = e.inert;
                    return N.createElement(N.Fragment, null, h ? N.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, d ? N.createElement(iC, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, ih.useMedium(m), ib),
                iq = N.forwardRef(function(e, t) {
                    return N.createElement(im, ii({}, e, {
                        ref: t,
                        sideCar: iW
                    }))
                });
            iq.classNames = im.classNames;
            var iK = new WeakMap,
                i$ = new WeakMap,
                iZ = {},
                iY = 0,
                iX = function(e) {
                    return e && (e.host || iX(e.parentNode))
                },
                iJ = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = iX(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    iZ[r] || (iZ[r] = new WeakMap);
                    var a = iZ[r],
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
                                    u = (iK.get(e) || 0) + 1,
                                    c = (a.get(e) || 0) + 1;
                                iK.set(e, u), a.set(e, c), i.push(e), 1 === u && o && i$.set(e, !0), 1 === c && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), iY++,
                        function() {
                            i.forEach(function(e) {
                                var t = iK.get(e) - 1,
                                    o = a.get(e) - 1;
                                iK.set(e, t), a.set(e, o), t || (i$.has(e) || e.removeAttribute(n), i$.delete(e)), o || e.removeAttribute(r)
                            }), --iY || (iK = new WeakMap, iK = new WeakMap, i$ = new WeakMap, iZ = {})
                        }
                },
                iQ = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), iJ(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function i0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i1(e) {
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

            function i2(e, t) {
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

            function i3(e, t) {
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

            function i6(e, t) {
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
                        if ("string" == typeof e) return i0(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var i5 = "Dialog",
                i8 = i6(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return N.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return N.useMemo(function() {
                                    var t, o;
                                    return aN({}, "__scope".concat(e), (t = aD({}, r), o = null != (o = aN({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                        var o = N.createContext(n),
                            a = r.length;
                        r = a_(r).concat([n]);
                        var i = function(t) {
                            var r, n = t.scope,
                                i = t.children,
                                l = aR(t, ["scope", "children"]),
                                u = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                                c = N.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, rT.jsx)(u.Provider, {
                                value: c,
                                children: i
                            })
                        };
                        return i.displayName = t + "Provider", [i, function(r, i) {
                            var l, u = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                                c = N.useContext(u);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, aL.apply(void 0, [n].concat(a_(t)))]
                }(i5), 2),
                i4 = i8[0];
            i8[1];
            var i7 = i6(i4(i5), 2),
                i9 = i7[0],
                le = i7[1],
                lt = function(e) {
                    var t, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v = e.__scopeDialog,
                        g = e.children,
                        w = e.open,
                        O = e.defaultOpen,
                        P = e.onOpenChange,
                        S = e.modal,
                        E = N.useRef(null),
                        A = N.useRef(null),
                        j = i6((c = (u = {
                            prop: w,
                            defaultProp: O,
                            onChange: P
                        }).prop, d = (p = aW((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: f = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, a = aW(o = N.useState(r), 1)[0], i = N.useRef(a), l = aV(n), N.useEffect(function() {
                            i.current !== a && (l(a), i.current = a)
                        }, [a, i, l]), o), 2))[0], h = p[1], m = (y = void 0 !== c) ? c : d, b = aV(f), [m, N.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && b(t)
                            } else h(e)
                        }, [y, c, h, b])]), 2),
                        x = j[0],
                        I = j[1];
                    return (0, rT.jsx)(i9, {
                        scope: v,
                        triggerRef: E,
                        contentRef: A,
                        contentId: aH(),
                        titleId: aH(),
                        descriptionId: aH(),
                        open: void 0 !== x && x,
                        onOpenChange: I,
                        onOpenToggle: N.useCallback(function() {
                            return I(function(e) {
                                return !e
                            })
                        }, [I]),
                        modal: void 0 === S || S,
                        children: g
                    })
                };
            lt.displayName = i5;
            var lr = "DialogTrigger";
            N.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = i3(e, ["__scopeDialog"]),
                    o = le(lr, r),
                    a = rW(t, o.triggerRef);
                return (0, rT.jsx)(a4.button, i2(i1({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": lP(o.open)
                }, n), {
                    ref: a,
                    onClick: aC(e.onClick, o.onOpenToggle)
                }))
            }).displayName = lr;
            var ln = "DialogPortal",
                lo = i6(i4(ln, {
                    forceMount: void 0
                }), 2),
                la = lo[0],
                li = lo[1],
                ll = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = le(ln, t);
                    return (0, rT.jsx)(la, {
                        scope: t,
                        forceMount: r,
                        children: N.Children.map(n, function(e) {
                            return (0, rT.jsx)(ir, {
                                present: r || a.open,
                                children: (0, rT.jsx)(a9, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            ll.displayName = ln;
            var lu = "DialogOverlay",
                lc = N.forwardRef(function(e, t) {
                    var r = li(lu, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = i3(e, ["forceMount"]),
                        i = le(lu, e.__scopeDialog);
                    return i.modal ? (0, rT.jsx)(ir, {
                        present: o || i.open,
                        children: (0, rT.jsx)(lf, i2(i1({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            lc.displayName = lu;
            var ls = a1("DialogOverlay.RemoveScroll"),
                lf = N.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = i3(e, ["__scopeDialog"]),
                        o = le(lu, r);
                    return (0, rT.jsx)(iq, {
                        as: ls,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, rT.jsx)(a4.div, i2(i1({
                            "data-state": lP(o.open)
                        }, n), {
                            ref: t,
                            style: i1({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                lp = "DialogContent",
                ld = N.forwardRef(function(e, t) {
                    var r = li(lp, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = i3(e, ["forceMount"]),
                        i = le(lp, e.__scopeDialog);
                    return (0, rT.jsx)(ir, {
                        present: o || i.open,
                        children: i.modal ? (0, rT.jsx)(lh, i2(i1({}, a), {
                            ref: t
                        })) : (0, rT.jsx)(ly, i2(i1({}, a), {
                            ref: t
                        }))
                    })
                });
            ld.displayName = lp;
            var lh = N.forwardRef(function(e, t) {
                    var r = le(lp, e.__scopeDialog),
                        n = N.useRef(null),
                        o = rW(t, r.contentRef, n);
                    return N.useEffect(function() {
                        var e = n.current;
                        if (e) return iQ(e)
                    }, []), (0, rT.jsx)(lm, i2(i1({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: aC(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: aC(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: aC(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                ly = N.forwardRef(function(e, t) {
                    var r = le(lp, e.__scopeDialog),
                        n = N.useRef(!1),
                        o = N.useRef(!1);
                    return (0, rT.jsx)(lm, i2(i1({}, e), {
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
                lm = N.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = i3(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = le(lp, r),
                        u = N.useRef(null),
                        c = rW(t, u);
                    return (0, ia.useFocusGuards)(), (0, rT.jsxs)(rT.Fragment, {
                        children: [(0, rT.jsx)(aK.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: a,
                            children: (0, rT.jsx)(aq.DismissableLayer, i2(i1({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": lP(l.open)
                            }, i), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, rT.jsxs)(rT.Fragment, {
                            children: [(0, rT.jsx)(lj, {
                                titleId: l.titleId
                            }), (0, rT.jsx)(lx, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                lb = "DialogTitle",
                lv = N.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = i3(e, ["__scopeDialog"]),
                        o = le(lb, r);
                    return (0, rT.jsx)(a4.h2, i2(i1({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            lv.displayName = lb;
            var lg = "DialogDescription";
            N.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = i3(e, ["__scopeDialog"]),
                    o = le(lg, r);
                return (0, rT.jsx)(a4.p, i2(i1({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = lg;
            var lw = "DialogClose",
                lO = N.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = i3(e, ["__scopeDialog"]),
                        o = le(lw, r);
                    return (0, rT.jsx)(a4.button, i2(i1({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: aC(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function lP(e) {
                return e ? "open" : "closed"
            }
            lO.displayName = lw;
            var lS = "DialogTitleWarning",
                lE = i6((b = {
                    contentName: lp,
                    titleName: lb,
                    docsSlug: "dialog"
                }, v = N.createContext(b), (g = function(e) {
                    var t = e.children,
                        r = aR(e, ["children"]),
                        n = N.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, rT.jsx)(v.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = lS + "Provider", [g, function(e) {
                    var t = N.useContext(v);
                    if (t) return t;
                    if (void 0 !== b) return b;
                    throw Error("`".concat(e, "` must be used within `").concat(lS, "`"))
                }]), 2),
                lA = (lE[0], lE[1]),
                lj = function(e) {
                    var t = e.titleId,
                        r = lA(lS),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return N.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                lx = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = lA("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return N.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function lI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lT(e) {
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

            function lC(e, t) {
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

            function lk(e, t) {
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

            function lN(e) {
                return function(e) {
                    if (Array.isArray(e)) return lI(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return lI(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lI(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lD = Symbol("radix.slottable");

            function lR(e) {
                return N.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === lD
            }

            function l_(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lL(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        l_(e, t, r[t])
                    })
                }
                return e
            }

            function lU(e, t) {
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
            var lB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, o, a, i, l = (r = o = "Primitive.".concat(t), (n = N.forwardRef(function(e, t) {
                        var r = e.children,
                            n = lk(e, ["children"]);
                        if (N.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = lT({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, lN(t));
                                            return o.apply(void 0, lN(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = lT({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return lT({}, e, r)
                                }(n, r.props);
                            return r.type !== N.Fragment && (s.ref = t ? rz(t, c) : c), N.cloneElement(r, s)
                        }
                        return N.Children.count(r) > 1 ? N.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), a = n, (i = N.forwardRef(function(e, t) {
                        var r = e.children,
                            n = lk(e, ["children"]),
                            o = N.Children.toArray(r),
                            i = o.find(lR);
                        if (i) {
                            var l = i.props.children,
                                u = o.map(function(e) {
                                    return e !== i ? e : N.Children.count(l) > 1 ? N.Children.only(null) : N.isValidElement(l) ? l.props.children : null
                                });
                            return (0, rT.jsx)(a, lC(lT({}, n), {
                                ref: t,
                                children: N.isValidElement(l) ? N.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, rT.jsx)(a, lC(lT({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(o, ".Slot"), i),
                    u = N.forwardRef(function(e, r) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, rT.jsx)(a, lU(lL({}, o), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), lU(lL({}, e), l_({}, t, u))
            }, {});

            function lM(e) {
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
            var lF = Object.freeze({
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
                lH = N.forwardRef(function(e, t) {
                    var r, n;
                    return (0, rT.jsx)(lB.span, (r = lM({}, e), n = n = {
                        ref: t,
                        style: lM({}, lF, e.style)
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

            function lG(e) {
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

            function lV(e, t) {
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
            lH.displayName = "VisuallyHidden";
            var lz = (0, N.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                lW = function() {
                    var e = (0, N.useContext)(lz);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                lq = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                lK = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                l$ = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                lZ = function(e) {
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
                        v = (0, N.useMemo)(function() {
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
                    return (0, N.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), D().createElement(lz.Provider, {
                        value: v
                    }, D().createElement(lt, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            lZ.displayName = "Dialog";
            var lY = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    a = e.overlayStyle,
                    i = e.onOpenAutoFocus,
                    l = lV(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = lW(),
                    c = u.size,
                    s = u.isModal,
                    f = u.hasCloseAffordance,
                    p = u.closeLabel,
                    d = u.hasDescription,
                    h = rN("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    y = rN("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return D().createElement(ll, null, D().createElement(lc, {
                    className: h,
                    style: a
                }, D().createElement(ld, lG({
                    className: y,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: i
                }, !d && {
                    "aria-describedby": void 0
                }, l), f && D().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, D().createElement(lO, {
                    asChild: !0
                }, D().createElement(aT, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            lY.displayName = "DialogContent";
            var lX = function(e) {
                var t = e.children,
                    r = e.className,
                    n = lV(e, ["children", "className"]),
                    o = lW(),
                    a = o.size,
                    i = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    u = rN(lq[a], i && lK[a], l && l$[a], r);
                return D().createElement("div", lG({
                    className: u
                }, n), t)
            };
            lX.displayName = "DialogBody";
            var lJ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = lV(e, ["children", "className", "hidden"]),
                    a = D().createElement(lv, lG({
                        className: r
                    }, o), t);
                return n ? D().createElement(lH, null, a) : a
            };
            lJ.displayName = "DialogTitle";
            var lQ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = lV(e, ["children", "className"]),
                    o = lW().size,
                    a = rN(lq[o], l$[o], r);
                return D().createElement("div", lG({
                    className: a
                }, n), t)
            };

            function l0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l1(e, t, r) {
                return (l1 = l4() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && l3(o, r.prototype), o
                }).apply(null, arguments)
            }

            function l2(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function l3(e, t) {
                return (l3 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function l6(e) {
                return function(e) {
                    if (Array.isArray(e)) return l0(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || l8(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l5(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function l8(e, t) {
                if (e) {
                    if ("string" == typeof e) return l0(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l0(e, t)
                }
            }

            function l4() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (l4 = function() {
                    return !!e
                })()
            }
            lQ.displayName = "DialogFooter"; /*! @license DOMPurify 3.3.1 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.3.1/LICENSE */
            var l7 = Object.entries,
                l9 = Object.setPrototypeOf,
                ue = Object.isFrozen,
                ut = Object.getPrototypeOf,
                ur = Object.getOwnPropertyDescriptor,
                un = Object.freeze,
                uo = Object.seal,
                ua = Object.create,
                ui = "u" > typeof Reflect && Reflect,
                ul = ui.apply,
                uu = ui.construct;
            un || (un = function(e) {
                return e
            }), uo || (uo = function(e) {
                return e
            }), ul || (ul = function(e, t) {
                for (var r = arguments.length, n = Array(r > 2 ? r - 2 : 0), o = 2; o < r; o++) n[o - 2] = arguments[o];
                return e.apply(t, n)
            }), uu || (uu = function(e) {
                for (var t = arguments.length, r = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) r[n - 1] = arguments[n];
                return l1(e, l6(r))
            });
            var uc = uS(Array.prototype.forEach),
                us = uS(Array.prototype.lastIndexOf),
                uf = uS(Array.prototype.pop),
                up = uS(Array.prototype.push),
                ud = uS(Array.prototype.splice),
                uh = uS(String.prototype.toLowerCase),
                uy = uS(String.prototype.toString),
                um = uS(String.prototype.match),
                ub = uS(String.prototype.replace),
                uv = uS(String.prototype.indexOf),
                ug = uS(String.prototype.trim),
                uw = uS(Object.prototype.hasOwnProperty),
                uO = uS(RegExp.prototype.test),
                uP = (i = TypeError, function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return uu(i, t)
                });

            function uS(e) {
                return function(t) {
                    l2(t, RegExp) && (t.lastIndex = 0);
                    for (var r = arguments.length, n = Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
                    return ul(e, t, n)
                }
            }

            function uE(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : uh;
                l9 && l9(e, null);
                for (var n = t.length; n--;) {
                    var o = t[n];
                    if ("string" == typeof o) {
                        var a = r(o);
                        a !== o && (ue(t) || (t[n] = a), o = a)
                    }
                    e[o] = !0
                }
                return e
            }

            function uA(e) {
                var t = ua(null),
                    r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var a, i = l7(e)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
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
                            }(l) || l8(l, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            c = u[0],
                            s = u[1];
                        uw(e, c) && (Array.isArray(s) ? t[c] = function(e) {
                            for (var t = 0; t < e.length; t++) uw(e, t) || (e[t] = null);
                            return e
                        }(s) : s && (void 0 === s ? "undefined" : l5(s)) === "object" && s.constructor === Object ? t[c] = uA(s) : t[c] = s)
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

            function uj(e, t) {
                for (; null !== e;) {
                    var r = ur(e, t);
                    if (r) {
                        if (r.get) return uS(r.get);
                        if ("function" == typeof r.value) return uS(r.value)
                    }
                    e = ut(e)
                }
                return function() {
                    return null
                }
            }
            var ux = un(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
                uI = un(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
                uT = un(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
                uC = un(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
                uk = un(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
                uN = un(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
                uD = un(["#text"]),
                uR = un(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns", "slot"]),
                u_ = un(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
                uL = un(["accent", "accentunder", "align", "bevelled", "close", "columnsalign", "columnlines", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lspace", "lquote", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
                uU = un(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
                uB = uo(/\{\{[\w\W]*|[\w\W]*\}\}/gm),
                uM = uo(/<%[\w\W]*|[\w\W]*%>/gm),
                uF = uo(/\$\{[\w\W]*/gm),
                uH = uo(/^data-[\-\w.\u00B7-\uFFFF]+$/),
                uG = uo(/^aria-[\-\w]+$/),
                uV = uo(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
                uz = uo(/^(?:\w+script|data):/i),
                uW = uo(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
                uq = uo(/^html$/i),
                uK = Object.freeze({
                    __proto__: null,
                    ARIA_ATTR: uG,
                    ATTR_WHITESPACE: uW,
                    CUSTOM_ELEMENT: uo(/^[a-z][.\w]*(-[.\w]+)+$/i),
                    DATA_ATTR: uH,
                    DOCTYPE_NAME: uq,
                    ERB_EXPR: uM,
                    IS_ALLOWED_URI: uV,
                    IS_SCRIPT_OR_DATA: uz,
                    MUSTACHE_EXPR: uB,
                    TMPLIT_EXPR: uF
                }),
                u$ = function(e, t) {
                    if ((void 0 === e ? "undefined" : l5(e)) !== "object" || "function" != typeof e.createPolicy) return null;
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
                uZ = function() {
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
                uY = function e() {
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
                        v = uj(b, "cloneNode"),
                        g = uj(b, "remove"),
                        w = uj(b, "nextSibling"),
                        O = uj(b, "childNodes"),
                        P = uj(b, "parentNode");
                    if ("function" == typeof u) {
                        var S = o.createElement("template");
                        S.content && S.content.ownerDocument && (o = S.content.ownerDocument)
                    }
                    var E = "",
                        A = o.implementation,
                        j = o.createNodeIterator,
                        x = o.createDocumentFragment,
                        I = o.getElementsByTagName,
                        T = a.importNode,
                        C = uZ();
                    n.isSupported = "function" == typeof l7 && "function" == typeof P && A && void 0 !== A.createHTMLDocument;
                    var k = uK.MUSTACHE_EXPR,
                        N = uK.ERB_EXPR,
                        D = uK.TMPLIT_EXPR,
                        R = uK.DATA_ATTR,
                        _ = uK.ARIA_ATTR,
                        L = uK.IS_SCRIPT_OR_DATA,
                        U = uK.ATTR_WHITESPACE,
                        B = uK.CUSTOM_ELEMENT,
                        M = uK.IS_ALLOWED_URI,
                        F = null,
                        H = uE({}, l6(ux).concat(l6(uI), l6(uT), l6(uk), l6(uD))),
                        G = null,
                        V = uE({}, l6(uR).concat(l6(u_), l6(uL), l6(uU))),
                        z = Object.seal(ua(null, {
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
                        K = Object.seal(ua(null, {
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
                        ep = uE({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "style", "svg", "template", "thead", "title", "video", "xmp"]),
                        ed = null,
                        eh = uE({}, ["audio", "video", "img", "source", "image", "track"]),
                        ey = null,
                        em = uE({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
                        eb = "http://www.w3.org/1998/Math/MathML",
                        ev = "http://www.w3.org/2000/svg",
                        eg = "http://www.w3.org/1999/xhtml",
                        ew = eg,
                        eO = !1,
                        eP = null,
                        eS = uE({}, [eb, ev, eg], uy),
                        eE = uE({}, ["mi", "mo", "mn", "ms", "mtext"]),
                        eA = uE({}, ["annotation-xml"]),
                        ej = uE({}, ["title", "style", "font", "a", "script"]),
                        ex = null,
                        eI = ["application/xhtml+xml", "text/html"],
                        eT = null,
                        eC = null,
                        ek = o.createElement("form"),
                        eN = function(e) {
                            return l2(e, RegExp) || l2(e, Function)
                        },
                        eD = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            if (!eC || eC !== e) {
                                if (e && (void 0 === e ? "undefined" : l5(e)) === "object" || (e = {}), e = uA(e), eT = "application/xhtml+xml" === (ex = -1 === eI.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? uy : uh, F = uw(e, "ALLOWED_TAGS") ? uE({}, e.ALLOWED_TAGS, eT) : H, G = uw(e, "ALLOWED_ATTR") ? uE({}, e.ALLOWED_ATTR, eT) : V, eP = uw(e, "ALLOWED_NAMESPACES") ? uE({}, e.ALLOWED_NAMESPACES, uy) : eS, ey = uw(e, "ADD_URI_SAFE_ATTR") ? uE(uA(em), e.ADD_URI_SAFE_ATTR, eT) : em, ed = uw(e, "ADD_DATA_URI_TAGS") ? uE(uA(eh), e.ADD_DATA_URI_TAGS, eT) : eh, ef = uw(e, "FORBID_CONTENTS") ? uE({}, e.FORBID_CONTENTS, eT) : ep, W = uw(e, "FORBID_TAGS") ? uE({}, e.FORBID_TAGS, eT) : uA({}), q = uw(e, "FORBID_ATTR") ? uE({}, e.FORBID_ATTR, eT) : uA({}), es = !!uw(e, "USE_PROFILES") && e.USE_PROFILES, $ = !1 !== e.ALLOW_ARIA_ATTR, Z = !1 !== e.ALLOW_DATA_ATTR, Y = e.ALLOW_UNKNOWN_PROTOCOLS || !1, X = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, J = e.SAFE_FOR_TEMPLATES || !1, Q = !1 !== e.SAFE_FOR_XML, ee = e.WHOLE_DOCUMENT || !1, en = e.RETURN_DOM || !1, eo = e.RETURN_DOM_FRAGMENT || !1, ea = e.RETURN_TRUSTED_TYPE || !1, er = e.FORCE_BODY || !1, ei = !1 !== e.SANITIZE_DOM, el = e.SANITIZE_NAMED_PROPS || !1, eu = !1 !== e.KEEP_CONTENT, ec = e.IN_PLACE || !1, M = e.ALLOWED_URI_REGEXP || uV, ew = e.NAMESPACE || eg, eE = e.MATHML_TEXT_INTEGRATION_POINTS || eE, eA = e.HTML_INTEGRATION_POINTS || eA, z = e.CUSTOM_ELEMENT_HANDLING || {}, e.CUSTOM_ELEMENT_HANDLING && eN(e.CUSTOM_ELEMENT_HANDLING.tagNameCheck) && (z.tagNameCheck = e.CUSTOM_ELEMENT_HANDLING.tagNameCheck), e.CUSTOM_ELEMENT_HANDLING && eN(e.CUSTOM_ELEMENT_HANDLING.attributeNameCheck) && (z.attributeNameCheck = e.CUSTOM_ELEMENT_HANDLING.attributeNameCheck), e.CUSTOM_ELEMENT_HANDLING && "boolean" == typeof e.CUSTOM_ELEMENT_HANDLING.allowCustomizedBuiltInElements && (z.allowCustomizedBuiltInElements = e.CUSTOM_ELEMENT_HANDLING.allowCustomizedBuiltInElements), J && (Z = !1), eo && (en = !0), es && (F = uE({}, uD), G = [], !0 === es.html && (uE(F, ux), uE(G, uR)), !0 === es.svg && (uE(F, uI), uE(G, u_), uE(G, uU)), !0 === es.svgFilters && (uE(F, uT), uE(G, u_), uE(G, uU)), !0 === es.mathMl && (uE(F, uk), uE(G, uL), uE(G, uU))), e.ADD_TAGS && ("function" == typeof e.ADD_TAGS ? K.tagCheck = e.ADD_TAGS : (F === H && (F = uA(F)), uE(F, e.ADD_TAGS, eT))), e.ADD_ATTR && ("function" == typeof e.ADD_ATTR ? K.attributeCheck = e.ADD_ATTR : (G === V && (G = uA(G)), uE(G, e.ADD_ATTR, eT))), e.ADD_URI_SAFE_ATTR && uE(ey, e.ADD_URI_SAFE_ATTR, eT), e.FORBID_CONTENTS && (ef === ep && (ef = uA(ef)), uE(ef, e.FORBID_CONTENTS, eT)), e.ADD_FORBID_CONTENTS && (ef === ep && (ef = uA(ef)), uE(ef, e.ADD_FORBID_CONTENTS, eT)), eu && (F["#text"] = !0), ee && uE(F, ["html", "head", "body"]), F.table && (uE(F, ["tbody"]), delete W.tbody), e.TRUSTED_TYPES_POLICY) {
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw uP('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw uP('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                                    E = (t = e.TRUSTED_TYPES_POLICY).createHTML("")
                                } else void 0 === t && (t = u$(m, i)), null !== t && "string" == typeof E && (E = t.createHTML(""));
                                un && un(e), eC = e
                            }
                        },
                        eR = uE({}, l6(uI).concat(l6(uT), l6(uC))),
                        e_ = uE({}, l6(uk).concat(l6(uN))),
                        eL = function(e) {
                            var t = P(e);
                            t && t.tagName || (t = {
                                namespaceURI: ew,
                                tagName: "template"
                            });
                            var r = uh(e.tagName),
                                n = uh(t.tagName);
                            return !!eP[e.namespaceURI] && (e.namespaceURI === ev ? t.namespaceURI === eg ? "svg" === r : t.namespaceURI === eb ? "svg" === r && ("annotation-xml" === n || eE[n]) : !!eR[r] : e.namespaceURI === eb ? t.namespaceURI === eg ? "math" === r : t.namespaceURI === ev ? "math" === r && eA[n] : !!e_[r] : e.namespaceURI === eg ? (t.namespaceURI !== ev || !!eA[n]) && (t.namespaceURI !== eb || !!eE[n]) && !e_[r] && (ej[r] || !eR[r]) : "application/xhtml+xml" === ex && !!eP[e.namespaceURI])
                        },
                        eU = function(e) {
                            up(n.removed, {
                                element: e
                            });
                            try {
                                P(e).removeChild(e)
                            } catch (t) {
                                g(e)
                            }
                        },
                        eB = function(e, t) {
                            try {
                                up(n.removed, {
                                    attribute: t.getAttributeNode(e),
                                    from: t
                                })
                            } catch (e) {
                                up(n.removed, {
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
                                var a = um(e, /^[\r\n\t ]+/);
                                n = a && a[0]
                            }
                            "application/xhtml+xml" === ex && ew === eg && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                            var i = t ? t.createHTML(e) : e;
                            if (ew === eg) try {
                                r = new y().parseFromString(i, ex)
                            } catch (e) {}
                            if (!r || !r.documentElement) {
                                r = A.createDocument(ew, "template", null);
                                try {
                                    r.documentElement.innerHTML = eO ? E : i
                                } catch (e) {}
                            }
                            var l = r.body || r.documentElement;
                            return (e && n && l.insertBefore(o.createTextNode(n), l.childNodes[0] || null), ew === eg) ? I.call(r, ee ? "html" : "body")[0] : ee ? r.documentElement : l
                        },
                        eF = function(e) {
                            return j.call(e.ownerDocument || e, e, f.SHOW_ELEMENT | f.SHOW_COMMENT | f.SHOW_TEXT | f.SHOW_PROCESSING_INSTRUCTION | f.SHOW_CDATA_SECTION, null)
                        },
                        eH = function(e) {
                            return l2(e, h) && ("string" != typeof e.nodeName || "string" != typeof e.textContent || "function" != typeof e.removeChild || !l2(e.attributes, d) || "function" != typeof e.removeAttribute || "function" != typeof e.setAttribute || "string" != typeof e.namespaceURI || "function" != typeof e.insertBefore || "function" != typeof e.hasChildNodes)
                        },
                        eG = function(e) {
                            return "function" == typeof c && l2(e, c)
                        };

                    function eV(e, t, r) {
                        uc(e, function(e) {
                            e.call(n, t, r, eC)
                        })
                    }
                    var ez = function(e) {
                            var t = null;
                            if (eV(C.beforeSanitizeElements, e, null), eH(e)) return eU(e), !0;
                            var r = eT(e.nodeName);
                            if (eV(C.uponSanitizeElement, e, {
                                    tagName: r,
                                    allowedTags: F
                                }), Q && e.hasChildNodes() && !eG(e.firstElementChild) && uO(/<[/\w!]/g, e.innerHTML) && uO(/<[/\w!]/g, e.textContent) || 7 === e.nodeType || Q && 8 === e.nodeType && uO(/<[/\w]/g, e.data)) return eU(e), !0;
                            if (!(l2(K.tagCheck, Function) && K.tagCheck(r)) && (!F[r] || W[r])) {
                                if (!W[r] && eq(r) && (l2(z.tagNameCheck, RegExp) && uO(z.tagNameCheck, r) || l2(z.tagNameCheck, Function) && z.tagNameCheck(r))) return !1;
                                if (eu && !ef[r]) {
                                    var o = P(e) || e.parentNode,
                                        a = O(e) || e.childNodes;
                                    if (a && o)
                                        for (var i = a.length, l = i - 1; l >= 0; --l) {
                                            var u = v(a[l], !0);
                                            u.__removalCount = (e.__removalCount || 0) + 1, o.insertBefore(u, w(e))
                                        }
                                }
                                return eU(e), !0
                            }
                            return l2(e, s) && !eL(e) || ("noscript" === r || "noembed" === r || "noframes" === r) && uO(/<\/no(script|embed|frames)/i, e.innerHTML) ? (eU(e), !0) : (J && 3 === e.nodeType && (t = e.textContent, uc([k, N, D], function(e) {
                                t = ub(t, e, " ")
                            }), e.textContent !== t && (up(n.removed, {
                                element: e.cloneNode()
                            }), e.textContent = t)), eV(C.afterSanitizeElements, e, null), !1)
                        },
                        eW = function(e, t, r) {
                            if (ei && ("id" === t || "name" === t) && (r in o || r in ek)) return !1;
                            if (Z && !q[t] && uO(R, t));
                            else if ($ && uO(_, t));
                            else if (l2(K.attributeCheck, Function) && K.attributeCheck(t, e));
                            else if (!G[t] || q[t]) {
                                if (!(eq(e) && (l2(z.tagNameCheck, RegExp) && uO(z.tagNameCheck, e) || l2(z.tagNameCheck, Function) && z.tagNameCheck(e)) && (l2(z.attributeNameCheck, RegExp) && uO(z.attributeNameCheck, t) || l2(z.attributeNameCheck, Function) && z.attributeNameCheck(t, e)) || "is" === t && z.allowCustomizedBuiltInElements && (l2(z.tagNameCheck, RegExp) && uO(z.tagNameCheck, r) || l2(z.tagNameCheck, Function) && z.tagNameCheck(r)))) return !1
                            } else if (ey[t]);
                            else if (uO(M, ub(r, U, "")));
                            else if (("src" === t || "xlink:href" === t || "href" === t) && "script" !== e && 0 === uv(r, "data:") && ed[e]);
                            else if (Y && !uO(L, ub(r, U, "")));
                            else if (r) return !1;
                            return !0
                        },
                        eq = function(e) {
                            return "annotation-xml" !== e && um(e, B)
                        },
                        eK = function(e) {
                            eV(C.beforeSanitizeAttributes, e, null);
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
                                        f = "value" === l ? c : ug(c);
                                    if (o.attrName = s, o.attrValue = f, o.keepAttr = !0, o.forceKeepAttr = void 0, eV(C.uponSanitizeAttribute, e, o), f = o.attrValue, el && ("id" === s || "name" === s) && (eB(l, e), f = "user-content-" + f), Q && uO(/((--!?|])>)|<\/(style|title|textarea)/i, f) || "attributename" === s && um(f, "href")) return eB(l, e);
                                    if (!o.forceKeepAttr) {
                                        if (!o.keepAttr || !X && uO(/\/>/i, f)) return eB(l, e);
                                        J && uc([k, N, D], function(e) {
                                            f = ub(f, e, " ")
                                        });
                                        var p = eT(e.nodeName);
                                        if (!eW(p, s, f)) return eB(l, e);
                                        if (t && (void 0 === m ? "undefined" : l5(m)) === "object" && "function" == typeof m.getAttributeType)
                                            if (u);
                                            else switch (m.getAttributeType(p, s)) {
                                                case "TrustedHTML":
                                                    f = t.createHTML(f);
                                                    break;
                                                case "TrustedScriptURL":
                                                    f = t.createScriptURL(f)
                                            }
                                        if (f !== c) try {
                                            u ? e.setAttributeNS(u, l, f) : e.setAttribute(l, f), eH(e) ? eU(e) : uf(n.removed)
                                        } catch (t) {
                                            eB(l, e)
                                        }
                                    }
                                }();
                                eV(C.afterSanitizeAttributes, e, null)
                            }
                        },
                        e$ = function e(t) {
                            var r = null,
                                n = eF(t);
                            for (eV(C.beforeSanitizeShadowDOM, t, null); r = n.nextNode();) eV(C.uponSanitizeShadowNode, r, null), ez(r), eK(r), l2(r.content, l) && e(r.content);
                            eV(C.afterSanitizeShadowDOM, t, null)
                        };
                    return n.sanitize = function(e) {
                        var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            o = null,
                            i = null,
                            u = null,
                            s = null;
                        if ((eO = !e) && (e = "\x3c!--\x3e"), "string" != typeof e && !eG(e))
                            if ("function" == typeof e.toString) {
                                if ("string" != typeof(e = e.toString())) throw uP("dirty is not a string, aborting")
                            } else throw uP("toString is not a function");
                        if (!n.isSupported) return e;
                        if (et || eD(r), n.removed = [], "string" == typeof e && (ec = !1), ec) {
                            if (e.nodeName) {
                                var f = eT(e.nodeName);
                                if (!F[f] || W[f]) throw uP("root node is forbidden and cannot be sanitized in-place")
                            }
                        } else if (l2(e, c)) 1 === (i = (o = eM("\x3c!----\x3e")).ownerDocument.importNode(e, !0)).nodeType && "BODY" === i.nodeName || "HTML" === i.nodeName ? o = i : o.appendChild(i);
                        else {
                            if (!en && !J && !ee && -1 === e.indexOf("<")) return t && ea ? t.createHTML(e) : e;
                            if (!(o = eM(e))) return en ? null : ea ? E : ""
                        }
                        o && er && eU(o.firstChild);
                        for (var p = eF(ec ? e : o); u = p.nextNode();) ez(u), eK(u), l2(u.content, l) && e$(u.content);
                        if (ec) return e;
                        if (en) {
                            if (eo)
                                for (s = x.call(o.ownerDocument); o.firstChild;) s.appendChild(o.firstChild);
                            else s = o;
                            return (G.shadowroot || G.shadowrootmode) && (s = T.call(a, s, !0)), s
                        }
                        var d = ee ? o.outerHTML : o.innerHTML;
                        return ee && F["!doctype"] && o.ownerDocument && o.ownerDocument.doctype && o.ownerDocument.doctype.name && uO(uq, o.ownerDocument.doctype.name) && (d = "<!DOCTYPE " + o.ownerDocument.doctype.name + ">\n" + d), J && uc([k, N, D], function(e) {
                            d = ub(d, e, " ")
                        }), t && ea ? t.createHTML(d) : d
                    }, n.setConfig = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        eD(e), et = !0
                    }, n.clearConfig = function() {
                        eC = null, et = !1
                    }, n.isValidAttribute = function(e, t, r) {
                        return eC || eD({}), eW(eT(e), eT(t), r)
                    }, n.addHook = function(e, t) {
                        "function" == typeof t && up(C[e], t)
                    }, n.removeHook = function(e, t) {
                        if (void 0 !== t) {
                            var r = us(C[e], t);
                            return -1 === r ? void 0 : ud(C[e], r, 1)[0]
                        }
                        return uf(C[e])
                    }, n.removeHooks = function(e) {
                        C[e] = []
                    }, n.removeAllHooks = function() {
                        C = uZ()
                    }, n
                }(),
                uX = {
                    ADD_ATTR: ["target"]
                },
                uJ = uY();
            uJ.addHook("afterSanitizeAttributes", function(e) {
                "A" === e.nodeName && (e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer"))
            });
            var uQ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = t.shouldOpenLinksInNewTab;
                    return (0, N.useMemo)(function() {
                        return (r ? uJ : uY).sanitize(e, uX)
                    }, [e, r])
                },
                u0 = function(e) {
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
                        d = uQ(r, {
                            shouldOpenLinksInNewTab: !0
                        }),
                        h = n && i ? (0, rT.jsx)(na, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: i,
                            className: "grow basis-0",
                            children: n
                        }) : null,
                        y = o && l ? (0, rT.jsx)(na, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: l,
                            className: "grow basis-0",
                            children: o
                        }) : null;
                    return (0, rT.jsx)(lZ, {
                        open: u,
                        onOpenChange: function(e) {
                            e || c()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: void 0 === s || s,
                        closeLabel: a,
                        children: (0, rT.jsxs)(lY, {
                            children: [(0, rT.jsxs)(lX, {
                                className: "flex flex-col gap-large",
                                children: [(0, rT.jsx)(lJ, {
                                    children: t
                                }), (0, rT.jsx)("span", {
                                    className: "[&_a]:[font-weight:700] [&_a]:underline",
                                    dangerouslySetInnerHTML: {
                                        __html: d
                                    }
                                })]
                            }), (0, rT.jsx)(lQ, {
                                className: p ? "flex flex-col gap-small" : "flex gap-x-medium",
                                children: p ? (0, rT.jsxs)(N.Fragment, {
                                    children: [h, y]
                                }) : (0, rT.jsxs)(N.Fragment, {
                                    children: [y, h]
                                })
                            })]
                        })
                    })
                },
                u1 = function(e) {
                    var t = e.isModalOpen,
                        r = e.navigateToAccountSettings,
                        n = e.closeModal,
                        o = e.translate;
                    return (0, rT.jsx)(u0, {
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
                u2 = function(e) {
                    var t = e.isModalOpen,
                        r = e.closeModal,
                        n = e.translate;
                    return (0, rT.jsx)(u0, {
                        titleText: n("RestrictedUnplayableModal.Label.Title"),
                        bodyText: n("RestrictedUnplayableModal.Label.Body"),
                        secondaryButtonText: n("RestrictedUnplayableModal.Action.Ok"),
                        closeLabelText: n("Action.Close"),
                        onSecondaryButtonClick: r,
                        isModalOpen: t,
                        onCloseModal: r
                    })
                },
                u3 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = !!e && !t,
                        n = (0, R.useQuery)({
                            queryKey: ["ageRecommendation", e],
                            queryFn: function() {
                                return J(e)
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

            function u6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function u5(e, t) {
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
                        if ("string" == typeof e) return u6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return u6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var u8 = function(e) {
                var t, r, n = u5((0, N.useState)(void 0), 2),
                    o = n[0],
                    a = n[1],
                    i = u5((0, N.useState)(!1), 2),
                    l = i[0],
                    u = i[1],
                    c = u5((0, N.useState)(!1), 2),
                    s = c[0],
                    f = c[1];
                (0, N.useEffect)(function() {
                    f(!1), u(!0), X().then(function(e) {
                        a(e.contentAgeRestriction)
                    }).catch(function() {
                        f(!0)
                    }).finally(function() {
                        u(!1)
                    })
                }, []);
                var p = u3(e),
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

            function u4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function u7(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function u9(e, t) {
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
                        if ("string" == typeof e) return u4(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return u4(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ce = function(e, t, r, n, o, a, i, l) {
                    var u = (0, R.useQuery)({
                            queryKey: ["guacPlayButtonUI"],
                            queryFn: function() {
                                return Y()
                            },
                            staleTime: 6e4
                        }).data,
                        c = u9((0, N.useState)(!1), 2),
                        s = c[0],
                        f = c[1],
                        p = u9((0, N.useState)(!1), 2),
                        d = p[0],
                        h = p[1],
                        y = (0, N.useCallback)(function() {
                            rS(e, n, o, a, i, void 0, l)
                        }, [i, a, e, o, n, l]),
                        m = (0, N.useCallback)(function(e, n, o) {
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
                                                    rI(t, e, ee.ContextualPlayabilityAgeRecommendationParentalControls, r)
                                                }, o || void 0 === e || void 0 === n) return y(), H(es.PlayButtonUpsellUnknownSettingOrAge), a(ef.gameLaunchFallbackUpsellName), [2];
                                            if ("minimal" === n) return y(), H(es.PlayButtonUpsellMinimalMaturityRating), a(ef.gameLaunchFallbackUpsellName), [2];
                                            if (!(i = ({
                                                    mild: "NinePlus",
                                                    moderate: "ThirteenPlus",
                                                    restricted: "SeventeenPlus",
                                                    unrated: "ThirteenPlus"
                                                })[n])) return y(), H(es.PlayButtonUpsellAgeNotInMapping), a(ef.gameLaunchFallbackUpsellName), [2];
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
                                            return f(!0), H(es.PlayButtonUpsellSelfUpdateSettingTriggered), a(c), [3, 12];
                                        case 2:
                                            if (H(es.PlayButtonUpsellAskYourParentTriggered), a(c), !(s = rp())) return H(es.PlayButtonUpsellParentalConsentError), [3, 12];
                                            d.label = 3;
                                        case 3:
                                            return d.trys.push([3, 5, , 6]), p = (null == u ? void 0 : u.useExperienceApprovalForParentalConsent) ? {
                                                featureName: "CanApproveExperience",
                                                namespace: eh.accountManagement,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    universeId: t,
                                                    experienceManagementAction: "Approve"
                                                }
                                            } : {
                                                featureName: "CanChangeSetting",
                                                namespace: eh.settingChange,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    contentAgeRestriction: l.option.optionValue
                                                }
                                            }, [4, s(p)];
                                        case 4:
                                            return d.sent(), [3, 6];
                                        case 5:
                                            return d.sent(), y(), H(es.PlayButtonUpsellParentalConsentError), a(ef.gameLaunchFallbackUpsellName), [3, 6];
                                        case 6:
                                        case 10:
                                            return [3, 12];
                                        case 7:
                                            return d.trys.push([7, 9, , 10]), H(es.PlayButtonUpsellAgeRestrictionVerificationTriggered), a(c), [4, rA({
                                                context: ed,
                                                pageContext: r
                                            })];
                                        case 8:
                                            return d.sent() && window.location.reload(), [3, 10];
                                        case 9:
                                            return d.sent(), y(), a(ef.gameLaunchFallbackUpsellName), [3, 10];
                                        case 11:
                                            y(), H(es.PlayButtonUpsellUnknownRequirement), a(ef.gameLaunchFallbackUpsellName), d.label = 12;
                                        case 12:
                                            return [3, 14];
                                        case 13:
                                            h(!0), H(es.PlayButtonUpsellRestrictedUnplayableTriggered), a(ef.restrictedUnplayableUpsellName), d.label = 14;
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
                                        u7(o, r, n, i, l, "next", e)
                                    }

                                    function l(e) {
                                        u7(o, r, n, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [u, y, t, r]),
                        b = (0, N.useCallback)(function() {
                            f(!1)
                        }, []),
                        v = (0, N.useCallback)(function() {
                            h(!1)
                        }, []);
                    return {
                        launchPlayButtonUpsell: m,
                        isSelfUpdateSettingModalOpen: s,
                        navigateToAccountSettings: (0, N.useCallback)(function() {
                            var e = (0, ev.getAbsoluteUrl)("/my/account#!/privacy");
                            "u" > typeof window && (window.location.href = e, f(!1))
                        }, []),
                        closeSelfUpdateSettingModal: b,
                        isRestrictedUnplayableModalOpen: d,
                        closeRestrictedUnplayableModal: v
                    }
                },
                ct = function(e) {
                    var t = e.universeId,
                        r = e.buttonClassName,
                        n = e.placeId,
                        o = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        l = e.eventProperties,
                        u = e.appsFlyerReferralProperties,
                        c = e.pageContext,
                        s = aS(),
                        f = u8(t),
                        p = f.contentAgeRestriction,
                        d = f.contentMaturityRating,
                        h = f.isFetching,
                        y = f.hasError,
                        m = ce(n, t, c, o, a, i, l, u),
                        b = m.launchPlayButtonUpsell,
                        v = m.isSelfUpdateSettingModalOpen,
                        g = m.navigateToAccountSettings,
                        w = m.closeSelfUpdateSettingModal,
                        O = m.isRestrictedUnplayableModalOpen,
                        P = m.closeRestrictedUnplayableModal,
                        S = (0, N.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), b(p, d, y)
                        }, [b, p, d, y]);
                    return !y && h ? (0, rT.jsx)(aj, {
                        buttonClassName: null != r ? r : "btn-common-play-game-action-needed-lg"
                    }) : (0, rT.jsxs)(D().Fragment, {
                        children: [(0, rT.jsx)(aE, {
                            onButtonClick: S,
                            buttonClassName: r
                        }), v && (0, rT.jsx)(u1, {
                            isModalOpen: v,
                            navigateToAccountSettings: g,
                            closeModal: w,
                            translate: s
                        }), O && (0, rT.jsx)(u2, {
                            isModalOpen: O,
                            closeModal: P,
                            translate: s
                        })]
                    })
                };

            function cr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cn(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function co(e, t) {
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
                        if ("string" == typeof e) return cr(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cr(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            ct.defaultProps = {
                buttonClassName: void 0,
                rootPlaceId: void 0,
                privateServerLinkCode: void 0,
                gameInstanceId: void 0,
                eventProperties: {},
                appsFlyerReferralProperties: {}
            };
            var ca = function(e, t) {
                    var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                        n = (0, R.useQuery)({
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
                                                return [4, Promise.all([(o = [e], K(function() {
                                                    var e;
                                                    return $(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, Z.getProductInfo(o)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data.data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })()), (a = [t], K(function() {
                                                    var e;
                                                    return $(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, Z.getPlaceDetails(a)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())])];
                                            case 1:
                                                return [2, {
                                                    productInfo: (r = co.apply(void 0, [n.sent(), 2]))[0],
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
                                            cn(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            cn(a, n, o, i, l, "throw", e)
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
                ci = function(e) {
                    var t = e.buttonWidth,
                        r = e.buttonClassName,
                        n = e.iconClassName,
                        o = e.hideButtonText,
                        a = e.hideButtonIcon,
                        i = e.buttonContent,
                        l = e.onClick,
                        u = e.isPurchasing,
                        c = e.redirectUrl;
                    return c ? (0, rT.jsx)("a", {
                        href: c,
                        className: "purchase-button-link",
                        children: (0, rT.jsxs)(na, {
                            "data-testid": "play-purchase-button",
                            variant: "Emphasis",
                            style: nf,
                            className: rk()(ns(t), r),
                            onClick: function() {
                                return null
                            },
                            isDisabled: u,
                            children: [!a && (0, rT.jsx)("span", {
                                className: n
                            }), !o && (0, rT.jsx)("span", {
                                className: "btn-text",
                                children: i
                            })]
                        })
                    }) : (0, rT.jsxs)(na, {
                        "data-testid": "play-purchase-button",
                        variant: "Emphasis",
                        style: nf,
                        className: rk()(ns(t), r),
                        onClick: function(e) {
                            l && !u && l(e)
                        },
                        isDisabled: u,
                        children: [!a && (0, rT.jsx)("span", {
                            className: n
                        }), !o && (0, rT.jsx)("span", {
                            className: "btn-text",
                            children: i
                        })]
                    })
                };

            function cl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cu(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            ci.defaultProps = {
                hideButtonText: !1,
                buttonWidth: nc,
                buttonClassName: "btn-economy-robux-white-lg",
                iconClassName: "icon-robux-white",
                hideButtonIcon: !1,
                isPurchasing: !1,
                onClick: void 0,
                redirectUrl: void 0
            };
            var cc = function(e) {
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
                        }(t = (0, N.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return cl(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cl(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        m = y[0],
                        b = y[1],
                        v = (0, N.useCallback)(function(e) {
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
                                            return l.trys.push([1, 3, 4, 5]), rI(o, ef.fiatPurchaseUpsellName, ee.FiatPurchaseRequired, h), [4, Q(a, r)];
                                        case 2:
                                            return (n = l.sent()) && (0, eO.isValidStripeCheckoutUrl)(n) && (window.location.href = n), [3, 5];
                                        case 3:
                                            return l.sent(), H(es.PreparePurchaseUrlError), console.error("Error preparing purchase url"), [3, 5];
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
                                        cu(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        cu(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [a, i, o, h]);
                    return (0, rT.jsx)(ci, {
                        buttonWidth: c,
                        buttonClassName: s,
                        iconClassName: u,
                        hideButtonText: f,
                        hideButtonIcon: !0,
                        buttonContent: void 0 !== d && d ? l(ei) : null != (r = null == (n = i.fiatPurchaseData) ? void 0 : n.localizedFiatPrice) ? r : "",
                        onClick: p ? void 0 : v,
                        redirectUrl: p,
                        isPurchasing: m
                    })
                },
                cs = window.RobloxItemPurchase,
                cf = window.RobloxThumbnails;

            function cp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var cd = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.price.toString()) ? t : ""
                },
                ch = function(e) {
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
                        p = (0, N.useRef)();
                    null != p.current || (p.current = (0, cs.createItemPurchase)());
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
                                if ("string" == typeof e) return cp(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cp(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        h = d[0],
                        y = d[1],
                        m = (0, N.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), y.start()
                        }, [y]);
                    return (0, rT.jsxs)(D().Fragment, {
                        children: [(0, rT.jsx)(ci, {
                            buttonWidth: o,
                            buttonClassName: a,
                            iconClassName: n,
                            hideButtonText: i,
                            buttonContent: cd(c),
                            onClick: l ? void 0 : m,
                            redirectUrl: l
                        }), (0, rT.jsx)(h, {
                            translate: s,
                            productId: c.productId,
                            expectedPrice: c.price,
                            thumbnail: (0, rT.jsx)(cf.Thumbnail2d, {
                                type: cf.ThumbnailTypes.gameIcon,
                                size: cf.DefaultThumbnailSize,
                                targetId: parseInt(r, 10),
                                imgClassName: "game-card-thumb",
                                format: cf.ThumbnailFormat.jpeg
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
                cy = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.iconClassName,
                        o = void 0 === n ? "icon-robux-white" : n,
                        a = e.buttonWidth,
                        i = void 0 === a ? nc : a,
                        l = e.buttonClassName,
                        u = void 0 === l ? "btn-economy-robux-white-lg" : l,
                        c = e.refetchPlayabilityStatus,
                        s = e.hideButtonText,
                        f = void 0 !== s && s,
                        p = e.redirectPurchaseUrl,
                        d = e.playabilityStatus,
                        h = e.showDefaultPurchaseText,
                        y = e.pageContext,
                        m = aS(),
                        b = ca(t, r),
                        v = b.productInfo,
                        g = b.productDetails;
                    return b.isLoading ? (0, rT.jsx)(aj, {
                        buttonClassName: u,
                        buttonWidth: i
                    }) : "Fiat" == (d === ee.FiatPurchaseRequired && (null == g ? void 0 : g.fiatPurchaseData) ? "Fiat" : "Robux") ? (0, rT.jsx)(cc, {
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
                    }) : (0, rT.jsx)(ch, {
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
                cm = function(e) {
                    var t, r, n = new URLSearchParams(window.location.search);
                    return {
                        launchData: null != (t = n.get("launchData")) ? t : e,
                        eventId: null != (r = n.get("eventId")) ? r : void 0
                    }
                },
                cb = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.rootPlaceId,
                        o = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        i = e.eventProperties,
                        l = e.appsFlyerReferralProperties,
                        u = aS(),
                        c = (0, N.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), rj(r, t);
                            var u = cm((null == i ? void 0 : i.launchData) != null ? String(i.launchData) : void 0);
                            rS(r, n, o, a, i, u, l, "DemoPlayButtonClick")
                        }, [t, r, n, o, a, i, l]),
                        s = u(el) || "Play Demo";
                    return (0, rT.jsx)("button", {
                        type: "button",
                        "data-testid": "demo-play-button",
                        className: "btn-control-lg btn-full-width demo-play-button",
                        onClick: c,
                        children: s
                    })
                },
                cv = function(e) {
                    var t = e.placeId,
                        r = aw("Feature.ExperienceDetails");
                    return (0, rT.jsx)(na, {
                        "data-testid": "play-on-web-button",
                        as: "a",
                        variant: "Standard",
                        size: "Large",
                        style: nf,
                        className: "btn-full-width btn-control-lg play-on-web-button",
                        href: "".concat(L().playWebsite, "/games/start?placeId=").concat(t),
                        target: "_blank",
                        children: r.dynamic(eu, void 0, "Play on Web")
                    })
                },
                cg = function(e, t) {
                    if (void 0 === t) return null;
                    var r, n = e.find(function(e) {
                        var r = e.isEnabled,
                            n = e.primaryStatuses;
                        return r && n.has(t)
                    });
                    return null != (r = null == n ? void 0 : n.render()) ? r : null
                },
                cw = function(e) {
                    var t = e.primaryButton,
                        r = e.secondaryButton,
                        n = e.isPrimaryButtonLoading;
                    return r ? (0, rT.jsxs)("div", {
                        className: "stacked-play-buttons-container",
                        children: [(0, rT.jsx)("div", {
                            className: "stacked-play-button-primary",
                            "data-testid": "stacked-play-button-primary",
                            children: t
                        }), !(void 0 !== n && n) && r]
                    }) : t
                },
                cO = function(e) {
                    var t = e.iconClassName,
                        r = e.buttonWidth,
                        n = e.buttonClassName,
                        o = e.hideButtonText,
                        a = aS();
                    return (0, rT.jsxs)(na, {
                        "data-testid": "play-unplayable-button",
                        variant: "Emphasis",
                        style: nf,
                        className: rk()(ns(void 0 === r ? nc : r), void 0 === n ? "btn-common-play-game-unplayable-lg" : n),
                        isDisabled: !0,
                        onClick: function() {
                            return null
                        },
                        children: [(0, rT.jsx)("span", {
                            className: void 0 === t ? "icon-status-unavailable-secondary" : t
                        }), !(void 0 !== o && o) && (0, rT.jsx)("span", {
                            className: "btn-text",
                            children: a(ea)
                        })]
                    })
                },
                cP = function(e) {
                    var t = e.treatmentData,
                        r = e.isModalOpen,
                        n = e.onConfirm,
                        o = e.onDismiss,
                        a = aS();
                    return (0, rT.jsx)(u0, {
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

            function cS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var cE = function(e) {
                    return !!e && "string" == typeof e.titleText && e.titleText.length > 0 && "string" == typeof e.bodyText && e.bodyText.length > 0 && "string" == typeof e.primaryActionText && e.primaryActionText.length > 0 && "string" == typeof e.secondaryActionText && e.secondaryActionText.length > 0
                },
                cA = function(e, t, r) {
                    var n, o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = (0, N.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return cS(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cS(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        a = o[0],
                        i = o[1],
                        l = eb(e),
                        u = l.playabilityStatus,
                        c = l.playableUxTreatment,
                        s = l.isFetchingPlayability,
                        f = (0, N.useCallback)(function(t) {
                            rI(e, t, ee.Playable, r)
                        }, [e, r]);
                    return {
                        doGameLaunchWithPlayableUxTreatment: (0, N.useCallback)(function() {
                            if (s) {
                                t(), H(es.PlayableUxTreatmentPlayabilityStatusStillLoading), f(ef.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (u !== ee.Playable || !(null == c ? void 0 : c.treatment)) return void t();
                            if ("reconfirmLaunchModal" !== c.treatment) {
                                t(), H(es.PlayableUxTreatmentUnknownTreatment), f(ef.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (!cE(c.data)) {
                                t(), H(es.PlayableUxTreatmentMalformedData), f(ef.gameLaunchFallbackUpsellName);
                                return
                            }
                            i(!0), f(ef.reconfirmLaunchModalUpsellName)
                        }, [s, u, c, t, f]),
                        playableUxTreatmentModal: (0, N.useMemo)(function() {
                            return a && c && cE(c.data) ? (0, rT.jsx)(cP, {
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

            function cj(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var cx = function(e) {
                var t = e.universeId,
                    r = e.buttonClassName,
                    n = e.playabilityStatus,
                    o = e.pageContext;
                return (0, rT.jsx)(aE, {
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
                                        return r.trys.push([1, 3, , 4]), rI(t, ef.ageCheckUpsellName, n, o), [4, rA({
                                            context: ep,
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
                                    cj(a, n, o, i, l, "next", e)
                                }

                                function l(e) {
                                    cj(a, n, o, i, l, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    },
                    buttonClassName: r
                })
            };

            function cI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cT(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function cC(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            cT(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            cT(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ck(e, t) {
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
                        if ("string" == typeof e) return cI(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cI(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cN(e, t) {
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
            var cD = function(e) {
                    var t, r;
                    return {
                        launchData: null != (t = new URLSearchParams(window.location.search).get("launchData")) ? t : e,
                        eventId: null != (r = new URLSearchParams(window.location.search).get("eventId")) ? r : void 0
                    }
                },
                cR = {},
                c_ = new Set([ee.PurchaseRequired, ee.FiatPurchaseRequired, ee.FiatPurchaseDeviceRestricted, ee.ContextualPlayabilityRegionalAvailability]),
                cL = new Set([ee.Playable]),
                cU = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.rootPlaceId,
                        o = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        i = e.status,
                        l = e.eventProperties,
                        u = void 0 === l ? cR : l,
                        c = e.appsFlyerReferralProperties,
                        s = void 0 === c ? cR : c,
                        f = e.iconClassName,
                        p = e.buttonWidth,
                        d = void 0 === p ? nc : p,
                        h = e.buttonClassName,
                        y = void 0 === h ? "btn-common-play-game-lg" : h,
                        m = e.disableLoadingState,
                        b = e.buttonText,
                        v = void 0 === b ? void 0 : b,
                        g = e.hideIcon,
                        w = e.analyticsCallback,
                        O = void 0 === w ? void 0 : w,
                        P = e.pageContext,
                        S = ck((0, N.useState)(void 0), 2),
                        E = S[0],
                        A = S[1],
                        j = ck((0, N.useState)(void 0), 2),
                        x = j[0],
                        I = j[1],
                        T = ck((0, N.useState)(void 0), 2),
                        C = T[0],
                        k = T[1],
                        _ = ck((0, N.useState)(void 0), 2),
                        U = _[0],
                        B = _[1],
                        M = ck((0, N.useState)(void 0), 2),
                        F = M[0],
                        V = M[1],
                        z = ck((0, N.useState)(void 0), 2),
                        W = z[0],
                        q = z[1],
                        Z = ck((0, N.useState)(void 0), 2),
                        X = Z[0],
                        J = Z[1],
                        Q = ck((0, N.useState)(void 0), 2),
                        et = Q[0],
                        er = Q[1],
                        en = (0, R.useQuery)({
                            queryKey: ["getIsVNGLandingRedirectEnabled"],
                            queryFn: ni.getIsVNGLandingRedirectEnabled,
                            retry: !1
                        }).data;
                    (0, N.useEffect)(function() {
                        cC(function() {
                            var e, r;
                            return cN(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return n.trys.push([0, 2, , 3]), [4, cC(function() {
                                            var e, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b;
                                            return cN(this, function(v) {
                                                switch (v.label) {
                                                    case 0:
                                                        if (e = {
                                                                isUniverseEnabledForVoice: !1,
                                                                isUniverseEnabledForAvatarVideo: !1
                                                            }, void 0 === rr()) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: !0,
                                                            useCameraU13Design: !1,
                                                            useVoiceUpsellV2Design: !1
                                                        }];
                                                        return [4, Y()];
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
                                                        return [4, (g = t, K(function() {
                                                            var e;
                                                            return $(this, function(t) {
                                                                switch (t.label) {
                                                                    case 0:
                                                                        return e = {
                                                                            withCredentials: !0,
                                                                            url: "".concat(L().voiceApi, "/v1/settings/verify/show-age-verification-overlay/").concat(g)
                                                                        }, [4, G.get(e)];
                                                                    case 1:
                                                                        return [2, t.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        if (f = (s = v.sent()).showAgeVerificationOverlay, p = s.showVoiceOptInOverlay, d = s.showAvatarVideoOptInOverlay, h = s.elegibleToSeeVoiceUpsell, y = s.universePlaceVoiceEnabledSettings, m = !1, b = !1, !nu().getAllValuesForLayer) return [3, 5];
                                                        return [4, nu().getAllValuesForLayer("Voice.AvatarChat.Upsell")];
                                                    case 3:
                                                        return m = Boolean.apply(void 0, [v.sent().ShouldShowUpsell]), [4, nu().getAllValuesForLayer("Voice.AvatarChat.U13Upsell")];
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
                                        return A(null != (e = (r = n.sent()).universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice) && e), k(r.elegibleToSeeVoiceUpsell), I(r.showAgeVerificationOverlay), B(r.showVoiceOptInOverlay), V(r.showAvatarVideoOptInOverlay), q(r.requireExplicitVoiceConsent), J(r.useCameraU13Design), er(r.useVoiceUpsellV2Design), [3, 3];
                                    case 2:
                                        return n.sent(), H(es.PlayButtonShowIdentificationError), k(!1), A(!1), I(!1), B(!1), V(!1), q(!0), J(!1), er(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []);
                    var eo = (0, N.useCallback)(function() {
                            rj(r, t);
                            var e = cD(null != u.launchData ? String(u.launchData) : void 0);
                            rS(r, n, o, a, u, e, s)
                        }, [r, t, u, s, n, o, a]),
                        ea = cA(t, eo, P),
                        ei = ea.doGameLaunchWithPlayableUxTreatment,
                        el = ea.playableUxTreatmentModal;
                    return void 0 !== x || void 0 !== m && m ? (0, rT.jsxs)(D().Fragment, {
                        children: [(0, rT.jsxs)(na, {
                            "data-testid": "play-button",
                            variant: "Emphasis",
                            style: nf,
                            className: rk()(ns(d), y),
                            onClick: function(e) {
                                return cC(function() {
                                    var t;
                                    return cN(this, function(n) {
                                        var o, a, l, u;
                                        switch (n.label) {
                                            case 0:
                                                if (e.preventDefault(), e.stopPropagation(), i !== ee.Playable) return [3, 7];
                                                if (C && E && nu().getAllValuesForLayer("SocialVoice.VoiceUpsell").then(function() {
                                                        nu().logLayerExposure("SocialVoice.VoiceUpsell")
                                                    }).catch(function() {
                                                        console.error("error logging exposure event in play-join")
                                                    }), !x) return [3, 2];
                                                return [4, ry(function() {
                                                    return rv(this, function(e) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.startVerificationFlow()]
                                                        } catch (e) {
                                                            return [2, [!1, !1]]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return (t = ck.apply(void 0, [n.sent(), 2]))[0], t[1] && I(!1), [3, 6];
                                            case 2:
                                                if (!U) return [3, 4];
                                                return [4, (o = null == W || W, a = null != et && et, ry(function() {
                                                    return rv(this, function(e) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.showVoiceOptInOverlay(o, a)]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 3:
                                                return n.sent() && B(!1), [3, 6];
                                            case 4:
                                                if (!F) return [3, 6];
                                                return [4, (l = null == W || W, u = null == X || X, ry(function() {
                                                    return rv(this, function(e) {
                                                        try {
                                                            return [2, window.Roblox.IdentityVerificationService.showAvatarVideoOptInOverlay(l, u)]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 5:
                                                n.sent() && V(!1), n.label = 6;
                                            case 6:
                                                return ei(), [3, 8];
                                            case 7:
                                                i === ee.GuestProhibited && (en ? ni.navigateToLoginWithRedirect() : rE(r, s)), n.label = 8;
                                            case 8:
                                                return O && O(), [2]
                                        }
                                    })
                                })()
                            },
                            children: [!(void 0 !== g && g) && (0, rT.jsx)("span", {
                                className: void 0 === f ? "icon-common-play" : f
                            }), v && (0, rT.jsx)("span", {
                                className: "play-button-text",
                                children: v
                            })]
                        }), (0, rT.jsx)("div", {
                            id: "id-verification-container"
                        }), el]
                    }) : (0, rT.jsx)(aj, {
                        buttonClassName: y,
                        buttonWidth: d
                    })
                },
                cB = function(e, t) {
                    var r = t.playabilityStatus,
                        n = t.shouldShowVpcPlayButtonUpsells,
                        o = t.shouldShowNoticeAgreementIfPlayable,
                        a = t.unplayableDisplayText;
                    if (void 0 !== r) {
                        if (r === ee.Playable && o) return {
                            message: e(en),
                            testId: "play-contextual-message"
                        };
                        if (a) return {
                            message: a,
                            testId: "play-server-message"
                        };
                        if (r !== ee.ContextualPlayabilityCoreGated && rx(r, n)) return {
                            message: e(Object.hasOwn(er, r) ? er[r] : er[ee.UnplayableOtherReason]),
                            testId: "play-error"
                        }
                    }
                },
                cM = window.Roblox["core-scripts"].util.elementVisibility,
                cF = function(e, t) {
                    var r = t.universeId,
                        n = t.playabilityStatus,
                        o = t.pageContext,
                        a = t.attributionId,
                        i = t.contextualMessage,
                        l = (0, N.useRef)(!1);
                    (0, N.useEffect)(function() {
                        l.current = !1
                    }, [r, n, o, a, i]), (0, N.useEffect)(function() {
                        if (e.current && !l.current && i) {
                            var t = null;
                            return t = (0, cM.observeVisibility)({
                                    element: e.current,
                                    threshold: .5
                                }, function(e) {
                                    e && !l.current && (l.current = !0, (0, ew.sendEventWithTarget)("playButtonContextualMessageImpression", o, {
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

            function cH(e) {
                var t = new(C()).Deferred;
                return k.Hybrid.Game.launchGame(e, function() {
                    t.resolve(e)
                }), t
            }
            var cG = {
                isJoinAttemptIdEnabled: !1,
                joinMultiplayerGame: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        r = {
                            requestType: k.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                            placeId: e.placeId.toString(),
                            isPlayTogetherGame: t,
                            browserTrackerId: k.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (r.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (r.joinAttemptOrigin = e.joinAttemptOrigin), cH(r)
                },
                followPlayerIntoGame: function(e) {
                    var t = {
                        requestType: k.Hybrid.Game.LAUNCH_MODES.FOLLOW_USER,
                        userId: e.userId.toString(),
                        browserTrackerId: k.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), cH(t)
                },
                joinGameInstance: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        r = {
                            requestType: k.Hybrid.Game.LAUNCH_MODES.GAME_INSTANCE,
                            placeId: e.placeId.toString(),
                            instanceId: e.gameId,
                            isPlayTogetherGame: t,
                            browserTrackerId: k.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (r.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (r.joinAttemptOrigin = e.joinAttemptOrigin), cH(r)
                },
                joinPrivateGame: function(e) {
                    var t = {
                        requestType: k.Hybrid.Game.LAUNCH_MODES.PRIVATE_SERVER,
                        placeId: e.placeId.toString(),
                        accessCode: e.accessCode,
                        browserTrackerId: k.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), cH(t)
                },
                playTogetherGame: function(e) {
                    var t = {
                        requestType: k.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                        placeId: e.placeId.toString(),
                        conversationId: e.conversationId.toString(),
                        browserTrackerId: k.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), cH(t)
                }
            };
            C()(document).ready(function() {
                j = new k.TranslationResourceProvider().getTranslationResource("Feature.GameLaunchGuestMode")
            });
            var cV = {
                    restrictGuests: function(e) {
                        var t = new(C()).Deferred;
                        return k.CurrentUser.isAuthenticated ? t.resolve(e) : k.Dialog.open({
                            titleText: j.get("Heading.Dialog.SignUpOrLogin"),
                            bodyContent: j.get("Description.Dialog.ConnectionsSignUpOrLogin"),
                            cssClass: "soli-modal",
                            acceptColor: k.Dialog.green,
                            acceptText: j.get("Action.Dialog.SignUp"),
                            declineText: j.get("Action.Dialog.Login"),
                            onDecline: function() {
                                k.FormEvents && k.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_login");
                                var e = "/login?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search);
                                window.location.href = k.Endpoints ? k.Endpoints.getAbsoluteUrl(e) : e
                            },
                            onAccept: function() {
                                var e;
                                k.FormEvents && k.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_signup"), e = "/CreateAccount?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search), window.location.href = k.Endpoints ? k.Endpoints.getAbsoluteUrl(e) : e
                            }
                        }), t
                    }
                },
                cz = window.CoreUtilities;

            function cW(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var cq = {
                gameLaunchInterface: null,
                gameLaunchLogger: null,
                initialized: new Promise(function(e) {
                    x = e
                })
            };

            function cK(e, t, r) {
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
                    joinAttemptId: null != t ? t : cz.uuidService.generateRandomUuid()
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

            function c$(e, t, r) {
                var n, o, a = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    l = arguments.length > 5 && void 0 !== arguments[5] && arguments[5],
                    u = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : "",
                    c = arguments.length > 7 && void 0 !== arguments[7] ? arguments[7] : "";
                a && i && (n = {
                    url: "".concat(k.EnvironmentUrls.gameJoinApi, "/v1/team-create-preemptive"),
                    withCredentials: !0,
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json"
                    }
                }, o = {
                    gameJoinAttemptId: cz.uuidService.generateRandomUuid(),
                    placeId: e
                }, cz.httpService.post(n, o)), cq.gameLaunchInterface.editGameInStudio(e, t, r, a && l, u, c)
            }

            function cZ(e, t, r, n, o, a, i) {
                var l = {
                    placeId: e,
                    launchData: null == a ? void 0 : a.launchData,
                    eventId: null == a ? void 0 : a.eventId,
                    isPlayTogetherGame: !0 === r,
                    referredByPlayerId: i
                };
                return cq.gameLaunchInterface.isJoinAttemptIdEnabled && (l = cK(l, n, o)), cV.restrictGuests(l).then(cq.gameLaunchInterface.joinMultiplayerGame)
            }
            C().fn.bindGameLaunch = function() {
                return this.find(".VisitButtonPlayGLI").click(function() {
                    var e = C()(this);
                    cZ(e.attr("placeid"), e.data("is-membership-level-ok"))
                }), this.find(".VisitButtonEditGLI").click(function() {
                    var e = C()(this);
                    c$(e.attr("placeid"), e.data("universeid"), !!e.data("allowupload"))
                }), this
            }, C()(document).ready(function() {
                C()("body").bindGameLaunch()
            }), Object.assign(cq, {
                authenticationChecker: cV,
                joinMultiplayerGame: cZ,
                openStudio: function() {
                    cq.gameLaunchInterface.openStudio()
                },
                openPluginInStudio: function(e) {
                    cq.gameLaunchInterface.openPluginInStudio(e)
                },
                editGameInStudio: c$,
                followPlayerIntoGame: function(e, t, r) {
                    var n = {
                        userId: e
                    };
                    return cq.gameLaunchInterface.isJoinAttemptIdEnabled && (n = cK(n, t, r)), cV.restrictGuests(n).then(cq.gameLaunchInterface.followPlayerIntoGame)
                },
                joinGameInstance: function(e, t, r, n, o, a, i) {
                    var l = {
                        placeId: e,
                        gameId: t,
                        isPlayTogetherGame: !0 === n,
                        referredByPlayerId: i
                    };
                    return cq.gameLaunchInterface.isJoinAttemptIdEnabled && (l = cK(l, o, a)), cV.restrictGuests(l).then(cq.gameLaunchInterface.joinGameInstance)
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
                                    return [4, cq.initialized];
                                case 1:
                                    return i.sent(), a = {
                                        placeId: e,
                                        accessCode: t,
                                        linkCode: r
                                    }, cq.gameLaunchInterface.isJoinAttemptIdEnabled && (a = cK(a, n, o)), [2, cq.gameLaunchInterface.joinPrivateGame(a)]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, n) {
                            var o = a.apply(e, t);

                            function i(e) {
                                cW(o, r, n, i, l, "next", e)
                            }

                            function l(e) {
                                cW(o, r, n, i, l, "throw", e)
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
                    return cq.gameLaunchInterface.isJoinAttemptIdEnabled && (o = cK(o, r, n)), cV.restrictGuests(o).then(cq.gameLaunchInterface.playTogetherGame)
                },
                setGameLaunchInterface: function(e) {
                    cq.gameLaunchInterface = e, x()
                },
                setGameLaunchLogger: function(e) {
                    cq.gameLaunchLogger = e
                },
                tryAssetInStudio: function(e) {
                    cq.gameLaunchInterface.tryAssetInStudio(e)
                },
                isJoinAttemptIdEnabled: function() {
                    var e;
                    return null == (e = cq.gameLaunchInterface) ? void 0 : e.isJoinAttemptIdEnabled
                },
                startClientAttemptedEvent: "startClientAttempted",
                startClientFailedEvent: "startClientFailed",
                startClientSucceededEvent: "startClientSucceeded",
                beginInstallEvent: "beginInstall",
                successfulInstallEvent: "successfulInstall",
                manualDownloadEvent: "manualDownload"
            });
            var cY = function(e) {
                    var t, r = "".concat(e, "="),
                        n = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(r)
                        })) ? void 0 : t.slice(r.length);
                    return null == n ? null : {
                        name: e,
                        value: decodeURIComponent(n)
                    }
                },
                cX = function() {
                    var e = cY("RBXcb");
                    if (null == e || "" === e.value) return !1;
                    var t = e.value.split("&").find(function(e) {
                        return "GoogleAnalytics" === e.split("=")[0]
                    });
                    return "true" === (null == t ? void 0 : t.split("=")[1])
                },
                cJ = {
                    lastContext: "unknown",
                    contextCategories: {
                        joinUser: "JoinUser"
                    }
                };

            function cQ(e, t, r, n, o, a) {
                var i, l, u;
                null !== t && "" !== t && "unknown" !== t && (cJ.lastContext = t), k.EventStream.SendEvent(e, cJ.lastContext, function(e) {
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
            Object.assign(cJ, {
                SendGamePlayIntent: function(e, t, r, n, o) {
                    cQ("gamePlayIntent", e, t, r, n, o), C()(document).trigger("playButton:gamePlayIntent")
                },
                SendDevelopIntent: function(e, t) {
                    cQ("developIntent", e, t)
                },
                SendInstallBegin: function(e, t) {
                    cQ("installBegin", e, t)
                },
                SendInstallSuccess: function(e, t) {
                    cQ("installSuccess", e, t)
                },
                SendClientStartAttempt: function(e, t) {
                    cQ("clientStartAttempt", e, t)
                },
                SendClientStartSuccessWeb: function(e, t) {
                    cQ("clientStartSuccessWeb", e, t)
                },
                SendManualDownloadClick: function(e, t) {
                    cQ("manualDownload", e, t)
                }
            });
            var c0 = {
                    logToConsoleEnabled: !1,
                    logToGAEnabled: !0,
                    logToEphemeralCountersEnabled: !0
                },
                c1 = {};
            c1[cq.startClientAttemptedEvent] = ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"], c1[cq.startClientSucceededEvent] = ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"];
            var c2 = {};
            k.GaEventSettings.gaLaunchAttemptAndLaunchSuccessEnabled && (c2[cq.startClientAttemptedEvent] = "Launch Attempt", c2[cq.startClientSucceededEvent] = "Launch Success"), c2[cq.beginInstallEvent] = "Install Begin", c2[cq.successfulInstallEvent] = "Install Success", c2[cq.manualDownloadEvent] = "Manual Download";
            var c3 = {};

            function c6(e) {
                c0.logToConsoleEnabled && console.log(e)
            }

            function c5(e, t) {
                if (c0.logToEphemeralCountersEnabled) {
                    var r, n = C()("#PlaceLauncherStatusPanel").data("os-name");
                    "Windows" === n && (n = "Win32");
                    var o = e;
                    o = (o = o.replace("<os>", n)).replace("<launchmethod>", t), (null == (r = window.EventTracker) ? void 0 : r.fireEvent) && window.EventTracker.fireEvent(o)
                }
            }

            function c8(e, t, r, n) {
                cX() && void 0 !== window.GoogleAnalyticsEvents && c0.logToGAEnabled && window.GoogleAnalyticsEvents.FireEvent && window.GoogleAnalyticsEvents.FireEvent([e, t, r, n])
            }

            function c4(e, t) {
                c6("".concat(e.type, ": ").concat(JSON.stringify(t))), c1[e.type] && C().each(c1[e.type], function(e, r) {
                    c5(r, t.launchMethod)
                }), c2[e.type] && c8(t.launchMethod, c2[e.type], t.params.launchMode, 0), c3[e.type] && c3[e.type](null, t.params.placeId)
            }
            c3[cq.startClientAttemptedEvent] = cJ.SendClientStartAttempt, c3[cq.startClientSucceededEvent] = cJ.SendClientStartSuccessWeb, c3[cq.beginInstallEvent] = cJ.SendInstallBegin, c3[cq.successfulInstallEvent] = cJ.SendInstallSuccess, c3[cq.manualDownloadEvent] = cJ.SendManualDownloadClick, Object.assign(c0, {
                logToConsole: c6,
                logToEphemeralCounters: c5,
                logToGA: c8
            }), C()(document).ready(function() {
                var e = [cq.startClientAttemptedEvent, cq.startClientFailedEvent, cq.startClientSucceededEvent, cq.beginInstallEvent, cq.successfulInstallEvent, cq.manualDownloadEvent];
                C()(cq).on(e.join(" "), c4)
            });
            var c7 = function() {
                    var e = "click";
                    C()("body").on(e, ".VisitButtonPlay, .VisitButtonPlayGLI", function() {
                        var e, t = C()(this);
                        if ((t.hasClass("VisitButtonPlay") || t.hasClass("VisitButtonPlayGLI")) && (e = "PlayButton"), e) {
                            var r = C()(this).attr("placeid"),
                                n = k.UrlParser ? k.UrlParser.getParameterValueByName("rbxp") : null;
                            cJ.SendGamePlayIntent(e, r, n)
                        }
                    }), C()("body").on(e, ".VisitButtonEdit, .VisitButtonEditGLI", function() {
                        var e = C()(this).attr("placeid");
                        cJ.SendDevelopIntent("Edit", e)
                    }), C()("#rbx-running-games").on(e, ".rbx-game-server-item .rbx-game-server-join", function() {
                        var e = C()(this).data("placeid");
                        e && cJ.SendGamePlayIntent("JoinInstance", e)
                    }), C()("#rbx-friends-running-games").on(e, ".rbx-friends-game-server-item .rbx-friends-game-server-join", function() {
                        var e = C()(this).data("placeid");
                        e && cJ.SendGamePlayIntent("JoinInstance", e)
                    }), C()("#game-instances").on(e, "#rbx-vip-servers .rbx-vip-server-item .rbx-vip-server-join", function() {
                        var e = C()(this).data("placeid");
                        e && cJ.SendGamePlayIntent("PrivateServer", e)
                    })
                },
                c9 = window.Roblox["core-scripts"].react,
                se = "u" > typeof window ? window.navigator.userAgent : "",
                st = /Mac OS X/i.test(se),
                sr = /Windows NT/i.test(se);
            /Linux/i.test(se) && /Android/i.test(se);
            var sn = /Android/i.test(se),
                so = /iPhone|iPad|iPod/i.test(se),
                sa = function(e) {
                    var t = e.alt,
                        r = void 0 === t ? "App Icon" : t,
                        n = e.className,
                        o = e.title,
                        a = e.style;
                    return D().createElement("div", {
                        className: "app-icon-bluebg app-icon-".concat(st ? "mac" : sr ? "windows" : so ? "ios" : sn ? "android" : "windows", " ").concat(void 0 === n ? "" : n),
                        role: "img",
                        "aria-label": r,
                        title: (void 0 === o ? "" : o) || r,
                        style: void 0 === a ? {} : a
                    })
                },
                si = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding"],
                sl = ["Common.VisitGame", "CommonUI.Controls"];

            function su(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var sc = {
                    Unknown: 1,
                    WindowsDirectDownload: 2,
                    WindowsStore: 3,
                    MacDirectDownload: 4,
                    AppleAppStore: 5,
                    GooglePlayStore: 6,
                    AmazonAppStore: 7
                },
                ss = {
                    downloadPageHeader: "Heading.DownloadPage",
                    appStoreLinksHeader: "Heading.AppStoreLinks",
                    windowsDownloadLabel: "Action.DownloadWindowsApp",
                    windowsDownloadLink: (0, ev.getAbsoluteUrl)("/download/client?os=win"),
                    macDownloadLabel: "Action.DownloadMacApp",
                    macDownloadLink: (0, ev.getAbsoluteUrl)("/download/client?os=mac"),
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
                sf = (su(I = {}, sc.WindowsDirectDownload, {
                    href: ss.windowsDownloadLink,
                    title: ss.windowsDownloadLabel,
                    name: "windows",
                    icon: "icon-filled-microsoft",
                    legacyIcon: "icon-logo-win",
                    isDirectDownload: !0
                }), su(I, sc.MacDirectDownload, {
                    href: ss.macDownloadLink,
                    title: ss.macDownloadLabel,
                    name: "mac",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !0
                }), su(I, sc.AmazonAppStore, {
                    href: ss.amazonStoreLink,
                    title: ss.androidAppDownloadLabel,
                    name: "amazonStore",
                    icon: "icon-filled-amazon",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), su(I, sc.GooglePlayStore, {
                    href: ss.googlePlayStoreLink,
                    title: ss.androidAppDownloadLabel,
                    name: "android",
                    icon: "icon-filled-android",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), su(I, sc.AppleAppStore, {
                    href: ss.appleAppStoreLink,
                    title: ss.iOSDownloadLabel,
                    name: "iOS",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !1
                }), I),
                sp = function(e) {
                    var t, r = e.translate;
                    return (0, rT.jsxs)(D().Fragment, {
                        children: [(0, rT.jsxs)("div", {
                            className: "flex flex-col gap-small",
                            children: [(0, rT.jsx)("h3", {
                                className: "text-label-large content-emphasis padding-none",
                                children: r("Heading.MobileAppDownloadOption")
                            }), (0, rT.jsx)("p", {
                                className: "text-body-medium",
                                children: r("Label.MobileAppQrCode")
                            })]
                        }), (0, rT.jsx)("div", {
                            className: "flex grow justify-center items-center bg-shift-100 radius-medium padding-x-large",
                            children: (0, rT.jsx)("div", {
                                className: "radius-medium padding-small bg-[white]",
                                children: (0, rT.jsx)("img", {
                                    className: "size-2100",
                                    src: "string" == typeof(t = "https://images.rbxcdn.com/6674b8e189bf79c6.png") ? t : t.src,
                                    alt: ""
                                })
                            })
                        })]
                    })
                };

            function sd(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var sh = function() {
                var e;

                function t(e, r) {
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    sd(this, "url", void 0), sd(this, "searchParams", void 0), this.url = e, this.searchParams = r
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

            function sy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sm(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function sb(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function sv(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function sg(e, t) {
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
                }(e, t) || sO(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sw(e) {
                return function(e) {
                    if (Array.isArray(e)) return sy(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || sO(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sO(e, t) {
                if (e) {
                    if ("string" == typeof e) return sy(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sy(e, t)
                }
            }
            var sP = function(e) {
                    return t8(new URLSearchParams(e))
                },
                sS = function(e) {
                    return Array.isArray(e)
                },
                sE = function(e) {
                    return String(e)
                },
                sA = ["__proto__", "prototype", "constructor"],
                sj = function(e) {
                    return sP(sw(e.entries()).filter(function(e) {
                        var t = sg(e, 2),
                            r = t[0],
                            n = t[1];
                        return !sA.includes(r) && !sA.includes(n)
                    }))
                },
                sx = function() {
                    var e, t;

                    function r(e) {
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        sb(this, "searchParams", void 0), this.searchParams = e
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
                            return this.searchParams.has(e, void 0 === t ? void 0 : sE(t))
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(e, t) {
                            var n = sP(this.searchParams);
                            return n.append(e, sE(t)), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(e) {
                            var t = sv(e, URLSearchParams) || sv(e, r) || sS(e) ? e : Object.entries(e);
                            return r.new(sw(this.searchParams).concat(sw(t)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(e, t) {
                            var n = sP(this.searchParams);
                            return n.set(e, sE(t)), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(e, t) {
                            var n = void 0 === t ? void 0 : sE(t);
                            if (this.searchParams.has(e, n)) {
                                var o = sP(this.searchParams);
                                return o.delete(e, n), r.fromUnique(o)
                            }
                            return this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var e = sP(this.searchParams);
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
                            if (sv(e, r)) return e;
                            var n = sP((sS(e) ? e : Object.entries(e)).map(function(e) {
                                var t = sg(e, 2);
                                return [t[0], sE(t[1])]
                            }));
                            return r.fromUnique(t ? sj(n) : n)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return r.fromUnique(t ? sj(e) : sP(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                n = sP(e);
                            return r.fromUnique(t ? sj(n) : n)
                        }
                    }], e && sm(r.prototype, e), t && sm(r, t), r
                }();

            function sI(e, t, r) {
                return (sI = sN() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && sC(o, r.prototype), o
                }).apply(null, arguments)
            }

            function sT(e) {
                return (sT = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function sC(e, t) {
                return (sC = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function sk(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (sk = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return sI(e, arguments, sT(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), sC(r, e)
                })(e)
            }

            function sN() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (sN = function() {
                    return !!e
                })()
            }
            sb(sx, "empty", sx.fromUnique(sP(""))), sk(Error), sk(Error);
            var sD = function(e) {
                return t8(new URL(e))
            };

            function sR(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function s_(e) {
                return (s_ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function sL(e, t) {
                return (sL = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function sU() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (sU = function() {
                    return !!e
                })()
            }
            var sB = function(e) {
                    var t, r;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e, t) {
                        var r, o;
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        return r = n, o = [e, t], r = s_(r),
                            function(e, t) {
                                var r;
                                if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return e
                            }(this, sU() ? Reflect.construct(r, o || [], s_(this).constructor) : r.apply(this, o))
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: n,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && sL(n, e), t = [{
                        key: "with",
                        value: function(e) {
                            var t = e.scheme,
                                r = e.host,
                                o = e.port,
                                a = e.path,
                                i = e.searchParams,
                                l = e.fragment;
                            if (null == t && null == r && null == o && null == a && null == i && null == l) return this;
                            var u = sD(this.url);
                            if (null != t && (u.protocol = t), null != r && (u.hostname = r), null != o && (u.port = "number" == typeof o ? o.toString() : o), null != a && (u.pathname = a), null != l && (u.hash = l), null != i) {
                                var c = sx.new(i);
                                return u.search = c.toString(), new n(u, c)
                            }
                            return new n(u, this.searchParams)
                        }
                    }, {
                        key: "withScheme",
                        value: function(e) {
                            var t = sD(this.url);
                            return t.protocol = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withHost",
                        value: function(e) {
                            var t = sD(this.url);
                            return t.hostname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withPort",
                        value: function(e) {
                            var t = sD(this.url);
                            return t.port = "number" == typeof e ? e.toString() : e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(e) {
                            var t = sD(this.url);
                            return t.pathname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(e) {
                            var t = sx.new(e),
                                r = sD(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(e) {
                            var t = this.searchParams.copyAndAppendAll(e),
                                r = sD(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withFragment",
                        value: function(e) {
                            var t = sD(this.url);
                            return t.hash = e, new n(t, this.searchParams)
                        }
                    }], r = [{
                        key: "new",
                        value: function(e) {
                            e.password = "", e.username = "";
                            var t = sx.internalFromUniqueURLSearchParams(t8(e.searchParams));
                            return new n(e, t)
                        }
                    }, {
                        key: "fromURL",
                        value: function(e) {
                            return n.new(sD(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            try {
                                return tk(n.new(t8(new URL(e))))
                            } catch (e) {
                                return tN(e)
                            }
                        }
                    }], t && sR(n.prototype, t), r && sR(n, r), n
                }(sh),
                sM = function(e) {
                    var t, r = new URLSearchParams(document.location.search).get("downloadType");
                    if (null != r) {
                        var n = sc[r];
                        if (null != n) return n
                    }
                    if (!e) return sc.Unknown;
                    var o = eA.getDeviceMeta();
                    return (null == o ? void 0 : o.isIosDevice) ? sc.AppleAppStore : (t = e, /Kindle|Silk|KFAPW|KFARWI|KFASWI|KFFOWI|KFJW|KFMEWI|KFOT|KFSAW|KFSOWI|KFTBW|KFTHW|KFTT|WFFOWI|KFAPWI/i.test(t)) ? sc.AmazonAppStore : (null == o ? void 0 : o.isAndroidDevice) ? sc.GooglePlayStore : eA.isMac() ? sc.MacDirectDownload : eA.isWindows() ? sc.WindowsDirectDownload : sc.Unknown
                },
                sF = function(e) {
                    (0, ew.sendEventWithTarget)(ew.eventTypes.formInteraction, "downloadV2", {
                        field: "".concat(e, "DownloadLink"),
                        aType: "click"
                    })
                },
                sH = function(e) {
                    return Object.values(sc).some(function(t) {
                        return t === e
                    })
                },
                sG = function(e) {
                    if (null != e) {
                        if ("number" == typeof e) return sH(e) && sf[e] ? e : void 0;
                        var t = sc[e];
                        if (null != t && sf[t]) return t;
                        var r = Number(e);
                        if (Number.isInteger(r) && sH(r) && sf[r]) return r
                    }
                },
                sV = function() {
                    var e, t, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = r.downloadTypeOverride,
                        o = r.translate,
                        a = null != (e = sG(n)) ? e : sM(navigator.userAgent),
                        i = sf[a];
                    if (i) {
                        var l = i.isDirectDownload ? i.href : null != (t = null == o ? void 0 : o(i.href)) ? t : i.href,
                            u = sB.parse(l);
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

            function sz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

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

            function sq(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            sW(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            sW(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function sK(e, t) {
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
                        if ("string" == typeof e) return sz(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sz(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function s$(e, t) {
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
            var sZ = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, rT.jsxs)(D().Fragment, {
                        children: [(0, rT.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, rT.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                sY = "\x01LINK_START\x01",
                sX = "\x01LINK_END\x01",
                sJ = new RegExp("".concat(sY, "|").concat(sX)),
                sQ = function() {
                    var e = sK(si, 5),
                        t = e[0],
                        r = e[1],
                        n = e[2],
                        o = e[3],
                        a = e[4],
                        i = aw(t),
                        l = aw(r),
                        u = aw(n),
                        c = aw(o),
                        s = aw(a);
                    return (0, N.useMemo)(function() {
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
                s0 = Error("client not started"),
                s1 = 0,
                s2 = function(e) {
                    var t = sK((0, N.useState)(function() {
                            return s1 += 1
                        }), 1)[0],
                        r = (0, R.useQuery)({
                            queryKey: ["client-status", t],
                            queryFn: function() {
                                return sq(function() {
                                    return s$(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, tH(function() {
                                                    var e, t;
                                                    return tG(this, function(r) {
                                                        switch (r.label) {
                                                            case 0:
                                                                return [4, U.get(tV(L().matchmakingApi, "/v1/client-status"), tz, {
                                                                    credentials: "include"
                                                                })];
                                                            case 1:
                                                                return t = r.sent().getOrThrow().status, [2, null != (e = tW.find(function(e) {
                                                                    return e === t
                                                                })) ? e : "Unknown"]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                if ("Unknown" === t.sent()) throw s0;
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
                s3 = function(e) {
                    var t = e.download,
                        r = e.launchGame,
                        n = e.unmount,
                        o = sK((0, N.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = sQ(),
                        u = s2(n);
                    if (!a) {
                        var c = l(u ? "Label.RobloxLoadingToPlay" : "Label.RobloxExciteToDownload");
                        return (0, rT.jsx)(lZ, {
                            hasCloseAffordance: !0,
                            closeLabel: l("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: n,
                            children: (0, rT.jsxs)(lY, {
                                className: "download-dialog",
                                children: [(0, rT.jsxs)(lX, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, rT.jsx)(sa, {
                                        className: "size-1600"
                                    }), (0, rT.jsx)(lJ, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? sZ(c) : c
                                    })]
                                }), (0, rT.jsx)(lQ, {
                                    className: "flex",
                                    children: u ? (0, rT.jsx)(na, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, rT.jsx)(na, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return sq(function() {
                                                var e;
                                                return s$(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            try {
                                                                (e = sV()) && sF(e.link.name)
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
                    var s = (0, eA.isMac)(),
                        f = s ? (0, ev.getAbsoluteUrl)("/download/client?os=mac") : (0, ev.getAbsoluteUrl)("/download/client?os=win");
                    return (0, rT.jsx)(lZ, {
                        hasCloseAffordance: !0,
                        closeLabel: l("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: n,
                        children: (0, rT.jsx)(lY, {
                            className: "install-dialog",
                            children: (0, rT.jsx)(lX, {
                                className: "content-default",
                                children: (0, rT.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, rT.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, rT.jsx)(lJ, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: l("Heading.DownloadConfirmation")
                                        }), (0, rT.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(l("Label.FollowInstallSteps"), " ").concat(l("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(f, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, rT.jsx)("div", {}), " ", (0, rT.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, rT.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, rT.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: l("Heading.InstallInstructions")
                                            }), (0, rT.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, rT.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l(s ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, rT.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, rT.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: l("Response.Dialog.ThirdInstruction")
                                                }), (0, rT.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = l("Response.Dialog.FourthInstruction", {
                                                                startLink: sY,
                                                                endLink: sX
                                                            }),
                                                            t = e.split(sJ);
                                                        if (t.length < 3) return e;
                                                        var n = sK(t, 3),
                                                            o = n[0],
                                                            a = n[1],
                                                            i = n[2];
                                                        return (0, rT.jsxs)(D().Fragment, {
                                                            children: [o, (0, rT.jsx)("button", {
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
                                        }), (0, rT.jsx)("div", {}), " ", (0, rT.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, rT.jsx)("div", {}), " ", (0, rT.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, rT.jsx)(sp, {
                                                translate: l
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                };

            function s6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var s5 = function(e) {
                    var t = e.unmount,
                        r = function(e) {
                            if (Array.isArray(e)) return e
                        }(sl) || function(e) {
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
                        }(sl) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return s6(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return s6(e, 2)
                            }
                        }(sl) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        n = r[0],
                        o = r[1],
                        a = aw(n),
                        i = aw(o);
                    return (0, rT.jsx)(lZ, {
                        hasCloseAffordance: !1,
                        isModal: !0,
                        open: !0,
                        size: "Small",
                        onOpenChange: function(e) {
                            e || t()
                        },
                        children: (0, rT.jsxs)(lY, {
                            children: [(0, rT.jsxs)(lX, {
                                className: "flex flex-col gap-small",
                                children: [(0, rT.jsx)(lJ, {
                                    className: "text-heading-small content-emphasis padding-none",
                                    children: a("Heading.ErrorStartingGame")
                                }), (0, rT.jsx)("p", {
                                    className: "text-body-medium content-default",
                                    children: a("Response.Dialog.ErrorLaunching")
                                })]
                            }), (0, rT.jsx)(lQ, {
                                className: "flex",
                                children: (0, rT.jsx)(na, {
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
                s8 = window.Roblox["core-lib"].index;

            function s4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function s7(e) {
                return function(e) {
                    if (Array.isArray(e)) return s4(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return s4(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return s4(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            s7(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(s7(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "nl-nl", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var s9 = s7(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(s7(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "nl_nl", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                fe = s7(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(s7(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "nl-NL", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));

            function ft(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            s7(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "pl", "pt", "th", "tr", "vi"]).concat(s7(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var fr = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                fn = function(e) {
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
                                    if ("string" == typeof e) return ft(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ft(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [oF(r), n]
                        ]
                    }))
                },
                fo = function(e) {
                    var t = fr(),
                        r = t.Lang,
                        n = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [oF(e), function(e) {
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
                        }({}, fn(null == o ? void 0 : o[e]), fn(null == r ? void 0 : r[e]), fn(null == n ? void 0 : n[e]))]
                    }))
                },
                fa = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        a = e.children,
                        i = n.join(","),
                        l = (0, N.useMemo)(function() {
                            return fo(n)
                        }, [i]);
                    return (0, rT.jsx)(oN, {
                        locale: null != o ? o : null != (t = null != (r = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, s8.arrayIncludes)(fe, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? r : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                                var r = t.dataset.languageCode;
                                if (r && (0, s8.arrayIncludes)(s9, r)) return r.replace("_", "-")
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: a
                    })
                },
                fi = JSON.parse('{"P":["Feature.GameLaunchGuestMode","Common.VisitGame","CommonUI.Controls","Feature.ExperienceDetails","Feature.DownloadLanding"]}'),
                fl = window.Roblox["core-scripts"].meta.user,
                fu = function() {
                    var e, t, r;
                    return null != (e = null == (r = cY("RBXEventTrackerV2")) || null == (t = r.value.match(/browserid=([^&]*)/i)) ? void 0 : t[1]) && e
                };

            function fc(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var fs = function() {
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
                                if (null == (0, fl.authenticatedUser)()) return [3, 2];
                                return [4, tq()];
                            case 1:
                                return e = t.sent(), [3, 3];
                            case 2:
                                e = void 0, t.label = 3;
                            case 3:
                                return [2, {
                                    authTicket: e,
                                    btId: fu() || void 0
                                }]
                        }
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            fc(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            fc(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };
            ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
            });
            var ff = "deeplink",
                fp = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                    return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
                }),
                fd = ["/share-links"],
                fh = ["ExperienceAffiliate"],
                fy = function(e) {
                    var t;
                    return fd.includes(e.pathname) && fh.includes(null != (t = e.searchParams.get("type")) ? t : "")
                },
                fm = function(e) {
                    try {
                        var t = new URL(e).searchParams.get("referralUrl");
                        if (!t) return null;
                        var r = new URL(decodeURIComponent(t));
                        if (fy(r)) return r.href;
                        return null
                    } catch (e) {
                        return null
                    }
                },
                fb = function(e, t, r) {
                    var n;
                    try {
                        null == (n = window.Roblox.EventStream) || n.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: t,
                            group: ff,
                            action: "create-token-attempt",
                            status_code: r,
                            token: null != e ? e : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (e) {}
                };

            function fv(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var fg = "".concat(L().apiGatewayUrl, "/deferred-deep-link/token-api"),
                fw = function(e) {
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
                                        group: ff
                                    }, t && (a.authTicket = t), n && (a.btId = n), o && (a.downloadSource = o), i = {
                                        withCredentials: !0,
                                        url: "".concat(fg, "/create-token")
                                    }, s.label = 1;
                                case 1:
                                    return s.trys.push([1, 3, , 4]), [4, G.post(i, a)];
                                case 2:
                                    return fb(c = null != (l = (u = s.sent()).data.token) ? l : null, e, u.status), [2, c];
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
                                fv(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                fv(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                };

            function fO(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function fP(e) {
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

            function fS(e, t) {
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

            function fE(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function fA(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            fE(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            fE(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function fj(e, t) {
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

            function fx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fI(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function fT(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            fI(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            fI(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function fC(e, t) {
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
                        if ("string" == typeof e) return fx(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fx(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fk(e, t) {
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
            var fN = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, rT.jsxs)(D().Fragment, {
                        children: [(0, rT.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, rT.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                fD = "\x01LINK_START\x01",
                fR = "\x01LINK_END\x01",
                f_ = new RegExp("".concat(fD, "|").concat(fR)),
                fL = function(e) {
                    var t = e.download,
                        r = e.launchGame,
                        n = e.unmount,
                        o = fC((0, N.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = (0, c9.useTranslation)().translate,
                        u = (0, R.useQuery)({
                            queryKey: ["client-status"],
                            queryFn: function() {
                                return fT(function() {
                                    return fk(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, fA(function() {
                                                    return fj(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return [4, G.get({
                                                                    url: "".concat(L().matchmakingApi, "/v1/client-status"),
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
                        return (0, rT.jsx)(lZ, {
                            hasCloseAffordance: !0,
                            closeLabel: l("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: n,
                            children: (0, rT.jsxs)(lY, {
                                className: "download-dialog",
                                children: [(0, rT.jsxs)(lX, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, rT.jsx)(sa, {
                                        className: "size-1600"
                                    }), (0, rT.jsx)(lJ, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? fN(c) : c
                                    })]
                                }), (0, rT.jsx)(lQ, {
                                    className: "flex",
                                    children: u ? (0, rT.jsx)(na, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, rT.jsx)(na, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return fT(function() {
                                                var e;
                                                return fk(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            try {
                                                                (e = sV()) && sF(e.link.name)
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
                    var s = (0, eA.isMac)(),
                        f = s ? (0, ev.getAbsoluteUrl)("/download/client?os=mac") : (0, ev.getAbsoluteUrl)("/download/client?os=win");
                    return (0, rT.jsx)(lZ, {
                        hasCloseAffordance: !0,
                        closeLabel: l("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: n,
                        children: (0, rT.jsx)(lY, {
                            className: "install-dialog",
                            children: (0, rT.jsx)(lX, {
                                className: "content-default",
                                children: (0, rT.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, rT.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, rT.jsx)(lJ, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: l("Heading.DownloadConfirmation")
                                        }), (0, rT.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(l("Label.FollowInstallSteps"), " ").concat(l("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(f, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, rT.jsx)("div", {}), " ", (0, rT.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, rT.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, rT.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: l("Heading.InstallInstructions")
                                            }), (0, rT.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, rT.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l(s ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, rT.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, rT.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: l("Response.Dialog.ThirdInstruction")
                                                }), (0, rT.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = l("Response.Dialog.FourthInstruction", {
                                                                startLink: fD,
                                                                endLink: fR
                                                            }),
                                                            t = e.split(f_);
                                                        if (t.length < 3) return e;
                                                        var n = fC(t, 3),
                                                            o = n[0],
                                                            a = n[1],
                                                            i = n[2];
                                                        return (0, rT.jsxs)(D().Fragment, {
                                                            children: [o, (0, rT.jsx)("button", {
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
                                        }), (0, rT.jsx)("div", {}), " ", (0, rT.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, rT.jsx)("div", {}), " ", (0, rT.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, rT.jsx)(sp, {
                                                translate: l
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                },
                fU = function(e) {
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
                        getBrowserTrackerId: fu,
                        isAuthenticated: fl.isAuthenticated,
                        isWindowsOrMac: function() {
                            return (0, eA.isWindows)() || (0, eA.isMac)()
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

            function fB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fM(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function fF(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            fM(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            fM(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function fH(e) {
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

            function fG(e, t) {
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
                        if ("string" == typeof e) return fB(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fB(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fV(e, t) {
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
            var fz = {
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

            function fW(e) {
                return "edit" === e || "plugin" === e || "asset" === e
            }

            function fq() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "react-dialog-container",
                    t = document.getElementById(e);
                return t ? (aZ().unmountComponentAtNode(t), t.innerHTML = "") : ((t = document.createElement("div")).id = e, document.body.appendChild(t)), t
            }

            function fK() {
                C().modal.close();
                var e = new k.TranslationResourceProvider,
                    t = e.getTranslationResource("Common.VisitGame"),
                    r = e.getTranslationResource("CommonUI.Controls");
                k.Dialog.open({
                    titleText: t.get("Heading.ErrorStartingGame"),
                    bodyContent: t.get("Response.Dialog.ErrorLaunching"),
                    acceptText: r.get("Action.OK") || "OK",
                    showDecline: !1
                })
            }

            function f$() {
                C().modal.close();
                var e = fq("react-launch-failure-dialog-container");
                (0, c9.renderWithErrorBoundary)((0, rT.jsx)(fa, {
                    namespaces: fi.P,
                    children: (0, rT.jsx)(s5, {
                        unmount: function() {
                            return aZ().unmountComponentAtNode(e)
                        }
                    })
                }), e)
            }

            function fZ(e) {
                C().modal.close();
                var t = {
                    launchMethod: "Protocol",
                    params: e
                };
                C()(cq).trigger(cq.startClientSucceededEvent, t), fz.isInstalling && (C()(cq).trigger(cq.successfulInstallEvent, t), fz.isInstalling = !1)
            }

            function fY(e) {
                var t = C()("iframe#gamelaunch");
                t.length > 0 && t.remove(), t = C()("<iframe id='gamelaunch' class='hidden'></iframe>").attr("src", e), C()("body").append(t);
                var r = new Event("ProtocolLaunchStartSelenium");
                window.dispatchEvent(r)
            }

            function fX(e) {
                return fF(function() {
                    var t, r, n;
                    return fV(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (o.trys.push([0, 5, , 6]), t = fW(null == e ? void 0 : e.launchMode), r = fA(function() {
                                        return fj(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, G.post({
                                                        url: "".concat(L().matchmakingApi, "/v1/client-status"),
                                                        withCredentials: !0
                                                    }, {
                                                        status: "Unknown"
                                                    })];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    })(), !(k.CurrentUser.isAuthenticated && !t)) return [3, 2];
                                return [4, Promise.all([fA(function() {
                                    var e, t, r;
                                    return fj(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return n.trys.push([0, 2, , 3]), [4, G.get({
                                                    url: "".concat(L().authApi, "/v1/client-assertion/"),
                                                    withCredentials: !0
                                                })];
                                            case 1:
                                                return e = n.sent().data, [3, 3];
                                            case 2:
                                                return n.sent(), [3, 3];
                                            case 3:
                                                return n.trys.push([3, 5, , 6]), [4, G.post({
                                                    url: "".concat(L().authApi, "/v1/authentication-ticket/"),
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
                                return n = fG.apply(void 0, [o.sent(), 1])[0], [3, 4];
                            case 2:
                                return [4, r];
                            case 3:
                                o.sent(), o.label = 4;
                            case 4:
                                var a, i, l, u, c, s, f;
                                return a = n, u = fW(null == e ? void 0 : e.launchMode), c = fz.protocolUrlSeparator, s = "".concat(e.protocolName, ":"), (f = []).push(1), f.push("launchmode:".concat(e.launchMode)), a && (e.protocolName !== fz.protocolNameForStudio || 0 !== a.indexOf("Guest:")) && f.push("gameinfo:".concat(encodeURIComponent(a))), f.push("launchtime:".concat(e.launchTime)), u && k.CurrentUser.isAuthenticated && (f.push("distributorType:".concat("Global")), f.push("userId:".concat(k.CurrentUser.userId))), u && f.push("browser:".concat((0, cz.getCurrentBrowser)())), C().each(e.otherParams, function(e, t) {
                                    e === t ? f.push(e) : f.push("".concat(e, ":").concat(encodeURIComponent(t)))
                                }), s += f.join(c), null == (l = cq.gameLaunchLogger) || null == (i = l.logToConsole) || i.call(l, "launchProtocolUrl: ".concat(JSON.stringify({
                                    url: s,
                                    params: e
                                }))), fY(s), fZ(e), [3, 6];
                            case 5:
                                return console.error(o.sent()), fK(), [3, 6];
                            case 6:
                                return [2]
                        }
                    })
                })()
            }

            function fJ(e) {
                var t = fH({}, e);
                t.launchTime = Date.now(), t.otherParams.browsertrackerid = k.Cookies.getBrowserTrackerId(), t.otherParams.robloxLocale = fz.robloxLocale, t.otherParams.gameLocale = fz.gameLocale, t.protocolName === fz.protocolNameForStudio ? t.otherParams.channel = fz.studioChannel : fz.isOmitPlayerChannelForWinAndMacEnabled && ((0, eA.isWindows)() || (0, eA.isMac)()) || (t.otherParams.channel = fz.playerChannel), fz.isDuarAutoOptInEnabled && t.protocolName === fz.protocolNameForClient && !t.otherParams.LaunchExp && (fz.isDuarOptOutDisabled ? t.otherParams.LaunchExp = "InApp" : t.otherParams.LaunchExp = "PreferInApp"), C()(cq).trigger(cq.startClientAttemptedEvent, {
                    launchMethod: "Protocol",
                    params: t
                });
                var r = fX(t);
                return fz.showDialog(t), r
            }

            function fQ(e) {
                return fz.isSharedGameLauncherEnabled ? (0, rT.jsx)(fa, {
                    namespaces: fi.P,
                    children: (0, rT.jsx)(R.QueryClientProvider, {
                        client: c9.queryClient,
                        children: (0, rT.jsx)(s3, fH({}, e))
                    })
                }) : (0, rT.jsx)(c9.TranslationProvider, {
                    config: fi.P,
                    children: (0, rT.jsx)(R.QueryClientProvider, {
                        client: c9.queryClient,
                        children: (0, rT.jsx)(fL, fH({}, e))
                    })
                })
            }

            function f0() {
                var e = " ";
                return k.Endpoints && k.Endpoints.Urls && (e = k.Endpoints.getAbsoluteUrl("/Game/PlaceLauncher.ashx")), "h" !== e[0] && (e = "http://".concat(window.location.host, "/Game/PlaceLauncher.ashx")), e.replace("placelauncher", "PlaceLauncher")
            }

            function f1(e, t) {
                var r = {
                    request: e,
                    browserTrackerId: k.Cookies.getBrowserTrackerId()
                };
                return C().extend(r, t), "".concat(f0(), "?").concat(C().param(r))
            }

            function f2() {
                return fF(function() {
                    var e, t, r;
                    return fV(this, function(n) {
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
                                                        var t = fm(e);
                                                        if (t) return t;
                                                        var r = new URL(e);
                                                        return (r.search = "", r.hash = "", fp.some(function(e) {
                                                            return e.test(r.pathname)
                                                        })) ? r.toString() : null
                                                    }(o))) return [2, e];
                                                return n = [t], a = [{}], [4, fs()];
                                            case 1:
                                                return [4, fw.apply(void 0, n.concat([fS.apply(void 0, [fP.apply(void 0, a.concat([i.sent()])), {
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
                                            fO(o, r, n, i, l, "next", e)
                                        }

                                        function l(e) {
                                            fO(o, r, n, i, l, "throw", e)
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

            function f3() {
                fz.isSharedGameLauncherEnabled = !0;
                var e = t5(fU({
                    state: fz,
                    getPlaceLauncherBaseUrl: f0,
                    triggerEvent: function(e, t) {
                        return C()(cq).trigger(cq["".concat(e, "Event")], t)
                    },
                    logToConsole: function(e) {
                        var t, r;
                        return null == (r = cq.gameLaunchLogger) || null == (t = r.logToConsole) ? void 0 : t.call(r, e)
                    },
                    showDialog: function(e, t) {
                        return fz.showDialog(e, t)
                    },
                    closeDialog: function() {
                        return C().modal.close()
                    },
                    showLaunchFailureDialog: f$,
                    openProtocolUrl: fY
                }));
                Object.assign(fz, {
                    joinMultiplayerGame: e.joinMultiplayerGame,
                    followPlayerIntoGame: e.followPlayerIntoGame,
                    joinGameInstance: e.joinGameInstance,
                    joinPrivateGame: e.joinPrivateGame,
                    playTogetherGame: e.playTogetherGame
                })
            }

            function f6() {
                return fF(function() {
                    return fV(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return C()(cq).trigger(cq.manualDownloadEvent, {
                                    launchMethod: "Protocol",
                                    params: {}
                                }), [4, f2()];
                            case 1:
                                return e.sent(), [2]
                        }
                    })
                })()
            }

            function f5(e) {
                switch (k.EnvironmentUrls.domain) {
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
            Object.assign(fz, {
                joinMultiplayerGame: function(e) {
                    var t = fz.protocolNameForClient,
                        r = f1("RequestGame", e),
                        n = !0 === e.isPlayTogetherGame;
                    return fJ({
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
                    return fz.avatarParamEnabled && (e.avatar = "avatar"), fJ({
                        protocolName: fz.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: e
                    })
                },
                tryAssetInStudio: function(e) {
                    var t = {
                        assetid: e
                    };
                    return fz.avatarParamEnabled && (t.avatar = "avatar"), fJ({
                        protocolName: fz.protocolNameForStudio,
                        launchMode: "asset",
                        otherParams: t
                    })
                },
                openPluginInStudio: function(e) {
                    var t = {
                        pluginid: e
                    };
                    fz.avatarParamEnabled && (t.avatar = "avatar"), fJ({
                        protocolName: fz.protocolNameForStudio,
                        launchMode: "plugin",
                        otherParams: t
                    })
                },
                editGameInStudio: function(e, t, r) {
                    var n, o, a, i, l, u, c = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                        s = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : "",
                        f = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : "";
                    fz.separateScriptParamsEnabled ? (u = {
                        task: c ? "StartTeamTest" : "EditPlace",
                        placeId: e,
                        universeId: t
                    }, !c && (s && (u.targetInstanceId = s), f && (u.annotationId = f))) : u = {
                        script: (n = e, o = t, a = r, i = "Edit.ashx", l = " ", k.Endpoints && k.Endpoints.Urls && (l = "".concat(k.Endpoints.getAbsoluteUrl("/Game/".concat(i)), "?")), "h" !== l[0] && (l = "http://".concat(window.location.host) + "/Game/".concat(i, "?")), l + C().param({
                            placeId: n,
                            upload: a ? n : "",
                            universeId: o,
                            testMode: !1
                        }))
                    }, fz.avatarParamEnabled && (u.avatar = "avatar"), fJ({
                        protocolName: fz.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: u,
                        placeId: e
                    })
                },
                followPlayerIntoGame: function(e) {
                    return fJ({
                        protocolName: fz.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: f1("RequestFollowUser", e)
                        }
                    })
                },
                joinGameInstance: function(e) {
                    var t = fz.protocolNameForClient,
                        r = f1("RequestGameJob", e),
                        n = !0 === e.isPlayTogetherGame;
                    return fJ({
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
                    return fJ({
                        protocolName: fz.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: f1("RequestPrivateGame", e)
                        },
                        placeId: e.placeId
                    })
                },
                playTogetherGame: function(e) {
                    return fJ({
                        protocolName: fz.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: f1("RequestPlayTogetherGame", e)
                        },
                        placeId: e.placeId,
                        conversationId: e.conversationId
                    })
                },
                manualDownload: f6,
                attachManualDownloadToLink: function() {
                    return fF(function() {
                        return fV(this, function(e) {
                            return C()("body #GameLaunchManualInstallLink").click(function() {
                                return fF(function() {
                                    return fV(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, f6()];
                                            case 1:
                                                return e.sent(), [2, !1]
                                        }
                                    })
                                })()
                            }), [2]
                        })
                    })()
                },
                startDownload: f2,
                setLocationHref: fY,
                openDesktopUniversalApp: function() {
                    var e = {};
                    e.protocolName = fz.protocolNameForClient, e.launchTime = Date.now(), e.launchMode = "app", e.otherParams = {}, e.otherParams.browsertrackerid = k.Cookies.getBrowserTrackerId(), e.otherParams.robloxLocale = fz.robloxLocale, e.otherParams.gameLocale = fz.gameLocale, e.otherParams.LaunchExp = "InApp", C()(cq).trigger(cq.startClientAttemptedEvent, {
                        launchMethod: "Protocol",
                        params: e
                    });
                    var t = fX(e);
                    return fz.showDialog(e), t
                },
                startDeepLinkFlow: function(e) {
                    var t = fq();
                    (0, c9.renderWithErrorBoundary)(fQ({
                        download: function() {
                            return fF(function() {
                                return fV(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return C()(cq).trigger(cq.beginInstallEvent, {
                                                launchMethod: "Protocol",
                                                params: {}
                                            }), fz.isInstalling = !0, [4, f2()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        },
                        launchGame: function() {
                            return fF(function() {
                                return fV(this, function(t) {
                                    return fY(e), [2]
                                })
                            })()
                        },
                        unmount: function() {
                            return aZ().unmountComponentAtNode(t)
                        }
                    }), t), fY(e)
                },
                showDialog: function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : function() {
                            return fX(e)
                        },
                        r = fq(),
                        n = function() {
                            return aZ().unmountComponentAtNode(r)
                        },
                        o = fW(null == e ? void 0 : e.launchMode);
                    (0, c9.renderWithErrorBoundary)(fQ({
                        download: function() {
                            return fF(function() {
                                var t, r;
                                return fV(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (e.placeId && null != (t = window.localStorage.getItem("ref_info"))) {
                                                window.localStorage.removeItem("ref_info"), r = {};
                                                try {
                                                    r = JSON.parse(atob(t))
                                                } catch (e) {}
                                                e.referredByPlayerId = r[e.placeId]
                                            }
                                            if (C()(cq).trigger(cq.beginInstallEvent, {
                                                    launchMethod: "Protocol",
                                                    params: e
                                                }), fz.isInstalling = !0, !o) return [3, 1];
                                            return document.getElementById("downloadInstallerIFrame").src = "/download/studio", n(), [3, 3];
                                        case 1:
                                            return [4, f2()];
                                        case 2:
                                            a.sent(), a.label = 3;
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        launchGame: function() {
                            return fF(function() {
                                return fV(this, function(e) {
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
                showLaunchFailureDialog: fK,
                cleanUpAndLogSuccess: fZ,
                startGameWithDeepLinkUrl: function(e, t) {
                    var r = {
                        launchMode: "play",
                        protocolName: fz.protocolNameForClient,
                        placeId: t
                    };
                    fz.showDialog(r), fY(e)
                },
                enableSharedGameLauncher: f3
            }), C()(document).ready(function() {
                cq.setGameLaunchInterface(fz);
                var e = C()("#PlaceLauncherStatusPanel");
                fz.protocolNameForClient = f5("roblox-player"), fz.protocolNameForStudio = f5("roblox-studio"), fz.protocolDetectionEnabled = !0, fz.separateScriptParamsEnabled = !0, fz.avatarParamEnabled = !0, fz.isJoinAttemptIdEnabled = !0, fz.robloxLocale = e.data("protocol-roblox-locale"), fz.gameLocale = e.data("protocol-game-locale");
                var t = e.data("protocol-channel-name");
                "string" == typeof t && "LIVE" !== t.toUpperCase() && (fz.channel = t);
                var r = e.data("protocol-studio-channel-name");
                "string" == typeof r && "LIVE" !== r.toUpperCase() && (fz.studioChannel = r);
                var n = e.data("protocol-player-channel-name");
                "string" == typeof n && "LIVE" !== n.toUpperCase() && (fz.playerChannel = n), fz.logger || void 0 === window.Roblox.ProtocolHandlerLogger || (fz.logger = window.Roblox.ProtocolHandlerLogger), fz.isDuarAutoOptInEnabled = e.data("is-duar-auto-opt-in-enabled"), fz.isDuarOptOutDisabled = e.data("is-duar-opt-out-disabled"), fz.isOmitPlayerChannelForWinAndMacEnabled = e.data("is-omit-player-channel-for-win-and-mac-enabled"), !0 === e.data("is-www-common-game-launcher-enabled") && f3()
            }), Object.assign(window.Roblox, {
                AuthenticationChecker: cV,
                GameLauncher: cq,
                GameLaunchLogger: c0,
                GamePlayEvents: cJ,
                ProtocolHandlerClientInterface: fz,
                PlayButton: {
                    usePlayabilityStatus: eb,
                    PlayabilityStatuses: ee,
                    launchGame: rS,
                    launchLogin: rE,
                    shouldShowUnplayableButton: rx,
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
                            p = void 0 === f ? cR : f,
                            d = e.appsFlyerReferralProperties,
                            h = void 0 === d ? cR : d,
                            y = e.disableLoadingState,
                            m = e.buttonClassName,
                            b = e.redirectPurchaseUrl,
                            v = e.showDefaultPurchaseText,
                            g = e.shouldShowVpcPlayButtonUpsells,
                            w = e.playabilityStatusCtaOverrides,
                            O = e.pageContext,
                            P = e.playOnWebEnabled,
                            S = ca(o, r, u === ee.PurchaseRequired || u === ee.FiatPurchaseRequired),
                            E = S.isLoading,
                            A = S.productInfo,
                            j = S.productDetails,
                            x = [{
                                isEnabled: !!c,
                                primaryStatuses: c_,
                                render: function() {
                                    return (0, rT.jsx)(cb, {
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
                                isEnabled: !!P,
                                primaryStatuses: cL,
                                render: function() {
                                    return (0, rT.jsx)(cv, {
                                        placeId: r
                                    })
                                }
                            }],
                            I = !1;
                        switch (u) {
                            case void 0:
                                if (!y) {
                                    t = (0, rT.jsx)(aj, {
                                        buttonClassName: m
                                    });
                                    break
                                }
                                t = (0, rT.jsx)(cU, {
                                    universeId: o,
                                    placeId: r,
                                    rootPlaceId: n,
                                    privateServerLinkCode: a,
                                    gameInstanceId: i,
                                    status: ee.Playable,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: h,
                                    disableLoadingState: y,
                                    buttonClassName: m,
                                    pageContext: O
                                });
                                break;
                            case ee.GuestProhibited:
                            case ee.Playable:
                                var T = null == w ? void 0 : w[u];
                                if (void 0 !== T) {
                                    t = T;
                                    break
                                }
                                t = (0, rT.jsx)(cU, {
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
                            case ee.ContextualPlayabilityUnverifiedSeventeenPlusUser:
                            case ee.ContextualPlayabilityAgeCheckRequired:
                                H(es.ActionNeeded), t = (0, rT.jsx)(cx, {
                                    universeId: o,
                                    buttonClassName: m,
                                    playabilityStatus: u,
                                    pageContext: O
                                });
                                break;
                            case ee.PurchaseRequired:
                            case ee.FiatPurchaseRequired:
                                var C = u === ee.FiatPurchaseRequired ? !!(null == j ? void 0 : j.fiatPurchaseData) : !!(null == A ? void 0 : A.isForSale);
                                if (!E && !C) {
                                    H(es.Unplayable), t = (0, rT.jsx)(cO, {
                                        hideButtonText: s,
                                        buttonClassName: m
                                    });
                                    break
                                }
                                t = (0, rT.jsx)(cy, {
                                    refetchPlayabilityStatus: l,
                                    universeId: o,
                                    placeId: r,
                                    hideButtonText: s,
                                    buttonClassName: m,
                                    redirectPurchaseUrl: b,
                                    playabilityStatus: u,
                                    showDefaultPurchaseText: v,
                                    pageContext: O
                                }), I = E;
                                break;
                            case ee.FiatPurchaseDeviceRestricted:
                            case ee.ContextualPlayabilityRegionalAvailability:
                                H(es.Unplayable), t = (0, rT.jsx)(cO, {
                                    hideButtonText: s,
                                    buttonClassName: m
                                });
                                break;
                            case ee.ContextualPlayabilityAgeRecommendationParentalControls:
                                if (g) {
                                    H(es.ActionNeeded), t = (0, rT.jsx)(ct, {
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
                                H(es.Unplayable), t = (0, rT.jsx)(cO, {
                                    hideButtonText: s,
                                    buttonClassName: m
                                });
                                break;
                            case ee.ContextualPlayabilityRequireParentApproval:
                                if (g) {
                                    H(es.ActionNeeded), t = (0, rT.jsx)(aA, {
                                        universeId: o,
                                        buttonClassName: m,
                                        pageContext: O
                                    });
                                    break
                                }
                                H(es.Unplayable), t = (0, rT.jsx)(cO, {
                                    hideButtonText: s,
                                    buttonClassName: m
                                });
                                break;
                            case ee.UnplayableOtherReason:
                            case ee.GameUnapproved:
                            case ee.IncorrectConfiguration:
                            case ee.UniverseRootPlaceIsPrivate:
                            case ee.InsufficientPermissionFriendsOnly:
                            case ee.InsufficientPermissionGroupOnly:
                            case ee.DeviceRestricted:
                            case ee.UnderReview:
                            case ee.AccountRestricted:
                            case ee.TemporarilyUnavailable:
                            case ee.ComplianceBlocked:
                            case ee.ContextualPlayabilityRegionalCompliance:
                            case ee.ContextualPlayabilityAgeGated:
                            case ee.PlaceHasNoPublishedVersion:
                            case ee.ContextualPlayabilityUnrated:
                            case ee.ContextualPlayabilityAgeGatedByDescriptor:
                            case ee.ContextualPlayabilityExperienceBlockedParentalControls:
                            case ee.ContextualPlayabilityCoreGated:
                            case ee.ContextualPlayabilityPlaytestDisabled:
                            case ee.ContextualPlayabilityTrustedFriendRequired:
                            default:
                                H(es.Unplayable), t = (0, rT.jsx)(cO, {
                                    hideButtonText: s,
                                    buttonClassName: m
                                })
                        }
                        return (0, rT.jsx)(cw, {
                            primaryButton: t,
                            secondaryButton: cg(x, u),
                            isPrimaryButtonLoading: I
                        })
                    },
                    PlayButton: cU,
                    PurchaseButton: cy,
                    Error: function(e) {
                        var t = e.playabilityStatus,
                            r = e.errorClassName,
                            n = e.containerRef,
                            o = aS()(Object.hasOwn(er, t) ? er[t] : er[ee.UnplayableOtherReason]);
                        return (0, rT.jsx)("span", {
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
                            l = aS(),
                            u = (0, N.useRef)(null),
                            c = cB(l, {
                                playabilityStatus: t,
                                shouldShowVpcPlayButtonUpsells: r,
                                shouldShowNoticeAgreementIfPlayable: o,
                                unplayableDisplayText: n
                            });
                        return (cF(u, {
                            universeId: i.universeId,
                            playabilityStatus: t,
                            pageContext: i.pageContext,
                            attributionId: i.attributionId,
                            contextualMessage: null == c ? void 0 : c.message
                        }), c) ? (0, rT.jsx)("span", {
                            ref: u,
                            "data-testid": c.testId,
                            className: void 0 === a ? "contextual-message" : a,
                            children: c.message
                        }) : null
                    }
                }
            }), C()(document).ready(function() {
                c7();
                var e = (0, k.DeviceMeta)();
                (e.isUWPApp || e.isUniversalApp) && (cG.isJoinAttemptIdEnabled = !0, window.Roblox.AppHybridClientInterface = cG, cq.setGameLaunchInterface(cG)), cq.setGameLaunchLogger(c0)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("GameLaunch");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/gameLaunch-1f331e691e1d9209.js.map