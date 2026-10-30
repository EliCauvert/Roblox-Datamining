! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "97596b8ae3d2664ff012bedb1a646bcf9f3edeac"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "a2f57f5c-70aa-4b48-aed8-ef8ed148b69b", e._sentryDebugIdIdentifier = "sentry-dbid-a2f57f5c-70aa-4b48-aed8-ef8ed148b69b")
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

                function j(e, t, r, n, o) {
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
                            return o = t, a = r, C(x(e, this.length - o), this, o, a);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return i = t, l = r, C(function(e) {
                                for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                                return t
                            }(e), this, i, l);
                        case "base64":
                            return u = t, c = r, C(I(e), this, u, c);
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
                    return E(this, e, t, !0, r)
                }, u.prototype.writeFloatBE = function(e, t, r) {
                    return E(this, e, t, !1, r)
                }, u.prototype.writeDoubleLE = function(e, t, r) {
                    return j(this, e, t, !0, r)
                }, u.prototype.writeDoubleBE = function(e, t, r) {
                    return j(this, e, t, !1, r)
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
                var A = /[^+/0-9A-Za-z-_]/g;

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
                        if ((e = (e = e.split("=")[0]).trim().replace(A, "")).length < 2) return "";
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
                    j = {
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
                t.addListener = a.exports.addListener, t.arch = P, t.argv = a.exports.argv, t.binding = g, t.browser = v, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = j, t.dlopen = b, t.emit = a.exports.emit, t.emitWarning = b, t.env = a.exports.env, t.execArgv = E, t.execPath = S, t.exit = b, t.features = w, t.kill = b, t.listeners = a.exports.listeners, t.memoryUsage = b, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = O, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = b, t.uvCounters = b, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = j
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
            var e, t, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v, g, w, O, P, S, E, j, A, x, I, C, T, k, N, D, R, _, L, U, B, M, F, H, G, z, V, W = window.jQuery,
                q = r.n(W),
                K = window.Roblox,
                $ = window.React,
                Z = r.n($),
                Y = window.TanstackQuery,
                X = window.Roblox["core-scripts"].environmentUrls,
                J = r.n(X),
                Q = window.Roblox["core-lib"].http.index,
                ee = window.Roblox["core-lib"].url.index,
                et = function() {
                    return ee.Url.parse(J().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                er = function(e, t, r) {
                    try {
                        Q.postUntyped(e().withSearchParams(function(e) {
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
                en = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    t.forEach(function(e) {
                        er(et, e)
                    })
                },
                eo = window.Roblox["core-scripts"].http.http,
                ea = window.Roblox["core-scripts"].dataStore,
                ei = r.n(ea),
                el = window.Roblox["core-scripts"].guac;

            function eu(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function ec(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            eu(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            eu(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function es(e, t) {
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
            var ef = ei().gamesDataStore,
                ep = function() {
                    return ec(function() {
                        return es(this, function(e) {
                            return [2, (0, el.callBehaviour)("play-button-ui")]
                        })
                    })()
                },
                ed = function() {
                    var e = {
                        url: "".concat(J().apiGatewayUrl, "/user-settings-api/v1/user-settings/settings-and-options"),
                        withCredentials: !0
                    };
                    return eo.get(e).then(function(e) {
                        return e.data
                    })
                },
                eh = function(e) {
                    var t = {
                        url: "".concat(J().apiGatewayUrl, "/experience-guidelines-api/experience-guidelines/get-age-recommendation"),
                        withCredentials: !0
                    };
                    return eo.post(t, {
                        universeId: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                ey = function(e, t) {
                    var r = {
                        url: "".concat(J().apiGatewayUrl, "/fiat-paid-access-service/v1/purchase"),
                        withCredentials: !0,
                        retryable: !0
                    };
                    return eo.post(r, {
                        rootPlaceId: e,
                        expectedBasePriceId: t
                    }).then(function(e) {
                        var t, r;
                        return null != (r = JSON.parse(null != (t = e.data.checkoutUrl) ? t : "").checkoutUrl) ? r : ""
                    })
                },
                em = {
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

            function eb(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var ev = (eb(L = {}, em.UnplayableOtherReason, "UnplayableError.UnplayableOther"), eb(L, em.TemporarilyUnavailable, "UnplayableError.TemporarilyUnavailable"), eb(L, em.GameUnapproved, "UnplayableError.GameUnapproved"), eb(L, em.IncorrectConfiguration, "UnplayableError.IncorrectConfiguration"), eb(L, em.UniverseRootPlaceIsPrivate, "UnplayableError.CreatorHasntMadeAvailable"), eb(L, em.InsufficientPermissionFriendsOnly, "UnplayableError.CreatorHasntMadeAvailable"), eb(L, em.InsufficientPermissionGroupOnly, "UnplayableError.CreatorHasntMadeAvailable"), eb(L, em.DeviceRestricted, "UnplayableError.DeviceRestrictedDefault"), eb(L, em.FiatPurchaseDeviceRestricted, "UnplayableError.FiatPurchaseDeviceRestricted"), eb(L, em.UnderReview, "UnplayableError.Moderated"), eb(L, em.AccountRestricted, "UnplayableError.AccountRestricted"), eb(L, em.ComplianceBlocked, "UnplayableError.ComplianceBlocked"), eb(L, em.ContextualPlayabilityRegionalAvailability, "UnplayableError.ContextualPlayabilityRegionalAvailability"), eb(L, em.ContextualPlayabilityRegionalCompliance, "UnplayableError.ContextualPlayabilityRegionalCompliance"), eb(L, em.ContextualPlayabilityAgeRecommendationParentalControls, "UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls"), eb(L, em.ContextualPlayabilityAgeGated, "UnplayableError.ContextualPlayabilityAgeGated"), eb(L, em.PlaceHasNoPublishedVersion, "UnplayableError.CreatorHasntMadeAvailable"), eb(L, em.ContextualPlayabilityUnrated, "UnplayableError.ContextualPlayabilityUnrated"), eb(L, em.ContextualPlayabilityAgeGatedByDescriptor, "UnplayableError.ContextualPlayabilityAgeGatedByDescriptor"), eb(L, em.ContextualPlayabilityExperienceBlockedParentalControls, "UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls"), eb(L, em.ContextualPlayabilityRequireParentApproval, "UnplayableError.ContextualPlayabilityRequireParentApproval"), L),
                eg = "PlayButtonMessage.AgreeToNotice",
                ew = "PlayButtonText.Unlock",
                eO = "PlayButtonText.Unavailable",
                eP = "PlayButtonText.Buy",
                eS = "PlayButtonText.PlayDemo",
                eE = "PlayButtonText.PlayOnWeb",
                ej = function(e, t) {
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
                                    eb(e, t, r[t])
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
                eA = {
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
                ex = {
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
                eI = "gameJoinAgeCheckRequired",
                eC = "gameJoinContentMaturityLock",
                eT = {
                    settingChange: "account_management/SettingsChange",
                    accountManagement: "account_management/AccountManagement"
                };

            function ek(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var eN = {
                    playabilityStatus: em.TemporarilyUnavailable,
                    isPlayable: void 0,
                    unplayableDisplayText: void 0,
                    playableUxTreatment: void 0,
                    upsellUxTreatment: void 0,
                    demoModeAvailable: void 0,
                    privatePlaytestInfo: void 0
                },
                eD = function(e) {
                    var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                        r = (0, Y.useQuery)({
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
                                                if (!e) throw en(eA.PlayabilityStatusFetchInvalidUniverseId), Error("Invalid universe ID for playability status fetch");
                                                n.label = 1;
                                            case 1:
                                                var o;
                                                return n.trys.push([1, 3, , 4]), [4, (o = [e], ec(function() {
                                                    var e;
                                                    return es(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, ef.getPlayabilityStatus(o)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())];
                                            case 2:
                                                return r = n.sent(), [3, 4];
                                            case 3:
                                                throw n.sent(), en(eA.PlayabilityStatusFetchFailed), Error("Playability status fetch failed");
                                            case 4:
                                                if (!(null == r ? void 0 : r.playabilityStatus) || void 0 === r.isPlayable) throw en(eA.PlayabilityStatusFetchInvalidResponse), Error("Invalid playability status response");
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
                                            ek(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            ek(a, n, o, i, l, "throw", e)
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
                        l = (0, $.useCallback)(function() {
                            i()
                        }, [i]);
                    return (0, $.useEffect)(function() {
                        var e = function(e) {
                            e.persisted && t && l()
                        };
                        return window.addEventListener("pageshow", e),
                            function() {
                                window.removeEventListener("pageshow", e)
                            }
                    }, [l, t]), (0, $.useMemo)(function() {
                        return a ? {
                            playabilityStatus: eN.playabilityStatus,
                            isPlayable: eN.isPlayable,
                            unplayableDisplayText: eN.unplayableDisplayText,
                            playableUxTreatment: eN.playableUxTreatment,
                            upsellUxTreatment: eN.upsellUxTreatment,
                            demoModeAvailable: eN.demoModeAvailable,
                            privatePlaytestInfo: eN.privatePlaytestInfo,
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
                eR = window.Roblox["core-scripts"].endpoints,
                e_ = window.Roblox["core-scripts"].game,
                eL = window.Roblox["core-scripts"].eventStream,
                eU = window.Roblox["core-scripts"].util.url,
                eB = "function" == typeof crypto.randomUUID,
                eM = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                eF = function() {
                    return eB ? crypto.randomUUID() : eM()
                },
                eH = window.Roblox["core-scripts"].meta.device,
                eG = function(e, t, r) {
                    return new Promise(function(n) {
                        var o = new CustomEvent(e, {
                            cancelable: !0,
                            detail: t(n)
                        });
                        window.dispatchEvent(o) && n(r)
                    })
                },
                ez = function() {
                    return null
                },
                eV = globalThis.window,
                eW = globalThis.navigator,
                eq = void 0 === eV ? void 0 : eV,
                eK = null == eq || void 0 === eW ? void 0 : eW,
                e$ = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null == eK ? void 0 : eK.userAgent;
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

            function eZ(e, t, r) {
                return t = eJ(t),
                    function(e, t) {
                        var r;
                        if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, e2() ? Reflect.construct(t, r || [], eJ(e).constructor) : t.apply(e, r))
            }

            function eY(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function eX(e, t, r) {
                return (eX = e2() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && e0(o, r.prototype), o
                }).apply(null, arguments)
            }

            function eJ(e) {
                return (eJ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eQ(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && e0(e, t)
            }

            function e0(e, t) {
                return (e0 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function e1(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (e1 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return eX(e, arguments, eJ(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), e0(r, e)
                })(e)
            }

            function e2() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (e2 = function() {
                    return !!e
                })()
            }

            function e3(e, t, r) {
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
                        return eY(this, t), eZ(this, t, arguments)
                    }
                    return eQ(t, e), t
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
            var e6 = function(e) {
                function t() {
                    return eY(this, t), eZ(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                }
                return eQ(t, e), t
            }(e1(Error));
            e1(Error);
            var e5 = {};

            function e8(e) {
                return e && Object.assign(e5, e), e5
            }

            function e4(e) {
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

            function e7(e, t) {
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

            function e9(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function te(e, t) {
                return (void 0 === t ? "undefined" : e9(t)) === "bigint" ? t.toString() : t
            }

            function tt(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }

            function tr(e) {
                var t = +!!e.startsWith("^"),
                    r = e.endsWith("$") ? e.length - 1 : e.length;
                return e.slice(t, r)
            }
            var tn = Symbol("evaluating");

            function to(e, t, r) {
                var n = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (n !== tn) return void 0 === n && (n = tn, n = r()), n
                    },
                    set: function(r) {
                        Object.defineProperty(e, t, {
                            value: r
                        })
                    },
                    configurable: !0
                })
            }
            var ta = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r]
            };

            function ti(e) {
                return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
            }

            function tl(e) {
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
                return (delete e.message, "string" == typeof e.error) ? e7(e4({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function tu(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var n = r; n < e.issues.length; n++)
                    if ((null == (t = e.issues[n]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function tc(e, t) {
                return t.map(function(t) {
                    return null != t.path || (t.path = []), t.path.unshift(e), t
                })
            }

            function ts(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function tf(e, t, r) {
                var n, o, a, i, l, u, c, s, f, p, d, h = e7(e4({}, e), {
                    path: null != (n = e.path) ? n : []
                });
                return e.message || (h.message = null != (o = null != (a = null != (i = null != (l = ts(null == (s = e.inst) || null == (c = s._zod.def) || null == (u = c.error) ? void 0 : u.call(c, e))) ? l : ts(null == t || null == (f = t.error) ? void 0 : f.call(t, e))) ? i : ts(null == (p = r.customError) ? void 0 : p.call(r, e))) ? a : ts(null == (d = r.localeError) ? void 0 : d.call(r, e))) ? o : "Invalid input"), delete h.inst, delete h.continue, (null == t ? void 0 : t.reportInput) || delete h.input, h
            }
            tt(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var tp = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, te, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                td = e3("$ZodError", tp),
                th = e3("$ZodError", tp, {
                    Parent: Error
                });

            function ty(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tm(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ty(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ty(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function tb(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function tv(e, t) {
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
            var tg = (e = th, function(t, r, n, o) {
                    var a = n ? Object.assign(n, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        i = t._zod.run({
                            value: r,
                            issues: []
                        }, a);
                    if (tb(i, Promise)) throw new e6;
                    if (i.issues.length) {
                        var l, u = new(null != (l = null == o ? void 0 : o.Err) ? l : e)(i.issues.map(function(e) {
                            return tf(e, a, e8())
                        }));
                        throw ta(u, null == o ? void 0 : o.callee), u
                    }
                    return i.value
                }),
                tw = (t = th, function(e, r, n, o) {
                    return tm(function() {
                        var a, i, l, u;
                        return tv(this, function(c) {
                            switch (c.label) {
                                case 0:
                                    if (a = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, !tb(i = e._zod.run({
                                            value: r,
                                            issues: []
                                        }, a), Promise)) return [3, 2];
                                    return [4, i];
                                case 1:
                                    i = c.sent(), c.label = 2;
                                case 2:
                                    if (i.issues.length) throw ta(u = new(null != (l = null == o ? void 0 : o.Err) ? l : t)(i.issues.map(function(e) {
                                        return tf(e, a, e8())
                                    })), null == o ? void 0 : o.callee), u;
                                    return [2, i.value]
                            }
                        })
                    })()
                }),
                tO = (n = th, function(e, t, r) {
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
                    if (tb(l, Promise)) throw new e6;
                    return l.issues.length ? {
                        success: !1,
                        error: new(null != n ? n : td)(l.issues.map(function(e) {
                            return tf(e, i, e8())
                        }))
                    } : {
                        success: !0,
                        data: l.value
                    }
                }),
                tP = (o = th, function(e, t, r) {
                    return tm(function() {
                        var n, a;
                        return tv(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (n = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, !tb(a = e._zod.run({
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
                                            return tf(e, n, e8())
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
            var tS = function(e) {
                    var t, r, n = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (r = null == e ? void 0 : e.maximum) ? r : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(n, "$"))
                },
                tE = {
                    major: 4,
                    minor: 1,
                    patch: 11
                };

            function tj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tA(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tx(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function tI(e) {
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

            function tC(e, t) {
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

            function tT(e) {
                return function(e) {
                    if (Array.isArray(e)) return tj(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tj(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tj(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tk = e3("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = tE;
                    var r, n = tT(null != (l = e._zod.def.checks) ? l : []);
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
                                var n = tu(e),
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
                                        if (tx(a, Promise) && (null == r ? void 0 : r.async) === !1) throw new e6;
                                        if (l || tx(a, Promise)) l = (null != l ? l : Promise.resolve()).then(function() {
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
                                                            return n || (n = tu(e, o)), [2]
                                                    }
                                                })
                                            }, function() {
                                                var e = this,
                                                    r = arguments;
                                                return new Promise(function(n, o) {
                                                    var a = t.apply(e, r);

                                                    function i(e) {
                                                        tA(a, n, o, i, l, "next", e)
                                                    }

                                                    function l(e) {
                                                        tA(a, n, o, i, l, "throw", e)
                                                    }
                                                    i(void 0)
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === o) return;
                                            n || (n = tu(e, o))
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
                                if (tu(t)) return t.aborted = !0, t;
                                var a = b(r, n, o);
                                if (tx(a, Promise)) {
                                    if (!1 === o.async) throw new e6;
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
                                }, tC(tI({}, r), {
                                    skipChecks: !0
                                }));
                                return tx(o, Promise) ? o.then(function(e) {
                                    return v(e, t, r)
                                }) : v(o, t, r)
                            }
                            var a = e._zod.parse(t, r);
                            if (tx(a, Promise)) {
                                if (!1 === r.async) throw new e6;
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
                                var r, n = tO(e, t);
                                return n.success ? {
                                    value: n.data
                                } : {
                                    issues: null == (r = n.error) ? void 0 : r.issues
                                }
                            } catch (r) {
                                return tP(e, t).then(function(e) {
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
                tN = e3("$ZodString", function(e, t) {
                    var r, n, o;
                    tk.init(e, t), e._zod.pattern = null != (r = tT(null != (n = null == e || null == (o = e._zod.bag) ? void 0 : o.patterns) ? n : []).pop()) ? r : tS(e._zod.bag), e._zod.parse = function(r, n) {
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

            function tD(e, t, r) {
                if (e.issues.length) {
                    var n;
                    (n = t.issues).push.apply(n, tT(tc(r, e.issues)))
                }
                t.value[r] = e.value
            }
            var tR = e3("$ZodArray", function(e, t) {
                tk.init(e, t), e._zod.parse = function(r, n) {
                    var o = function(e) {
                            var o = a[e],
                                l = t.element._zod.run({
                                    value: o,
                                    issues: []
                                }, n);
                            tx(l, Promise) ? i.push(l.then(function(t) {
                                return tD(t, r, e)
                            })) : tD(l, r, e)
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

            function t_(e, t, r, n) {
                if (e.issues.length) {
                    var o;
                    (o = t.issues).push.apply(o, tT(tc(r, e.issues)))
                }
                void 0 === e.value ? r in n && (t.value[r] = void 0) : t.value[r] = e.value
            }
            var tL = e3("$ZodObject", function(e, t) {
                    tk.init(e, t);
                    var r, n = Object.getOwnPropertyDescriptor(t, "shape");
                    if (!(null == n ? void 0 : n.get)) {
                        var o = t.shape;
                        Object.defineProperty(t, "shape", {
                            get: function() {
                                var e = tI({}, o);
                                return Object.defineProperty(t, "shape", {
                                    value: e
                                }), e
                            }
                        })
                    }
                    var a = tt(function() {
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
                            return tC(tI({}, e), {
                                keys: r,
                                keySet: new Set(r),
                                numKeys: r.length,
                                optionalKeys: new Set(d)
                            })
                        }(t)
                    });
                    to(e._zod, "propValues", function() {
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
                        if (!((void 0 === (p = o) ? "undefined" : e9(p)) === "object" && null !== p && !Array.isArray(p))) return t.issues.push({
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
                                tx(r, Promise) ? l.push(r.then(function(r) {
                                    return t_(r, t, e, o)
                                })) : t_(r, t, e, o)
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
                                        tx(a, Promise) ? e.push(a.then(function(e) {
                                            return t_(e, r, o, t)
                                        })) : t_(a, r, o, t)
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
                tU = e3("$ZodLiteral", function(e, t) {
                    if (tk.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
                    e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                        return "string" == typeof e ? ti(e) : e ? ti(e.toString()) : String(e)
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

            function tB(e, t) {
                return e.issues.length && void 0 === t ? {
                    issues: [],
                    value: void 0
                } : e
            }
            var tM = e3("$ZodOptional", function(e, t) {
                    tk.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", to(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tT(t.innerType._zod.values).concat([void 0])) : void 0
                    }), to(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(tr(e.source), ")?$")) : void 0
                    }), e._zod.parse = function(e, r) {
                        if ("optional" === t.innerType._zod.optin) {
                            var n = t.innerType._zod.run(e, r);
                            return tx(n, Promise) ? n.then(function(t) {
                                return tB(t, e.value)
                            }) : tB(n, e.value)
                        }
                        return void 0 === e.value ? e : t.innerType._zod.run(e, r)
                    }
                }),
                tF = e3("$ZodNullable", function(e, t) {
                    tk.init(e, t), to(e._zod, "optin", function() {
                        return t.innerType._zod.optin
                    }), to(e._zod, "optout", function() {
                        return t.innerType._zod.optout
                    }), to(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(tr(e.source), "|null)$")) : void 0
                    }), to(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tT(t.innerType._zod.values).concat([null])) : void 0
                    }), e._zod.parse = function(e, r) {
                        return null === e.value ? e : t.innerType._zod.run(e, r)
                    }
                });

            function tH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tG(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function tz(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            tG(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            tG(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function tV(e) {
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

            function tW(e) {
                return function(e) {
                    if (Array.isArray(e)) return tH(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tH(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tH(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tq(e, t) {
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
            var tK = e3("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    tk.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, r) {
                        return tg(e, t, r, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, r) {
                        return tO(e, t, r)
                    }, e.parseAsync = function(t, r) {
                        return tz(function() {
                            return tq(this, function(n) {
                                return [2, tw(e, t, r, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, r) {
                        return tz(function() {
                            return tq(this, function(n) {
                                return [2, tP(e, t, r)]
                            })
                        })()
                    }, e.check = function() {
                        for (var r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
                        return e.clone((r = tV({}, t), n = n = {
                            checks: tW(null != (o = t.checks) ? o : []).concat(tW(i.map(function(e) {
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
                t$ = e3("ZodMiniString", function(e, t) {
                    tN.init(e, t), tK.init(e, t)
                });

            function tZ(e) {
                return new t$(function(e) {
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
                }, tl(e)))
            }
            var tY = e3("ZodMiniArray", function(e, t) {
                    tR.init(e, t), tK.init(e, t)
                }),
                tX = e3("ZodMiniObject", function(e, t) {
                    tL.init(e, t), tK.init(e, t), to(e, "shape", function() {
                        return t.shape
                    })
                });

            function tJ(e, t) {
                return new tX(tV({
                    type: "object",
                    shape: null != e ? e : {}
                }, tl(t)))
            }
            var tQ = e3("ZodMiniLiteral", function(e, t) {
                    tU.init(e, t), tK.init(e, t)
                }),
                t0 = e3("ZodMiniOptional", function(e, t) {
                    tM.init(e, t), tK.init(e, t)
                }),
                t1 = e3("ZodMiniNullable", function(e, t) {
                    tF.init(e, t), tK.init(e, t)
                });

            function t2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t3(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function t6(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            t3(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            t3(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function t5(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function t8(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function t4(e, t, r) {
                return t && t8(e.prototype, t), r && t8(e, r), e
            }

            function t7(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function t9(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function re(e, t) {
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
            var rt = function() {
                    function e(t) {
                        t5(this, e), t7(this, "value", void 0), this.value = t
                    }
                    return t4(e, [{
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
                            return rn.fromResult(this.cast())
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
                rr = function() {
                    function e(t) {
                        t5(this, e), t7(this, "error", void 0), this.error = t
                    }
                    return t4(e, [{
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
                            return rn.fromResult(this.cast())
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
            (U || (U = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new rt(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var rn = function() {
                    function e(t) {
                        t5(this, e), t7(this, "promise", void 0), this.promise = t
                    }
                    return t4(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return t6(function() {
                                    var r, n;
                                    return re(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return n = rt.bind, [4, t(e.value)];
                                            case 1:
                                                return r = new(n.apply(rt, [void 0, o.sent()])), [3, 3];
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
                                return t6(function() {
                                    var r, n;
                                    return re(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return n = rr.bind, [4, t(e.error)];
                                            case 1:
                                                return r = new(n.apply(rr, [void 0, o.sent()])), [3, 3];
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
                                return t9(n, e) ? n.promise : n
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(r) {
                                if (r.isOk()) return r.cast();
                                var n = t(r.error);
                                return t9(n, e) ? n.promise : n
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
                                return new rt(e)
                            }).catch(function(e) {
                                return new rr(r(e))
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
                            return t9(t, e) ? t : t9(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                                return e.fromPromiseResult(t.apply(void 0, function(e) {
                                    if (Array.isArray(e)) return t2(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return t2(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return t2(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(U.all))
                        }
                    }]), e
                }(),
                ro = function(e) {
                    return new rt(e)
                },
                ra = function(e) {
                    return new rr(e)
                };

            function ri(e, t, r) {
                return (ri = rs() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && ru(o, r.prototype), o
                }).apply(null, arguments)
            }

            function rl(e) {
                return (rl = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ru(e, t) {
                return (ru = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function rc(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (rc = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return ri(e, arguments, rl(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), ru(r, e)
                })(e)
            }

            function rs() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (rs = function() {
                    return !!e
                })()
            }
            rc(Error);
            var rf = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e) {
                        var r, n, o, a, i;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return n = t, o = [e.message, {
                            cause: e
                        }], n = rl(n), r = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, rs() ? Reflect.construct(n, o || [], rl(this).constructor) : n.apply(this, o)), i = void 0, (a = "cause") in r ? Object.defineProperty(r, a, {
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
                    }), e && ru(t, e), t
                }(rc(Error)),
                rp = function(e, t) {
                    try {
                        return ro(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return ra(new rf(e))
                    }
                };

            function rd(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function rh(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            rd(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            rd(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ry(e, t) {
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
            var rm = function(e, t) {
                    return ee.Url.parse("".concat(e.replace(/\/+$/, "")).concat(t)).getOrThrow()
                },
                rb = tJ({
                    status: tZ()
                }),
                rv = ["Unknown", "BootstrapperInstalling", "AppStarted", "AcquiringGame", "JoiningGame", "InGame", "LeftGame"],
                rg = function() {
                    return rh(function() {
                        var e, t, r, n;
                        return ry(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return [4, Q.getUntyped(rm(J().authApi, "/v1/client-assertion/"), {
                                        credentials: "include"
                                    })];
                                case 1:
                                    return t = o.sent(), [4, Q.fetch(rm(J().authApi, "/v1/authentication-ticket/"), {
                                        method: "POST",
                                        credentials: "include",
                                        headers: {
                                            "content-type": "application/json"
                                        },
                                        body: rp(null != (e = t.isOk() ? t.value : null) ? e : {}).getOrThrow()
                                    })];
                                case 2:
                                    if ((r = o.sent()).isErr() || !(n = r.value.headers.get("rbx-authentication-ticket"))) return [2, void 0];
                                    return [2, n]
                            }
                        })
                    })()
                };

            function rw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rO(e, t) {
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
                        if ("string" == typeof e) return rw(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rw(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rP = function(e) {
                    return "play" !== e
                },
                rS = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
                rE = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : J().domain;
                    return rS.includes(t) ? "".concat(e, "-").concat(t.split(".")[0]) : e
                },
                rj = function(e, t, r) {
                    var n = ["1", "launchmode:".concat(e.launchMode)];
                    return t && n.push("gameinfo:".concat(encodeURIComponent(t))), n.push("launchtime:".concat(String(e.launchTime))), r && (null != r.userId && n.push("distributorType:Global", "userId:".concat(String(r.userId))), n.push("browser:".concat(r.browser))), Object.entries(e.otherParams).forEach(function(e) {
                        var t = rO(e, 2),
                            r = t[0],
                            o = t[1];
                        n.push(r === o ? r : "".concat(r, ":").concat(encodeURIComponent(String(o))))
                    }), "".concat(e.protocolName, ":").concat(n.join("+"))
                };

            function rA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rx(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function rI(e) {
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

            function rC(e, t) {
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

            function rT(e, t) {
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
                        if ("string" == typeof e) return rA(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rA(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rk = function(e) {
                    null == (t = document.querySelector("iframe#gamelaunch")) || t.remove();
                    var t, r = document.createElement("iframe");
                    r.id = "gamelaunch", r.className = "hidden", r.src = e, document.body.appendChild(r), window.dispatchEvent(new Event("ProtocolLaunchStartSelenium"))
                },
                rN = function() {
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
                rD = function(e) {
                    var t, r, n = null != (t = e.installState) ? t : rN(),
                        o = null != (r = e.openProtocolUrl) ? r : rk,
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
                                            if (s.trys.push([0, 5, , 6]), r = rP(t.launchMode), i = rh(function() {
                                                    return ry(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return [4, Q.fetch(rm(J().matchmakingApi, "/v1/client-status"), {
                                                                    method: "POST",
                                                                    credentials: "include",
                                                                    headers: {
                                                                        "content-type": "application/json"
                                                                    },
                                                                    body: rp({
                                                                        status: "Unknown"
                                                                    }).value
                                                                })];
                                                            case 1:
                                                                return e.sent().getOrThrow(), [2]
                                                        }
                                                    })
                                                })(), !(e.isAuthenticated() && !r)) return [3, 2];
                                            return [4, Promise.all([rg(), i])];
                                        case 1:
                                            return l = rT.apply(void 0, [s.sent(), 1])[0], [3, 4];
                                        case 2:
                                            return [4, i];
                                        case 3:
                                            s.sent(), s.label = 4;
                                        case 4:
                                            return u = r ? {
                                                userId: e.isAuthenticated() ? e.getUserId() : null,
                                                browser: e$()
                                            } : void 0, o(rj(t, l, u)), e.onLaunchSucceeded(), e.onEvent("startClientSucceeded", a(t)), n.get() && (e.onEvent("successfulInstall", a(t)), n.set(!1)), [3, 6];
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
                                        rx(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        rx(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        },
                        l = function(t) {
                            var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "play",
                                n = e.getConfig(),
                                o = rP(r),
                                l = rC(rI({}, t), {
                                    protocolName: rE(o ? "roblox-studio" : "roblox-player"),
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
                                return void 0 !== rO(e, 2)[1]
                            })))).map(function(e) {
                                var t = rO(e, 2),
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
                                otherParams: rC(rI({
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
                                protocolName: rE("roblox-player"),
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
                rR = function(e) {
                    return e
                },
                r_ = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                rL = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? rR(e.toString()) : null
                },
                rU = function(e) {
                    var t = r_(e);
                    return null == t ? null : rL(t)
                },
                rB = "blackbird",
                rM = function(e) {
                    var t, r, n, o, a = null != (t = e.userid) ? t : e.user,
                        i = null == a ? void 0 : null != (r = rU(a)) ? r : void 0;
                    if ("string" == typeof i) return {
                        isAuthenticated: !0,
                        id: i,
                        userName: null != (n = e.name) ? n : e.userName,
                        displayName: null != (o = e.displayname) ? o : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === rB || e.userMembership === rB ? rB : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                rF = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return rM(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                };

            function rH(e) {
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
            var rG = function() {
                    var e, t, r;
                    return null != ez() || null != (e = null == (r = window.Roblox) || null == (t = r.GameLauncher) ? void 0 : t.isJoinAttemptIdEnabled()) && e
                },
                rz = function() {
                    var e = window.location.href;
                    window.location.href = "/login?".concat(new URLSearchParams({
                        returnUrl: e
                    }).toString())
                },
                rV = function(e, t, r, n) {
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
                        if (void 0 === rF()) return void rz();
                        var y = eF(),
                            m = function(e) {
                                return rI(rC(rI({}, e), {
                                    joinAttemptId: null != y ? y : eF()
                                }), i ? {
                                    joinAttemptOrigin: i
                                } : {})
                            },
                            b = function(e) {
                                var t, r, u = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                (0, eL.sendEventWithTarget)(o, a, rH((t = rH({}, l), r = r = {
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
                                })), (0, eL.sendGamePlayEvent)(i, e, void 0, y, n)
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
                rW = function(e, t, r) {
                    var n = ez();
                    null == n ? (0, e_.launchGame)(e, t, r) : rV(n, e, t, r)
                },
                rq = function(e) {
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
                    return eG("StartAccessManagementUpsell", function(e) {
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
                rK = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS,
                r$ = function() {
                    if (rK) return rq;
                    var e = null == eq ? void 0 : eq.Roblox.AccessManagementUpsellV2Service;
                    return e && function(t) {
                        return e.startAccessManagementUpsell(t)
                    }
                };

            function rZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rY(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function rX(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            rY(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            rY(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function rJ(e) {
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

            function rQ(e, t) {
                if (e) {
                    if ("string" == typeof e) return rZ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rZ(e, t)
                }
            }

            function r0(e, t) {
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
            var r1 = {
                pid: "experiencestart_mobileweb",
                is_retargeting: "false"
            };

            function r2(e) {
                if (!rG()) return {};
                var t = e.joinAttemptOrigin,
                    r = e.joinAttemptId;
                return {
                    joinAttemptId: r = "string" == typeof r ? r : eF(),
                    joinAttemptOrigin: t
                }
            }

            function r3(e, t, r, n) {
                var o = rJ({
                    placeId: t
                }, e, r2(e), r, null == n ? {} : {
                    actionType: n
                });
                return (0, eL.sendEventWithTarget)("playGameClicked", "click", o), o
            }

            function r6(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = "".concat(J().websiteUrl, "/games/start?placeid=").concat(e);
                if (rG()) {
                    var n = r2(t),
                        o = n.joinAttemptId,
                        a = n.joinAttemptOrigin;
                    "string" == typeof o && o.length > 0 && (r += "&joinAttemptId=".concat(o), "string" == typeof a && a.length > 0 && (r += "&joinAttemptOrigin=".concat(a)))
                }
                var i = t.launchData,
                    l = t.eventId;
                return "string" == typeof i && i.length > 0 && (r += "&launchData=".concat(i)), "string" == typeof l && l.length > 0 && (r += "&eventId=".concat(l)), encodeURIComponent(r)
            }
            var r5 = function(e, t, r, n) {
                    var o = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : {},
                        a = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {},
                        i = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : {},
                        l = arguments.length > 7 ? arguments[7] : void 0,
                        u = (0, eH.getDeviceMeta)();
                    if ((null == u ? void 0 : u.isIosDevice) || (null == u ? void 0 : u.isAndroidDevice) || (0, eH.isIos13Ipad)() || (null == u ? void 0 : u.isChromeOs)) {
                        var c = r3(o, e, a, l),
                            s = r6(e, c),
                            f = (0, eU.composeQueryString)(rJ({}, r1, i));
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
                        }()[e]), rW((0, e_.buildPlayGameProperties)(t, e, n, void 0, r, p, a), ej(e, o), l), window.localStorage.getItem("ref_info") && window.localStorage.removeItem("ref_info")
                    }
                },
                r8 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = (0, eH.getDeviceMeta)();
                    if ((null == r ? void 0 : r.isIosDevice) || (null == r ? void 0 : r.isAndroidDevice) || (0, eH.isIos13Ipad)() || (null == r ? void 0 : r.isChromeOs)) {
                        var n = r3({}, e, {}),
                            o = r6(e, n),
                            a = (0, eU.composeQueryString)(rJ({}, r1, t));
                        window.open("https://ro.blox.com/Ebh5?".concat(a, "&af_dp=").concat(o, "&af_web_dp=").concat(o, "&deep_link_value=").concat(o), "_self")
                    } else rW((0, e_.buildPlayGameProperties)(void 0, e), ej(e, {}))
                },
                r4 = function() {
                    var e;
                    return null == (e = window.Roblox) ? void 0 : e.IdentityVerificationService
                },
                r7 = function(e) {
                    var t = e.context,
                        r = e.pageContext;
                    return rX(function() {
                        var e, n, o, a;
                        return r0(this, function(i) {
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
                                    }, [4, null == (n = r$()) ? void 0 : n(o)];
                                case 1:
                                    return [2, null != (e = i.sent()) && e];
                                case 2:
                                    throw a = i.sent(), en(eA.PlayButtonUpsellAgeRestrictionVerificationError), a;
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                r9 = function(e, t) {
                    try {
                        var r, n, o = null == (n = (r = new URLSearchParams(window.location.search), function(e) {
                            if (Array.isArray(e)) return rZ(e)
                        }(r) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rQ(r) || function() {
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
                            }(e) || rQ(e, 1) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }())[0];
                            return "sharelinksourcetype" === t.toLowerCase()
                        })) ? void 0 : n[1];
                        if ((null == o ? void 0 : o.toLowerCase()) !== "experiencedetails") return;
                        (0, eL.sendEventWithTarget)("shareLinkGameJoin", "GamePlayButtonWeb", {
                            placeId: e,
                            universeId: t
                        }, eL.targetTypes.WWW)
                    } catch (e) {}
                },
                ne = function(e, t) {
                    return void 0 !== e && e !== em.Playable && e !== em.GuestProhibited && e !== em.PurchaseRequired && e !== em.ContextualPlayabilityUnverifiedSeventeenPlusUser && e !== em.FiatPurchaseRequired && e !== em.ContextualPlayabilityAgeCheckRequired && (e !== em.ContextualPlayabilityAgeRecommendationParentalControls && e !== em.ContextualPlayabilityRequireParentApproval || !t) && !0
                },
                nt = function(e, t, r, n) {
                    (0, eL.sendEvent)({
                        name: ex.eventName,
                        type: ex.eventName,
                        context: eL.eventTypes.formInteraction
                    }, {
                        universeId: e,
                        upsellName: t,
                        playabilityStatus: r,
                        pg: n
                    })
                },
                nr = function(e) {
                    var t, r;
                    return {
                        launchData: null != (t = new URLSearchParams(window.location.search).get("launchData")) ? t : e,
                        eventId: null != (r = new URLSearchParams(window.location.search).get("eventId")) ? r : void 0
                    }
                },
                nn = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                        n = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {};
                    r9(e, t);
                    var o = r3(r, e, n, "PlayOnWebButtonClick"),
                        a = o.joinAttemptId,
                        i = o.joinAttemptOrigin;
                    return rG() && "string" == typeof a && "" !== a ? {
                        joinAttemptId: a,
                        joinAttemptOrigin: "string" == typeof i && i.length > 0 ? i : void 0
                    } : {}
                },
                no = window.ReactJSX,
                na = r(611),
                ni = r.n(na),
                nl = function() {
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
                nu = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                nc = function(e) {
                    var t = e.className;
                    return Z().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: nl("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                ns = function(e) {
                    var t = e.width,
                        r = e.height;
                    return Z().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, Z().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function nf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function np(e) {
                if (Array.isArray(e)) return e
            }

            function nd() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nh(e, t) {
                if (e) {
                    if ("string" == typeof e) return nf(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nf(e, t)
                }
            }
            var ny = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                nm = Z().forwardRef(function(e, t) {
                    var r, n = np(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || nh(r) || nd(),
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
                        s = (np(a) || function(e) {
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
                        }(a) || nh(a, 1) || nd())[0];
                    return Z().createElement("span", function(e) {
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
                        className: nl("grow-0 shrink-0 basis-auto icon", i, ny[void 0 === l ? "Medium" : l], u)
                    }, c))
                });

            function nb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nv(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ng() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = nv(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : nv(t[e], null)
                        }
                    }
                }
            }

            function nw() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return $.useCallback(ng.apply(void 0, function(e) {
                    if (Array.isArray(e)) return nb(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nb(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nb(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function nO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nP(e) {
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

            function nS(e, t) {
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

            function nE(e, t) {
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

            function nj(e) {
                return function(e) {
                    if (Array.isArray(e)) return nO(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nO(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nO(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nA(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            nm.displayName = "Icon";
            var nx = Symbol.for("react.lazy"),
                nI = $[" use ".trim().toString()];

            function nC(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : nA(e)) === "object" && "$$typeof" in e && e.$$typeof === nx && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nA(t)) === "object" && null !== t && "then" in t
            }
            var nT = ((a = $.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nE(e, ["children"]);
                    if (nC(r) && "function" == typeof nI && (r = nI(r._payload)), $.isValidElement(r)) {
                        var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = nP({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, nj(t));
                                        return o.apply(void 0, nj(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = nP({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return nP({}, e, r)
                            }(n, r.props);
                        return r.type !== $.Fragment && (s.ref = t ? ng(t, c) : c), $.cloneElement(r, s)
                    }
                    return $.Children.count(r) > 1 ? $.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), h = a, (y = $.forwardRef(function(e, t) {
                    var r = e.children,
                        n = nE(e, ["children"]);
                    nC(r) && "function" == typeof nI && (r = nI(r._payload));
                    var o = $.Children.toArray(r),
                        a = o.find(nN);
                    if (a) {
                        var i = a.props.children,
                            l = o.map(function(e) {
                                return e !== a ? e : $.Children.count(i) > 1 ? $.Children.only(null) : $.isValidElement(i) ? i.props.children : null
                            });
                        return (0, no.jsx)(h, nS(nP({}, n), {
                            ref: t,
                            children: $.isValidElement(i) ? $.cloneElement(i, void 0, l) : null
                        }))
                    }
                    return (0, no.jsx)(h, nS(nP({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), y),
                nk = Symbol("radix.slottable");

            function nN(e) {
                return $.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nk
            }

            function nD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nR(e) {
                if (Array.isArray(e)) return e
            }

            function n_() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nL(e) {
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

            function nU(e, t) {
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

            function nB(e, t) {
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

            function nM(e, t) {
                if (e) {
                    if ("string" == typeof e) return nD(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nD(e, t)
                }
            }
            var nF = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                nH = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                nG = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nz = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nV = (0, $.forwardRef)(function(e, t) {
                    var r, n = nR(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || nM(r) || n_(),
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
                        g = nB(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (nR(a) || function(e) {
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
                        }(a) || nM(a, 1) || n_())[0],
                        O = nl("foundation-web-button", s ? "opacity-[0.5]" : [nu, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nH[y], s ? nz[b] : nG[b], l),
                        P = nL({
                            textDecoration: "none"
                        }, u),
                        S = function(e) {
                            return Z().createElement(Z().Fragment, null, Z().createElement(nc, null), p && Z().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, Z().createElement(ns, {
                                width: nF[y],
                                height: nF[y]
                            })), Z().createElement("span", {
                                className: nl("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && Z().createElement(nm, {
                                name: d,
                                size: y
                            }), Z().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var E = nB(g, ["as"]),
                            j = Z().Children.only(i);
                        return Z().createElement(nT, nU(nL({
                            ref: w
                        }, E), {
                            className: O,
                            style: P,
                            "aria-disabled": s || void 0
                        }), Z().cloneElement(j, {}, S(j.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var A = g.href,
                            x = nB(g, ["as", "href"]);
                        return Z().createElement("a", nU(nL({
                            ref: w
                        }, x), {
                            "aria-disabled": s,
                            href: s ? void 0 : A,
                            className: O,
                            style: P
                        }), S(i))
                    }
                    g.as;
                    var I = nB(g, ["as"]);
                    return Z().createElement("button", nU(nL({
                        ref: w,
                        type: "button"
                    }, I), {
                        disabled: s,
                        className: O,
                        style: P
                    }), S(i))
                }),
                nW = window.Roblox.NavigationService,
                nq = window.Roblox.ExperimentationService,
                nK = r.n(nq),
                n$ = "full",
                nZ = function(e) {
                    return e === n$ && "btn-full-width"
                },
                nY = {
                    display: "flex"
                };

            function nX(e, t) {
                var r = t && t.cache ? t.cache : n2,
                    n = t && t.serializer ? t.serializer : n0;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var r, n, o = 1 === e.length ? nJ : nQ;
                    return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
                })(e, {
                    cache: r,
                    serializer: n
                })
            }

            function nJ(e, t, r, n) {
                var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
                    a = t.get(o);
                return void 0 === a && (a = e.call(this, n), t.set(o, a)), a
            }

            function nQ(e, t, r) {
                var n = Array.prototype.slice.call(arguments, 3),
                    o = r(n),
                    a = t.get(o);
                return void 0 === a && (a = e.apply(this, n), t.set(o, a)), a
            }
            var n0 = function() {
                    return JSON.stringify(arguments)
                },
                n1 = function() {
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
                n2 = {
                    create: function() {
                        return new n1
                    }
                },
                n3 = {
                    variadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, nQ.bind(this, e, r, n)
                    },
                    monadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, nJ.bind(this, e, r, n)
                    }
                };

            function n6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n5(e, t, r) {
                return (n5 = n9() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && n4(o, r.prototype), o
                }).apply(null, arguments)
            }

            function n8(e) {
                return (n8 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function n4(e, t) {
                return (n4 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function n7(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (n7 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return n5(e, arguments, n8(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), n4(r, e)
                })(e)
            }

            function n9() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (n9 = function() {
                    return !!e
                })()
            }
            var oe = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        var n, o, a, i = e;
                        return r && (i += ": " + r), n = t, o = [i], n = n8(n), (a = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, n9() ? Reflect.construct(n, o || [], n8(this).constructor) : n.apply(this, o))).code = e, r && (a.originalMessage = r), a
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && n4(t, e), t
                }(n7(Error)),
                ot = ((m = ot || {}).MISSING_MESSAGE = "MISSING_MESSAGE", m.MISSING_FORMAT = "MISSING_FORMAT", m.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", m.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", m.INVALID_MESSAGE = "INVALID_MESSAGE", m.INVALID_KEY = "INVALID_KEY", m.FORMATTING_ERROR = "FORMATTING_ERROR", m);

            function or(e, t) {
                return nX(e, {
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
                    strategy: n3.variadic
                })
            }

            function on(e, t) {
                return or(function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return n5(e, function(e) {
                        if (Array.isArray(e)) return n6(e)
                    }(r) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return n6(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n6(e, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())
                }, t)
            }

            function oo(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oa(e) {
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

            function oi(e, t) {
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
            var ol = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                ou = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                oc = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                os = /^(@+)?(\+|#+)?[rs]?$/g,
                of = /(\*)(0+)|(#+)(0+)|(0+)/g,
                op = /^(0+)$/;

            function od(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(os, function(e, r, n) {
                    return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
                }), t
            }

            function oh(e) {
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

            function oy(e) {
                var t = oh(e);
                return t || {}
            }

            function om(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ob(e) {
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

            function ov(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function og(e, t) {
                if (e) {
                    if ("string" == typeof e) return om(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return om(e, t)
                }
            }
            var ow = ((b = {})[b.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", b[b.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", b[b.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", b[b.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", b[b.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", b[b.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", b[b.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", b[b.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", b[b.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", b[b.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", b[b.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", b[b.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", b[b.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", b[b.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", b[b.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", b[b.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", b[b.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", b[b.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", b[b.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", b[b.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", b[b.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", b[b.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", b[b.INVALID_TAG = 23] = "INVALID_TAG", b[b.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", b[b.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", b[b.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", b);

            function oO(e) {
                return !!(e && (void 0 === e ? "undefined" : ov(e)) === "object" && 0 === e.type)
            }

            function oP(e) {
                return !!(e && (void 0 === e ? "undefined" : ov(e)) === "object" && 1 === e.type)
            }
            var oS = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                oE = {
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
                oj = new RegExp("^".concat(oS.source, "*")),
                oA = new RegExp("".concat(oS.source, "*$"));

            function ox(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var oI = !!Object.fromEntries,
                oC = !!String.prototype.trimStart,
                oT = !!String.prototype.trimEnd,
                ok = oI ? Object.fromEntries : function(e) {
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
                                }(l) || og(l, 2) || function() {
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
                oN = oC ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(oj, "")
                },
                oD = oT ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(oA, "")
                },
                oR = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                o_ = function() {
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
                                                    location: ox(r, this.clonePosition())
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
                                            location: ox(i, this.clonePosition())
                                        })
                                    } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                        if (60 === o && !this.ignoreTag && oL(this.peek() || 0)) {
                                            var l = this.parseTag(e, t);
                                            if (l.err) return l;
                                            n.push(l.val)
                                        } else {
                                            var u = this.parseLiteral(e, t);
                                            if (u.err) return u;
                                            n.push(u.val)
                                        }
                                    else if (!r) return this.error(26, ox(this.clonePosition(), this.clonePosition()));
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
                                        location: ox(r, this.clonePosition())
                                    },
                                    err: null
                                };
                                if (!this.bumpIf(">")) return this.error(23, ox(r, this.clonePosition()));
                                var o = this.parseMessage(e + 1, t, !0);
                                if (o.err) return o;
                                var a = o.val,
                                    i = this.clonePosition();
                                if (!this.bumpIf("</")) return this.error(27, ox(r, this.clonePosition()));
                                if (this.isEOF() || !oL(this.char())) return this.error(23, ox(i, this.clonePosition()));
                                var l = this.clonePosition();
                                return n !== this.parseTagName() ? this.error(26, ox(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                    val: {
                                        type: 8,
                                        value: n,
                                        children: a,
                                        location: ox(r, this.clonePosition())
                                    },
                                    err: null
                                } : this.error(23, ox(i, this.clonePosition()))
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
                                        location: ox(r, this.clonePosition())
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseLeftAngleBracket",
                            value: function() {
                                var e;
                                return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (oL(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                                    if (Array.isArray(e)) return om(e)
                                }(r) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || og(r) || function() {
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
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, ox(r, this.clonePosition()));
                                if (125 === this.char()) return this.bump(), this.error(2, ox(r, this.clonePosition()));
                                var n = this.parseIdentifierIfPossible().value;
                                if (!n) return this.error(3, ox(r, this.clonePosition()));
                                if (this.bumpSpace(), this.isEOF()) return this.error(1, ox(r, this.clonePosition()));
                                switch (this.char()) {
                                    case 125:
                                        return this.bump(), {
                                            val: {
                                                type: 1,
                                                value: n,
                                                location: ox(r, this.clonePosition())
                                            },
                                            err: null
                                        };
                                    case 44:
                                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, ox(r, this.clonePosition()));
                                        return this.parseArgumentOptions(e, t, n, r);
                                    default:
                                        return this.error(3, ox(r, this.clonePosition()))
                                }
                            }
                        }, {
                            key: "parseIdentifierIfPossible",
                            value: function() {
                                var e, t, r = this.clonePosition(),
                                    n = this.offset(),
                                    o = (e = this.message, oR.lastIndex = n, null != (t = oR.exec(e)[1]) ? t : ""),
                                    a = n + o.length;
                                return this.bumpTo(a), {
                                    value: o,
                                    location: ox(r, this.clonePosition())
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
                                        return this.error(4, ox(o, i));
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
                                            var f = oD(s.val);
                                            if (0 === f.length) return this.error(6, ox(this.clonePosition(), this.clonePosition()));
                                            u = {
                                                style: f,
                                                styleLocation: ox(c, this.clonePosition())
                                            }
                                        }
                                        var p = this.tryParseArgumentClose(n);
                                        if (p.err) return p;
                                        var d = ox(n, this.clonePosition());
                                        if (u && u.style.startsWith("::")) {
                                            var h = oN(u.style.slice(2));
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
                                                                return "root" !== n && (t = e.maximize().region), (oE[t || ""] || oE[n || ""] || oE["".concat(n, "-001")] || oE["001"])[0]
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
                                                        parsedOptions: this.shouldParseSkeletons ? (m = {}, b.replace(ol, function(e) {
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
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, ox(v, ob({}, v)));
                                        this.bumpSpace();
                                        var g = this.parseIdentifierIfPossible(),
                                            w = 0;
                                        if ("select" !== a && "offset" === g.value) {
                                            if (!this.bumpIf(":")) return this.error(13, ox(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var O = this.tryParseDecimalInteger(13, 14);
                                            if (O.err) return O;
                                            this.bumpSpace(), g = this.parseIdentifierIfPossible(), w = O.val
                                        }
                                        var P = this.tryParsePluralOrSelectOptions(e, a, t, g);
                                        if (P.err) return P;
                                        var S = this.tryParseArgumentClose(n);
                                        if (S.err) return S;
                                        var E = ox(n, this.clonePosition());
                                        if ("select" === a) return {
                                            val: {
                                                type: 5,
                                                value: r,
                                                options: ok(P.val),
                                                location: E
                                            },
                                            err: null
                                        };
                                        return {
                                            val: {
                                                type: 6,
                                                value: r,
                                                options: ok(P.val),
                                                offset: w,
                                                pluralType: "plural" === a ? "cardinal" : "ordinal",
                                                location: E
                                            }, err: null
                                        };
                                    default:
                                        return this.error(5, ox(o, i))
                                }
                            }
                        }, {
                            key: "tryParseArgumentClose",
                            value: function(e) {
                                return this.isEOF() || 125 !== this.char() ? this.error(1, ox(e, this.clonePosition())) : (this.bump(), {
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
                                        if (!this.bumpUntil("'")) return this.error(11, ox(r, this.clonePosition()));
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
                                        var t = e.split(ou).filter(function(e) {
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
                                                            if ("string" == typeof e) return oo(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oo(e, void 0)
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
                                                            t = oa(oi(oa({}, t), {
                                                                notation: "scientific"
                                                            }), l.options.reduce(function(e, t) {
                                                                return oa({}, e, oy(t))
                                                            }, {}));
                                                            continue;
                                                        case "engineering":
                                                            t = oa(oi(oa({}, t), {
                                                                notation: "engineering"
                                                            }), l.options.reduce(function(e, t) {
                                                                return oa({}, e, oy(t))
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
                                                            l.options[0].replace(of, function(e, r, n, o, a, i) {
                                                                if (r) t.minimumIntegerDigits = n.length;
                                                                else if (o && a) throw Error("We currently do not support maximum integer digits");
                                                                else if (i) throw Error("We currently do not support exact integer digits");
                                                                return ""
                                                            });
                                                            continue
                                                    }
                                                    if (op.test(l.stem)) {
                                                        t.minimumIntegerDigits = l.stem.length;
                                                        continue
                                                    }
                                                    if (oc.test(l.stem)) {
                                                        if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                        l.stem.replace(oc, function(e, r, n, o, a, i) {
                                                            return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : a && i ? (t.minimumFractionDigits = a.length, t.maximumFractionDigits = a.length + i.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                        });
                                                        var u = l.options[0];
                                                        "w" === u ? t = oi(oa({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : u && (t = oa({}, t, od(u)));
                                                        continue
                                                    }
                                                    if (os.test(l.stem)) {
                                                        t = oa({}, t, od(l.stem));
                                                        continue
                                                    }
                                                    var c = oh(l.stem);
                                                    c && (t = oa({}, t, c));
                                                    var s = function(e) {
                                                        var t;
                                                        if ("E" === e[0] && "E" === e[1] ? (t = {
                                                                notation: "engineering"
                                                            }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                                notation: "scientific"
                                                            }, e = e.slice(1)), t) {
                                                            var r = e.slice(0, 2);
                                                            if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !op.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                            t.minimumIntegerDigits = e.length
                                                        }
                                                        return t
                                                    }(l.stem);
                                                    s && (t = oa({}, t, s))
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
                                            u = ox(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                        } else break
                                    }
                                    if (i.has(l)) return this.error("select" === t ? 21 : 20, u);
                                    "other" === l && (o = !0), this.bumpSpace();
                                    var p = this.clonePosition();
                                    if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, ox(this.clonePosition(), this.clonePosition()));
                                    var d = this.parseMessage(e + 1, t, r);
                                    if (d.err) return d;
                                    var h = this.tryParseArgumentClose(p);
                                    if (h.err) return h;
                                    a.push([l, {
                                        value: d.val,
                                        location: ox(p, this.clonePosition())
                                    }]), i.add(l), this.bumpSpace(), l = (c = this.parseIdentifierIfPossible()).value, u = c.location
                                }
                                return 0 === a.length ? this.error("select" === t ? 15 : 16, ox(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, ox(this.clonePosition(), this.clonePosition())) : {
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
                                var l = ox(n, this.clonePosition());
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

            function oL(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }

            function oU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oB(e, t, r) {
                return t = oV(t),
                    function(e, t) {
                        if (t && ("object" === oZ(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, oX() ? Reflect.construct(t, r || [], oV(e).constructor) : t.apply(e, r))
            }

            function oM(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function oF(e, t, r) {
                return (oF = oX() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && oK(o, r.prototype), o
                }).apply(null, arguments)
            }

            function oH(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function oG(e, t, r) {
                return t && oH(e.prototype, t), r && oH(e, r), e
            }

            function oz() {
                return (oz = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function oV(e) {
                return (oV = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function oW(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && oK(e, t)
            }

            function oq(e) {
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

            function oK(e, t) {
                return (oK = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function o$(e) {
                return function(e) {
                    if (Array.isArray(e)) return oU(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return oU(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oU(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oZ(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function oY(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (oY = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return oF(e, arguments, oV(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), oK(r, e)
                })(e)
            }

            function oX() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (oX = function() {
                    return !!e
                })()
            }
            var oJ = function(e) {
                    function t(e, r, n) {
                        var o;
                        return oM(this, t), (o = oB(this, t, [e])).code = r, o.originalMessage = n, o
                    }
                    return oW(t, e), oG(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(oY(Error)),
                oQ = function(e) {
                    function t(e, r, n, o) {
                        return oM(this, t), oB(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return oW(t, e), t
                }(oJ),
                o0 = function(e) {
                    function t(e, r, n) {
                        return oM(this, t), oB(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return oW(t, e), t
                }(oJ),
                o1 = function(e) {
                    function t(e, r) {
                        return oM(this, t), oB(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
                    }
                    return oW(t, e), t
                }(oJ);

            function o2(e) {
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
            var o3 = ((B = function() {
                function e(t) {
                    var r, n = this,
                        o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        a = arguments.length > 2 ? arguments[2] : void 0,
                        i = arguments.length > 3 ? arguments[3] : void 0;
                    if (oM(this, e), this.formatterCache = {
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
                                        if (!(a && y in a)) throw new o1(y, l);
                                        var m = a[y];
                                        if (1 === h.type) {
                                            m && "string" != typeof m && "number" != typeof m && (void 0 === m ? "undefined" : oZ(m)) !== "bigint" || (m = "string" == typeof m || "number" == typeof m || (void 0 === m ? "undefined" : oZ(m)) === "bigint" ? String(m) : ""), u.push({
                                                type: +("string" != typeof m),
                                                value: m
                                            });
                                            continue
                                        }
                                        if (3 === h.type) {
                                            var b = "string" == typeof h.style ? o.date[h.style] : oP(h.style) ? h.style.parsedOptions : void 0;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, b).format(m)
                                            });
                                            continue
                                        }
                                        if (4 === h.type) {
                                            var v = "string" == typeof h.style ? o.time[h.style] : oP(h.style) ? h.style.parsedOptions : o.time.medium;
                                            u.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, v).format(m)
                                            });
                                            continue
                                        }
                                        if (2 === h.type) {
                                            var g = "string" == typeof h.style ? o.number[h.style] : oO(h.style) ? h.style.parsedOptions : void 0;
                                            if (g && g.scale) {
                                                var w = g.scale || 1;
                                                if ((void 0 === m ? "undefined" : oZ(m)) === "bigint") {
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
                                            if ("function" != typeof S) throw new o0(P, "function", l);
                                            var E = S(e(O, r, n, o, a, i).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(E) || (E = [E]), u.push.apply(u, o$(E.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === h.type) {
                                            var j = m,
                                                A = (Object.prototype.hasOwnProperty.call(h.options, j) ? h.options[j] : void 0) || h.options.other;
                                            if (!A) throw new oQ(h.value, m, Object.keys(h.options), l);
                                            u.push.apply(u, o$(e(A.value, r, n, o, a)));
                                            continue
                                        }
                                        if (6 === h.type) {
                                            var x = "=".concat(m),
                                                I = Object.prototype.hasOwnProperty.call(h.options, x) ? h.options[x] : void 0;
                                            if (!I) {
                                                if (!Intl.PluralRules) throw new oJ('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var C = (void 0 === m ? "undefined" : oZ(m)) === "bigint" ? Number(m) : m,
                                                    T = n.getPluralRules(r, {
                                                        type: h.pluralType
                                                    }).select(C - (h.offset || 0));
                                                I = (Object.prototype.hasOwnProperty.call(h.options, T) ? h.options[T] : void 0) || h.options.other
                                            }
                                            if (!I) throw new oQ(h.value, m, Object.keys(h.options), l);
                                            var k = (void 0 === m ? "undefined" : oZ(m)) === "bigint" ? Number(m) : m;
                                            u.push.apply(u, o$(e(I.value, r, n, o, a, k - (h.offset || 0))));
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
                            }(c), oz({}, c));
                        this.ast = e.__parse(t, (l = oq({}, s), u = u = {
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
                        return e[t] = (n = r[t], (o = a[t]) ? oq({}, n, o, Object.keys(n).reduce(function(e, t) {
                            return e[t] = oq({}, n[t], o[t]), e
                        }, {})) : n), e
                    }, oq({}, r)) : r), this.formatters = i && i.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: nX(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return oF(Intl.NumberFormat, o$(t))
                            }, {
                                cache: o2(e.number),
                                strategy: n3.variadic
                            }),
                            getDateTimeFormat: nX(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return oF(Intl.DateTimeFormat, o$(t))
                            }, {
                                cache: o2(e.dateTime),
                                strategy: n3.variadic
                            }),
                            getPluralRules: nX(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return oF(Intl.PluralRules, o$(t))
                            }, {
                                cache: o2(e.pluralRules),
                                strategy: n3.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return oG(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, B.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, B.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = new o_(e, t = ob({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (r.err) {
                    var n = SyntaxError(ow[r.err.kind]);
                    throw n.location = r.err.location, n.originalMessage = r.err.message, n
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                        else 2 === t.type && oO(t.style) || (3 === t.type || 4 === t.type) && oP(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(r.val), r.val
            }, B.formats = {
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
            }, B);

            function o6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o5(e) {
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

            function o8(e, t) {
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

            function o4(e, t) {
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
                        if ("string" == typeof e) return o6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function o7() {
                for (var e, t, r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
                var u = o4(i, 4),
                    c = (u[0], u[1]),
                    s = u[2],
                    f = u[3];
                if (Array.isArray(c)) throw new oe(ot.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === c ? "undefined" : c && "u" > typeof Symbol && c.constructor === Symbol ? "symbol" : typeof c)) throw new oe(ot.INSUFFICIENT_PATH, void 0);
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
                y.getMessageFormat || (y.getMessageFormat = or(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new o3(t[0], t[1], t[2], o5({
                        formatters: y
                    }, t[3]))
                }, d.message));
                try {
                    o = y.getMessageFormat(c, b, (e = o3.formats.date, t = o3.formats.time, r = o5({}, null == m ? void 0 : m.dateTime, null == h ? void 0 : h.dateTime), n = {
                        date: o5({}, e, r),
                        time: o5({}, t, r),
                        number: o5({}, null == m ? void 0 : m.number, null == h ? void 0 : h.number)
                    }, v && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            a = void 0;
                        try {
                            for (var i, l = Object.entries(t)[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                                var u = o4(i.value, 2),
                                    c = u[0],
                                    s = u[1];
                                t[c] = o5({
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
                        formatters: o8(o5({}, y), {
                            getDateTimeFormat: function(e, t) {
                                var r;
                                return y.getDateTimeFormat(e, o8(o5({}, t), {
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : v
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new oe(ot.INVALID_MESSAGE, void 0)
                }
                var g = o.format(s);
                return (0, $.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
            }

            function o9(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function ae(e) {
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

            function at(e, t) {
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

            function ar() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return t.filter(Boolean).join(".")
            }

            function an(e) {
                return ar(e.namespace, e.key)
            }

            function ao(e) {
                console.error(e)
            }

            function aa(e, t, r, n) {
                var o = ar(n, r);
                if (!t) throw Error(o);
                var a = t;
                return r.split(".").forEach(function(t) {
                    var r = a[t];
                    if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
                    a = r
                }), a
            }
            o7.raw = !0;
            var ai = (0, $.createContext)(void 0);

            function al(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    a = e.messages,
                    i = e.now,
                    l = e.onError,
                    u = e.timeZone,
                    c = (0, $.useContext)(ai),
                    s = (0, $.useMemo)(function() {
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
                    f = (0, $.useMemo)(function() {
                        return (null == c ? void 0 : c.formatters) || {
                            getDateTimeFormat: on(Intl.DateTimeFormat, s.dateTime),
                            getNumberFormat: on(Intl.NumberFormat, s.number),
                            getPluralRules: on(Intl.PluralRules, s.pluralRules),
                            getRelativeTimeFormat: on(Intl.RelativeTimeFormat, s.relativeTime),
                            getListFormat: on(Intl.ListFormat, s.list),
                            getDisplayNames: on(Intl.DisplayNames, s.displayNames)
                        }
                    }, [s, null == c ? void 0 : c.formatters]),
                    p = (0, $.useMemo)(function() {
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
                        }).formats, p = e.getMessageFallback, d = e.messages, h = e.onError, at(ae({}, function(e, t) {
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
                            onError: h || ao,
                            getMessageFallback: p || an
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
                return (0, no.jsx)(ai.Provider, {
                    value: p,
                    children: t
                })
            }

            function au() {
                var e = (0, $.useContext)(ai);
                if (!e) throw Error(void 0);
                return e
            }
            var ac = !1,
                as = "u" < typeof window;

            function af(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ap = "__FN_nvfToKPAOuiV__",
                ad = "__FN_END_nvfToKPAOuiV__",
                ah = new RegExp("".concat(ap, "(\\d+)\\|")),
                ay = new RegExp("".concat(ad, "(\\d+)\\|")),
                am = function(e, t, r) {
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
                            a = "".concat(ap).concat(r, "|"),
                            i = "".concat(ad).concat(r, "|");
                        n[e.opening] = a, n[e.closing] = i, o[r] = {
                            start: a,
                            end: i,
                            render: e.render
                        }
                    });
                    var a = function(e) {
                            var t = [],
                                r = ah.exec(e),
                                n = ay.exec(e);
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
                                    if (Array.isArray(e)) return af(e)
                                }(s) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(s) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return af(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return af(e, void 0)
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
                        return (0, no.jsx)($.Fragment, {
                            children: e
                        }, t)
                    })
                },
                ab = function(e) {
                    return e.replaceAll(".", ":")
                };

            function av(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ag(e) {
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

            function aw(e, t) {
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

            function aO(e, t) {
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
                        if ("string" == typeof e) return av(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return av(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aP(e, t) {
                var r = t.publish,
                    n = t.captureException,
                    o = t.featureName;

                function a(e, t, r) {
                    if (null != r) {
                        var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](r) : r instanceof a) ? r.name || "Error" : "UnknownError",
                            l = o ? "".concat(o, "_").concat(e) : e;
                        return null == n || n(r, {
                            error_counter: l
                        }), aw(ag({}, t), {
                            errorType: i
                        })
                    }
                    return t
                }
                return {
                    trackCounter: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var o = aO(t, 2);
                        r(o[0], o[1])
                    },
                    trackError: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var o = aO(t, 3),
                            i = o[0],
                            l = o[1],
                            u = o[2],
                            c = a(i, aw(ag({}, null != l ? l : {}), {
                                severity: "error"
                            }), u);
                        r(i, c)
                    },
                    trackCriticalError: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var o = aO(t, 3),
                            i = o[0],
                            l = o[1],
                            u = o[2],
                            c = a(i, aw(ag({}, null != l ? l : {}), {
                                severity: "critical"
                            }), u);
                        r(i, c)
                    }
                }
            }

            function aS(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function aE() {
                return null != M || (M = "".concat(J().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), M
            }
            var aj = function() {};

            function aA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ax(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var aI = function(e, t) {
                    return e << 3 | t
                },
                aC = aI(1, 2),
                aT = aI(2, 2),
                ak = aI(5, 2),
                aN = aI(6, 2),
                aD = aI(8, 2),
                aR = aI(1, 2),
                a_ = aI(2, 1),
                aL = aI(3, 0),
                aU = aI(5, 2);
            aI(1, 2), aI(2, 1), aI(3, 0), aI(4, 2), aI(5, 2), aI(6, 0), aI(8, 2);
            var aB = aI(4, 0),
                aM = aI(6, 2),
                aF = aI(7, 2);
            aI(1, 0), aI(2, 2);
            var aH = aI(1, 2),
                aG = aI(2, 2),
                az = aI(1, 2);
            aI(1, 2), aI(2, 2), aI(1, 2);
            var aV = new TextEncoder,
                aW = function() {
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
                                var t = (void 0 === e ? "undefined" : ax(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = aV.encode(e);
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

            function aq(e, t, r) {
                var n = new aW;
                return n.writeVarint(aI(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function aK(e) {
                var t = new aW;
                if (t.writeVarint(aR), t.writeString(e.name), t.writeVarint(a_), t.writeDouble(e.value), t.writeVarint(aL), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new aW,
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
                                            if ("string" == typeof e) return aA(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aA(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var i = aq(n, aI(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(ak), t.writeBytes(i)
                                } else if ("boolean" == typeof o) {
                                    var l = aq(n, aI(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(aN), t.writeBytes(l)
                                } else if ((void 0 === o ? "undefined" : ax(o)) === "bigint") {
                                    var u = aq(n, aI(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(aT), t.writeBytes(u)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var c = aq(n, aI(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(aC), t.writeBytes(c)
                                        } else if (Number.isInteger(o)) {
                                    var s = aq(n, aI(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(aT), t.writeBytes(s)
                                } else {
                                    var f = aq(n, aI(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(aD), t.writeBytes(f)
                                } else {
                                    var p = aq(n, aI(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(ak), t.writeBytes(p)
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
                    t.writeVarint(aU), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function a$(e, t, r) {
                var n = new aW;
                n.writeVarint(aB), n.writeVarint(r);
                var o = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var l, u = e[Symbol.iterator](); !(o = (l = u.next()).done); o = !0) {
                        var c = l.value;
                        n.writeVarint(aM), n.writeBytes(c)
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
                        n.writeVarint(aF), n.writeBytes(y)
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

            function aZ(e) {
                var t = new aW;
                t.writeVarint(aH), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(aG), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new aW;
                return n.writeVarint(az), n.writeBytes(r), n.toBytes()
            }
            var aY = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function aX(e) {
                return aY.test(e)
            }
            var aJ = [],
                aQ = !1,
                a0 = !1;

            function a1(e, t) {
                var r, n, o, a = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    i = BigInt(Date.now());
                !0 === t || a0 || "u" > typeof document && "hidden" === document.visibilityState ? (r = aZ(a$(a.map(aK), [], i)).buffer, fetch("".concat(aE()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(aj)) : (n = aZ(a$(a.map(aK), [], i)), (o = function() {
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
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(aj), t.close().catch(aj), r = [], [4, (o = e.readable.getReader()).read()];
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
                            aS(a, r, n, i, l, "next", e)
                        }

                        function l(e) {
                            aS(a, r, n, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(aE()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(aj)
            }

            function a2() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = aJ[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var a = n.value.splice(0);
                        0 !== a.length && a1(a, !0)
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

            function a3(e, t) {
                var r, n, o, a = Math.max(1, null != (r = null == t ? void 0 : t.batchSize) ? r : 10),
                    i = null != (n = null == t ? void 0 : t.batchIntervalMs) ? n : 250;

                function l(e, r) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, r): console.error(e, r)
                }
                if (!aX(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var u = [];
                return aJ.push(u), aQ || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && a2()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        a0 = !0, a2()
                    }), aQ = !0),
                    function(t, r, n) {
                        var c = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!aX(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        o = void 0;
                                    try {
                                        for (var a, i = Object.keys(t)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                            var l = a.value;
                                            if (!aX(l)) return !1
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
                        }), u.length >= a ? (void 0 !== o && (clearTimeout(o), o = void 0), a1(u.splice(0, a))) : void 0 === o && (o = setTimeout(function() {
                            for (o = void 0; u.length > 0;) a1(u.splice(0, a))
                        }, i))
                    }
            }
            var a6 = {
                    featureName: "WwwCommon",
                    team: "Economy > Payments & Fraud",
                    features: {
                        i18n: {
                            errors: [{
                                name: "TranslationKeyNotFound",
                                dimensions: ["namespace", "key", "internalPageName"]
                            }, {
                                name: "TranslationMalformed",
                                dimensions: ["namespace", "key", "internalPageName"]
                            }]
                        }
                    }
                },
                a5 = a3(a6.featureName),
                a8 = aP(a6, {
                    publish: a5
                });
            a8.trackCounter;
            var a4 = a8.trackError;
            a8.trackCriticalError;
            var a7 = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                a9 = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                ie = function(e, t, r) {
                    var n;
                    "u" > typeof window && a4(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = a7()) ? n : "unknown"
                    })
                },
                it = function(e) {
                    var t, r, n, o, a, i, l, u, c, s, f, p, d, h = (t = ab(e), r = {
                        "!": au().messages
                    }, n = t ? "!.".concat(t) : "!", a = (o = au()).cache, i = o.formats, l = o.formatters, u = o.getMessageFallback, c = o.locale, s = o.onError, f = o.timeZone, p = r["!"], d = "!" === n ? void 0 : n.slice(2), f || ac || !as || (ac = !0, s(new oe(ot.ENVIRONMENT_FALLBACK, void 0))), (0, $.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, r) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var n = r ? aa(e, t, r) : t;
                                    if (!n) throw Error(r);
                                    return n
                                } catch (e) {
                                    return new oe(ot.MISSING_MESSAGE, e.message)
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
                                    a = void 0 === o ? an : o,
                                    i = e.locale,
                                    l = e.messagesOrError,
                                    u = e.namespace,
                                    c = e.onError,
                                    s = e.timeZone,
                                    f = o9(l, oe);

                                function p(e, t, r, n) {
                                    var o = new oe(t, r);
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
                                        y = aa(i, l, e, u)
                                    } catch (t) {
                                        if (!h) return p(e, ot.MISSING_MESSAGE, t.message, h);
                                        y = h
                                    }
                                    try {
                                        var v, g = ar(u, e);
                                        return o7(g, y, o ? (v = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, $.isValidElement)(o) ? (0, $.cloneElement)(o, {
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
                                        return o9(t, oe) ? (m = t.code, b = t.originalMessage) : (m = ot.FORMATTING_ERROR, b = t.message), p(e, m, b, h)
                                    }
                                }

                                function h(e, t, r, n) {
                                    var o = d(e, t, r, n);
                                    return "string" != typeof o ? p(e, ot.INVALID_MESSAGE, void 0) : o
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
                                        return aa(i, l, e, u)
                                    } catch (t) {
                                        return p(e, ot.MISSING_MESSAGE, t.message)
                                    }
                                }, h.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return aa(i, l, e, u), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, h
                            }(at(ae({}, e), {
                                messagesOrError: t
                            }))
                    }, [a, l, u, p, d, s, i, c, f]));
                    return (0, $.useMemo)(function() {
                        return Object.assign(function(t, r, n) {
                            var o = ab(t);
                            return void 0 === n || h.has(o) ? h(o, r) : (ie("TranslationKeyNotFound", e, o), n)
                        }, {
                            rich: function(e, t) {
                                return h.rich(ab(e), t)
                            },
                            has: function(e) {
                                return a9(e) && h.has(ab(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!a9(t)) return ie("TranslationKeyNotFound", e, String(t)), n;
                                var o = ab(t),
                                    a = h.has(o);
                                return a || ie("TranslationKeyNotFound", e, o), a ? h(o, r) : n
                            },
                            html: function(t, r, n) {
                                if (!a9(t)) return ie("TranslationKeyNotFound", e, String(t)), null;
                                var o = ab(t);
                                if (!h.has(o)) return ie("TranslationKeyNotFound", e, o), null;
                                var a = am(function(e) {
                                    return h(o, e)
                                }, r, n);
                                return null == a && ie("TranslationMalformed", e, o), a
                            }
                        })
                    }, [h, e])
                },
                ir = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding", "Feature.Build", "Feature.Friends"];

            function io(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ia = function() {
                    var e = function(e) {
                            if (Array.isArray(e)) return e
                        }(ir) || function(e) {
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
                        }(ir) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return io(e, 7);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return io(e, 7)
                            }
                        }(ir) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        t = e[0],
                        r = e[1],
                        n = e[2],
                        o = e[3],
                        a = e[4],
                        i = e[5],
                        l = e[6],
                        u = it(t),
                        c = it(r),
                        s = it(n),
                        f = it(o),
                        p = it(a),
                        d = it(i),
                        h = it(l);
                    return (0, $.useMemo)(function() {
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
                ii = function(e) {
                    var t = e.onButtonClick,
                        r = e.buttonWidth,
                        n = e.buttonClassName,
                        o = ia();
                    return (0, no.jsxs)(Z().Fragment, {
                        children: [(0, no.jsx)(nV, {
                            "data-testid": "play-action-needed-button",
                            variant: "Emphasis",
                            style: nY,
                            className: ni()(nZ(void 0 === r ? n$ : r), void 0 === n ? "btn-common-play-game-action-needed-lg" : n),
                            onClick: t,
                            children: o(ew)
                        }), (0, no.jsx)("div", {
                            id: "access-management-upsell-container-v1"
                        })]
                    })
                },
                il = function(e) {
                    var t = e.universeId,
                        r = e.buttonClassName,
                        n = e.pageContext,
                        o = (0, $.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), en(eA.PlayButtonUpsellExperienceApprovalTriggered), nt(t, ex.experienceApprovalUpsellName, em.ContextualPlayabilityRequireParentApproval, n);
                            var r = r$();
                            r ? r({
                                featureName: "CanApproveExperience",
                                namespace: eT.accountManagement,
                                isAsyncCall: !1,
                                usePrologue: !0,
                                ampRecourseData: {
                                    universeId: t,
                                    experienceManagementAction: "Approve"
                                }
                            }).catch(function() {
                                en(eA.PlayButtonUpsellExperienceApprovalError)
                            }) : en(eA.PlayButtonUpsellExperienceApprovalError)
                        }, [t, n]);
                    return (0, no.jsx)(ii, {
                        onButtonClick: o,
                        buttonClassName: r
                    })
                };
            il.defaultProps = {
                buttonClassName: void 0
            };
            var iu = function(e) {
                    var t = e.buttonClassName,
                        r = e.buttonWidth;
                    return (0, no.jsx)(nV, {
                        "data-testid": "play-button-loading",
                        variant: "Emphasis",
                        isLoading: !0,
                        "aria-label": "Loading",
                        style: nY,
                        className: ni()(nZ(void 0 === r ? n$ : r), void 0 === t ? "btn-common-play-game-lg" : t)
                    })
                },
                ic = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                is = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                ip = function(e) {
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
                    return Z().createElement("button", function(e) {
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
                        className: nl("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", nu, is[t], ic[r], n && "radius-circle", o)
                    }, a), Z().createElement(nc, null), Z().createElement(nm, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function id(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function ih(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iy(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function im(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iy(e, t, r[t])
                    })
                }
                return e
            }

            function ib(e, t) {
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

            function iv(e) {
                return function(e) {
                    if (Array.isArray(e)) return ih(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ih(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ih(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ig() {
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
                            return im({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return $.useMemo(function() {
                            return iy({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var iw = (null == (F = globalThis) ? void 0 : F.document) ? $.useLayoutEffect : function() {};

            function iO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var iP = $[" useId ".trim().toString()] || function() {},
                iS = 0;

            function iE(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = $.useState(iP())) || function(e) {
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
                            if ("string" == typeof e) return iO(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iO(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return iw(function() {
                    e || o(function(e) {
                        return null != e ? e : String(iS++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function ij(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iA(e) {
                var t = $.useRef(e);
                return $.useEffect(function() {
                    t.current = e
                }), $.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return ij(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return ij(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ij(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function ix(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iI(e, t) {
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
                        if ("string" == typeof e) return ix(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ix(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iC = window.RadixUI["react-dismissable-layer"],
                iT = window.RadixUI["react-focus-scope"],
                ik = window.ReactDOM,
                iN = r.n(ik);

            function iD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iR(e) {
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

            function i_(e, t) {
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

            function iL(e, t) {
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

            function iU(e) {
                return function(e) {
                    if (Array.isArray(e)) return iD(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iD(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iD(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iB(e) {
                var t, r, n = (t = e, (r = $.forwardRef(function(e, t) {
                        var r = e.children,
                            n = iL(e, ["children"]);
                        if ($.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = iR({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            a.apply(void 0, iU(t)), o.apply(void 0, iU(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = iR({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return iR({}, e, r)
                                }(n, r.props);
                            return r.type !== $.Fragment && (s.ref = t ? ng(t, c) : c), $.cloneElement(r, s)
                        }
                        return $.Children.count(r) > 1 ? $.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = $.forwardRef(function(e, t) {
                        var r = e.children,
                            o = iL(e, ["children"]),
                            a = $.Children.toArray(r),
                            i = a.find(iF);
                        if (i) {
                            var l = i.props.children,
                                u = a.map(function(e) {
                                    return e !== i ? e : $.Children.count(l) > 1 ? $.Children.only(null) : $.isValidElement(l) ? l.props.children : null
                                });
                            return (0, no.jsx)(n, i_(iR({}, o), {
                                ref: t,
                                children: $.isValidElement(l) ? $.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, no.jsx)(n, i_(iR({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var iM = Symbol("radix.slottable");

            function iF(e) {
                return $.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === iM
            }

            function iH(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function iG(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iH(e, t, r[t])
                    })
                }
                return e
            }

            function iz(e, t) {
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
            var iV = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = iB("Primitive.".concat(t)),
                    n = $.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, no.jsx)(i, iz(iG({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), iz(iG({}, e), iH({}, t, n))
            }, {});

            function iW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var iq = $.forwardRef(function(e, t) {
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
                    }(r = $.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return iW(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iW(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = c[0],
                    f = c[1];
                iw(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return p ? iN().createPortal((0, no.jsx)(iV.div, (n = function(e) {
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

            function iK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i$(e, t) {
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
                        if ("string" == typeof e) return iK(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            iq.displayName = "Portal";
            var iZ = function(e) {
                var t, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v = e.present,
                    g = e.children,
                    w = (t = v, a = (o = i$($.useState(), 2))[0], i = o[1], l = $.useRef({}), u = $.useRef(t), c = $.useRef("none"), f = (s = i$((r = t ? "mounted" : "unmounted", n = {
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
                    }, $.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], $.useEffect(function() {
                        var e = iY(l.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), iw(function() {
                        var e = l.current,
                            r = u.current;
                        if (r !== t) {
                            var n = c.current,
                                o = iY(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = t
                        }
                    }, [t, p]), iw(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = iY(l.current).includes(e.animationName);
                                    if (e.target === a && n && (p("ANIMATION_END"), !u.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (c.current = iY(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [a, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: $.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    O = "function" == typeof g ? g({
                        present: w.isPresent
                    }) : $.Children.only(g),
                    P = nw(w.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((d = O).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? d.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || w.isPresent ? $.cloneElement(O, {
                    ref: P
                }) : null
            };

            function iY(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            iZ.displayName = "Presence";
            var iX = window.RadixUI["react-focus-guards"],
                iJ = function() {
                    return (iJ = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function iQ(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var i0 = "right-scroll-bar-position",
                i1 = "width-before-scroll-bar";

            function i2(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var i3 = "u" > typeof window ? $.useLayoutEffect : $.useEffect,
                i6 = new WeakMap,
                i5 = (void 0 === v && (v = {}), (void 0 === g && (g = function(e) {
                    return e
                }), w = [], O = !1, P = {
                    read: function() {
                        if (O) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return w.length ? w[w.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = g(e, O);
                        return w.push(t),
                            function() {
                                w = w.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (O = !0; w.length;) {
                            var t = w;
                            w = [], t.forEach(e)
                        }
                        w = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return w
                            }
                        }
                    },
                    assignMedium: function(e) {
                        O = !0;
                        var t = [];
                        if (w.length) {
                            var r = w;
                            w = [], r.forEach(e), t = w
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), w = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), w
                            }
                        }
                    }
                }).options = iJ({
                    async: !0,
                    ssr: !1
                }, v), P),
                i8 = function() {},
                i4 = $.forwardRef(function(e, t) {
                    var r, n, o, a, i = $.useRef(null),
                        l = $.useState({
                            onScrollCapture: i8,
                            onWheelCapture: i8,
                            onTouchMoveCapture: i8
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
                        S = iQ(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        E = (r = [i, t], n = function(e) {
                            return r.forEach(function(t) {
                                return i2(t, e)
                            })
                        }, (o = (0, $.useState)(function() {
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
                        })[0]).callback = n, a = o.facade, i3(function() {
                            var e = i6.get(a);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = a.current;
                                t.forEach(function(e) {
                                    n.has(e) || i2(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || i2(e, o)
                                })
                            }
                            i6.set(a, r)
                        }, [r]), a),
                        j = iJ(iJ({}, S), u);
                    return $.createElement($.Fragment, null, h && $.createElement(m, {
                        sideCar: i5,
                        removeScrollBar: d,
                        shards: y,
                        noRelative: b,
                        noIsolation: v,
                        inert: g,
                        setCallbacks: c,
                        allowPinchZoom: !!w,
                        lockRef: i,
                        gapMode: P
                    }), s ? $.cloneElement($.Children.only(f), iJ(iJ({}, j), {
                        ref: E
                    })) : $.createElement(void 0 === O ? "div" : O, iJ({}, j, {
                        className: p,
                        ref: E
                    }), f))
                });
            i4.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, i4.classNames = {
                fullWidth: i1,
                zeroRight: i0
            };
            var i7 = function(e) {
                var t = e.sideCar,
                    r = iQ(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return $.createElement(n, iJ({}, r))
            };
            i7.isSideCarExport = !0;
            var i9 = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = H || r.nc;
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
                le = function() {
                    var e = i9();
                    return function(t, r) {
                        $.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                lt = function() {
                    var e = le();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                lr = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                ln = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                lo = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [ln(r), ln(n), ln(o)]
                },
                la = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return lr;
                    var t = lo(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                li = lt(),
                ll = "data-scroll-locked",
                lu = function(e, t, r, n) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(ll, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(i0, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(i1, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(i0, " .").concat(i0, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(i1, " .").concat(i1, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(ll, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                lc = function() {
                    var e = parseInt(document.body.getAttribute(ll) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                ls = function() {
                    $.useEffect(function() {
                        return document.body.setAttribute(ll, (lc() + 1).toString()),
                            function() {
                                var e = lc() - 1;
                                e <= 0 ? document.body.removeAttribute(ll) : document.body.setAttribute(ll, e.toString())
                            }
                    }, [])
                },
                lf = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    ls();
                    var a = $.useMemo(function() {
                        return la(o)
                    }, [o]);
                    return $.createElement(li, {
                        styles: lu(a, !t, o, r ? "" : "!important")
                    })
                },
                lp = !1;
            if ("u" > typeof window) try {
                var ld = Object.defineProperty({}, "passive", {
                    get: function() {
                        return lp = !0, !0
                    }
                });
                window.addEventListener("test", ld, ld), window.removeEventListener("test", ld, ld)
            } catch (e) {
                lp = !1
            }
            var lh = !!lp && {
                passive: !1
            };

            function ly(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var lm = function(e, t) {
                    if (!ly(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                lb = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && ly(n, ShadowRoot) && (n = n.host), lv(e, n)) {
                            var o = lg(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                lv = function(e, t) {
                    return "v" === e ? lm(t, "overflowY") : lm(t, "overflowX")
                },
                lg = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                lw = function(e, t, r, n, o) {
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
                        var h = lg(e, u),
                            y = h[0],
                            m = h[1] - h[2] - i * y;
                        (y || m) && lv(e, u) && (p += m, d += y);
                        var b = u.parentNode;
                        u = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
                },
                lO = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                lP = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                lS = function(e) {
                    return e && "current" in e ? e.current : e
                },
                lE = 0,
                lj = [],
                lA = (S = function(e) {
                    var t = $.useRef([]),
                        r = $.useRef([0, 0]),
                        n = $.useRef(),
                        o = $.useState(lE++)[0],
                        a = $.useState(lt)[0],
                        i = $.useRef(e);
                    $.useEffect(function() {
                        i.current = e
                    }, [e]), $.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(lS), !0).filter(Boolean);
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
                    var l = $.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                            var o, a = lO(e),
                                l = r.current,
                                u = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                c = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                s = e.target,
                                f = Math.abs(u) > Math.abs(c) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = lb(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = lb(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (u || c) && (n.current = o), !o) return !0;
                            var d = n.current || o;
                            return lw(d, t, e, "h" === d ? u : c, !0)
                        }, []),
                        u = $.useCallback(function(e) {
                            if (lj.length && lj[lj.length - 1] === a) {
                                var r = "deltaY" in e ? lP(e) : lO(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (i.current.shards || []).map(lS).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        c = $.useCallback(function(e, r, n, o) {
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
                        s = $.useCallback(function(e) {
                            r.current = lO(e), n.current = void 0
                        }, []),
                        f = $.useCallback(function(t) {
                            c(t.type, lP(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = $.useCallback(function(t) {
                            c(t.type, lO(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    $.useEffect(function() {
                        return lj.push(a), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", u, lh), document.addEventListener("touchmove", u, lh), document.addEventListener("touchstart", s, lh),
                            function() {
                                lj = lj.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", u, lh), document.removeEventListener("touchmove", u, lh), document.removeEventListener("touchstart", s, lh)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        h = e.inert;
                    return $.createElement($.Fragment, null, h ? $.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, d ? $.createElement(lf, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, i5.useMedium(S), i7),
                lx = $.forwardRef(function(e, t) {
                    return $.createElement(i4, iJ({}, e, {
                        ref: t,
                        sideCar: lA
                    }))
                });
            lx.classNames = i4.classNames;
            var lI = new WeakMap,
                lC = new WeakMap,
                lT = {},
                lk = 0,
                lN = function(e) {
                    return e && (e.host || lN(e.parentNode))
                },
                lD = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = lN(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    lT[r] || (lT[r] = new WeakMap);
                    var a = lT[r],
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
                                    u = (lI.get(e) || 0) + 1,
                                    c = (a.get(e) || 0) + 1;
                                lI.set(e, u), a.set(e, c), i.push(e), 1 === u && o && lC.set(e, !0), 1 === c && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), lk++,
                        function() {
                            i.forEach(function(e) {
                                var t = lI.get(e) - 1,
                                    o = a.get(e) - 1;
                                lI.set(e, t), a.set(e, o), t || (lC.has(e) || e.removeAttribute(n), lC.delete(e)), o || e.removeAttribute(r)
                            }), --lk || (lI = new WeakMap, lI = new WeakMap, lC = new WeakMap, lT = {})
                        }
                },
                lR = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), lD(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function l_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lL(e) {
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

            function lB(e, t) {
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

            function lM(e, t) {
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
                        if ("string" == typeof e) return l_(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l_(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lF = "Dialog",
                lH = lM(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return $.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return $.useMemo(function() {
                                    var t, o;
                                    return iy({}, "__scope".concat(e), (t = im({}, r), o = null != (o = iy({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                        var o = $.createContext(n),
                            a = r.length;
                        r = iv(r).concat([n]);
                        var i = function(t) {
                            var r, n = t.scope,
                                i = t.children,
                                l = ib(t, ["scope", "children"]),
                                u = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                                c = $.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, no.jsx)(u.Provider, {
                                value: c,
                                children: i
                            })
                        };
                        return i.displayName = t + "Provider", [i, function(r, i) {
                            var l, u = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                                c = $.useContext(u);
                            if (c) return c;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, ig.apply(void 0, [n].concat(iv(t)))]
                }(lF), 2),
                lG = lH[0];
            lH[1];
            var lz = lM(lG(lF), 2),
                lV = lz[0],
                lW = lz[1],
                lq = function(e) {
                    var t, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b, v = e.__scopeDialog,
                        g = e.children,
                        w = e.open,
                        O = e.defaultOpen,
                        P = e.onOpenChange,
                        S = e.modal,
                        E = $.useRef(null),
                        j = $.useRef(null),
                        A = lM((c = (u = {
                            prop: w,
                            defaultProp: O,
                            onChange: P
                        }).prop, d = (p = iI((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: f = void 0 === (s = u.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, a = iI(o = $.useState(r), 1)[0], i = $.useRef(a), l = iA(n), $.useEffect(function() {
                            i.current !== a && (l(a), i.current = a)
                        }, [a, i, l]), o), 2))[0], h = p[1], m = (y = void 0 !== c) ? c : d, b = iA(f), [m, $.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(c) : e;
                                t !== c && b(t)
                            } else h(e)
                        }, [y, c, h, b])]), 2),
                        x = A[0],
                        I = A[1];
                    return (0, no.jsx)(lV, {
                        scope: v,
                        triggerRef: E,
                        contentRef: j,
                        contentId: iE(),
                        titleId: iE(),
                        descriptionId: iE(),
                        open: void 0 !== x && x,
                        onOpenChange: I,
                        onOpenToggle: $.useCallback(function() {
                            return I(function(e) {
                                return !e
                            })
                        }, [I]),
                        modal: void 0 === S || S,
                        children: g
                    })
                };
            lq.displayName = lF;
            var lK = "DialogTrigger";
            $.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = lB(e, ["__scopeDialog"]),
                    o = lW(lK, r),
                    a = nw(t, o.triggerRef);
                return (0, no.jsx)(iV.button, lU(lL({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": un(o.open)
                }, n), {
                    ref: a,
                    onClick: id(e.onClick, o.onOpenToggle)
                }))
            }).displayName = lK;
            var l$ = "DialogPortal",
                lZ = lM(lG(l$, {
                    forceMount: void 0
                }), 2),
                lY = lZ[0],
                lX = lZ[1],
                lJ = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = lW(l$, t);
                    return (0, no.jsx)(lY, {
                        scope: t,
                        forceMount: r,
                        children: $.Children.map(n, function(e) {
                            return (0, no.jsx)(iZ, {
                                present: r || a.open,
                                children: (0, no.jsx)(iq, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            lJ.displayName = l$;
            var lQ = "DialogOverlay",
                l0 = $.forwardRef(function(e, t) {
                    var r = lX(lQ, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = lB(e, ["forceMount"]),
                        i = lW(lQ, e.__scopeDialog);
                    return i.modal ? (0, no.jsx)(iZ, {
                        present: o || i.open,
                        children: (0, no.jsx)(l2, lU(lL({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            l0.displayName = lQ;
            var l1 = iB("DialogOverlay.RemoveScroll"),
                l2 = $.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lB(e, ["__scopeDialog"]),
                        o = lW(lQ, r);
                    return (0, no.jsx)(lx, {
                        as: l1,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, no.jsx)(iV.div, lU(lL({
                            "data-state": un(o.open)
                        }, n), {
                            ref: t,
                            style: lL({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                l3 = "DialogContent",
                l6 = $.forwardRef(function(e, t) {
                    var r = lX(l3, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = lB(e, ["forceMount"]),
                        i = lW(l3, e.__scopeDialog);
                    return (0, no.jsx)(iZ, {
                        present: o || i.open,
                        children: i.modal ? (0, no.jsx)(l5, lU(lL({}, a), {
                            ref: t
                        })) : (0, no.jsx)(l8, lU(lL({}, a), {
                            ref: t
                        }))
                    })
                });
            l6.displayName = l3;
            var l5 = $.forwardRef(function(e, t) {
                    var r = lW(l3, e.__scopeDialog),
                        n = $.useRef(null),
                        o = nw(t, r.contentRef, n);
                    return $.useEffect(function() {
                        var e = n.current;
                        if (e) return lR(e)
                    }, []), (0, no.jsx)(l4, lU(lL({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: id(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: id(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: id(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                l8 = $.forwardRef(function(e, t) {
                    var r = lW(l3, e.__scopeDialog),
                        n = $.useRef(!1),
                        o = $.useRef(!1);
                    return (0, no.jsx)(l4, lU(lL({}, e), {
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
                l4 = $.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = lB(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = lW(l3, r),
                        u = $.useRef(null),
                        c = nw(t, u);
                    return (0, iX.useFocusGuards)(), (0, no.jsxs)(no.Fragment, {
                        children: [(0, no.jsx)(iT.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: a,
                            children: (0, no.jsx)(iC.DismissableLayer, lU(lL({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": un(l.open)
                            }, i), {
                                ref: c,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, no.jsxs)(no.Fragment, {
                            children: [(0, no.jsx)(ul, {
                                titleId: l.titleId
                            }), (0, no.jsx)(uu, {
                                contentRef: u,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                l7 = "DialogTitle",
                l9 = $.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lB(e, ["__scopeDialog"]),
                        o = lW(l7, r);
                    return (0, no.jsx)(iV.h2, lU(lL({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            l9.displayName = l7;
            var ue = "DialogDescription";
            $.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = lB(e, ["__scopeDialog"]),
                    o = lW(ue, r);
                return (0, no.jsx)(iV.p, lU(lL({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = ue;
            var ut = "DialogClose",
                ur = $.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = lB(e, ["__scopeDialog"]),
                        o = lW(ut, r);
                    return (0, no.jsx)(iV.button, lU(lL({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: id(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function un(e) {
                return e ? "open" : "closed"
            }
            ur.displayName = ut;
            var uo = "DialogTitleWarning",
                ua = lM((E = {
                    contentName: l3,
                    titleName: l7,
                    docsSlug: "dialog"
                }, j = $.createContext(E), (A = function(e) {
                    var t = e.children,
                        r = ib(e, ["children"]),
                        n = $.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, no.jsx)(j.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = uo + "Provider", [A, function(e) {
                    var t = $.useContext(j);
                    if (t) return t;
                    if (void 0 !== E) return E;
                    throw Error("`".concat(e, "` must be used within `").concat(uo, "`"))
                }]), 2),
                ui = (ua[0], ua[1]),
                ul = function(e) {
                    var t = e.titleId,
                        r = ui(uo),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return $.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                uu = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = ui("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return $.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function uc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function us(e) {
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

            function uf(e, t) {
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

            function up(e, t) {
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

            function ud(e) {
                return function(e) {
                    if (Array.isArray(e)) return uc(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return uc(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return uc(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uh = Symbol("radix.slottable");

            function uy(e) {
                return $.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === uh
            }

            function um(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ub(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        um(e, t, r[t])
                    })
                }
                return e
            }

            function uv(e, t) {
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
            var ug = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, o, a, i, l = (r = o = "Primitive.".concat(t), (n = $.forwardRef(function(e, t) {
                        var r = e.children,
                            n = up(e, ["children"]);
                        if ($.isValidElement(r)) {
                            var o, a, i, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (u = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = us({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, ud(t));
                                            return o.apply(void 0, ud(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = us({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return us({}, e, r)
                                }(n, r.props);
                            return r.type !== $.Fragment && (s.ref = t ? ng(t, c) : c), $.cloneElement(r, s)
                        }
                        return $.Children.count(r) > 1 ? $.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), a = n, (i = $.forwardRef(function(e, t) {
                        var r = e.children,
                            n = up(e, ["children"]),
                            o = $.Children.toArray(r),
                            i = o.find(uy);
                        if (i) {
                            var l = i.props.children,
                                u = o.map(function(e) {
                                    return e !== i ? e : $.Children.count(l) > 1 ? $.Children.only(null) : $.isValidElement(l) ? l.props.children : null
                                });
                            return (0, no.jsx)(a, uf(us({}, n), {
                                ref: t,
                                children: $.isValidElement(l) ? $.cloneElement(l, void 0, u) : null
                            }))
                        }
                        return (0, no.jsx)(a, uf(us({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(o, ".Slot"), i),
                    u = $.forwardRef(function(e, r) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, no.jsx)(a, uv(ub({}, o), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), uv(ub({}, e), um({}, t, u))
            }, {});

            function uw(e) {
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
            var uO = Object.freeze({
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
                uP = $.forwardRef(function(e, t) {
                    var r, n;
                    return (0, no.jsx)(ug.span, (r = uw({}, e), n = n = {
                        ref: t,
                        style: uw({}, uO, e.style)
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

            function uS(e) {
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

            function uE(e, t) {
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
            uP.displayName = "VisuallyHidden";
            var uj = (0, $.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                uA = function() {
                    var e = (0, $.useContext)(uj);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                ux = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                uI = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                uC = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                uT = function(e) {
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
                        v = (0, $.useMemo)(function() {
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
                    return (0, $.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), Z().createElement(uj.Provider, {
                        value: v
                    }, Z().createElement(lq, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            uT.displayName = "Dialog";
            var uk = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    a = e.overlayStyle,
                    i = e.onOpenAutoFocus,
                    l = uE(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = uA(),
                    c = u.size,
                    s = u.isModal,
                    f = u.hasCloseAffordance,
                    p = u.closeLabel,
                    d = u.hasDescription,
                    h = nl("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    y = nl("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return Z().createElement(lJ, null, Z().createElement(l0, {
                    className: h,
                    style: a
                }, Z().createElement(l6, uS({
                    className: y,
                    "data-size": c,
                    style: n,
                    onOpenAutoFocus: i
                }, !d && {
                    "aria-describedby": void 0
                }, l), f && Z().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, Z().createElement(ur, {
                    asChild: !0
                }, Z().createElement(ip, {
                    variant: "OverMedia",
                    size: c,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            uk.displayName = "DialogContent";
            var uN = function(e) {
                var t = e.children,
                    r = e.className,
                    n = uE(e, ["children", "className"]),
                    o = uA(),
                    a = o.size,
                    i = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    u = nl(ux[a], i && uI[a], l && uC[a], r);
                return Z().createElement("div", uS({
                    className: u
                }, n), t)
            };
            uN.displayName = "DialogBody";
            var uD = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = uE(e, ["children", "className", "hidden"]),
                    a = Z().createElement(l9, uS({
                        className: r
                    }, o), t);
                return n ? Z().createElement(uP, null, a) : a
            };
            uD.displayName = "DialogTitle";
            var uR = function(e) {
                var t = e.children,
                    r = e.className,
                    n = uE(e, ["children", "className"]),
                    o = uA().size,
                    a = nl(ux[o], uC[o], r);
                return Z().createElement("div", uS({
                    className: a
                }, n), t)
            };

            function u_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uL(e, t, r) {
                return (uL = uH() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && uB(o, r.prototype), o
                }).apply(null, arguments)
            }

            function uU(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function uB(e, t) {
                return (uB = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function uM(e) {
                return function(e) {
                    if (Array.isArray(e)) return u_(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return u_(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return u_(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uF(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function uH() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (uH = function() {
                    return !!e
                })()
            } /*! @license DOMPurify 3.4.17 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.4.17/LICENSE */
            function uG(e, t) {
                this.v = e, this.k = t
            }

            function uz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uV(e) {
                var t, r;

                function n(t, r) {
                    try {
                        var a = e[t](r),
                            i = a.value,
                            l = uU(i, uG);
                        Promise.resolve(l ? i.v : i).then(function(r) {
                            if (l) {
                                var u = "return" === t && i.k ? t : "next";
                                if (!i.k || r.done) return n(u, r);
                                r = e[u](r).value
                            }
                            o(!!a.done, r)
                        }, function(e) {
                            n("throw", e)
                        })
                    } catch (e) {
                        o(2, e)
                    }
                }

                function o(e, o) {
                    2 === e ? t.reject(o) : t.resolve({
                        value: o,
                        done: e
                    }), (t = t.next) ? n(t.key, t.arg) : r = null
                }
                this._invoke = function(e, o) {
                    return new Promise(function(a, i) {
                        var l = {
                            key: e,
                            arg: o,
                            resolve: a,
                            reject: i,
                            next: null
                        };
                        r ? r = r.next = l : (t = r = l, n(e, o))
                    })
                }, "function" != typeof e.return && (this.return = void 0)
            }
            uR.displayName = "DialogFooter", uV.prototype["function" == typeof Symbol && Symbol.asyncIterator || "@@asyncIterator"] = function() {
                return this
            }, uV.prototype.next = function(e) {
                return this._invoke("next", e)
            }, uV.prototype.throw = function(e) {
                return this._invoke("throw", e)
            }, uV.prototype.return = function(e) {
                return this._invoke("return", e)
            };
            var uW = Object.entries,
                uq = Object.setPrototypeOf,
                uK = Object.isFrozen,
                u$ = Object.getPrototypeOf,
                uZ = Object.getOwnPropertyDescriptor,
                uY = Object.freeze,
                uX = Object.seal,
                uJ = Object.create,
                uQ = "u" > typeof Reflect && Reflect,
                u0 = uQ.apply,
                u1 = uQ.construct;
            uY || (uY = function(e) {
                return e
            }), uX || (uX = function(e) {
                return e
            }), u0 || (u0 = function(e, t) {
                for (var r = arguments.length, n = Array(r > 2 ? r - 2 : 0), o = 2; o < r; o++) n[o - 2] = arguments[o];
                return e.apply(t, n)
            }), u1 || (u1 = function(e) {
                for (var t = arguments.length, r = Array(t > 1 ? t - 1 : 0), n = 1; n < t; n++) r[n - 1] = arguments[n];
                return uL(e, uM(r))
            });
            var u2 = cm(Array.prototype.forEach);
            Array.prototype.indexOf;
            var u3 = cm(Array.prototype.lastIndexOf),
                u6 = cm(Array.prototype.pop),
                u5 = cm(Array.prototype.push),
                u8 = cm(Array.prototype.slice),
                u4 = cm(Array.prototype.splice),
                u7 = Array.isArray,
                u9 = cb(Set),
                ce = cm(Set.prototype.add),
                ct = cm(Set.prototype.has),
                cr = cm(String.prototype.toLowerCase),
                cn = cm(String.prototype.toString),
                co = cm(String.prototype.match),
                ca = cm(String.prototype.replace),
                ci = cm(String.prototype.indexOf),
                cl = cm(String.prototype.trim),
                cu = cm(Number.prototype.toString),
                cc = cm(Boolean.prototype.toString),
                cs = "u" < typeof BigInt ? null : cm(BigInt.prototype.toString),
                cf = "u" < typeof Symbol ? null : cm(Symbol.prototype.toString),
                cp = cm(Object.prototype.hasOwnProperty),
                cd = cm(Object.prototype.toString),
                ch = cm(RegExp.prototype.test),
                cy = cb(TypeError);

            function cm(e) {
                return function(t) {
                    uU(t, RegExp) && (t.lastIndex = 0);
                    for (var r = arguments.length, n = Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
                    return u0(e, t, n)
                }
            }

            function cb(e) {
                return function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return u1(e, r)
                }
            }

            function cv(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : cr;
                if (uq && uq(e, null), !u7(t)) return e;
                for (var n = t.length; n--;) {
                    var o = t[n];
                    if ("string" == typeof o) {
                        var a = r(o);
                        a !== o && (uK(t) || (t[n] = a), o = a)
                    }
                    e[o] = !0
                }
                return e
            }

            function cg(e) {
                var t = uJ(null),
                    r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var a, i = uW(e)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                        var l, u = (l = a.value, function(e) {
                                if (Array.isArray(e)) return e
                            }(l) || function(e) {
                                var t = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != t) {
                                    var r, n, o, a, i = [],
                                        l = !0,
                                        u = !1;
                                    try {
                                        o = (t = t.call(e)).next, !1;
                                        for (; !(l = (r = o.call(t)).done) && (i.push(r.value), 2 !== i.length); l = !0);
                                    } catch (e) {
                                        u = !0, n = e
                                    } finally {
                                        try {
                                            if (!l && null != t.return && (a = t.return(), Object(a) !== a)) return
                                        } finally {
                                            if (u) throw n
                                        }
                                    }
                                    return i
                                }
                            }(l) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return uz(e, 2);
                                    var t = ({}).toString.call(e).slice(8, -1);
                                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? uz(e, 2) : void 0
                                }
                            }(l) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            c = u[0],
                            s = u[1];
                        cp(e, c) && (u7(s) ? t[c] = function(e) {
                            for (var t = 0; t < e.length; t++) cp(e, t) || (e[t] = null);
                            return e
                        }(s) : s && (void 0 === s ? "undefined" : uF(s)) === "object" && s.constructor === Object ? t[c] = cg(s) : t[c] = s)
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

            function cw(e, t) {
                for (; null !== e;) {
                    var r = uZ(e, t);
                    if (r) {
                        if (r.get) return cm(r.get);
                        if ("function" == typeof r.value) return cm(r.value)
                    }
                    e = u$(e)
                }
                return function() {
                    return null
                }
            }
            var cO = uY(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
                cP = uY(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
                cS = uY(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
                cE = uY(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
                cj = uY(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
                cA = uY(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
                cx = uY(["#text"]),
                cI = uY(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "command", "commandfor", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns"]),
                cC = uY(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dominant-baseline", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "pointer-events", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-orientation", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "vector-effect", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
                cT = uY(["accent", "accentunder", "align", "bevelled", "close", "columnalign", "columnlines", "columnspacing", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lquote", "lspace", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
                ck = uY(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
                cN = uX(/{{[\w\W]*|^[\w\W]*}}/g),
                cD = uX(/<%[\w\W]*|^[\w\W]*%>/g),
                cR = uX(/\${[\w\W]*/g),
                c_ = uX(/^data-[\-\w.\u00B7-\uFFFF]+$/),
                cL = uX(/^aria-[\-\w]+$/),
                cU = uX(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
                cB = uX(/^(?:\w+script|data):/i),
                cM = uX(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
                cF = uX(/^html$/i),
                cH = uX(/^[a-z][.\w]*(-[.\w]+)+$/i),
                cG = uX(/<[/\w!]/g),
                cz = uX(/<[/\w]/g),
                cV = uX(/<\/no(script|embed|frames)/i),
                cW = uX(/\/>/i),
                cq = uY(cv({}, ["style", "script", "xmp", "iframe", "noembed", "noframes", "plaintext", "noscript"])),
                cK = function(e, t) {
                    if ((void 0 === e ? "undefined" : uF(e)) !== "object" || "function" != typeof e.createPolicy) return null;
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
                c$ = function() {
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
                cZ = function(e, t, r, n) {
                    return cp(e, t) && u7(e[t]) ? cv(n.base ? cg(n.base) : {}, e[t], n.transform) : r
                },
                cY = function(e, t, r) {
                    var n = cp(e, t) ? e[t] : void 0;
                    return n && (void 0 === n ? "undefined" : uF(n)) === "object" ? cg(n) : r()
                },
                cX = function e() {
                    var t, r, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? null : window,
                        o = function(t) {
                            return e(t)
                        };
                    if (o.version = "3.4.17", o.removed = [], !n || !n.document || 9 !== n.document.nodeType || !n.Element) return o.isSupported = !1, o;
                    var a = n.document,
                        i = a,
                        l = i.currentScript;
                    n.DocumentFragment;
                    var u = n.HTMLTemplateElement,
                        c = n.Node,
                        s = n.Element,
                        f = n.NodeFilter;
                    void 0 === n.NamedNodeMap && (n.NamedNodeMap || n.MozNamedAttrMap), n.HTMLFormElement;
                    var p = n.DOMParser,
                        d = n.trustedTypes,
                        h = s.prototype,
                        y = cw(h, "cloneNode"),
                        m = cw(h, "remove"),
                        b = cw(h, "removeAttributeNode"),
                        v = cw(h, "nextSibling"),
                        g = cw(h, "childNodes"),
                        w = cw(h, "parentNode"),
                        O = cw(h, "shadowRoot"),
                        P = cw(h, "attributes"),
                        S = c && c.prototype ? cw(c.prototype, "nodeType") : null,
                        E = c && c.prototype ? cw(c.prototype, "nodeName") : null,
                        j = c && c.prototype ? cw(c.prototype, "ownerDocument") : null,
                        A = function(e) {
                            return S ? S(e) : e.nodeType
                        },
                        x = function(e) {
                            return E ? E(e) : e.nodeName
                        },
                        I = function(e, t) {
                            for (; null !== e;) {
                                var r = uZ(e, t);
                                if (r) return r.get ? cm(r.get) : null;
                                e = u$(e)
                            }
                            return null
                        }(h, "namespaceURI"),
                        C = function(e) {
                            return I ? I(e) : e.namespaceURI
                        };
                    if ("function" == typeof u) {
                        var T = a.createElement("template");
                        T.content && T.content.ownerDocument && (a = T.content.ownerDocument)
                    }
                    var k = "",
                        N = !1,
                        D = 0,
                        R = function() {
                            if (D > 0) throw cy('A configured TRUSTED_TYPES_POLICY callback (createHTML or createScriptURL) must not call DOMPurify.sanitize, as that causes infinite recursion. Do not pass a policy whose callbacks wrap DOMPurify as TRUSTED_TYPES_POLICY; see the "DOMPurify and Trusted Types" section of the README.')
                        },
                        _ = function(e) {
                            R(), D++;
                            try {
                                return t.createHTML(e)
                            } finally {
                                D--
                            }
                        },
                        L = function(e) {
                            R(), D++;
                            try {
                                return t.createScriptURL(e)
                            } finally {
                                D--
                            }
                        },
                        U = a,
                        B = U.implementation,
                        M = U.createNodeIterator,
                        F = U.createDocumentFragment,
                        H = U.getElementsByTagName,
                        G = i.importNode,
                        z = c$();
                    o.isSupported = "function" == typeof uW && "function" == typeof w && B && void 0 !== B.createHTMLDocument;
                    var V = cU,
                        W = null,
                        q = cv({}, uM(cO).concat(uM(cP), uM(cS), uM(cj), uM(cx))),
                        K = null,
                        $ = cv({}, uM(cI).concat(uM(cC), uM(cT), uM(ck))),
                        Z = Object.seal(uJ(null, {
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
                        Y = null,
                        X = null,
                        J = Object.seal(uJ(null, {
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
                        Q = !0,
                        ee = !0,
                        et = !1,
                        er = !0,
                        en = !1,
                        eo = !0,
                        ea = !1,
                        ei = !1,
                        el = null,
                        eu = null,
                        ec = !1,
                        es = !1,
                        ef = !1,
                        ep = !1,
                        ed = !0,
                        eh = !1,
                        ey = "user-content-",
                        em = !0,
                        eb = !1,
                        ev = null,
                        eg = {},
                        ew = null,
                        eO = cv({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "selectedcontent", "style", "svg", "template", "thead", "title", "video", "xmp"]),
                        eP = null,
                        eS = cv({}, ["audio", "video", "img", "source", "image", "track"]),
                        eE = null,
                        ej = cv({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
                        eA = "http://www.w3.org/1998/Math/MathML",
                        ex = "http://www.w3.org/2000/svg",
                        eI = "http://www.w3.org/1999/xhtml",
                        eC = eI,
                        eT = !1,
                        ek = null,
                        eN = cv({}, [eA, ex, eI], cn),
                        eD = uY(["mi", "mo", "mn", "ms", "mtext"]),
                        eR = cv({}, eD),
                        e_ = uY(["annotation-xml"]),
                        eL = cv({}, e_),
                        eU = cv({}, ["title", "style", "font", "a", "script"]),
                        eB = null,
                        eM = ["application/xhtml+xml", "text/html"],
                        eF = null,
                        eH = null,
                        eG = a.createElement("form"),
                        ez = function(e) {
                            return uU(e, RegExp) || uU(e, Function)
                        },
                        eV = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            if (!eH || eH !== e) {
                                e && (void 0 === e ? "undefined" : uF(e)) === "object" || (e = {}), e = cg(e), eF = "application/xhtml+xml" === (eB = -1 === eM.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? cn : cr, W = cZ(e, "ALLOWED_TAGS", q, {
                                    transform: eF
                                }), K = cZ(e, "ALLOWED_ATTR", $, {
                                    transform: eF
                                }), ek = cZ(e, "ALLOWED_NAMESPACES", eN, {
                                    transform: cn
                                }), eE = cZ(e, "ADD_URI_SAFE_ATTR", ej, {
                                    transform: eF,
                                    base: ej
                                }), eP = cZ(e, "ADD_DATA_URI_TAGS", eS, {
                                    transform: eF,
                                    base: eS
                                }), ew = cZ(e, "FORBID_CONTENTS", eO, {
                                    transform: eF
                                }), Y = cZ(e, "FORBID_TAGS", cg({}), {
                                    transform: eF
                                }), X = cZ(e, "FORBID_ATTR", cg({}), {
                                    transform: eF
                                }), eg = !!cp(e, "USE_PROFILES") && (e.USE_PROFILES && "object" === uF(e.USE_PROFILES) ? cg(e.USE_PROFILES) : e.USE_PROFILES), Q = !1 !== e.ALLOW_ARIA_ATTR, ee = !1 !== e.ALLOW_DATA_ATTR, et = e.ALLOW_UNKNOWN_PROTOCOLS || !1, er = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, en = e.SAFE_FOR_TEMPLATES || !1, eo = !1 !== e.SAFE_FOR_XML, ea = e.WHOLE_DOCUMENT || !1, es = e.RETURN_DOM || !1, ef = e.RETURN_DOM_FRAGMENT || !1, ep = e.RETURN_TRUSTED_TYPE || !1, ec = e.FORCE_BODY || !1, ed = !1 !== e.SANITIZE_DOM, eh = e.SANITIZE_NAMED_PROPS || !1, em = !1 !== e.KEEP_CONTENT, eb = e.IN_PLACE || !1, V = ! function(e) {
                                    try {
                                        return ch(e, ""), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }(e.ALLOWED_URI_REGEXP) ? cU : e.ALLOWED_URI_REGEXP, eC = "string" == typeof e.NAMESPACE ? e.NAMESPACE : eI, eR = cY(e, "MATHML_TEXT_INTEGRATION_POINTS", function() {
                                    return cv({}, eD)
                                }), eL = cY(e, "HTML_INTEGRATION_POINTS", function() {
                                    return cv({}, e_)
                                });
                                var n = cY(e, "CUSTOM_ELEMENT_HANDLING", function() {
                                    return uJ(null)
                                });
                                if (Z = uJ(null), cp(n, "tagNameCheck") && ez(n.tagNameCheck) && (Z.tagNameCheck = n.tagNameCheck), cp(n, "attributeNameCheck") && ez(n.attributeNameCheck) && (Z.attributeNameCheck = n.attributeNameCheck), cp(n, "allowCustomizedBuiltInElements") && "boolean" == typeof n.allowCustomizedBuiltInElements && (Z.allowCustomizedBuiltInElements = n.allowCustomizedBuiltInElements), uX(Z), en && (ee = !1), ef && (es = !0), eg && (W = cv({}, cx), K = uJ(null), !0 === eg.html && (cv(W, cO), cv(K, cI)), !0 === eg.svg && (cv(W, cP), cv(K, cC), cv(K, ck)), !0 === eg.svgFilters && (cv(W, cS), cv(K, cC), cv(K, ck)), !0 === eg.mathMl && (cv(W, cj), cv(K, cT), cv(K, ck))), J.tagCheck = null, J.attributeCheck = null, cp(e, "ADD_TAGS") && ("function" == typeof e.ADD_TAGS ? J.tagCheck = e.ADD_TAGS : u7(e.ADD_TAGS) && (W === q && (W = cg(W)), cv(W, e.ADD_TAGS, eF))), cp(e, "ADD_ATTR") && ("function" == typeof e.ADD_ATTR ? J.attributeCheck = e.ADD_ATTR : u7(e.ADD_ATTR) && (K === $ && (K = cg(K)), cv(K, e.ADD_ATTR, eF))), cp(e, "ADD_FORBID_CONTENTS") && u7(e.ADD_FORBID_CONTENTS) && (ew === eO && (ew = cg(ew)), cv(ew, e.ADD_FORBID_CONTENTS, eF)), em && (W["#text"] = !0), ea && cv(W, ["html", "head", "body"]), W.table && (cv(W, ["tbody"]), delete Y.tbody), e.TRUSTED_TYPES_POLICY) {
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw cy('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw cy('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                                    var o = t;
                                    t = e.TRUSTED_TYPES_POLICY;
                                    try {
                                        k = _("")
                                    } catch (e) {
                                        throw t = o, e
                                    }
                                } else null === e.TRUSTED_TYPES_POLICY ? (t = void 0, k = "") : (void 0 === t && (N || (r = cK(d, l), N = !0), t = r), t && "string" == typeof k && (k = _("")));
                                uY && uY(e), eH = e
                            }
                        },
                        eW = cv({}, uM(cP).concat(uM(cS), uM(cE))),
                        eq = cv({}, uM(cj).concat(uM(cA))),
                        eK = function(e) {
                            var t, r, n, o, a, i, l, u, c = C(e),
                                s = cr(x(e)),
                                f = w(e);
                            return f && 1 === A(f) ? (l = {
                                namespaceURI: C(f)
                            }, u = cr(x(f))) : (l = {
                                namespaceURI: eC
                            }, u = "template"), !!ek[c] && (c === ex ? (t = l, r = u, t.namespaceURI === eI ? "svg" === s : t.namespaceURI === eA ? "svg" === s && ("annotation-xml" === r || eR[r]) : !!eW[s]) : c === eA ? (n = l, o = u, n.namespaceURI === eI ? "math" === s : n.namespaceURI === ex ? "math" === s && eL[o] : !!eq[s]) : c === eI ? (a = l, i = u, (a.namespaceURI !== ex || !!eL[i]) && (a.namespaceURI !== eA || !!eR[i]) && !eq[s] && (eU[s] || !eW[s])) : "application/xhtml+xml" === eB && !!ek[c])
                        },
                        e$ = function(e) {
                            u5(o.removed, {
                                element: e
                            });
                            try {
                                w(e).removeChild(e)
                            } catch (t) {
                                if (m(e), !w(e)) throw cy("a node selected for removal could not be detached from its tree and cannot be safely returned; refusing to sanitize in place")
                            }
                        },
                        eZ = function(e, t, r) {
                            try {
                                b(e, t)
                            } catch (t) {
                                try {
                                    e.removeAttribute(r)
                                } catch (e) {}
                            }
                        },
                        eY = function(e) {
                            e0(e);
                            var t = g(e);
                            t && u2(u8(t), function(e) {
                                try {
                                    m(e)
                                } catch (e) {}
                            });
                            var r = 1 === A(e) ? P(e) : null;
                            if (r)
                                for (var n = r.length - 1; n >= 0; --n) {
                                    var o = r[n],
                                        a = o && o.name;
                                    "string" == typeof a && eZ(e, o, a)
                                }
                        },
                        eX = function(e, t, r) {
                            if (!r) try {
                                r = t.getAttributeNode(e)
                            } catch (e) {
                                r = null
                            }
                            u5(o.removed, {
                                attribute: r || null,
                                from: t
                            });
                            try {
                                r ? b(t, r) : t.removeAttribute(e)
                            } catch (r) {
                                try {
                                    t.removeAttribute(e)
                                } catch (e) {}
                            }
                            if ("is" === e)
                                if (es || ef) try {
                                    e$(t)
                                } catch (e) {} else try {
                                    t.setAttribute(e, "")
                                } catch (e) {}
                        },
                        eJ = function(e) {
                            var t = P(e);
                            if (t)
                                for (var r = t.length - 1; r >= 0; --r) {
                                    var n = t[r],
                                        o = n && n.name;
                                    "string" != typeof o || K[eF(o)] || eZ(e, n, o)
                                }
                        },
                        eQ = function(e, t) {
                            for (var r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2], n = [e]; n.length > 0;) {
                                var o = n.pop();
                                if (!1 !== t(o)) {
                                    if (r && 1 === A(o)) {
                                        var a = O(o);
                                        ta(a) && n.push(a)
                                    }
                                    var i = g(o);
                                    if (i)
                                        for (var l = i.length - 1; l >= 0; --l) n.push(i[l])
                                }
                            }
                        },
                        e0 = function(e) {
                            eQ(e, function(e) {
                                1 === A(e) && eJ(e)
                            })
                        },
                        e1 = function(e) {
                            var t = [];
                            return eQ(e, function(e) {
                                t.push(e)
                            }, !0), t
                        },
                        e2 = function(e, t) {
                            var r = u9();
                            u2(e1(e), function(e) {
                                1 === A(e) && ce(r, e)
                            }), u2(t, function(e) {
                                1 !== A(e) || ct(r, e) || eJ(e)
                            })
                        },
                        e3 = function(e, t) {
                            var r = !1;
                            return u2(o.removed, function(t) {
                                t.element && (r = r || t.element === e, e0(t.element))
                            }), e2(e, t), r
                        },
                        e6 = function(e, t) {
                            for (var r = ev, n = null, o = function() {
                                    return n || (n = u9(), u2(t, function(e) {
                                        ce(n, e)
                                    })), n
                                }, a = 0;; a++) {
                                var i = function(t) {
                                    var n = e1(e),
                                        a = [e],
                                        i = !1;
                                    if (u2(n, function(e) {
                                            11 === A(e) ? u5(a, e) : i || ct(r, e) || (i = ct(o(), e))
                                        }), !i) return {
                                        v: void 0
                                    };
                                    if (t >= 8) throw cy("the tree kept changing during in-place sanitization; refusing to return it");
                                    u2(a, function(t, r) {
                                        e5(t, r > 0, e, o())
                                    })
                                }(a);
                                if ("object" === uF(i)) return i.v
                            }
                        },
                        e5 = function(e, t, r, n) {
                            for (var o, a = te(e); o = a.nextNode();) !(!ct(n, o) || ct(ev, o)) && (t && tl(z.uponSanitizeShadowNode, o, null), tp(o, r), tg(o, r), ta(o.content) && tw(o.content))
                        },
                        e8 = function(e) {
                            ev && ce(ev, e)
                        },
                        e4 = function(e, t) {
                            return !!eo && ("patchsrc" === e || "for" === e && "label" !== t && "output" !== t)
                        },
                        e7 = function(e) {
                            eo && eQ(e, function(e) {
                                var t = A(e);
                                if (7 === t || 8 === t && ch(cz, e.data)) {
                                    try {
                                        m(e)
                                    } catch (e) {}
                                    return !1
                                }
                                if (1 === t) {
                                    var r = eF(x(e));
                                    try {
                                        e.hasAttribute && e.hasAttribute("patchsrc") && e.removeAttribute("patchsrc"), e.hasAttribute && e.hasAttribute("for") && e4("for", r) && e.removeAttribute("for")
                                    } catch (e) {}
                                }
                                return !0
                            })
                        },
                        e9 = function(e) {
                            var r = null,
                                n = null;
                            if (ec) e = "<remove></remove>" + e;
                            else {
                                var o = co(e, /^[\r\n\t ]+/);
                                n = o && o[0]
                            }
                            "application/xhtml+xml" === eB && eC === eI && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                            var i = t ? _(e) : e;
                            if (eC === eI) try {
                                r = new p().parseFromString(i, eB)
                            } catch (e) {}
                            if (!r || !r.documentElement) {
                                r = B.createDocument(eC, "template", null);
                                try {
                                    r.documentElement.innerHTML = eT ? k : i
                                } catch (e) {}
                            }
                            var l = r.body || r.documentElement;
                            return (e && n && l.insertBefore(a.createTextNode(n), l.childNodes[0] || null), eC === eI) ? H.call(r, ea ? "html" : "body")[0] : ea ? r.documentElement : l
                        },
                        te = function(e) {
                            var t = j ? j(e) : e.ownerDocument;
                            return M.call(t || e, e, f.SHOW_ELEMENT | f.SHOW_COMMENT | f.SHOW_TEXT | f.SHOW_PROCESSING_INSTRUCTION | f.SHOW_CDATA_SECTION, null)
                        },
                        tt = function(e) {
                            return e = ca(e, cN, " "), e = ca(e, cD, " "), e = ca(e, cR, " ")
                        },
                        tr = function(e) {
                            tn(e);
                            var t, r = null == (t = e.querySelectorAll) ? void 0 : t.call(e, "template");
                            r && u2(r, function(e) {
                                ta(e.content) && tr(e.content)
                            })
                        },
                        tn = function(e) {
                            e.normalize();
                            for (var t = j ? j(e) : e.ownerDocument, r = M.call(t || e, e, f.SHOW_TEXT | f.SHOW_COMMENT | f.SHOW_CDATA_SECTION | f.SHOW_PROCESSING_INSTRUCTION, null), n = r.nextNode(); n;) n.data = tt(n.data), n = r.nextNode()
                        },
                        to = function(e) {
                            var t = E ? E(e) : null;
                            return "string" == typeof t && "form" === eF(t) && ("string" != typeof e.nodeName || "string" != typeof e.textContent || "function" != typeof e.removeChild || e.attributes !== P(e) || "function" != typeof e.removeAttribute || "function" != typeof e.removeAttributeNode || "function" != typeof e.getAttributeNode || "function" != typeof e.setAttribute || "string" != typeof e.namespaceURI || "function" != typeof e.insertBefore || "function" != typeof e.hasChildNodes || e.nodeType !== S(e) || e.childNodes !== g(e))
                        },
                        ta = function(e) {
                            if (!S || (void 0 === e ? "undefined" : uF(e)) !== "object" || null === e) return !1;
                            try {
                                return 11 === S(e)
                            } catch (e) {
                                return !1
                            }
                        },
                        ti = function(e) {
                            if (!S || (void 0 === e ? "undefined" : uF(e)) !== "object" || null === e) return !1;
                            try {
                                return "number" == typeof S(e)
                            } catch (e) {
                                return !1
                            }
                        };

                    function tl(e, t, r) {
                        0 !== e.length && u2(e, function(e) {
                            e.call(o, t, r, eH)
                        })
                    }
                    var tu = function(e, t) {
                            if (uU(e, RegExp)) return ch(e, t);
                            if (uU(e, Function)) {
                                for (var r = arguments.length, n = Array(r > 2 ? r - 2 : 0), o = 2; o < r; o++) n[o - 2] = arguments[o];
                                return !!e.apply(void 0, [t].concat(uM(n)))
                            }
                            return !1
                        },
                        tc = function(e, t, r) {
                            if (!Y[t] && ty(t) && tu(Z.tagNameCheck, t)) return !1;
                            if (em && !ew[t] && !ew[cr(t)]) {
                                var n = w(e),
                                    o = g(e);
                                if (o && n)
                                    for (var a = o.length, i = a - 1; i >= 0; --i) {
                                        var l = e === r ? y(o[i], !0) : o[i];
                                        n.insertBefore(l, v(e))
                                    }
                            }
                            return e$(e), !0
                        },
                        ts = function(e, t, r, n) {
                            return 0 === e.length ? t : t === r || t === n ? cg(t) : t
                        },
                        tf = function(e, t) {
                            return e !== t && null === w(e) && (eb && e0(e), !0)
                        },
                        tp = function(e, t) {
                            if (e8(e), tl(z.beforeSanitizeElements, e, null), tf(e, t)) return !0;
                            if (to(e)) return e$(e), !0;
                            var r = eF(x(e));
                            if (W = ts(z.uponSanitizeElement, W, q, el), tl(z.uponSanitizeElement, e, {
                                    tagName: r,
                                    allowedTags: W
                                }), tf(e, t)) return !0;
                            if (eo && e.hasChildNodes() && !ti(e.firstElementChild) && ch(cG, e.textContent) && ch(cG, e.innerHTML) || eo && cq[r] && 1 === A(e) && C(e) === eI && (ti(e.firstElementChild) || "string" == typeof e.textContent && ch(cG, e.textContent)) || 7 === e.nodeType || eo && 8 === e.nodeType && ch(cz, e.data)) return e$(e), !0;
                            if (Y[r] || !(uU(J.tagCheck, Function) && J.tagCheck(r)) && !W[r]) {
                                var n = tc(e, r, t);
                                return !!(!1 === n && (tl(z.afterSanitizeElements, e, null), tf(e, t))) || n
                            }
                            if (1 === A(e) && !eK(e) || ("noscript" === r || "noembed" === r || "noframes" === r) && ch(cV, e.innerHTML)) return e$(e), !0;
                            if (en && 3 === e.nodeType) {
                                var a = tt(e.textContent);
                                e.textContent !== a && (u5(o.removed, {
                                    element: e.cloneNode()
                                }), e.textContent = a)
                            }
                            return tl(z.afterSanitizeElements, e, null), tf(e, t)
                        },
                        td = function(e, t, r) {
                            if (X[t] || e4(t, e) || ed && ("id" === t || "name" === t) && (r in a || r in eG)) return !1;
                            var n = K[t] || uU(J.attributeCheck, Function) && J.attributeCheck(t, e);
                            return !!(ee && ch(c_, t) || Q && ch(cL, t)) || (n ? !(!(eE[t] || ch(V, ca(r, cM, ""))) && ("src" !== t && "xlink:href" !== t && "href" !== t || "script" === e || 0 !== ci(r, "data:") || !eP[e]) && (!et || ch(cB, ca(r, cM, "")))) || !r : ty(e) && tu(Z.tagNameCheck, e) && tu(Z.attributeNameCheck, t, e) || "is" === t && Z.allowCustomizedBuiltInElements && tu(Z.tagNameCheck, r))
                        },
                        th = cv({}, ["annotation-xml", "color-profile", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "missing-glyph"]),
                        ty = function(e) {
                            return !th[cr(e)] && ch(cH, e)
                        },
                        tm = function(e, r, n, o) {
                            if (t && (void 0 === d ? "undefined" : uF(d)) === "object" && "function" == typeof d.getAttributeType && !n) switch (d.getAttributeType(e, r)) {
                                case "TrustedHTML":
                                    return _(o);
                                case "TrustedScriptURL":
                                    return L(o)
                            }
                            return o
                        },
                        tb = function(e, t, r, n) {
                            try {
                                if (r ? e.setAttributeNS(r, t, n) : e.setAttribute(t, n), to(e)) return e$(e), !1;
                                return !0
                            } catch (r) {
                                return eX(t, e), !1
                            }
                        },
                        tv = function(e, t) {
                            return !!(eo && ch(/((--!?|])>)|<\/(style|script|title|xmp|textarea|noscript|iframe|noembed|noframes)/i, t)) || "attributename" === cr(e) && null !== co(t, "href")
                        },
                        tg = function(e, t) {
                            if (tl(z.beforeSanitizeAttributes, e, null), !tf(e, t)) {
                                var r = e.attributes;
                                if (!(!r || to(e))) {
                                    for (var n = {
                                            attrName: "",
                                            attrValue: "",
                                            keepAttr: !0,
                                            allowedAttributes: K = ts(z.uponSanitizeAttribute, K, $, eu),
                                            forceKeepAttr: void 0
                                        }, a = r.length, i = eF(e.nodeName); a--;) {
                                        var l = r[a],
                                            u = l.name,
                                            c = l.namespaceURI,
                                            s = l.value,
                                            f = eF(u),
                                            p = "value" === u ? s : cl(s),
                                            d = !1;
                                        if (n.attrName = f, n.attrValue = p, n.keepAttr = !0, n.forceKeepAttr = void 0, tl(z.uponSanitizeAttribute, e, n), p = n.attrValue, eh && ("id" === f || "name" === f) && 0 !== ci(p, ey) && (eX(u, e, l), p = ey + p, d = !0), tv(u, p)) {
                                            eX(u, e, l);
                                            continue
                                        }
                                        if (!n.forceKeepAttr) {
                                            if (!n.keepAttr || !er && ch(cW, p) || (en && (p = tt(p)), !td(i, f, p))) {
                                                eX(u, e, l);
                                                continue
                                            }(p = tm(i, f, c, p)) !== s && tb(e, u, c, p) && d && u6(o.removed)
                                        }
                                    }
                                    tl(z.afterSanitizeAttributes, e, null), tf(e, t)
                                }
                            }
                        },
                        tw = function(e) {
                            var t = null,
                                r = te(e);
                            for (tl(z.beforeSanitizeShadowDOM, e, null); t = r.nextNode();)
                                if (tl(z.uponSanitizeShadowNode, t, null), tp(t, e), tg(t, e), ta(t.content) && tw(t.content), 1 === A(t)) {
                                    var n = O(t);
                                    ta(n) && (tO(n), tw(n))
                                } en && tn(e), tl(z.afterSanitizeShadowDOM, e, null)
                        },
                        tO = function(e) {
                            for (var t = [{
                                    node: e,
                                    shadow: null
                                }]; t.length > 0;) {
                                var r = t.pop();
                                if (r.shadow) {
                                    tw(r.shadow);
                                    continue
                                }
                                var n = r.node,
                                    o = 1 === A(n),
                                    a = g(n);
                                if (a)
                                    for (var i = a.length - 1; i >= 0; --i) t.push({
                                        node: a[i],
                                        shadow: null
                                    });
                                if (o) {
                                    var l = E ? E(n) : null;
                                    if ("string" == typeof l && "template" === eF(l)) {
                                        var u = n.content;
                                        ta(u) && t.push({
                                            node: u,
                                            shadow: null
                                        })
                                    }
                                }
                                if (o) {
                                    var c = O(n);
                                    ta(c) && t.push({
                                        node: null,
                                        shadow: c
                                    }, {
                                        node: c,
                                        shadow: null
                                    })
                                }
                            }
                        };
                    return o.sanitize = function(e) {
                        var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            n = null,
                            a = null,
                            l = null,
                            u = null;
                        if ((eT = !e) && (e = "\x3c!--\x3e"), "string" != typeof e && !ti(e) && "string" != typeof(e = function(e) {
                                switch (void 0 === e ? "undefined" : uF(e)) {
                                    case "string":
                                        return e;
                                    case "number":
                                        return cu(e);
                                    case "boolean":
                                        return cc(e);
                                    case "bigint":
                                        return cs ? cs(e) : "0";
                                    case "symbol":
                                        return cf ? cf(e) : "Symbol()";
                                    case "undefined":
                                    default:
                                        return cd(e);
                                    case "function":
                                    case "object":
                                        if (null === e) return cd(e);
                                        var t = cw(e, "toString");
                                        if ("function" == typeof t) {
                                            var r = t(e);
                                            return "string" == typeof r ? r : cd(r)
                                        }
                                        return cd(e)
                                }
                            }(e))) throw cy("dirty is not a string, aborting");
                        if (!o.isSupported) return e;
                        ei ? (W = el, K = eu) : eV(r), (z.uponSanitizeElement.length > 0 || z.uponSanitizeAttribute.length > 0) && (W = cg(W)), z.uponSanitizeAttribute.length > 0 && (K = cg(K)), o.removed = [];
                        var c = eb && "string" != typeof e && ti(e),
                            s = [],
                            f = ev;
                        if (c) {
                            e7(e);
                            var p = x(e);
                            if ("string" == typeof p) {
                                var d = eF(p);
                                if (!W[d] || Y[d]) throw eY(e), cy("root node is forbidden and cannot be sanitized in-place")
                            }
                            if (to(e)) throw eY(e), cy("root node is clobbered and cannot be sanitized in-place");
                            s = e1(e), ev = u9()
                        } else if (ti(e)) 1 === (a = (n = e9("\x3c!----\x3e")).ownerDocument.importNode(e, !0)).nodeType && "BODY" === a.nodeName || "HTML" === a.nodeName ? n = a : n.appendChild(a), tO(n);
                        else {
                            if (!es && !en && !ea && -1 === e.indexOf("<")) return t && ep ? _(e) : e;
                            if (!(n = e9(e))) return es ? null : ep ? k : ""
                        }
                        n && ec && e$(n.firstChild);
                        var h = c ? e : n;
                        try {
                            c && tO(e);
                            for (var y = te(h); l = y.nextNode();) tp(l, h), tg(l, h), ta(l.content) && tw(l.content);
                            c && e6(e, s)
                        } catch (t) {
                            throw c && (eY(e), e3(e, s)), t
                        } finally {
                            ev = f
                        }
                        if (c) {
                            if (e3(e, s)) throw cy("a node selected for removal could not be safely returned; refusing to sanitize in place");
                            return en && tr(e), e
                        }
                        if (es) {
                            if (en && tr(n), ef)
                                for (u = F.call(n.ownerDocument); n.firstChild;) u.appendChild(n.firstChild);
                            else u = n;
                            return (K.shadowroot || K.shadowrootmode) && (u = G.call(i, u, !0)), u
                        }
                        var m = ea ? n.outerHTML : n.innerHTML;
                        return ea && W["!doctype"] && n.ownerDocument && n.ownerDocument.doctype && n.ownerDocument.doctype.name && ch(cF, n.ownerDocument.doctype.name) && (m = "<!DOCTYPE " + n.ownerDocument.doctype.name + ">\n" + m), en && (m = tt(m)), t && ep ? _(m) : m
                    }, o.setConfig = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        eV(e), ei = !0, el = W, eu = K
                    }, o.clearConfig = function() {
                        eH = null, ei = !1, el = null, eu = null, t = r, k = ""
                    }, o.isValidAttribute = function(e, t, r) {
                        eH || eV({});
                        var n = eF(e),
                            o = eF(t);
                        return !("string" == typeof r && (tv(t, r) || !er && ch(cW, r))) && td(n, o, r)
                    }, o.addHook = function(e, t) {
                        "function" != typeof t || cp(z, e) && u5(z[e], t)
                    }, o.removeHook = function(e, t) {
                        if (cp(z, e)) {
                            if (void 0 !== t) {
                                var r = u3(z[e], t);
                                return -1 === r ? void 0 : u4(z[e], r, 1)[0]
                            }
                            return u6(z[e])
                        }
                    }, o.removeHooks = function(e) {
                        cp(z, e) && (z[e] = [])
                    }, o.removeAllHooks = function() {
                        z = c$()
                    }, o
                }(),
                cJ = cX.sanitize.bind(cX),
                cQ = cX.isSupported;
            cX.addHook.bind(cX), cX.removeHook.bind(cX), cX.removeHooks.bind(cX), cX.removeAllHooks.bind(cX), cX.setConfig.bind(cX), cX.clearConfig.bind(cX), cX.isValidAttribute.bind(cX), cX.version, cX.removed;
            var c0 = {
                    ADD_ATTR: ["target"]
                },
                c1 = (x = function(e) {
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
                }({}, c0), I = I = {
                    RETURN_DOM_FRAGMENT: !0
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(x, Object.getOwnPropertyDescriptors(I)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(I)).forEach(function(e) {
                    Object.defineProperty(x, e, Object.getOwnPropertyDescriptor(I, e))
                }), x),
                c2 = function(e) {
                    e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer")
                },
                c3 = function(e, t) {
                    if (!t || !cQ) return cJ(e, c0);
                    var r = cJ(e, c1);
                    if ("string" == typeof r) return r;
                    r.querySelectorAll("a").forEach(c2);
                    var n = r.ownerDocument.createElement("div");
                    return n.appendChild(r), n.innerHTML
                },
                c6 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = t.shouldOpenLinksInNewTab;
                    return (0, $.useMemo)(function() {
                        return c3(e, null != r && r)
                    }, [e, r])
                },
                c5 = function(e) {
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
                        d = c6(r, {
                            shouldOpenLinksInNewTab: !0
                        }),
                        h = n && i ? (0, no.jsx)(nV, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: i,
                            className: "grow basis-0",
                            children: n
                        }) : null,
                        y = o && l ? (0, no.jsx)(nV, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: l,
                            className: "grow basis-0",
                            children: o
                        }) : null;
                    return (0, no.jsx)(uT, {
                        open: u,
                        onOpenChange: function(e) {
                            e || c()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: void 0 === s || s,
                        closeLabel: a,
                        children: (0, no.jsxs)(uk, {
                            children: [(0, no.jsxs)(uN, {
                                className: "flex flex-col gap-large",
                                children: [(0, no.jsx)(uD, {
                                    children: t
                                }), (0, no.jsx)("span", {
                                    className: "[&_a]:[font-weight:700] [&_a]:underline",
                                    dangerouslySetInnerHTML: {
                                        __html: d
                                    }
                                })]
                            }), (0, no.jsx)(uR, {
                                className: p ? "flex flex-col gap-small" : "flex gap-x-medium",
                                children: p ? (0, no.jsxs)($.Fragment, {
                                    children: [h, y]
                                }) : (0, no.jsxs)($.Fragment, {
                                    children: [y, h]
                                })
                            })]
                        })
                    })
                },
                c8 = function(e) {
                    var t = e.isModalOpen,
                        r = e.navigateToAccountSettings,
                        n = e.closeModal,
                        o = e.translate;
                    return (0, no.jsx)(c5, {
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
                c4 = function(e) {
                    var t = e.isModalOpen,
                        r = e.closeModal,
                        n = e.translate;
                    return (0, no.jsx)(c5, {
                        titleText: n("RestrictedUnplayableModal.Label.Title"),
                        bodyText: n("RestrictedUnplayableModal.Label.Body"),
                        secondaryButtonText: n("RestrictedUnplayableModal.Action.Ok"),
                        closeLabelText: n("Action.Close"),
                        onSecondaryButtonClick: r,
                        isModalOpen: t,
                        onCloseModal: r
                    })
                },
                c7 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = !!e && !t,
                        n = (0, Y.useQuery)({
                            queryKey: ["ageRecommendation", e],
                            queryFn: function() {
                                return eh(e)
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

            function c9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function se(e, t) {
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
                        if ("string" == typeof e) return c9(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c9(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var st = function(e) {
                var t, r, n = se((0, $.useState)(void 0), 2),
                    o = n[0],
                    a = n[1],
                    i = se((0, $.useState)(!1), 2),
                    l = i[0],
                    u = i[1],
                    c = se((0, $.useState)(!1), 2),
                    s = c[0],
                    f = c[1];
                (0, $.useEffect)(function() {
                    f(!1), u(!0), ed().then(function(e) {
                        a(e.contentAgeRestriction)
                    }).catch(function() {
                        f(!0)
                    }).finally(function() {
                        u(!1)
                    })
                }, []);
                var p = c7(e),
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

            function sr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sn(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function so(e, t) {
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
                        if ("string" == typeof e) return sr(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sr(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sa = function(e, t, r, n, o, a, i, l) {
                    var u = (0, Y.useQuery)({
                            queryKey: ["guacPlayButtonUI"],
                            queryFn: function() {
                                return ep()
                            },
                            staleTime: 6e4
                        }).data,
                        c = so((0, $.useState)(!1), 2),
                        s = c[0],
                        f = c[1],
                        p = so((0, $.useState)(!1), 2),
                        d = p[0],
                        h = p[1],
                        y = (0, $.useCallback)(function() {
                            r5(e, n, o, a, i, void 0, l)
                        }, [i, a, e, o, n, l]),
                        m = (0, $.useCallback)(function(e, n, o) {
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
                                                    nt(t, e, em.ContextualPlayabilityAgeRecommendationParentalControls, r)
                                                }, o || void 0 === e || void 0 === n) return y(), en(eA.PlayButtonUpsellUnknownSettingOrAge), a(ex.gameLaunchFallbackUpsellName), [2];
                                            if ("minimal" === n) return y(), en(eA.PlayButtonUpsellMinimalMaturityRating), a(ex.gameLaunchFallbackUpsellName), [2];
                                            if (!(i = ({
                                                    mild: "NinePlus",
                                                    moderate: "ThirteenPlus",
                                                    restricted: "SeventeenPlus",
                                                    unrated: "ThirteenPlus"
                                                })[n])) return y(), en(eA.PlayButtonUpsellAgeNotInMapping), a(ex.gameLaunchFallbackUpsellName), [2];
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
                                            return f(!0), en(eA.PlayButtonUpsellSelfUpdateSettingTriggered), a(c), [3, 12];
                                        case 2:
                                            if (en(eA.PlayButtonUpsellAskYourParentTriggered), a(c), !(s = r$())) return en(eA.PlayButtonUpsellParentalConsentError), [3, 12];
                                            d.label = 3;
                                        case 3:
                                            return d.trys.push([3, 5, , 6]), p = (null == u ? void 0 : u.useExperienceApprovalForParentalConsent) ? {
                                                featureName: "CanApproveExperience",
                                                namespace: eT.accountManagement,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    universeId: t,
                                                    experienceManagementAction: "Approve"
                                                }
                                            } : {
                                                featureName: "CanChangeSetting",
                                                namespace: eT.settingChange,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    contentAgeRestriction: l.option.optionValue
                                                }
                                            }, [4, s(p)];
                                        case 4:
                                            return d.sent(), [3, 6];
                                        case 5:
                                            return d.sent(), y(), en(eA.PlayButtonUpsellParentalConsentError), a(ex.gameLaunchFallbackUpsellName), [3, 6];
                                        case 6:
                                        case 10:
                                            return [3, 12];
                                        case 7:
                                            return d.trys.push([7, 9, , 10]), en(eA.PlayButtonUpsellAgeRestrictionVerificationTriggered), a(c), [4, r7({
                                                context: eC,
                                                pageContext: r
                                            })];
                                        case 8:
                                            return d.sent() && window.location.reload(), [3, 10];
                                        case 9:
                                            return d.sent(), y(), a(ex.gameLaunchFallbackUpsellName), [3, 10];
                                        case 11:
                                            y(), en(eA.PlayButtonUpsellUnknownRequirement), a(ex.gameLaunchFallbackUpsellName), d.label = 12;
                                        case 12:
                                            return [3, 14];
                                        case 13:
                                            h(!0), en(eA.PlayButtonUpsellRestrictedUnplayableTriggered), a(ex.restrictedUnplayableUpsellName), d.label = 14;
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
                                        sn(o, r, n, i, l, "next", e)
                                    }

                                    function l(e) {
                                        sn(o, r, n, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [u, y, t, r]),
                        b = (0, $.useCallback)(function() {
                            f(!1)
                        }, []),
                        v = (0, $.useCallback)(function() {
                            h(!1)
                        }, []);
                    return {
                        launchPlayButtonUpsell: m,
                        isSelfUpdateSettingModalOpen: s,
                        navigateToAccountSettings: (0, $.useCallback)(function() {
                            var e = (0, eR.getAbsoluteUrl)("/my/account#!/privacy");
                            "u" > typeof window && (window.location.href = e, f(!1))
                        }, []),
                        closeSelfUpdateSettingModal: b,
                        isRestrictedUnplayableModalOpen: d,
                        closeRestrictedUnplayableModal: v
                    }
                },
                si = function(e) {
                    var t = e.universeId,
                        r = e.buttonClassName,
                        n = e.placeId,
                        o = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        i = e.gameInstanceId,
                        l = e.eventProperties,
                        u = e.appsFlyerReferralProperties,
                        c = e.pageContext,
                        s = ia(),
                        f = st(t),
                        p = f.contentAgeRestriction,
                        d = f.contentMaturityRating,
                        h = f.isFetching,
                        y = f.hasError,
                        m = sa(n, t, c, o, a, i, l, u),
                        b = m.launchPlayButtonUpsell,
                        v = m.isSelfUpdateSettingModalOpen,
                        g = m.navigateToAccountSettings,
                        w = m.closeSelfUpdateSettingModal,
                        O = m.isRestrictedUnplayableModalOpen,
                        P = m.closeRestrictedUnplayableModal,
                        S = (0, $.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), b(p, d, y)
                        }, [b, p, d, y]);
                    return !y && h ? (0, no.jsx)(iu, {
                        buttonClassName: null != r ? r : "btn-common-play-game-action-needed-lg"
                    }) : (0, no.jsxs)(Z().Fragment, {
                        children: [(0, no.jsx)(ii, {
                            onButtonClick: S,
                            buttonClassName: r
                        }), v && (0, no.jsx)(c8, {
                            isModalOpen: v,
                            navigateToAccountSettings: g,
                            closeModal: w,
                            translate: s
                        }), O && (0, no.jsx)(c4, {
                            isModalOpen: O,
                            closeModal: P,
                            translate: s
                        })]
                    })
                };

            function sl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function su(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function sc(e, t) {
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
                        if ("string" == typeof e) return sl(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sl(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            si.defaultProps = {
                buttonClassName: void 0,
                rootPlaceId: void 0,
                privateServerLinkCode: void 0,
                gameInstanceId: void 0,
                eventProperties: {},
                appsFlyerReferralProperties: {}
            };
            var ss = function(e, t) {
                    var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                        n = (0, Y.useQuery)({
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
                                                return [4, Promise.all([(o = [e], ec(function() {
                                                    var e;
                                                    return es(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, ef.getProductInfo(o)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data.data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })()), (a = [t], ec(function() {
                                                    var e;
                                                    return es(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, ef.getPlaceDetails(a)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())])];
                                            case 1:
                                                return [2, {
                                                    productInfo: (r = sc.apply(void 0, [n.sent(), 2]))[0],
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
                                            su(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            su(a, n, o, i, l, "throw", e)
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
                sf = function(e) {
                    var t = e.buttonWidth,
                        r = e.buttonClassName,
                        n = e.iconClassName,
                        o = e.hideButtonText,
                        a = e.hideButtonIcon,
                        i = e.buttonContent,
                        l = e.onClick,
                        u = e.isPurchasing,
                        c = e.redirectUrl;
                    return c ? (0, no.jsx)("a", {
                        href: c,
                        className: "purchase-button-link",
                        children: (0, no.jsxs)(nV, {
                            "data-testid": "play-purchase-button",
                            variant: "Emphasis",
                            style: nY,
                            className: ni()(nZ(t), r),
                            onClick: function() {
                                return null
                            },
                            isDisabled: u,
                            children: [!a && (0, no.jsx)("span", {
                                className: n
                            }), !o && (0, no.jsx)("span", {
                                className: "btn-text",
                                children: i
                            })]
                        })
                    }) : (0, no.jsxs)(nV, {
                        "data-testid": "play-purchase-button",
                        variant: "Emphasis",
                        style: nY,
                        className: ni()(nZ(t), r),
                        onClick: function(e) {
                            l && !u && l(e)
                        },
                        isDisabled: u,
                        children: [!a && (0, no.jsx)("span", {
                            className: n
                        }), !o && (0, no.jsx)("span", {
                            className: "btn-text",
                            children: i
                        })]
                    })
                };

            function sp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sd(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            sf.defaultProps = {
                hideButtonText: !1,
                buttonWidth: n$,
                buttonClassName: "btn-economy-robux-white-lg",
                iconClassName: "icon-robux-white",
                hideButtonIcon: !1,
                isPurchasing: !1,
                onClick: void 0,
                redirectUrl: void 0
            };
            var sh = function(e) {
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
                        }(t = (0, $.useState)(!1)) || function(e) {
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
                        m = y[0],
                        b = y[1],
                        v = (0, $.useCallback)(function(e) {
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
                                            return l.trys.push([1, 3, 4, 5]), nt(o, ex.fiatPurchaseUpsellName, em.FiatPurchaseRequired, h), [4, ey(a, r)];
                                        case 2:
                                            return (n = l.sent()) && (0, eU.isValidStripeCheckoutUrl)(n) && (window.location.href = n), [3, 5];
                                        case 3:
                                            return l.sent(), en(eA.PreparePurchaseUrlError), console.error("Error preparing purchase url"), [3, 5];
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
                                        sd(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        sd(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [a, i, o, h]);
                    return (0, no.jsx)(sf, {
                        buttonWidth: c,
                        buttonClassName: s,
                        iconClassName: u,
                        hideButtonText: f,
                        hideButtonIcon: !0,
                        buttonContent: void 0 !== d && d ? l(eP) : null != (r = null == (n = i.fiatPurchaseData) ? void 0 : n.localizedFiatPrice) ? r : "",
                        onClick: p ? void 0 : v,
                        redirectUrl: p,
                        isPurchasing: m
                    })
                },
                sy = window.RobloxItemPurchase;

            function sm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sb(e) {
                if (Array.isArray(e)) return e
            }

            function sv() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function sg(e) {
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

            function sw(e, t) {
                if (e) {
                    if ("string" == typeof e) return sm(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sm(e, t)
                }
            }
            var sO = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
                sP = (0, $.forwardRef)(function(e, t) {
                    var r, n, o, a = sb(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || sw(r) || sv(),
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
                        m = (sb(l) || function(e) {
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
                        }(l) || sw(l, 1) || sv())[0],
                        b = "Text" === f,
                        v = "Circle" === f,
                        g = {};
                    return b ? (g.height = null != h ? h : "1em", g.width = null != d ? d : "100%") : (void 0 !== d && (g.width = d), void 0 !== h && (g.height = h)), Z().createElement("div", (n = sg({
                        ref: m,
                        "aria-hidden": "true",
                        "data-variant": f
                    }, y), o = o = {
                        className: nl("relative clip block bg-[var(--color-common-shimmer)]", b && "radius-xsmall", v && "radius-circle", !b && !v && "radius-small", (void 0 === p || p) && sO, u),
                        style: sg({}, g, c)
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
            sP.displayName = "Skeleton";
            var sS = Error("thumbnail pending"),
                sE = function(e, t) {
                    return t === sS && e < 5
                },
                sj = function() {
                    var e, t;
                    return {
                        promise: new Promise(function(r, n) {
                            e = r, t = n
                        }),
                        resolve: e,
                        reject: t
                    }
                };

            function sA(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var sx = "150x150",
                sI = "webp",
                sC = function(e) {
                    var t, r, n, o;
                    return "".concat(e.type, ":").concat(e.targetId, ":").concat(null != (t = e.size) ? t : sx, ":").concat(null != (r = e.format) ? r : sI, ":").concat(null != (n = e.version) ? n : "", ":").concat(null != (o = e.headShape) ? o : "", ":").concat(e.includeBackground ? "bg" : "", ":").concat(e.includeProfileFrame ? "frame" : "")
                },
                sT = tJ({
                    data: (T = tJ({
                        requestId: tZ(),
                        state: new tQ(tV({
                            type: "literal",
                            values: Array.isArray(C = ["Completed", "Pending", "Blocked", "Error", "InReview"]) ? C : [C]
                        }, tl(void 0))),
                        imageUrl: new t0({
                            type: "optional",
                            innerType: new t1({
                                type: "nullable",
                                innerType: tZ()
                            })
                        })
                    }), new tY(tV({
                        type: "array",
                        element: T
                    }, tl(void 0))))
                }),
                sk = function(e) {
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
                sN = (k = {
                    delay: 50,
                    maxSize: 100
                }, N = function(e) {
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
                                    return t = ee.Url.parse(J().thumbnailsApi).getOrThrow().withPath("/v1/batch"), r = e.map(function(e) {
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
                                            requestId: sC(e),
                                            type: e.type,
                                            targetId: e.targetId,
                                            size: null != (t = e.size) ? t : sx,
                                            format: null != (r = e.format) ? r : sI
                                        }, null != e.version ? {
                                            version: e.version
                                        } : {}, e.headShape ? {
                                            headShape: e.headShape
                                        } : {}, e.includeBackground ? {
                                            includeBackground: !0
                                        } : {}, e.includeProfileFrame && "AvatarHeadShot" === e.type ? {
                                            includeProfileFrame: !0
                                        } : {})
                                    }), [4, Q.post(t, r, sT, {
                                        credentials: "include",
                                        headers: {
                                            Accept: "application/json"
                                        },
                                        retry: Q.defaultBrowserRetryDelay
                                    })];
                                case 1:
                                    return [2, sk(n.sent().getOrThrow())]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = t.apply(e, r);

                            function i(e) {
                                sA(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                sA(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                }, D = function(e, t) {
                    var r;
                    return null != (r = e.get(sC(t))) ? r : {
                        state: "Error"
                    }
                }, i = k, l = N, c = i.delay, s = i.maxSize, f = [], p = sj(), d = function() {
                    var e = p.resolve,
                        t = p.reject,
                        r = f;
                    f = [], p = sj(), l(r).then(e).catch(t)
                }, R = function(e) {
                    0 === f.length && (u = setTimeout(d, c)), f.push(e);
                    var t = p.promise;
                    return null != s && f.length >= s && (clearTimeout(u), d()), t
                }, function(e) {
                    return R(e).then(function(t) {
                        return D(t, e)
                    })
                }),
                sD = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                        r = Number.parseInt(e, t);
                    return Number.isNaN(r) ? null : r
                };

            function sR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var s_ = function() {
                    if ("u" < typeof document) return {
                        batchSize: 100,
                        waitMs: 1e3
                    };
                    var e, t, r, n, o, a, i = document.getElementsByName("performance")[0],
                        l = sD(null != (t = null == i ? void 0 : i.getAttribute("data-ui-performance-metrics-batch-size")) ? t : ""),
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
                                if ("string" == typeof e) return sR(e, 3);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sR(e, 3)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = u[0],
                        s = u[1],
                        f = u[2],
                        p = ((null != (n = sD(null != c ? c : "")) ? n : 0) * 3600 + (null != (o = sD(null != s ? s : "")) ? o : 0) * 60 + (null != (a = sD(null != f ? f : "")) ? a : 0)) * 1e3;
                    return {
                        batchSize: null != l ? l : 100,
                        waitMs: 0 === p ? 1e3 : p
                    }
                },
                sL = [],
                sU = !1,
                sB = function() {
                    if (sU = !1, 0 !== sL.length) {
                        var e = sL;
                        sL = [], Q.postUntyped(ee.Url.parse("".concat(J().beaconApi, "/v1/measurements")).getOrThrow(), e, {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e3)
                        })
                    }
                },
                sM = function(e, t) {
                    var r = rp(t);
                    sL.push({
                        metricName: e,
                        jsonData: r.isOk() ? r.value : "{}"
                    });
                    var n = s_(),
                        o = n.batchSize,
                        a = n.waitMs;
                    sL.length >= o ? sB() : sU || (sU = !0, setTimeout(sB, a))
                };

            function sF(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var sH = function(e) {
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
                    d = (0, $.useRef)(Date.now()),
                    h = (0, $.useRef)(0),
                    y = (0, $.useRef)(!1),
                    m = (0, Y.useQuery)({
                        queryKey: ["thumbnail-2d", r, t, n, o, a, i, l, u],
                        staleTime: 1 / 0,
                        retry: sE,
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
                                            return [4, sN({
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
                                            if ("Pending" === (e = c.sent()).state) throw h.current += 1, sS;
                                            return [2, e]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, o) {
                                    var a = e.apply(t, r);

                                    function i(e) {
                                        sF(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        sF(a, n, o, i, l, "throw", e)
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
                (0, $.useEffect)(function() {
                    d.current = Date.now(), h.current = 0, y.current = !1
                }, [r, t, n, o, a, i, l, u]), (0, $.useEffect)(function() {
                    if (!y.current) {
                        var e = "".concat(r, "_2d");
                        if (b) {
                            if (y.current = !0, sM("ThumbnailStatusCountWebapp", {
                                    Status: b.state,
                                    ThumbnailType: e
                                }), "Completed" === b.state) {
                                var t = h.current;
                                sM("ThumbnailLoadDurationWebapp", {
                                    Status: "Success",
                                    ThumbnailType: e,
                                    Value: String(Date.now() - d.current)
                                }), sM(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                                    ThumbnailType: e
                                } : {
                                    ThumbnailType: e,
                                    Value: String(t)
                                })
                            }
                        } else v && g === sS && (y.current = !0, sM("ThumbnailTimeoutWebapp", {
                            ThumbnailType: e
                        }))
                    }
                }, [b, v, g, r]);
                var P = (null == b ? void 0 : b.state) === "Completed" ? b.imageUrl : null,
                    S = ["thumbnail-2d-container float-left overflow-hidden", void 0 === f ? "" : f, (null == b ? void 0 : b.state) === "Blocked" ? "icon-blocked" : (null == b ? void 0 : b.state) === "InReview" ? "icon-in-review" : (null == b ? void 0 : b.state) === "Error" ? "icon-broken" : v ? g === sS ? "icon-pending" : "icon-broken" : ""].filter(Boolean).join(" ");
                return (0, no.jsxs)("span", {
                    className: S,
                    children: [(null != w ? w : O) && (0, no.jsx)(sP, {
                        variant: "Rectangle",
                        width: "100%",
                        height: "100%"
                    }), null != P && (0, no.jsx)("img", {
                        className: ["size-full", void 0 === s ? "" : s].filter(Boolean).join(" "),
                        src: P,
                        alt: void 0 === c ? "" : c,
                        onLoad: p
                    })]
                })
            };

            function sG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sz = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.price.toString()) ? t : ""
                },
                sV = function(e) {
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
                        p = (0, $.useRef)(void 0);
                    null != p.current || (p.current = (0, sy.createItemPurchase)());
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
                                if ("string" == typeof e) return sG(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sG(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        h = d[0],
                        y = d[1],
                        m = (0, $.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), y.start()
                        }, [y]);
                    return (0, no.jsxs)(Z().Fragment, {
                        children: [(0, no.jsx)(sf, {
                            buttonWidth: o,
                            buttonClassName: a,
                            iconClassName: n,
                            hideButtonText: i,
                            buttonContent: sz(c),
                            onClick: l ? void 0 : m,
                            redirectUrl: l
                        }), (0, no.jsx)(h, {
                            translate: s,
                            productId: c.productId,
                            expectedPrice: c.price,
                            thumbnail: (0, no.jsx)(sH, {
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
                sW = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.iconClassName,
                        o = void 0 === n ? "icon-robux-white" : n,
                        a = e.buttonWidth,
                        i = void 0 === a ? n$ : a,
                        l = e.buttonClassName,
                        u = void 0 === l ? "btn-economy-robux-white-lg" : l,
                        c = e.refetchPlayabilityStatus,
                        s = e.hideButtonText,
                        f = void 0 !== s && s,
                        p = e.redirectPurchaseUrl,
                        d = e.playabilityStatus,
                        h = e.showDefaultPurchaseText,
                        y = e.pageContext,
                        m = ia(),
                        b = ss(t, r),
                        v = b.productInfo,
                        g = b.productDetails;
                    return b.isLoading ? (0, no.jsx)(iu, {
                        buttonClassName: u,
                        buttonWidth: i
                    }) : "Fiat" == (d === em.FiatPurchaseRequired && (null == g ? void 0 : g.fiatPurchaseData) ? "Fiat" : "Robux") ? (0, no.jsx)(sh, {
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
                    }) : (0, no.jsx)(sV, {
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
                sq = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.rootPlaceId,
                        o = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        i = e.eventProperties,
                        l = e.appsFlyerReferralProperties,
                        u = ia(),
                        c = (0, $.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), r9(r, t);
                            var u = nr((null == i ? void 0 : i.launchData) != null ? String(i.launchData) : void 0);
                            r5(r, n, o, a, i, u, l, "DemoPlayButtonClick")
                        }, [t, r, n, o, a, i, l]),
                        s = u(eS) || "Play Demo";
                    return (0, no.jsx)("button", {
                        type: "button",
                        "data-testid": "demo-play-button",
                        className: "btn-control-lg btn-full-width demo-play-button",
                        onClick: c,
                        children: s
                    })
                },
                sK = function(e) {
                    var t = e.placeId,
                        r = e.universeId,
                        n = e.eventProperties,
                        o = "".concat(J().playWebsite, "/games/start?placeId=").concat(t),
                        a = it("Feature.ExperienceDetails"),
                        i = (0, $.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation();
                            var a = nr((null == n ? void 0 : n.launchData) != null ? String(n.launchData) : void 0),
                                i = nn(t, r, n, a),
                                l = i.joinAttemptId,
                                u = i.joinAttemptOrigin,
                                c = new URL(o);
                            a.launchData && c.searchParams.set("launchData", a.launchData), a.eventId && c.searchParams.set("eventId", a.eventId), l && c.searchParams.set("joinAttemptId", l), null != u && c.searchParams.set("joinAttemptOrigin", String(u)), window.open(c.toString(), "_blank", "noopener")
                        }, [t, r, n, o]);
                    return (0, no.jsx)(nV, {
                        "data-testid": "play-on-web-button",
                        variant: "Standard",
                        size: "Large",
                        style: nY,
                        className: "btn-full-width btn-control-lg play-on-web-button",
                        onClick: i,
                        children: a.dynamic(eE, void 0, "Play on Web")
                    })
                },
                s$ = function(e, t) {
                    if (void 0 === t) return null;
                    var r, n = e.find(function(e) {
                        var r = e.isEnabled,
                            n = e.primaryStatuses;
                        return r && n.has(t)
                    });
                    return null != (r = null == n ? void 0 : n.render()) ? r : null
                },
                sZ = function(e) {
                    var t = e.primaryButton,
                        r = e.secondaryButton,
                        n = e.isPrimaryButtonLoading;
                    return r ? (0, no.jsxs)("div", {
                        className: "stacked-play-buttons-container",
                        children: [(0, no.jsx)("div", {
                            className: "stacked-play-button-primary",
                            "data-testid": "stacked-play-button-primary",
                            children: t
                        }), !(void 0 !== n && n) && r]
                    }) : t
                },
                sY = function(e) {
                    var t = e.iconClassName,
                        r = e.buttonWidth,
                        n = e.buttonClassName,
                        o = e.hideButtonText,
                        a = ia();
                    return (0, no.jsxs)(nV, {
                        "data-testid": "play-unplayable-button",
                        variant: "Emphasis",
                        style: nY,
                        className: ni()(nZ(void 0 === r ? n$ : r), void 0 === n ? "btn-common-play-game-unplayable-lg" : n),
                        isDisabled: !0,
                        onClick: function() {
                            return null
                        },
                        children: [(0, no.jsx)("span", {
                            className: void 0 === t ? "icon-status-unavailable-secondary" : t
                        }), !(void 0 !== o && o) && (0, no.jsx)("span", {
                            className: "btn-text",
                            children: a(eO)
                        })]
                    })
                },
                sX = function(e) {
                    var t = e.treatmentData,
                        r = e.isModalOpen,
                        n = e.onConfirm,
                        o = e.onDismiss,
                        a = ia();
                    return (0, no.jsx)(c5, {
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

            function sJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sQ = function(e) {
                    return !!e && "string" == typeof e.titleText && e.titleText.length > 0 && "string" == typeof e.bodyText && e.bodyText.length > 0 && "string" == typeof e.primaryActionText && e.primaryActionText.length > 0 && "string" == typeof e.secondaryActionText && e.secondaryActionText.length > 0
                },
                s0 = function(e, t, r) {
                    var n, o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = (0, $.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return sJ(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sJ(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        a = o[0],
                        i = o[1],
                        l = eD(e),
                        u = l.playabilityStatus,
                        c = l.playableUxTreatment,
                        s = l.isFetchingPlayability,
                        f = (0, $.useCallback)(function(t) {
                            nt(e, t, em.Playable, r)
                        }, [e, r]);
                    return {
                        doGameLaunchWithPlayableUxTreatment: (0, $.useCallback)(function() {
                            if (s) {
                                t(), en(eA.PlayableUxTreatmentPlayabilityStatusStillLoading), f(ex.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (u !== em.Playable || !(null == c ? void 0 : c.treatment)) return void t();
                            if ("reconfirmLaunchModal" !== c.treatment) {
                                t(), en(eA.PlayableUxTreatmentUnknownTreatment), f(ex.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (!sQ(c.data)) {
                                t(), en(eA.PlayableUxTreatmentMalformedData), f(ex.gameLaunchFallbackUpsellName);
                                return
                            }
                            i(!0), f(ex.reconfirmLaunchModalUpsellName)
                        }, [s, u, c, t, f]),
                        playableUxTreatmentModal: (0, $.useMemo)(function() {
                            return a && c && sQ(c.data) ? (0, no.jsx)(sX, {
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

            function s1(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var s2 = function(e) {
                var t = e.universeId,
                    r = e.buttonClassName,
                    n = e.playabilityStatus,
                    o = e.pageContext;
                return (0, no.jsx)(ii, {
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
                                        return r.trys.push([1, 3, , 4]), nt(t, ex.ageCheckUpsellName, n, o), [4, r7({
                                            context: eI,
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
                                    s1(a, n, o, i, l, "next", e)
                                }

                                function l(e) {
                                    s1(a, n, o, i, l, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    },
                    buttonClassName: r
                })
            };

            function s3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function s6(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function s5(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            s6(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            s6(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function s8(e, t) {
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
                        if ("string" == typeof e) return s3(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return s3(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function s4(e, t) {
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
            var s7 = {},
                s9 = new Set([em.PurchaseRequired, em.FiatPurchaseRequired, em.FiatPurchaseDeviceRestricted, em.ContextualPlayabilityRegionalAvailability]),
                fe = new Set([em.Playable]),
                ft = function(e) {
                    var t = e.universeId,
                        r = e.placeId,
                        n = e.rootPlaceId,
                        o = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        i = e.status,
                        l = e.eventProperties,
                        u = void 0 === l ? s7 : l,
                        c = e.appsFlyerReferralProperties,
                        s = void 0 === c ? s7 : c,
                        f = e.iconClassName,
                        p = e.buttonWidth,
                        d = void 0 === p ? n$ : p,
                        h = e.buttonClassName,
                        y = void 0 === h ? "btn-common-play-game-lg" : h,
                        m = e.disableLoadingState,
                        b = e.buttonText,
                        v = void 0 === b ? void 0 : b,
                        g = e.hideIcon,
                        w = e.analyticsCallback,
                        O = void 0 === w ? void 0 : w,
                        P = e.pageContext,
                        S = s8((0, $.useState)(void 0), 2),
                        E = S[0],
                        j = S[1],
                        A = s8((0, $.useState)(void 0), 2),
                        x = A[0],
                        I = A[1],
                        C = s8((0, $.useState)(void 0), 2),
                        T = C[0],
                        k = C[1],
                        N = s8((0, $.useState)(void 0), 2),
                        D = N[0],
                        R = N[1],
                        _ = s8((0, $.useState)(void 0), 2),
                        L = _[0],
                        U = _[1],
                        B = s8((0, $.useState)(void 0), 2),
                        M = B[0],
                        F = B[1],
                        H = s8((0, $.useState)(void 0), 2),
                        G = H[0],
                        z = H[1],
                        V = s8((0, $.useState)(void 0), 2),
                        W = V[0],
                        q = V[1],
                        K = (0, Y.useQuery)({
                            queryKey: ["getIsVNGLandingRedirectEnabled"],
                            queryFn: nW.getIsVNGLandingRedirectEnabled,
                            retry: !1
                        }).data;
                    (0, $.useEffect)(function() {
                        s5(function() {
                            var e, r;
                            return s4(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return n.trys.push([0, 2, , 3]), [4, s5(function() {
                                            var e, r, n, o, a, i, l, u, c, s, f, p, d, h, y, m, b;
                                            return s4(this, function(v) {
                                                switch (v.label) {
                                                    case 0:
                                                        if (e = {
                                                                isUniverseEnabledForVoice: !1,
                                                                isUniverseEnabledForAvatarVideo: !1
                                                            }, void 0 === rF()) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: !0,
                                                            useCameraU13Design: !1,
                                                            useVoiceUpsellV2Design: !1
                                                        }];
                                                        return [4, ep()];
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
                                                        return [4, (g = t, ec(function() {
                                                            var e;
                                                            return es(this, function(t) {
                                                                switch (t.label) {
                                                                    case 0:
                                                                        return e = {
                                                                            withCredentials: !0,
                                                                            url: "".concat(J().voiceApi, "/v1/settings/verify/show-age-verification-overlay/").concat(g)
                                                                        }, [4, eo.get(e)];
                                                                    case 1:
                                                                        return [2, t.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        if (f = (s = v.sent()).showAgeVerificationOverlay, p = s.showVoiceOptInOverlay, d = s.showAvatarVideoOptInOverlay, h = s.elegibleToSeeVoiceUpsell, y = s.universePlaceVoiceEnabledSettings, m = !1, b = !1, !nK().getAllValuesForLayer) return [3, 5];
                                                        return [4, nK().getAllValuesForLayer("Voice.AvatarChat.Upsell")];
                                                    case 3:
                                                        return m = Boolean.apply(void 0, [v.sent().ShouldShowUpsell]), [4, nK().getAllValuesForLayer("Voice.AvatarChat.U13Upsell")];
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
                                        return j(null != (e = (r = n.sent()).universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice) && e), k(r.elegibleToSeeVoiceUpsell), I(r.showAgeVerificationOverlay), R(r.showVoiceOptInOverlay), U(r.showAvatarVideoOptInOverlay), F(r.requireExplicitVoiceConsent), z(r.useCameraU13Design), q(r.useVoiceUpsellV2Design), [3, 3];
                                    case 2:
                                        return n.sent(), en(eA.PlayButtonShowIdentificationError), k(!1), j(!1), I(!1), R(!1), U(!1), F(!0), z(!1), q(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []);
                    var X = (0, $.useCallback)(function() {
                            r9(r, t);
                            var e = nr(null != u.launchData ? String(u.launchData) : void 0);
                            r5(r, n, o, a, u, e, s)
                        }, [r, t, u, s, n, o, a]),
                        Q = s0(t, X, P),
                        ee = Q.doGameLaunchWithPlayableUxTreatment,
                        et = Q.playableUxTreatmentModal;
                    return void 0 !== x || void 0 !== m && m ? (0, no.jsxs)(Z().Fragment, {
                        children: [(0, no.jsxs)(nV, {
                            "data-testid": "play-button",
                            variant: "Emphasis",
                            style: nY,
                            className: ni()(nZ(d), y),
                            onClick: function(e) {
                                return s5(function() {
                                    var t;
                                    return s4(this, function(n) {
                                        var o, a, l, u;
                                        switch (n.label) {
                                            case 0:
                                                if (e.preventDefault(), e.stopPropagation(), i !== em.Playable) return [3, 7];
                                                if (T && E && nK().getAllValuesForLayer("SocialVoice.VoiceUpsell").then(function() {
                                                        nK().logLayerExposure("SocialVoice.VoiceUpsell")
                                                    }).catch(function() {
                                                        console.error("error logging exposure event in play-join")
                                                    }), !x) return [3, 2];
                                                return [4, rX(function() {
                                                    var e, t;
                                                    return r0(this, function(r) {
                                                        try {
                                                            return t = (e = r4()) ? e.startVerificationFlow() : eG("OpenIdentityVerificationModal", function(e) {
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
                                                return (t = s8.apply(void 0, [n.sent(), 2]))[0], t[1] && I(!1), [3, 6];
                                            case 2:
                                                if (!D) return [3, 4];
                                                return [4, (o = null == M || M, a = null != W && W, rX(function() {
                                                    var e, t;
                                                    return r0(this, function(r) {
                                                        try {
                                                            return t = (e = r4()) ? e.showVoiceOptInOverlay(o, a) : eG("OpenVoiceOptInOverlay", function(e) {
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
                                                return [4, (l = null == M || M, u = null == G || G, rX(function() {
                                                    var e, t;
                                                    return r0(this, function(r) {
                                                        try {
                                                            return t = (e = r4()) ? e.showAvatarVideoOptInOverlay(l, u) : eG("OpenCameraOptInOverlay", function(e) {
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
                                                i === em.GuestProhibited && (K ? nW.navigateToLoginWithRedirect() : r8(r, s)), n.label = 8;
                                            case 8:
                                                return O && O(), [2]
                                        }
                                    })
                                })()
                            },
                            children: [!(void 0 !== g && g) && (0, no.jsx)("span", {
                                className: void 0 === f ? "icon-common-play" : f
                            }), v && (0, no.jsx)("span", {
                                className: "play-button-text",
                                children: v
                            })]
                        }), (0, no.jsx)("div", {
                            id: "id-verification-container"
                        }), et]
                    }) : (0, no.jsx)(iu, {
                        buttonClassName: y,
                        buttonWidth: d
                    })
                },
                fr = function(e, t) {
                    var r = t.playabilityStatus,
                        n = t.shouldShowVpcPlayButtonUpsells,
                        o = t.shouldShowNoticeAgreementIfPlayable,
                        a = t.unplayableDisplayText;
                    if (void 0 !== r) {
                        if (r === em.Playable && o) return {
                            message: e(eg),
                            testId: "play-contextual-message"
                        };
                        if (a) return {
                            message: a,
                            testId: "play-server-message"
                        };
                        if (r !== em.ContextualPlayabilityCoreGated && ne(r, n)) return {
                            message: e(Object.hasOwn(ev, r) ? ev[r] : ev[em.UnplayableOtherReason]),
                            testId: "play-error"
                        }
                    }
                },
                fn = window.Roblox["core-scripts"].util.elementVisibility,
                fo = function(e, t) {
                    var r = t.universeId,
                        n = t.playabilityStatus,
                        o = t.pageContext,
                        a = t.attributionId,
                        i = t.contextualMessage,
                        l = (0, $.useRef)(!1);
                    (0, $.useEffect)(function() {
                        l.current = !1
                    }, [r, n, o, a, i]), (0, $.useEffect)(function() {
                        if (e.current && !l.current && i) {
                            var t = null;
                            return t = (0, fn.observeVisibility)({
                                    element: e.current,
                                    threshold: .5
                                }, function(e) {
                                    e && !l.current && (l.current = !0, (0, eL.sendEventWithTarget)("playButtonContextualMessageImpression", o, {
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

            function fa(e) {
                var t = new(q()).Deferred;
                return K.Hybrid.Game.launchGame(e, function() {
                    t.resolve(e)
                }), t
            }
            var fi = {
                isJoinAttemptIdEnabled: !1,
                joinMultiplayerGame: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        r = {
                            requestType: K.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                            placeId: e.placeId.toString(),
                            isPlayTogetherGame: t,
                            browserTrackerId: K.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (r.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (r.joinAttemptOrigin = e.joinAttemptOrigin), fa(r)
                },
                followPlayerIntoGame: function(e) {
                    var t = {
                        requestType: K.Hybrid.Game.LAUNCH_MODES.FOLLOW_USER,
                        userId: e.userId.toString(),
                        browserTrackerId: K.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), fa(t)
                },
                joinGameInstance: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        r = {
                            requestType: K.Hybrid.Game.LAUNCH_MODES.GAME_INSTANCE,
                            placeId: e.placeId.toString(),
                            instanceId: e.gameId,
                            isPlayTogetherGame: t,
                            browserTrackerId: K.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (r.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (r.joinAttemptOrigin = e.joinAttemptOrigin), fa(r)
                },
                joinPrivateGame: function(e) {
                    var t = {
                        requestType: K.Hybrid.Game.LAUNCH_MODES.PRIVATE_SERVER,
                        placeId: e.placeId.toString(),
                        accessCode: e.accessCode,
                        browserTrackerId: K.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), fa(t)
                },
                playTogetherGame: function(e) {
                    var t = {
                        requestType: K.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                        placeId: e.placeId.toString(),
                        conversationId: e.conversationId.toString(),
                        browserTrackerId: K.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), fa(t)
                }
            };
            q()(document).ready(function() {
                G = new K.TranslationResourceProvider().getTranslationResource("Feature.GameLaunchGuestMode")
            });
            var fl = {
                    restrictGuests: function(e) {
                        var t = new(q()).Deferred;
                        return K.CurrentUser.isAuthenticated ? t.resolve(e) : K.Dialog.open({
                            titleText: G.get("Heading.Dialog.SignUpOrLogin"),
                            bodyContent: G.get("Description.Dialog.ConnectionsSignUpOrLogin"),
                            cssClass: "soli-modal",
                            acceptColor: K.Dialog.green,
                            acceptText: G.get("Action.Dialog.SignUp"),
                            declineText: G.get("Action.Dialog.Login"),
                            onDecline: function() {
                                K.FormEvents && K.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_login");
                                var e = "/login?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search);
                                window.location.href = K.Endpoints ? K.Endpoints.getAbsoluteUrl(e) : e
                            },
                            onAccept: function() {
                                var e;
                                K.FormEvents && K.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_signup"), e = "/CreateAccount?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search), window.location.href = K.Endpoints ? K.Endpoints.getAbsoluteUrl(e) : e
                            }
                        }), t
                    }
                },
                fu = window.CoreUtilities;

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
            var fs = {
                gameLaunchInterface: null,
                gameLaunchLogger: null,
                initialized: new Promise(function(e) {
                    z = e
                })
            };

            function ff(e, t, r) {
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
                    joinAttemptId: null != t ? t : fu.uuidService.generateRandomUuid()
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

            function fp(e, t, r) {
                var n, o, a = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    l = arguments.length > 5 && void 0 !== arguments[5] && arguments[5],
                    u = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : "",
                    c = arguments.length > 7 && void 0 !== arguments[7] ? arguments[7] : "";
                a && i && (n = {
                    url: "".concat(K.EnvironmentUrls.gameJoinApi, "/v1/team-create-preemptive"),
                    withCredentials: !0,
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json"
                    }
                }, o = {
                    gameJoinAttemptId: fu.uuidService.generateRandomUuid(),
                    placeId: e
                }, fu.httpService.post(n, o)), fs.gameLaunchInterface.editGameInStudio(e, t, r, a && l, u, c)
            }

            function fd(e, t, r, n, o, a, i) {
                var l = {
                    placeId: e,
                    launchData: null == a ? void 0 : a.launchData,
                    eventId: null == a ? void 0 : a.eventId,
                    isPlayTogetherGame: !0 === r,
                    referredByPlayerId: i
                };
                return fs.gameLaunchInterface.isJoinAttemptIdEnabled && (l = ff(l, n, o)), fl.restrictGuests(l).then(fs.gameLaunchInterface.joinMultiplayerGame)
            }
            q().fn.bindGameLaunch = function() {
                return this.find(".VisitButtonPlayGLI").click(function() {
                    var e = q()(this);
                    fd(e.attr("placeid"), e.data("is-membership-level-ok"))
                }), this.find(".VisitButtonEditGLI").click(function() {
                    var e = q()(this);
                    fp(e.attr("placeid"), e.data("universeid"), !!e.data("allowupload"))
                }), this
            }, q()(document).ready(function() {
                q()("body").bindGameLaunch()
            }), Object.assign(fs, {
                authenticationChecker: fl,
                joinMultiplayerGame: fd,
                openStudio: function() {
                    fs.gameLaunchInterface.openStudio()
                },
                openPluginInStudio: function(e) {
                    fs.gameLaunchInterface.openPluginInStudio(e)
                },
                editGameInStudio: fp,
                followPlayerIntoGame: function(e, t, r) {
                    var n = {
                        userId: e
                    };
                    return fs.gameLaunchInterface.isJoinAttemptIdEnabled && (n = ff(n, t, r)), fl.restrictGuests(n).then(fs.gameLaunchInterface.followPlayerIntoGame)
                },
                joinGameInstance: function(e, t, r, n, o, a, i) {
                    var l = {
                        placeId: e,
                        gameId: t,
                        isPlayTogetherGame: !0 === n,
                        referredByPlayerId: i
                    };
                    return fs.gameLaunchInterface.isJoinAttemptIdEnabled && (l = ff(l, o, a)), fl.restrictGuests(l).then(fs.gameLaunchInterface.joinGameInstance)
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
                                    return [4, fs.initialized];
                                case 1:
                                    return i.sent(), a = {
                                        placeId: e,
                                        accessCode: t,
                                        linkCode: r
                                    }, fs.gameLaunchInterface.isJoinAttemptIdEnabled && (a = ff(a, n, o)), [2, fs.gameLaunchInterface.joinPrivateGame(a)]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(r, n) {
                            var o = a.apply(e, t);

                            function i(e) {
                                fc(o, r, n, i, l, "next", e)
                            }

                            function l(e) {
                                fc(o, r, n, i, l, "throw", e)
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
                    return fs.gameLaunchInterface.isJoinAttemptIdEnabled && (o = ff(o, r, n)), fl.restrictGuests(o).then(fs.gameLaunchInterface.playTogetherGame)
                },
                setGameLaunchInterface: function(e) {
                    fs.gameLaunchInterface = e, z()
                },
                setGameLaunchLogger: function(e) {
                    fs.gameLaunchLogger = e
                },
                tryAssetInStudio: function(e) {
                    fs.gameLaunchInterface.tryAssetInStudio(e)
                },
                isJoinAttemptIdEnabled: function() {
                    var e;
                    return null == (e = fs.gameLaunchInterface) ? void 0 : e.isJoinAttemptIdEnabled
                },
                isSharedGameLauncherEnabled: function() {
                    var e;
                    return !!(null == (e = fs.gameLaunchInterface) ? void 0 : e.isSharedGameLauncherEnabled)
                },
                startClientAttemptedEvent: "startClientAttempted",
                startClientFailedEvent: "startClientFailed",
                startClientSucceededEvent: "startClientSucceeded",
                beginInstallEvent: "beginInstall",
                successfulInstallEvent: "successfulInstall",
                manualDownloadEvent: "manualDownload"
            });
            var fh = function(e) {
                    var t, r = "".concat(e, "="),
                        n = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(r)
                        })) ? void 0 : t.slice(r.length);
                    return null == n ? null : {
                        name: e,
                        value: decodeURIComponent(n)
                    }
                },
                fy = function() {
                    var e = fh("RBXcb");
                    if (null == e || "" === e.value) return !1;
                    var t = e.value.split("&").find(function(e) {
                        return "GoogleAnalytics" === e.split("=")[0]
                    });
                    return "true" === (null == t ? void 0 : t.split("=")[1])
                },
                fm = {
                    lastContext: "unknown",
                    contextCategories: {
                        joinUser: "JoinUser"
                    }
                };

            function fb(e, t, r, n, o, a) {
                var i, l, u;
                null !== t && "" !== t && "unknown" !== t && (fm.lastContext = t), K.EventStream.SendEvent(e, fm.lastContext, function(e) {
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
            Object.assign(fm, {
                SendGamePlayIntent: function(e, t, r, n, o) {
                    fb("gamePlayIntent", e, t, r, n, o), q()(document).trigger("playButton:gamePlayIntent")
                },
                SendDevelopIntent: function(e, t) {
                    fb("developIntent", e, t)
                },
                SendInstallBegin: function(e, t) {
                    fb("installBegin", e, t)
                },
                SendInstallSuccess: function(e, t) {
                    fb("installSuccess", e, t)
                },
                SendClientStartAttempt: function(e, t) {
                    fb("clientStartAttempt", e, t)
                },
                SendClientStartSuccessWeb: function(e, t) {
                    fb("clientStartSuccessWeb", e, t)
                },
                SendManualDownloadClick: function(e, t) {
                    fb("manualDownload", e, t)
                }
            });
            var fv = {
                    logToConsoleEnabled: !1,
                    logToGAEnabled: !0,
                    logToEphemeralCountersEnabled: !0
                },
                fg = {};
            fg[fs.startClientAttemptedEvent] = ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"], fg[fs.startClientSucceededEvent] = ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"];
            var fw = {};
            K.GaEventSettings.gaLaunchAttemptAndLaunchSuccessEnabled && (fw[fs.startClientAttemptedEvent] = "Launch Attempt", fw[fs.startClientSucceededEvent] = "Launch Success"), fw[fs.beginInstallEvent] = "Install Begin", fw[fs.successfulInstallEvent] = "Install Success", fw[fs.manualDownloadEvent] = "Manual Download";
            var fO = {};

            function fP(e) {
                fv.logToConsoleEnabled && console.log(e)
            }

            function fS(e, t) {
                if (fv.logToEphemeralCountersEnabled) {
                    var r, n = q()("#PlaceLauncherStatusPanel").data("os-name");
                    "Windows" === n && (n = "Win32");
                    var o = e;
                    o = (o = o.replace("<os>", n)).replace("<launchmethod>", t), (null == (r = window.EventTracker) ? void 0 : r.fireEvent) && window.EventTracker.fireEvent(o)
                }
            }

            function fE(e, t, r, n) {
                fy() && void 0 !== window.GoogleAnalyticsEvents && fv.logToGAEnabled && window.GoogleAnalyticsEvents.FireEvent && window.GoogleAnalyticsEvents.FireEvent([e, t, r, n])
            }

            function fj(e, t) {
                fP("".concat(e.type, ": ").concat(JSON.stringify(t))), fg[e.type] && q().each(fg[e.type], function(e, r) {
                    fS(r, t.launchMethod)
                }), fw[e.type] && fE(t.launchMethod, fw[e.type], t.params.launchMode, 0), fO[e.type] && fO[e.type](null, t.params.placeId)
            }
            fO[fs.startClientAttemptedEvent] = fm.SendClientStartAttempt, fO[fs.startClientSucceededEvent] = fm.SendClientStartSuccessWeb, fO[fs.beginInstallEvent] = fm.SendInstallBegin, fO[fs.successfulInstallEvent] = fm.SendInstallSuccess, fO[fs.manualDownloadEvent] = fm.SendManualDownloadClick, Object.assign(fv, {
                logToConsole: fP,
                logToEphemeralCounters: fS,
                logToGA: fE
            }), q()(document).ready(function() {
                var e = [fs.startClientAttemptedEvent, fs.startClientFailedEvent, fs.startClientSucceededEvent, fs.beginInstallEvent, fs.successfulInstallEvent, fs.manualDownloadEvent];
                q()(fs).on(e.join(" "), fj)
            });
            var fA = function() {
                    var e = "click";
                    q()("body").on(e, ".VisitButtonPlay, .VisitButtonPlayGLI", function() {
                        var e, t = q()(this);
                        if ((t.hasClass("VisitButtonPlay") || t.hasClass("VisitButtonPlayGLI")) && (e = "PlayButton"), e) {
                            var r = q()(this).attr("placeid"),
                                n = K.UrlParser ? K.UrlParser.getParameterValueByName("rbxp") : null;
                            fm.SendGamePlayIntent(e, r, n)
                        }
                    }), q()("body").on(e, ".VisitButtonEdit, .VisitButtonEditGLI", function() {
                        var e = q()(this).attr("placeid");
                        fm.SendDevelopIntent("Edit", e)
                    }), q()("#rbx-running-games").on(e, ".rbx-game-server-item .rbx-game-server-join", function() {
                        var e = q()(this).data("placeid");
                        e && fm.SendGamePlayIntent("JoinInstance", e)
                    }), q()("#rbx-friends-running-games").on(e, ".rbx-friends-game-server-item .rbx-friends-game-server-join", function() {
                        var e = q()(this).data("placeid");
                        e && fm.SendGamePlayIntent("JoinInstance", e)
                    }), q()("#game-instances").on(e, "#rbx-vip-servers .rbx-vip-server-item .rbx-vip-server-join", function() {
                        var e = q()(this).data("placeid");
                        e && fm.SendGamePlayIntent("PrivateServer", e)
                    })
                },
                fx = window.Roblox["core-scripts"].react,
                fI = "u" > typeof window ? window.navigator.userAgent : "",
                fC = /Mac OS X/i.test(fI),
                fT = /Windows NT/i.test(fI);
            /Linux/i.test(fI) && /Android/i.test(fI);
            var fk = /Android/i.test(fI),
                fN = /iPhone|iPad|iPod/i.test(fI),
                fD = function(e) {
                    var t = e.alt,
                        r = void 0 === t ? "App Icon" : t,
                        n = e.className,
                        o = e.title,
                        a = e.style;
                    return Z().createElement("div", {
                        className: "app-icon-bluebg app-icon-".concat(fC ? "mac" : fT ? "windows" : fN ? "ios" : fk ? "android" : "windows", " ").concat(void 0 === n ? "" : n),
                        role: "img",
                        "aria-label": r,
                        title: (void 0 === o ? "" : o) || r,
                        style: void 0 === a ? {} : a
                    })
                },
                fR = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding"],
                f_ = ["Common.VisitGame", "CommonUI.Controls"];

            function fL(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var fU = {
                    Unknown: 1,
                    WindowsDirectDownload: 2,
                    WindowsStore: 3,
                    MacDirectDownload: 4,
                    AppleAppStore: 5,
                    GooglePlayStore: 6,
                    AmazonAppStore: 7
                },
                fB = {
                    downloadPageHeader: "Heading.DownloadPage",
                    appStoreLinksHeader: "Heading.AppStoreLinks",
                    windowsDownloadLabel: "Action.DownloadWindowsApp",
                    windowsDownloadLink: (0, eR.getAbsoluteUrl)("/download/client?os=win"),
                    macDownloadLabel: "Action.DownloadMacApp",
                    macDownloadLink: (0, eR.getAbsoluteUrl)("/download/client?os=mac"),
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
                fM = (fL(V = {}, fU.WindowsDirectDownload, {
                    href: fB.windowsDownloadLink,
                    title: fB.windowsDownloadLabel,
                    name: "windows",
                    icon: "icon-filled-microsoft",
                    legacyIcon: "icon-logo-win",
                    isDirectDownload: !0
                }), fL(V, fU.MacDirectDownload, {
                    href: fB.macDownloadLink,
                    title: fB.macDownloadLabel,
                    name: "mac",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !0
                }), fL(V, fU.AmazonAppStore, {
                    href: fB.amazonStoreLink,
                    title: fB.androidAppDownloadLabel,
                    name: "amazonStore",
                    icon: "icon-filled-amazon",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), fL(V, fU.GooglePlayStore, {
                    href: fB.googlePlayStoreLink,
                    title: fB.androidAppDownloadLabel,
                    name: "android",
                    icon: "icon-filled-android",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), fL(V, fU.AppleAppStore, {
                    href: fB.appleAppStoreLink,
                    title: fB.iOSDownloadLabel,
                    name: "iOS",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !1
                }), V),
                fF = function(e) {
                    var t, r = e.translate;
                    return (0, no.jsxs)(Z().Fragment, {
                        children: [(0, no.jsxs)("div", {
                            className: "flex flex-col gap-small",
                            children: [(0, no.jsx)("h3", {
                                className: "text-label-large content-emphasis padding-none",
                                children: r("Heading.MobileAppDownloadOption")
                            }), (0, no.jsx)("p", {
                                className: "text-body-medium",
                                children: r("Label.MobileAppQrCode")
                            })]
                        }), (0, no.jsx)("div", {
                            className: "flex grow justify-center items-center bg-shift-100 radius-medium padding-x-large",
                            children: (0, no.jsx)("div", {
                                className: "radius-medium padding-small bg-[white]",
                                children: (0, no.jsx)("img", {
                                    className: "size-2100",
                                    src: "string" == typeof(t = "https://images.rbxcdn.com/6674b8e189bf79c6.png") ? t : t.src,
                                    alt: ""
                                })
                            })
                        })]
                    })
                };

            function fH(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var fG = function() {
                var e;

                function t(e, r) {
                    if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                    fH(this, "url", void 0), fH(this, "searchParams", void 0), this.url = e, this.searchParams = r
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

            function fz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fV(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function fW(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function fq(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
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
                }(e, t) || fZ(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function f$(e) {
                return function(e) {
                    if (Array.isArray(e)) return fz(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || fZ(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fZ(e, t) {
                if (e) {
                    if ("string" == typeof e) return fz(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fz(e, t)
                }
            }
            var fY = function(e) {
                    return rR(new URLSearchParams(e))
                },
                fX = function(e) {
                    return Array.isArray(e)
                },
                fJ = function(e) {
                    return String(e)
                },
                fQ = ["__proto__", "prototype", "constructor"],
                f0 = function(e) {
                    return fY(f$(e.entries()).filter(function(e) {
                        var t = fK(e, 2),
                            r = t[0],
                            n = t[1];
                        return !fQ.includes(r) && !fQ.includes(n)
                    }))
                },
                f1 = function() {
                    var e, t;

                    function r(e) {
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        fW(this, "searchParams", void 0), this.searchParams = e
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
                            return this.searchParams.has(e, void 0 === t ? void 0 : fJ(t))
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(e, t) {
                            var n = fY(this.searchParams);
                            return n.append(e, fJ(t)), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(e) {
                            var t = fq(e, URLSearchParams) || fq(e, r) || fX(e) ? e : Object.entries(e);
                            return r.new(f$(this.searchParams).concat(f$(t)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(e, t) {
                            var n = fY(this.searchParams);
                            return n.set(e, fJ(t)), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(e, t) {
                            var n = void 0 === t ? void 0 : fJ(t);
                            if (this.searchParams.has(e, n)) {
                                var o = fY(this.searchParams);
                                return o.delete(e, n), r.fromUnique(o)
                            }
                            return this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var e = fY(this.searchParams);
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
                            if (fq(e, r)) return e;
                            var n = fY((fX(e) ? e : Object.entries(e)).map(function(e) {
                                var t = fK(e, 2);
                                return [t[0], fJ(t[1])]
                            }));
                            return r.fromUnique(t ? f0(n) : n)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return r.fromUnique(t ? f0(e) : fY(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                n = fY(e);
                            return r.fromUnique(t ? f0(n) : n)
                        }
                    }], e && fV(r.prototype, e), t && fV(r, t), r
                }();

            function f2(e, t, r) {
                return (f2 = f8() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && f6(o, r.prototype), o
                }).apply(null, arguments)
            }

            function f3(e) {
                return (f3 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function f6(e, t) {
                return (f6 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function f5(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (f5 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return f2(e, arguments, f3(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), f6(r, e)
                })(e)
            }

            function f8() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (f8 = function() {
                    return !!e
                })()
            }
            fW(f1, "empty", f1.fromUnique(fY(""))), f5(Error), f5(Error);
            var f4 = function(e) {
                return rR(new URL(e))
            };

            function f7(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function f9(e) {
                return (f9 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function pe(e, t) {
                return (pe = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function pt() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (pt = function() {
                    return !!e
                })()
            }
            var pr = function(e) {
                    var t, r;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e, t) {
                        var r, o;
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        return r = n, o = [e, t], r = f9(r),
                            function(e, t) {
                                var r;
                                if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return e
                            }(this, pt() ? Reflect.construct(r, o || [], f9(this).constructor) : r.apply(this, o))
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: n,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && pe(n, e), t = [{
                        key: "with",
                        value: function(e) {
                            var t = e.scheme,
                                r = e.host,
                                o = e.port,
                                a = e.path,
                                i = e.searchParams,
                                l = e.fragment;
                            if (null == t && null == r && null == o && null == a && null == i && null == l) return this;
                            var u = f4(this.url);
                            if (null != t && (u.protocol = t), null != r && (u.hostname = r), null != o && (u.port = "number" == typeof o ? o.toString() : o), null != a && (u.pathname = a), null != l && (u.hash = l), null != i) {
                                var c = f1.new(i);
                                return u.search = c.toString(), new n(u, c)
                            }
                            return new n(u, this.searchParams)
                        }
                    }, {
                        key: "withScheme",
                        value: function(e) {
                            var t = f4(this.url);
                            return t.protocol = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withHost",
                        value: function(e) {
                            var t = f4(this.url);
                            return t.hostname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withPort",
                        value: function(e) {
                            var t = f4(this.url);
                            return t.port = "number" == typeof e ? e.toString() : e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(e) {
                            var t = f4(this.url);
                            return t.pathname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(e) {
                            var t = f1.new(e),
                                r = f4(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(e) {
                            var t = this.searchParams.copyAndAppendAll(e),
                                r = f4(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withFragment",
                        value: function(e) {
                            var t = f4(this.url);
                            return t.hash = e, new n(t, this.searchParams)
                        }
                    }], r = [{
                        key: "new",
                        value: function(e) {
                            e.password = "", e.username = "";
                            var t = f1.internalFromUniqueURLSearchParams(rR(e.searchParams));
                            return new n(e, t)
                        }
                    }, {
                        key: "fromURL",
                        value: function(e) {
                            return n.new(f4(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            try {
                                return ro(n.new(rR(new URL(e))))
                            } catch (e) {
                                return ra(e)
                            }
                        }
                    }], t && f7(n.prototype, t), r && f7(n, r), n
                }(fG),
                pn = function(e) {
                    var t, r = new URLSearchParams(document.location.search).get("downloadType");
                    if (null != r) {
                        var n = fU[r];
                        if (null != n) return n
                    }
                    if (!e) return fU.Unknown;
                    var o = eH.getDeviceMeta();
                    return (null == o ? void 0 : o.isIosDevice) ? fU.AppleAppStore : (t = e, /Kindle|Silk|KFAPW|KFARWI|KFASWI|KFFOWI|KFJW|KFMEWI|KFOT|KFSAW|KFSOWI|KFTBW|KFTHW|KFTT|WFFOWI|KFAPWI/i.test(t)) ? fU.AmazonAppStore : (null == o ? void 0 : o.isAndroidDevice) ? fU.GooglePlayStore : eH.isMac() ? fU.MacDirectDownload : eH.isWindows() ? fU.WindowsDirectDownload : fU.Unknown
                },
                po = function(e) {
                    (0, eL.sendEventWithTarget)(eL.eventTypes.formInteraction, "downloadV2", {
                        field: "".concat(e, "DownloadLink"),
                        aType: "click"
                    })
                },
                pa = function(e) {
                    return Object.values(fU).some(function(t) {
                        return t === e
                    })
                },
                pi = function(e) {
                    if (null != e) {
                        if ("number" == typeof e) return pa(e) && fM[e] ? e : void 0;
                        var t = fU[e];
                        if (null != t && fM[t]) return t;
                        var r = Number(e);
                        if (Number.isInteger(r) && pa(r) && fM[r]) return r
                    }
                },
                pl = function(e) {
                    var t;
                    return null != (t = pi(e)) ? t : pn(navigator.userAgent)
                },
                pu = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        r = t.downloadTypeOverride,
                        n = t.translate,
                        o = pl(r),
                        a = fM[o];
                    if (a) {
                        var i = a.isDirectDownload ? a.href : null != (e = null == n ? void 0 : n(a.href)) ? e : a.href,
                            l = pr.parse(i);
                        if (!l.isErr()) return {
                            downloadType: o,
                            link: a,
                            isDirectDownload: a.isDirectDownload,
                            href: l.value,
                            icon: a.icon,
                            legacyIcon: a.legacyIcon
                        }
                    }
                };

            function pc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ps(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function pf(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            ps(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            ps(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function pp(e, t) {
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
                        if ("string" == typeof e) return pc(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return pc(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function pd(e, t) {
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
            var ph = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, no.jsxs)(Z().Fragment, {
                        children: [(0, no.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, no.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                py = "\x01LINK_START\x01",
                pm = "\x01LINK_END\x01",
                pb = new RegExp("".concat(py, "|").concat(pm)),
                pv = function() {
                    var e = pp(fR, 5),
                        t = e[0],
                        r = e[1],
                        n = e[2],
                        o = e[3],
                        a = e[4],
                        i = it(t),
                        l = it(r),
                        u = it(n),
                        c = it(o),
                        s = it(a);
                    return (0, $.useMemo)(function() {
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
                pg = Error("client not started"),
                pw = 0,
                pO = function(e) {
                    var t = pp((0, $.useState)(function() {
                            return pw += 1
                        }), 1)[0],
                        r = (0, Y.useQuery)({
                            queryKey: ["client-status", t],
                            queryFn: function() {
                                return pf(function() {
                                    return pd(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, rh(function() {
                                                    var e, t;
                                                    return ry(this, function(r) {
                                                        switch (r.label) {
                                                            case 0:
                                                                return [4, Q.get(rm(J().matchmakingApi, "/v1/client-status"), rb, {
                                                                    credentials: "include"
                                                                })];
                                                            case 1:
                                                                return t = r.sent().getOrThrow().status, [2, null != (e = rv.find(function(e) {
                                                                    return e === t
                                                                })) ? e : "Unknown"]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                if ("Unknown" === t.sent()) throw pg;
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
                pP = function(e) {
                    var t = e.download,
                        r = e.launchGame,
                        n = e.unmount,
                        o = pp((0, $.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = pv(),
                        u = pO(n);
                    if (!a) {
                        var c = l(u ? "Label.RobloxLoadingToPlay" : "Label.RobloxExciteToDownload");
                        return (0, no.jsx)(uT, {
                            hasCloseAffordance: !0,
                            closeLabel: l("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: n,
                            children: (0, no.jsxs)(uk, {
                                className: "download-dialog",
                                children: [(0, no.jsxs)(uN, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, no.jsx)(fD, {
                                        className: "size-1600"
                                    }), (0, no.jsx)(uD, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? ph(c) : c
                                    })]
                                }), (0, no.jsx)(uR, {
                                    className: "flex",
                                    children: u ? (0, no.jsx)(nV, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, no.jsx)(nV, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return pf(function() {
                                                var e;
                                                return pd(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            try {
                                                                (e = pu()) && po(e.link.name)
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
                    var s = (0, eH.isMac)(),
                        f = s ? (0, eR.getAbsoluteUrl)("/download/client?os=mac") : (0, eR.getAbsoluteUrl)("/download/client?os=win");
                    return (0, no.jsx)(uT, {
                        hasCloseAffordance: !0,
                        closeLabel: l("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: n,
                        children: (0, no.jsx)(uk, {
                            className: "install-dialog",
                            children: (0, no.jsx)(uN, {
                                className: "content-default",
                                children: (0, no.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, no.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, no.jsx)(uD, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: l("Heading.DownloadConfirmation")
                                        }), (0, no.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(l("Label.FollowInstallSteps"), " ").concat(l("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(f, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, no.jsx)("div", {}), " ", (0, no.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, no.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, no.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: l("Heading.InstallInstructions")
                                            }), (0, no.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, no.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l(s ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, no.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, no.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: l("Response.Dialog.ThirdInstruction")
                                                }), (0, no.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = l("Response.Dialog.FourthInstruction", {
                                                                startLink: py,
                                                                endLink: pm
                                                            }),
                                                            t = e.split(pb);
                                                        if (t.length < 3) return e;
                                                        var n = pp(t, 3),
                                                            o = n[0],
                                                            a = n[1],
                                                            i = n[2];
                                                        return (0, no.jsxs)(Z().Fragment, {
                                                            children: [o, (0, no.jsx)("button", {
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
                                        }), (0, no.jsx)("div", {}), " ", (0, no.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, no.jsx)("div", {}), " ", (0, no.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, no.jsx)(fF, {
                                                translate: l
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                };

            function pS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var pE = function(e) {
                    var t = e.unmount,
                        r = function(e) {
                            if (Array.isArray(e)) return e
                        }(f_) || function(e) {
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
                        }(f_) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return pS(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return pS(e, 2)
                            }
                        }(f_) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        n = r[0],
                        o = r[1],
                        a = it(n),
                        i = it(o);
                    return (0, no.jsx)(uT, {
                        hasCloseAffordance: !1,
                        isModal: !0,
                        open: !0,
                        size: "Small",
                        onOpenChange: function(e) {
                            e || t()
                        },
                        children: (0, no.jsxs)(uk, {
                            children: [(0, no.jsxs)(uN, {
                                className: "flex flex-col gap-small",
                                children: [(0, no.jsx)(uD, {
                                    className: "text-heading-small content-emphasis padding-none",
                                    children: a("Heading.ErrorStartingGame")
                                }), (0, no.jsx)("p", {
                                    className: "text-body-medium content-default",
                                    children: a("Response.Dialog.ErrorLaunching")
                                })]
                            }), (0, no.jsx)(uR, {
                                className: "flex",
                                children: (0, no.jsx)(nV, {
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
                pj = window.Roblox["core-lib"].index;

            function pA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function px(e) {
                return function(e) {
                    if (Array.isArray(e)) return pA(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return pA(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return pA(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            px(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(px(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var pI = px(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(px(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                pC = px(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(px(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));

            function pT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            px(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(px(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var pk = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                pN = function(e) {
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
                                    if ("string" == typeof e) return pT(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return pT(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [ab(r), n]
                        ]
                    }))
                },
                pD = function(e) {
                    var t = pk(),
                        r = t.Lang,
                        n = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [ab(e), function(e) {
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
                        }({}, pN(null == o ? void 0 : o[e]), pN(null == r ? void 0 : r[e]), pN(null == n ? void 0 : n[e]))]
                    }))
                },
                pR = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        a = e.children,
                        i = n.join(","),
                        l = (0, $.useMemo)(function() {
                            return pD(n)
                        }, [i]);
                    return (0, no.jsx)(al, {
                        locale: null != o ? o : null != (t = null != (r = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, pj.arrayIncludes)(pC, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? r : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                                var r = t.dataset.languageCode;
                                if (r && (0, pj.arrayIncludes)(pI, r)) return r.replace("_", "-")
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: a
                    })
                },
                p_ = JSON.parse('{"P":["Feature.GameLaunchGuestMode","Common.VisitGame","CommonUI.Controls","Feature.ExperienceDetails","Feature.DownloadLanding"]}'),
                pL = window.Roblox["core-scripts"].meta.user,
                pU = function() {
                    var e, t, r;
                    return null != (e = null == (r = fh("RBXEventTrackerV2")) || null == (t = r.value.match(/browserid=([^&]*)/i)) ? void 0 : t[1]) && e
                };

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
            var pM = function() {
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
                                if (null == (0, pL.authenticatedUser)()) return [3, 2];
                                return [4, rg()];
                            case 1:
                                return e = t.sent(), [3, 3];
                            case 2:
                                e = void 0, t.label = 3;
                            case 3:
                                return [2, {
                                    authTicket: e,
                                    btId: pU() || void 0
                                }]
                        }
                    })
                }, function() {
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
                })()
            };
            ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
            });
            var pF = "Website.DownloadFunnel",
                pH = "deeplink",
                pG = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                    return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
                }),
                pz = ["/share-links"],
                pV = ["ExperienceAffiliate"],
                pW = function(e) {
                    var t;
                    return pz.includes(e.pathname) && pV.includes(null != (t = e.searchParams.get("type")) ? t : "")
                },
                pq = function(e) {
                    try {
                        var t = new URL(e).searchParams.get("referralUrl");
                        if (!t) return null;
                        var r = new URL(decodeURIComponent(t));
                        if (pW(r)) return r.href;
                        return null
                    } catch (e) {
                        return null
                    }
                },
                pK = function(e, t, r) {
                    var n;
                    try {
                        null == (n = window.Roblox.EventStream) || n.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: t,
                            group: pH,
                            action: "create-token-attempt",
                            status_code: r,
                            token: null != e ? e : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (e) {}
                };

            function p$(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }
            var pZ = "".concat(J().apiGatewayUrl, "/deferred-deep-link/token-api"),
                pY = function(e) {
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
                                        group: pH
                                    }, t && (i.authTicket = t), n && (i.btId = n), o && (i.downloadSource = o), a && (i.launchContext = a), l = {
                                        withCredentials: !0,
                                        url: "".concat(pZ, "/create-token")
                                    }, f.label = 1;
                                case 1:
                                    return f.trys.push([1, 3, , 4]), [4, eo.post(l, i)];
                                case 2:
                                    return pK(s = null != (u = (c = f.sent()).data.token) ? u : null, e, c.status), [2, s];
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
                                p$(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                p$(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                },
                pX = a3("Download"),
                pJ = function(e) {
                    pX("GameJoinDeeplinkToken", {
                        outcome: e
                    })
                };

            function pQ(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function p0(e) {
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

            function p1(e, t) {
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
            var p2 = new TextEncoder,
                p3 = function(e) {
                    var t;
                    return rR((t = e, rR(btoa(Array.from(p2.encode(t), function(e) {
                        return String.fromCodePoint(e)
                    }).join("")))).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, ""))
                };
            new TextDecoder;
            var p6 = ["joinAttemptOrigin", "accessCode", "linkCode", "gameId", "launchData", "eventId", "conversationId"],
                p5 = function(e, t, r) {
                    var n = null == (h = pr.parse(e).getOrNull()) ? void 0 : h.searchParams;
                    if (null == n) return null;
                    var o = sD(null != (f = n.get("placeId")) ? f : "");
                    if (null == o || o <= 0) return null;
                    var a = sD(String(null != r ? r : "")),
                        i = {
                            v: 1,
                            joinType: "GameJoin",
                            placeId: o,
                            isPlayTogetherGame: "true" === n.get("isPlayTogetherGame"),
                            referredByPlayerId: null != a && a > 0 ? a : null != (p = sD(null != (d = n.get("referredByPlayerId")) ? d : "0")) ? p : 0
                        },
                        l = n.get("request");
                    l && (i.requestType = l);
                    var u = !0,
                        c = !1,
                        s = void 0;
                    try {
                        for (var f, p, d, h, y, m = p6[Symbol.iterator](); !(u = (y = m.next()).done); u = !0) {
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
                    return t && (i.launchExp = t), p3(rp(i).value)
                };

            function p8(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function p4(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            p8(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            p8(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function p7(e, t) {
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

            function p9(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function de(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            p9(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            p9(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function dt(e, t) {
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

            function dr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dn(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function da(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            dn(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            dn(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function di(e, t) {
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
                        if ("string" == typeof e) return dr(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dr(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dl(e, t) {
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
            var du = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, no.jsxs)(Z().Fragment, {
                        children: [(0, no.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, no.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                dc = "\x01LINK_START\x01",
                ds = "\x01LINK_END\x01",
                df = new RegExp("".concat(dc, "|").concat(ds)),
                dp = function(e) {
                    var t = e.download,
                        r = e.launchGame,
                        n = e.unmount,
                        o = di((0, $.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = (0, fx.useTranslation)().translate,
                        u = (0, Y.useQuery)({
                            queryKey: ["client-status"],
                            queryFn: function() {
                                return da(function() {
                                    return dl(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, de(function() {
                                                    return dt(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return [4, eo.get({
                                                                    url: "".concat(J().matchmakingApi, "/v1/client-status"),
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
                        return (0, no.jsx)(uT, {
                            hasCloseAffordance: !0,
                            closeLabel: l("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: n,
                            children: (0, no.jsxs)(uk, {
                                className: "download-dialog",
                                children: [(0, no.jsxs)(uN, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, no.jsx)(fD, {
                                        className: "size-1600"
                                    }), (0, no.jsx)(uD, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? du(c) : c
                                    })]
                                }), (0, no.jsx)(uR, {
                                    className: "flex",
                                    children: u ? (0, no.jsx)(nV, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, no.jsx)(nV, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return da(function() {
                                                var e;
                                                return dl(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            try {
                                                                (e = pu()) && po(e.link.name)
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
                    var s = (0, eH.isMac)(),
                        f = s ? (0, eR.getAbsoluteUrl)("/download/client?os=mac") : (0, eR.getAbsoluteUrl)("/download/client?os=win");
                    return (0, no.jsx)(uT, {
                        hasCloseAffordance: !0,
                        closeLabel: l("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: n,
                        children: (0, no.jsx)(uk, {
                            className: "install-dialog",
                            children: (0, no.jsx)(uN, {
                                className: "content-default",
                                children: (0, no.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, no.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, no.jsx)(uD, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: l("Heading.DownloadConfirmation")
                                        }), (0, no.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(l("Label.FollowInstallSteps"), " ").concat(l("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(f, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, no.jsx)("div", {}), " ", (0, no.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, no.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, no.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: l("Heading.InstallInstructions")
                                            }), (0, no.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, no.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l(s ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, no.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: l("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, no.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: l("Response.Dialog.ThirdInstruction")
                                                }), (0, no.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = l("Response.Dialog.FourthInstruction", {
                                                                startLink: dc,
                                                                endLink: ds
                                                            }),
                                                            t = e.split(df);
                                                        if (t.length < 3) return e;
                                                        var n = di(t, 3),
                                                            o = n[0],
                                                            a = n[1],
                                                            i = n[2];
                                                        return (0, no.jsxs)(Z().Fragment, {
                                                            children: [o, (0, no.jsx)("button", {
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
                                        }), (0, no.jsx)("div", {}), " ", (0, no.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, no.jsx)("div", {}), " ", (0, no.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, no.jsx)(fF, {
                                                translate: l
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                },
                dd = {
                    featureName: "AppShell",
                    team: "User > Consumer Apps > Platforms - Web & Backend",
                    features: {
                        page: {
                            counters: [{
                                name: "ShellStart",
                                dimensions: ["auth_state"]
                            }, {
                                name: "PageRender",
                                dimensions: ["page", "auth_state", "nav"]
                            }, {
                                name: "PageHeartbeat",
                                dimensions: ["page", "beat"]
                            }]
                        },
                        presence: {
                            counters: [{
                                name: "PresenceHeartbeat",
                                dimensions: ["outcome"]
                            }]
                        },
                        navigation: {
                            counters: [{
                                name: "NavLoad",
                                dimensions: ["outcome"]
                            }]
                        },
                        realtime: {
                            counters: [{
                                name: "RealtimeStart",
                                dimensions: ["outcome"]
                            }]
                        },
                        chat: {
                            counters: [{
                                name: "ChatLoad",
                                dimensions: ["outcome"]
                            }]
                        },
                        gameLaunch: {
                            counters: [{
                                name: "GameLaunch",
                                dimensions: ["outcome"]
                            }]
                        }
                    }
                },
                dh = aP(dd, {
                    publish: (_ = a3(dd.featureName), function(e, t) {
                        var r, n;
                        _(e, (r = function(e) {
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
                            host: "dotnet"
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
                    }),
                    featureName: dd.featureName
                }).trackCounter,
                dy = function(e) {
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
                        getBrowserTrackerId: pU,
                        isAuthenticated: pL.isAuthenticated,
                        getUserId: pL.userId,
                        isWindowsOrMac: function() {
                            return (0, eH.isWindows)() || (0, eH.isMac)()
                        },
                        onEvent: function(e, t) {
                            "startClientAttempted" === e && dh("GameLaunch", {
                                outcome: "attempted"
                            }), n(e, t)
                        },
                        installState: {
                            get: function() {
                                return t.isInstalling
                            },
                            set: function(e) {
                                t.isInstalling = e
                            }
                        },
                        onLaunchStarted: a,
                        onLaunchSucceeded: function() {
                            dh("GameLaunch", {
                                outcome: "succeeded"
                            }), i()
                        },
                        onLaunchFailed: function(e) {
                            dh("GameLaunch", {
                                outcome: "failed"
                            }), console.error(e), l()
                        },
                        openProtocolUrl: function(e) {
                            o("launchProtocolUrl: ".concat(JSON.stringify({
                                url: e
                            }))), u(e)
                        }
                    }
                };

            function dm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function db(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        u = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(u) : Promise.resolve(u).then(n, o)
            }

            function dv(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            db(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            db(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function dg(e) {
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

            function dw(e, t) {
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
                        if ("string" == typeof e) return dm(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dm(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dO(e, t) {
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
            var dP = {
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

            function dS(e) {
                return "edit" === e || "plugin" === e || "asset" === e
            }

            function dE() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "react-dialog-container",
                    t = document.getElementById(e);
                return t ? (iN().unmountComponentAtNode(t), t.innerHTML = "") : ((t = document.createElement("div")).id = e, document.body.appendChild(t)), t
            }

            function dj() {
                q().modal.close();
                var e = new K.TranslationResourceProvider,
                    t = e.getTranslationResource("Common.VisitGame"),
                    r = e.getTranslationResource("CommonUI.Controls");
                K.Dialog.open({
                    titleText: t.get("Heading.ErrorStartingGame"),
                    bodyContent: t.get("Response.Dialog.ErrorLaunching"),
                    acceptText: r.get("Action.OK") || "OK",
                    showDecline: !1
                })
            }

            function dA() {
                q().modal.close();
                var e = dE("react-launch-failure-dialog-container");
                (0, fx.renderWithErrorBoundary)((0, no.jsx)(pR, {
                    namespaces: p_.P,
                    children: (0, no.jsx)(pE, {
                        unmount: function() {
                            return iN().unmountComponentAtNode(e)
                        }
                    })
                }), e)
            }

            function dx(e) {
                q().modal.close();
                var t = {
                    launchMethod: "Protocol",
                    params: e
                };
                q()(fs).trigger(fs.startClientSucceededEvent, t), dP.isInstalling && (q()(fs).trigger(fs.successfulInstallEvent, t), dP.isInstalling = !1)
            }

            function dI(e) {
                var t = q()("iframe#gamelaunch");
                t.length > 0 && t.remove(), t = q()("<iframe id='gamelaunch' class='hidden'></iframe>").attr("src", e), q()("body").append(t);
                var r = new Event("ProtocolLaunchStartSelenium");
                window.dispatchEvent(r)
            }

            function dC(e) {
                return dv(function() {
                    var t, r, n;
                    return dO(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (o.trys.push([0, 5, , 6]), t = dS(null == e ? void 0 : e.launchMode), r = de(function() {
                                        return dt(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, eo.post({
                                                        url: "".concat(J().matchmakingApi, "/v1/client-status"),
                                                        withCredentials: !0
                                                    }, {
                                                        status: "Unknown"
                                                    })];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    })(), !(K.CurrentUser.isAuthenticated && !t)) return [3, 2];
                                return [4, Promise.all([de(function() {
                                    var e, t, r;
                                    return dt(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return n.trys.push([0, 2, , 3]), [4, eo.get({
                                                    url: "".concat(J().authApi, "/v1/client-assertion/"),
                                                    withCredentials: !0
                                                })];
                                            case 1:
                                                return e = n.sent().data, [3, 3];
                                            case 2:
                                                return n.sent(), [3, 3];
                                            case 3:
                                                return n.trys.push([3, 5, , 6]), [4, eo.post({
                                                    url: "".concat(J().authApi, "/v1/authentication-ticket/"),
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
                                return n = dw.apply(void 0, [o.sent(), 1])[0], [3, 4];
                            case 2:
                                return [4, r];
                            case 3:
                                o.sent(), o.label = 4;
                            case 4:
                                var a, i, l, u, c, s, f;
                                return a = n, u = dS(null == e ? void 0 : e.launchMode), c = dP.protocolUrlSeparator, s = "".concat(e.protocolName, ":"), (f = []).push(1), f.push("launchmode:".concat(e.launchMode)), a && (e.protocolName !== dP.protocolNameForStudio || 0 !== a.indexOf("Guest:")) && f.push("gameinfo:".concat(encodeURIComponent(a))), f.push("launchtime:".concat(e.launchTime)), u && K.CurrentUser.isAuthenticated && (f.push("distributorType:".concat("Global")), f.push("userId:".concat(K.CurrentUser.userId))), u && f.push("browser:".concat((0, fu.getCurrentBrowser)())), q().each(e.otherParams, function(e, t) {
                                    e === t ? f.push(e) : f.push("".concat(e, ":").concat(encodeURIComponent(t)))
                                }), s += f.join(c), null == (l = fs.gameLaunchLogger) || null == (i = l.logToConsole) || i.call(l, "launchProtocolUrl: ".concat(JSON.stringify({
                                    url: s,
                                    params: e
                                }))), dI(s), dx(e), [3, 6];
                            case 5:
                                return console.error(o.sent()), dj(), [3, 6];
                            case 6:
                                return [2]
                        }
                    })
                })()
            }

            function dT(e) {
                var t = dg({}, e);
                t.launchTime = Date.now(), t.otherParams.browsertrackerid = K.Cookies.getBrowserTrackerId(), t.otherParams.robloxLocale = dP.robloxLocale, t.otherParams.gameLocale = dP.gameLocale, t.protocolName === dP.protocolNameForStudio ? t.otherParams.channel = dP.studioChannel : dP.isOmitPlayerChannelForWinAndMacEnabled && ((0, eH.isWindows)() || (0, eH.isMac)()) || (t.otherParams.channel = dP.playerChannel), dP.isDuarAutoOptInEnabled && t.protocolName === dP.protocolNameForClient && !t.otherParams.LaunchExp && (dP.isDuarOptOutDisabled ? t.otherParams.LaunchExp = "InApp" : t.otherParams.LaunchExp = "PreferInApp"), q()(fs).trigger(fs.startClientAttemptedEvent, {
                    launchMethod: "Protocol",
                    params: t
                });
                var r = dC(t);
                return dP.showDialog(t), r
            }

            function dk(e) {
                return dP.isSharedGameLauncherEnabled ? (0, no.jsx)(pR, {
                    namespaces: p_.P,
                    children: (0, no.jsx)(Y.QueryClientProvider, {
                        client: fx.queryClient,
                        children: (0, no.jsx)(pP, dg({}, e))
                    })
                }) : (0, no.jsx)(fx.TranslationProvider, {
                    config: p_.P,
                    children: (0, no.jsx)(Y.QueryClientProvider, {
                        client: fx.queryClient,
                        children: (0, no.jsx)(dp, dg({}, e))
                    })
                })
            }

            function dN() {
                var e = " ";
                return K.Endpoints && K.Endpoints.Urls && (e = K.Endpoints.getAbsoluteUrl("/Game/PlaceLauncher.ashx")), "h" !== e[0] && (e = "http://".concat(window.location.host, "/Game/PlaceLauncher.ashx")), e.replace("placelauncher", "PlaceLauncher")
            }

            function dD(e, t) {
                var r = {
                    request: e,
                    browserTrackerId: K.Cookies.getBrowserTrackerId()
                };
                return q().extend(r, t), "".concat(dN(), "?").concat(q().param(r))
            }

            function dR(e) {
                return dv(function() {
                    var t, r, n;
                    return dO(this, function(o) {
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
                                                        var t = pq(e);
                                                        if (t) return t;
                                                        var r = new URL(e);
                                                        return (r.search = "", r.hash = "", pG.some(function(e) {
                                                            return e.test(r.pathname)
                                                        })) ? r.toString() : null
                                                    }(a))) return e && pJ("unsupportedPage"), [2, t];
                                                return o = [r], i = [{}], [4, pM()];
                                            case 1:
                                                return [4, pY.apply(void 0, o.concat([p0.apply(void 0, [p1.apply(void 0, [p0.apply(void 0, i.concat([l.sent()])), {
                                                    downloadSource: "installer"
                                                }]), e ? {
                                                    launchContext: e
                                                } : {}])]))];
                                            case 2:
                                                return n = l.sent(), e && pJ(n ? "minted" : "tokenFailed"), n && (t = "?".concat("token", "=").concat(n)), [2, t]
                                        }
                                    })
                                }, function() {
                                    var e = this,
                                        t = arguments;
                                    return new Promise(function(r, n) {
                                        var o = i.apply(e, t);

                                        function a(e) {
                                            pQ(o, r, n, a, l, "next", e)
                                        }

                                        function l(e) {
                                            pQ(o, r, n, a, l, "throw", e)
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

            function d_() {
                dP.isSharedGameLauncherEnabled = !0;
                var e = rD(dy({
                    state: dP,
                    getPlaceLauncherBaseUrl: dN,
                    triggerEvent: function(e, t) {
                        return q()(fs).trigger(fs["".concat(e, "Event")], t)
                    },
                    logToConsole: function(e) {
                        var t, r;
                        return null == (r = fs.gameLaunchLogger) || null == (t = r.logToConsole) ? void 0 : t.call(r, e)
                    },
                    showDialog: function(e, t) {
                        return dP.showDialog(e, t)
                    },
                    closeDialog: function() {
                        return q().modal.close()
                    },
                    showLaunchFailureDialog: dA,
                    openProtocolUrl: dI
                }));
                Object.assign(dP, {
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

            function dL() {
                return dv(function() {
                    return dO(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return q()(fs).trigger(fs.manualDownloadEvent, {
                                    launchMethod: "Protocol",
                                    params: {}
                                }), [4, dR()];
                            case 1:
                                return e.sent(), [2]
                        }
                    })
                })()
            }

            function dU(e) {
                switch (K.EnvironmentUrls.domain) {
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
            Object.assign(dP, {
                joinMultiplayerGame: function(e) {
                    var t = dP.protocolNameForClient,
                        r = dD("RequestGame", e),
                        n = !0 === e.isPlayTogetherGame;
                    return dT({
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
                    return dP.avatarParamEnabled && (e.avatar = "avatar"), dT({
                        protocolName: dP.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: e
                    })
                },
                tryAssetInStudio: function(e) {
                    var t = {
                        assetid: e
                    };
                    return dP.avatarParamEnabled && (t.avatar = "avatar"), dT({
                        protocolName: dP.protocolNameForStudio,
                        launchMode: "asset",
                        otherParams: t
                    })
                },
                openPluginInStudio: function(e) {
                    var t = {
                        pluginid: e
                    };
                    dP.avatarParamEnabled && (t.avatar = "avatar"), dT({
                        protocolName: dP.protocolNameForStudio,
                        launchMode: "plugin",
                        otherParams: t
                    })
                },
                editGameInStudio: function(e, t, r) {
                    var n, o, a, i, l, u, c = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                        s = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : "",
                        f = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : "";
                    dP.separateScriptParamsEnabled ? (u = {
                        task: c ? "StartTeamTest" : "EditPlace",
                        placeId: e,
                        universeId: t
                    }, !c && (s && (u.targetInstanceId = s), f && (u.annotationId = f))) : u = {
                        script: (n = e, o = t, a = r, i = "Edit.ashx", l = " ", K.Endpoints && K.Endpoints.Urls && (l = "".concat(K.Endpoints.getAbsoluteUrl("/Game/".concat(i)), "?")), "h" !== l[0] && (l = "http://".concat(window.location.host) + "/Game/".concat(i, "?")), l + q().param({
                            placeId: n,
                            upload: a ? n : "",
                            universeId: o,
                            testMode: !1
                        }))
                    }, dP.avatarParamEnabled && (u.avatar = "avatar"), dT({
                        protocolName: dP.protocolNameForStudio,
                        launchMode: "edit",
                        otherParams: u,
                        placeId: e
                    })
                },
                followPlayerIntoGame: function(e) {
                    return dT({
                        protocolName: dP.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: dD("RequestFollowUser", e)
                        }
                    })
                },
                joinGameInstance: function(e) {
                    var t = dP.protocolNameForClient,
                        r = dD("RequestGameJob", e),
                        n = !0 === e.isPlayTogetherGame;
                    return dT({
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
                    return dT({
                        protocolName: dP.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: dD("RequestPrivateGame", e)
                        },
                        placeId: e.placeId
                    })
                },
                playTogetherGame: function(e) {
                    return dT({
                        protocolName: dP.protocolNameForClient,
                        launchMode: "play",
                        otherParams: {
                            placelauncherurl: dD("RequestPlayTogetherGame", e)
                        },
                        placeId: e.placeId,
                        conversationId: e.conversationId
                    })
                },
                manualDownload: dL,
                attachManualDownloadToLink: function() {
                    return dv(function() {
                        return dO(this, function(e) {
                            return q()("body #GameLaunchManualInstallLink").click(function() {
                                return dv(function() {
                                    return dO(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, dL()];
                                            case 1:
                                                return e.sent(), [2, !1]
                                        }
                                    })
                                })()
                            }), [2]
                        })
                    })()
                },
                startDownload: dR,
                setLocationHref: dI,
                openDesktopUniversalApp: function() {
                    var e = {};
                    e.protocolName = dP.protocolNameForClient, e.launchTime = Date.now(), e.launchMode = "app", e.otherParams = {}, e.otherParams.browsertrackerid = K.Cookies.getBrowserTrackerId(), e.otherParams.robloxLocale = dP.robloxLocale, e.otherParams.gameLocale = dP.gameLocale, e.otherParams.LaunchExp = "InApp", q()(fs).trigger(fs.startClientAttemptedEvent, {
                        launchMethod: "Protocol",
                        params: e
                    });
                    var t = dC(e);
                    return dP.showDialog(e), t
                },
                startDeepLinkFlow: function(e) {
                    var t = dE();
                    (0, fx.renderWithErrorBoundary)(dk({
                        download: function() {
                            return dv(function() {
                                return dO(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return q()(fs).trigger(fs.beginInstallEvent, {
                                                launchMethod: "Protocol",
                                                params: {}
                                            }), dP.isInstalling = !0, [4, dR()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        },
                        launchGame: function() {
                            return dv(function() {
                                return dO(this, function(t) {
                                    return dI(e), [2]
                                })
                            })()
                        },
                        unmount: function() {
                            return iN().unmountComponentAtNode(t)
                        }
                    }), t), dI(e)
                },
                showDialog: function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : function() {
                            return dC(e)
                        },
                        r = dE(),
                        n = function() {
                            return iN().unmountComponentAtNode(r)
                        },
                        o = dS(null == e ? void 0 : e.launchMode);
                    (0, fx.renderWithErrorBoundary)(dk({
                        download: function() {
                            return dv(function() {
                                var t, r, a, i;
                                return dO(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            if (e.placeId && null != (t = window.localStorage.getItem("ref_info"))) {
                                                window.localStorage.removeItem("ref_info"), r = {};
                                                try {
                                                    r = JSON.parse(atob(t))
                                                } catch (e) {}
                                                e.referredByPlayerId = r[e.placeId]
                                            }
                                            if (q()(fs).trigger(fs.beginInstallEvent, {
                                                    launchMethod: "Protocol",
                                                    params: e
                                                }), dP.isInstalling = !0, !o) return [3, 1];
                                            return document.getElementById("downloadInstallerIFrame").src = "/download/studio", n(), [3, 4];
                                        case 1:
                                            var u, c, s;
                                            return [4, (u = null == e || null == (a = e.otherParams) ? void 0 : a.placelauncherurl, c = null == e || null == (i = e.otherParams) ? void 0 : i.LaunchExp, s = null == e ? void 0 : e.referredByPlayerId, p4(function() {
                                                var e;
                                                return p7(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            if (null == (e = p5(null != u ? u : "", c, s))) return pJ("noLaunchContext"), [2, void 0];
                                                            return [4, p4(function() {
                                                                var e;
                                                                return p7(this, function(t) {
                                                                    switch (t.label) {
                                                                        case 0:
                                                                            return t.trys.push([0, 2, , 3]), [4, nK().getAllValuesForLayer(pF)];
                                                                        case 1:
                                                                            return e = t.sent(), nK().logLayerExposure(pF), [2, !0 === e.IsGameJoinDeeplinkEnabled];
                                                                        case 2:
                                                                            return t.sent(), [2, !1];
                                                                        case 3:
                                                                            return [2]
                                                                    }
                                                                })
                                                            })()];
                                                        case 1:
                                                            if (!t.sent()) return pJ("ixpOff"), [2, void 0];
                                                            return [2, e]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            return [4, dR(l.sent())];
                                        case 3:
                                            l.sent(), l.label = 4;
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        launchGame: function() {
                            return dv(function() {
                                return dO(this, function(e) {
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
                showLaunchFailureDialog: dj,
                cleanUpAndLogSuccess: dx,
                startGameWithDeepLinkUrl: function(e, t) {
                    var r = {
                        launchMode: "play",
                        protocolName: dP.protocolNameForClient,
                        placeId: t
                    };
                    dP.showDialog(r), dI(e)
                },
                enableSharedGameLauncher: d_
            }), q()(document).ready(function() {
                fs.setGameLaunchInterface(dP);
                var e = q()("#PlaceLauncherStatusPanel");
                dP.protocolNameForClient = dU("roblox-player"), dP.protocolNameForStudio = dU("roblox-studio"), dP.protocolDetectionEnabled = !0, dP.separateScriptParamsEnabled = !0, dP.avatarParamEnabled = !0, dP.isJoinAttemptIdEnabled = !0, dP.robloxLocale = e.data("protocol-roblox-locale"), dP.gameLocale = e.data("protocol-game-locale");
                var t = e.data("protocol-channel-name");
                "string" == typeof t && "LIVE" !== t.toUpperCase() && (dP.channel = t);
                var r = e.data("protocol-studio-channel-name");
                "string" == typeof r && "LIVE" !== r.toUpperCase() && (dP.studioChannel = r);
                var n = e.data("protocol-player-channel-name");
                "string" == typeof n && "LIVE" !== n.toUpperCase() && (dP.playerChannel = n), dP.logger || void 0 === window.Roblox.ProtocolHandlerLogger || (dP.logger = window.Roblox.ProtocolHandlerLogger), dP.isDuarAutoOptInEnabled = e.data("is-duar-auto-opt-in-enabled"), dP.isDuarOptOutDisabled = e.data("is-duar-opt-out-disabled"), dP.isOmitPlayerChannelForWinAndMacEnabled = e.data("is-omit-player-channel-for-win-and-mac-enabled"), !0 === e.data("is-www-common-game-launcher-enabled") && d_()
            }), Object.assign(window.Roblox, {
                AuthenticationChecker: fl,
                GameLauncher: fs,
                GameLaunchLogger: fv,
                GamePlayEvents: fm,
                ProtocolHandlerClientInterface: dP,
                PlayButton: {
                    usePlayabilityStatus: eD,
                    PlayabilityStatuses: em,
                    launchGame: r5,
                    launchLogin: r8,
                    shouldShowUnplayableButton: ne,
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
                            p = void 0 === f ? s7 : f,
                            d = e.appsFlyerReferralProperties,
                            h = void 0 === d ? s7 : d,
                            y = e.disableLoadingState,
                            m = e.buttonClassName,
                            b = e.iconClassName,
                            v = e.purchaseIconClassName,
                            g = e.unplayableIconClassName,
                            w = e.redirectPurchaseUrl,
                            O = e.showDefaultPurchaseText,
                            P = e.shouldShowVpcPlayButtonUpsells,
                            S = e.playabilityStatusCtaOverrides,
                            E = e.pageContext,
                            j = e.playOnWebEnabled,
                            A = ss(o, r, u === em.PurchaseRequired || u === em.FiatPurchaseRequired),
                            x = A.isLoading,
                            I = A.productInfo,
                            C = A.productDetails,
                            T = [{
                                isEnabled: !!c,
                                primaryStatuses: s9,
                                render: function() {
                                    return (0, no.jsx)(sq, {
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
                                isEnabled: !!j,
                                primaryStatuses: fe,
                                render: function() {
                                    return (0, no.jsx)(sK, {
                                        placeId: r,
                                        universeId: o,
                                        eventProperties: p
                                    })
                                }
                            }],
                            k = !1;
                        switch (u) {
                            case void 0:
                                if (!y) {
                                    t = (0, no.jsx)(iu, {
                                        buttonClassName: m
                                    });
                                    break
                                }
                                t = (0, no.jsx)(ft, {
                                    universeId: o,
                                    placeId: r,
                                    rootPlaceId: n,
                                    privateServerLinkCode: a,
                                    gameInstanceId: i,
                                    status: em.Playable,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: h,
                                    disableLoadingState: y,
                                    buttonClassName: m,
                                    iconClassName: b,
                                    pageContext: E
                                });
                                break;
                            case em.GuestProhibited:
                            case em.Playable:
                                var N = null == S ? void 0 : S[u];
                                if (void 0 !== N) {
                                    t = N;
                                    break
                                }
                                t = (0, no.jsx)(ft, {
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
                                    iconClassName: b,
                                    pageContext: E
                                });
                                break;
                            case em.ContextualPlayabilityUnverifiedSeventeenPlusUser:
                            case em.ContextualPlayabilityAgeCheckRequired:
                                en(eA.ActionNeeded), t = (0, no.jsx)(s2, {
                                    universeId: o,
                                    buttonClassName: m,
                                    playabilityStatus: u,
                                    pageContext: E
                                });
                                break;
                            case em.PurchaseRequired:
                            case em.FiatPurchaseRequired:
                                var D = u === em.FiatPurchaseRequired ? !!(null == C ? void 0 : C.fiatPurchaseData) : !!(null == I ? void 0 : I.isForSale);
                                if (!x && !D) {
                                    en(eA.Unplayable), t = (0, no.jsx)(sY, {
                                        hideButtonText: s,
                                        buttonClassName: m,
                                        iconClassName: g
                                    });
                                    break
                                }
                                t = (0, no.jsx)(sW, {
                                    refetchPlayabilityStatus: l,
                                    universeId: o,
                                    placeId: r,
                                    hideButtonText: s,
                                    buttonClassName: m,
                                    iconClassName: v,
                                    redirectPurchaseUrl: w,
                                    playabilityStatus: u,
                                    showDefaultPurchaseText: O,
                                    pageContext: E
                                }), k = x;
                                break;
                            case em.FiatPurchaseDeviceRestricted:
                            case em.ContextualPlayabilityRegionalAvailability:
                                en(eA.Unplayable), t = (0, no.jsx)(sY, {
                                    hideButtonText: s,
                                    buttonClassName: m,
                                    iconClassName: g
                                });
                                break;
                            case em.ContextualPlayabilityAgeRecommendationParentalControls:
                                if (P) {
                                    en(eA.ActionNeeded), t = (0, no.jsx)(si, {
                                        universeId: o,
                                        buttonClassName: m,
                                        placeId: r,
                                        rootPlaceId: n,
                                        privateServerLinkCode: a,
                                        gameInstanceId: i,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: h,
                                        pageContext: E
                                    });
                                    break
                                }
                                en(eA.Unplayable), t = (0, no.jsx)(sY, {
                                    hideButtonText: s,
                                    buttonClassName: m,
                                    iconClassName: g
                                });
                                break;
                            case em.ContextualPlayabilityRequireParentApproval:
                                if (P) {
                                    en(eA.ActionNeeded), t = (0, no.jsx)(il, {
                                        universeId: o,
                                        buttonClassName: m,
                                        pageContext: E
                                    });
                                    break
                                }
                                en(eA.Unplayable), t = (0, no.jsx)(sY, {
                                    hideButtonText: s,
                                    buttonClassName: m,
                                    iconClassName: g
                                });
                                break;
                            case em.UnplayableOtherReason:
                            case em.GameUnapproved:
                            case em.IncorrectConfiguration:
                            case em.UniverseRootPlaceIsPrivate:
                            case em.InsufficientPermissionFriendsOnly:
                            case em.InsufficientPermissionGroupOnly:
                            case em.DeviceRestricted:
                            case em.UnderReview:
                            case em.AccountRestricted:
                            case em.TemporarilyUnavailable:
                            case em.ComplianceBlocked:
                            case em.ContextualPlayabilityRegionalCompliance:
                            case em.ContextualPlayabilityAgeGated:
                            case em.PlaceHasNoPublishedVersion:
                            case em.ContextualPlayabilityUnrated:
                            case em.ContextualPlayabilityAgeGatedByDescriptor:
                            case em.ContextualPlayabilityExperienceBlockedParentalControls:
                            case em.ContextualPlayabilityCoreGated:
                            case em.ContextualPlayabilityPlaytestDisabled:
                            case em.ContextualPlayabilityTrustedFriendRequired:
                            default:
                                en(eA.Unplayable), t = (0, no.jsx)(sY, {
                                    hideButtonText: s,
                                    buttonClassName: m,
                                    iconClassName: g
                                })
                        }
                        return (0, no.jsx)(sZ, {
                            primaryButton: t,
                            secondaryButton: s$(T, u),
                            isPrimaryButtonLoading: k
                        })
                    },
                    PlayButton: ft,
                    PurchaseButton: sW,
                    Error: function(e) {
                        var t = e.playabilityStatus,
                            r = e.errorClassName,
                            n = e.containerRef,
                            o = ia()(Object.hasOwn(ev, t) ? ev[t] : ev[em.UnplayableOtherReason]);
                        return (0, no.jsx)("span", {
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
                            l = ia(),
                            u = (0, $.useRef)(null),
                            c = fr(l, {
                                playabilityStatus: t,
                                shouldShowVpcPlayButtonUpsells: r,
                                shouldShowNoticeAgreementIfPlayable: o,
                                unplayableDisplayText: n
                            });
                        return (fo(u, {
                            universeId: i.universeId,
                            playabilityStatus: t,
                            pageContext: i.pageContext,
                            attributionId: i.attributionId,
                            contextualMessage: null == c ? void 0 : c.message
                        }), c) ? (0, no.jsx)("span", {
                            ref: u,
                            "data-testid": c.testId,
                            className: void 0 === a ? "contextual-message" : a,
                            children: c.message
                        }) : null
                    }
                }
            }), q()(document).ready(function() {
                fA();
                var e = (0, K.DeviceMeta)();
                (e.isUWPApp || e.isUniversalApp) && (fi.isJoinAttemptIdEnabled = !0, window.Roblox.AppHybridClientInterface = fi, fs.setGameLaunchInterface(fi)), fs.setGameLaunchLogger(fv)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "GameLaunch");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/gameLaunch-08ffa0545c603314.js.map