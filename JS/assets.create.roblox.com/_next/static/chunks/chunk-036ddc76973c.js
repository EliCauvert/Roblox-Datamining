;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "58221bf1-cf74-bb31-ece0-7fa0f2a4b374")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 570098, (e, t, n) => {
    var r = {
            872: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = c(e),
                        n = t[0],
                        r = t[1];
                    return (n + r) * 3 / 4 - r
                }, t.toByteArray = function(e) {
                    var t, n, a = c(e),
                        o = a[0],
                        s = a[1],
                        u = new i((o + s) * 3 / 4 - s),
                        l = 0,
                        d = s > 0 ? o - 4 : o;
                    for (n = 0; n < d; n += 4) t = r[e.charCodeAt(n)] << 18 | r[e.charCodeAt(n + 1)] << 12 | r[e.charCodeAt(n + 2)] << 6 | r[e.charCodeAt(n + 3)], u[l++] = t >> 16 & 255, u[l++] = t >> 8 & 255, u[l++] = 255 & t;
                    return 2 === s && (t = r[e.charCodeAt(n)] << 2 | r[e.charCodeAt(n + 1)] >> 4, u[l++] = 255 & t), 1 === s && (t = r[e.charCodeAt(n)] << 10 | r[e.charCodeAt(n + 1)] << 4 | r[e.charCodeAt(n + 2)] >> 2, u[l++] = t >> 8 & 255, u[l++] = 255 & t), u
                }, t.fromByteArray = function(e) {
                    for (var t, r = e.length, i = r % 3, a = [], o = 0, s = r - i; o < s; o += 16383) a.push(function(e, t, r) {
                        for (var i, a = [], o = t; o < r; o += 3) i = (e[o] << 16 & 0xff0000) + (e[o + 1] << 8 & 65280) + (255 & e[o + 2]), a.push(n[i >> 18 & 63] + n[i >> 12 & 63] + n[i >> 6 & 63] + n[63 & i]);
                        return a.join("")
                    }(e, o, o + 16383 > s ? s : o + 16383));
                    return 1 === i ? a.push(n[(t = e[r - 1]) >> 2] + n[t << 4 & 63] + "==") : 2 === i && a.push(n[(t = (e[r - 2] << 8) + e[r - 1]) >> 10] + n[t >> 4 & 63] + n[t << 2 & 63] + "="), a.join("")
                };
                for (var n = [], r = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", o = 0, s = a.length; o < s; ++o) n[o] = a[o], r[a.charCodeAt(o)] = o;

                function c(e) {
                    var t = e.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var n = e.indexOf("="); - 1 === n && (n = t);
                    var r = n === t ? 0 : 4 - n % 4;
                    return [n, r]
                }
                r[45] = 62, r[95] = 63
            },
            230: function(e, t, n) {
                "use strict";
                var r = n(872),
                    i = n(321),
                    a = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function o(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, s.prototype), t
                }

                function s(e, t, n) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return l(e)
                    }
                    return c(e, t, n)
                }

                function c(e, t, n) {
                    if ("string" == typeof e) {
                        var r = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !s.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var a = 0 | f(r, i),
                            c = o(a),
                            u = c.write(r, i);
                        return u !== a && (c = c.slice(0, u)), c
                    }
                    if (ArrayBuffer.isView(e)) return d(e);
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e);
                    if (U(e, ArrayBuffer) || e && U(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (U(e, SharedArrayBuffer) || e && U(e.buffer, SharedArrayBuffer))) return function(e, t, n) {
                        var r;
                        if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                        if (e.byteLength < t + (n || 0)) throw RangeError('"length" is outside of buffer bounds');
                        return Object.setPrototypeOf(r = void 0 === t && void 0 === n ? new Uint8Array(e) : void 0 === n ? new Uint8Array(e, t) : new Uint8Array(e, t, n), s.prototype), r
                    }(e, t, n);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var l = e.valueOf && e.valueOf();
                    if (null != l && l !== e) return s.from(l, t, n);
                    var p = function(e) {
                        if (s.isBuffer(e)) {
                            var t = 0 | h(e.length),
                                n = o(t);
                            return 0 === n.length || e.copy(n, 0, 0, t), n
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? o(0) : d(e) : "Buffer" === e.type && Array.isArray(e.data) ? d(e.data) : void 0
                    }(e);
                    if (p) return p;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return s.from(e[Symbol.toPrimitive]("string"), t, n);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + typeof e)
                }

                function u(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function l(e) {
                    return u(e), o(e < 0 ? 0 : 0 | h(e))
                }

                function d(e) {
                    for (var t = e.length < 0 ? 0 : 0 | h(e.length), n = o(t), r = 0; r < t; r += 1) n[r] = 255 & e[r];
                    return n
                }
                t.Buffer = s, t.SlowBuffer = function(e) {
                    return +e != e && (e = 0), s.alloc(+e)
                }, t.INSPECT_MAX_BYTES = 50, t.kMaxLength = 0x7fffffff, s.TYPED_ARRAY_SUPPORT = function() {
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
                }(), !s.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(s.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (s.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(s.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (s.isBuffer(this)) return this.byteOffset
                    }
                }), s.poolSize = 8192, s.from = function(e, t, n) {
                    return c(e, t, n)
                }, Object.setPrototypeOf(s.prototype, Uint8Array.prototype), Object.setPrototypeOf(s, Uint8Array), s.alloc = function(e, t, n) {
                    return (u(e), e <= 0) ? o(e) : void 0 !== t ? "string" == typeof n ? o(e).fill(t, n) : o(e).fill(t) : o(e)
                }, s.allocUnsafe = function(e) {
                    return l(e)
                }, s.allocUnsafeSlow = function(e) {
                    return l(e)
                };

                function h(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function f(e, t) {
                    if (s.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || U(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + typeof e);
                    var n = e.length,
                        r = arguments.length > 2 && !0 === arguments[2];
                    if (!r && 0 === n) return 0;
                    for (var i = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return n;
                        case "utf8":
                        case "utf-8":
                            return E(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * n;
                        case "hex":
                            return n >>> 1;
                        case "base64":
                            return x(e).length;
                        default:
                            if (i) return r ? -1 : E(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function p(e, t, n) {
                    var i, a, o, s = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === n || n > this.length) && (n = this.length), n <= 0 || (n >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, n) {
                                var r = e.length;
                                (!t || t < 0) && (t = 0), (!n || n < 0 || n > r) && (n = r);
                                for (var i = "", a = t; a < n; ++a) i += _[e[a]];
                                return i
                            }(this, t, n);
                        case "utf8":
                        case "utf-8":
                            return g(this, t, n);
                        case "ascii":
                            return function(e, t, n) {
                                var r = "";
                                n = Math.min(e.length, n);
                                for (var i = t; i < n; ++i) r += String.fromCharCode(127 & e[i]);
                                return r
                            }(this, t, n);
                        case "latin1":
                        case "binary":
                            return function(e, t, n) {
                                var r = "";
                                n = Math.min(e.length, n);
                                for (var i = t; i < n; ++i) r += String.fromCharCode(e[i]);
                                return r
                            }(this, t, n);
                        case "base64":
                            return i = this, a = t, o = n, 0 === a && o === i.length ? r.fromByteArray(i) : r.fromByteArray(i.slice(a, o));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, n) {
                                for (var r = e.slice(t, n), i = "", a = 0; a < r.length; a += 2) i += String.fromCharCode(r[a] + 256 * r[a + 1]);
                                return i
                            }(this, t, n);
                        default:
                            if (s) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), s = !0
                    }
                }

                function m(e, t, n) {
                    var r = e[t];
                    e[t] = e[n], e[n] = r
                }

                function y(e, t, n, r, i) {
                    var a;
                    if (0 === e.length) return -1;
                    if ("string" == typeof n ? (r = n, n = 0) : n > 0x7fffffff ? n = 0x7fffffff : n < -0x80000000 && (n = -0x80000000), (a = n *= 1) != a && (n = i ? 0 : e.length - 1), n < 0 && (n = e.length + n), n >= e.length)
                        if (i) return -1;
                        else n = e.length - 1;
                    else if (n < 0)
                        if (!i) return -1;
                        else n = 0;
                    if ("string" == typeof t && (t = s.from(t, r)), s.isBuffer(t)) return 0 === t.length ? -1 : v(e, t, n, r, i);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (i) return Uint8Array.prototype.indexOf.call(e, t, n);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, n);
                        return v(e, [t], n, r, i)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function v(e, t, n, r, i) {
                    var a, o = 1,
                        s = e.length,
                        c = t.length;
                    if (void 0 !== r && ("ucs2" === (r = String(r).toLowerCase()) || "ucs-2" === r || "utf16le" === r || "utf-16le" === r)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        o = 2, s /= 2, c /= 2, n /= 2
                    }

                    function u(e, t) {
                        return 1 === o ? e[t] : e.readUInt16BE(t * o)
                    }
                    if (i) {
                        var l = -1;
                        for (a = n; a < s; a++)
                            if (u(e, a) === u(t, -1 === l ? 0 : a - l)) {
                                if (-1 === l && (l = a), a - l + 1 === c) return l * o
                            } else - 1 !== l && (a -= a - l), l = -1
                    } else
                        for (n + c > s && (n = s - c), a = n; a >= 0; a--) {
                            for (var d = !0, h = 0; h < c; h++)
                                if (u(e, a + h) !== u(t, h)) {
                                    d = !1;
                                    break
                                } if (d) return a
                        }
                    return -1
                }
                s.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== s.prototype
                }, s.compare = function(e, t) {
                    if (U(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), U(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), !s.isBuffer(e) || !s.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var n = e.length, r = t.length, i = 0, a = Math.min(n, r); i < a; ++i)
                        if (e[i] !== t[i]) {
                            n = e[i], r = t[i];
                            break
                        } return n < r ? -1 : +(r < n)
                }, s.isEncoding = function(e) {
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
                }, s.concat = function(e, t) {
                    if (!Array.isArray(e)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === e.length) return s.alloc(0);
                    if (void 0 === t)
                        for (n = 0, t = 0; n < e.length; ++n) t += e[n].length;
                    var n, r = s.allocUnsafe(t),
                        i = 0;
                    for (n = 0; n < e.length; ++n) {
                        var a = e[n];
                        if (U(a, Uint8Array) && (a = s.from(a)), !s.isBuffer(a)) throw TypeError('"list" argument must be an Array of Buffers');
                        a.copy(r, i), i += a.length
                    }
                    return r
                }, s.byteLength = f, s.prototype._isBuffer = !0, s.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) m(this, t, t + 1);
                    return this
                }, s.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) m(this, t, t + 3), m(this, t + 1, t + 2);
                    return this
                }, s.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) m(this, t, t + 7), m(this, t + 1, t + 6), m(this, t + 2, t + 5), m(this, t + 3, t + 4);
                    return this
                }, s.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? g(this, 0, e) : p.apply(this, arguments)
                }, s.prototype.toLocaleString = s.prototype.toString, s.prototype.equals = function(e) {
                    if (!s.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === s.compare(this, e)
                }, s.prototype.inspect = function() {
                    var e = "",
                        n = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, n).replace(/(.{2})/g, "$1 ").trim(), this.length > n && (e += " ... "), "<Buffer " + e + ">"
                }, a && (s.prototype[a] = s.prototype.inspect), s.prototype.compare = function(e, t, n, r, i) {
                    if (U(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), !s.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + typeof e);
                    if (void 0 === t && (t = 0), void 0 === n && (n = e ? e.length : 0), void 0 === r && (r = 0), void 0 === i && (i = this.length), t < 0 || n > e.length || r < 0 || i > this.length) throw RangeError("out of range index");
                    if (r >= i && t >= n) return 0;
                    if (r >= i) return -1;
                    if (t >= n) return 1;
                    if (t >>>= 0, n >>>= 0, r >>>= 0, i >>>= 0, this === e) return 0;
                    for (var a = i - r, o = n - t, c = Math.min(a, o), u = this.slice(r, i), l = e.slice(t, n), d = 0; d < c; ++d)
                        if (u[d] !== l[d]) {
                            a = u[d], o = l[d];
                            break
                        } return a < o ? -1 : +(o < a)
                }, s.prototype.includes = function(e, t, n) {
                    return -1 !== this.indexOf(e, t, n)
                }, s.prototype.indexOf = function(e, t, n) {
                    return y(this, e, t, n, !0)
                }, s.prototype.lastIndexOf = function(e, t, n) {
                    return y(this, e, t, n, !1)
                };

                function g(e, t, n) {
                    n = Math.min(e.length, n);
                    for (var r = [], i = t; i < n;) {
                        var a, o, s, c, u = e[i],
                            l = null,
                            d = u > 239 ? 4 : u > 223 ? 3 : u > 191 ? 2 : 1;
                        if (i + d <= n) switch (d) {
                            case 1:
                                u < 128 && (l = u);
                                break;
                            case 2:
                                (192 & (a = e[i + 1])) == 128 && (c = (31 & u) << 6 | 63 & a) > 127 && (l = c);
                                break;
                            case 3:
                                a = e[i + 1], o = e[i + 2], (192 & a) == 128 && (192 & o) == 128 && (c = (15 & u) << 12 | (63 & a) << 6 | 63 & o) > 2047 && (c < 55296 || c > 57343) && (l = c);
                                break;
                            case 4:
                                a = e[i + 1], o = e[i + 2], s = e[i + 3], (192 & a) == 128 && (192 & o) == 128 && (192 & s) == 128 && (c = (15 & u) << 18 | (63 & a) << 12 | (63 & o) << 6 | 63 & s) > 65535 && c < 1114112 && (l = c)
                        }
                        null === l ? (l = 65533, d = 1) : l > 65535 && (l -= 65536, r.push(l >>> 10 & 1023 | 55296), l = 56320 | 1023 & l), r.push(l), i += d
                    }
                    var h = r,
                        f = h.length;
                    if (f <= 4096) return String.fromCharCode.apply(String, h);
                    for (var p = "", m = 0; m < f;) p += String.fromCharCode.apply(String, h.slice(m, m += 4096));
                    return p
                }

                function b(e, t, n) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > n) throw RangeError("Trying to access beyond buffer length")
                }

                function w(e, t, n, r, i, a) {
                    if (!s.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > i || t < a) throw RangeError('"value" argument is out of bounds');
                    if (n + r > e.length) throw RangeError("Index out of range")
                }

                function A(e, t, n, r, i, a) {
                    if (n + r > e.length || n < 0) throw RangeError("Index out of range")
                }

                function S(e, t, n, r, a) {
                    return t *= 1, n >>>= 0, a || A(e, t, n, 4, 34028234663852886e22, -34028234663852886e22), i.write(e, t, n, r, 23, 4), n + 4
                }

                function T(e, t, n, r, a) {
                    return t *= 1, n >>>= 0, a || A(e, t, n, 8, 17976931348623157e292, -17976931348623157e292), i.write(e, t, n, r, 52, 8), n + 8
                }
                s.prototype.write = function(e, t, n, r) {
                    if (void 0 === t) r = "utf8", n = this.length, t = 0;
                    else if (void 0 === n && "string" == typeof t) r = t, n = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(n) ? (n >>>= 0, void 0 === r && (r = "utf8")) : (r = n, n = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var i, a, o, s, c, u, l, d, h = this.length - t;
                    if ((void 0 === n || n > h) && (n = h), e.length > 0 && (n < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    r || (r = "utf8");
                    for (var f = !1;;) switch (r) {
                        case "hex":
                            return function(e, t, n, r) {
                                n = Number(n) || 0;
                                var i = e.length - n;
                                r ? (r = Number(r)) > i && (r = i) : r = i;
                                var a = t.length;
                                r > a / 2 && (r = a / 2);
                                for (var o = 0; o < r; ++o) {
                                    var s, c = parseInt(t.substr(2 * o, 2), 16);
                                    if ((s = c) != s) break;
                                    e[n + o] = c
                                }
                                return o
                            }(this, e, t, n);
                        case "utf8":
                        case "utf-8":
                            return i = t, a = n, I(E(e, this.length - i), this, i, a);
                        case "ascii":
                            return o = t, s = n, I(D(e), this, o, s);
                        case "latin1":
                        case "binary":
                            return function(e, t, n, r) {
                                return I(D(t), e, n, r)
                            }(this, e, t, n);
                        case "base64":
                            return c = t, u = n, I(x(e), this, c, u);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return l = t, d = n, I(function(e, t) {
                                for (var n, r, i = [], a = 0; a < e.length && !((t -= 2) < 0); ++a) r = (n = e.charCodeAt(a)) >> 8, i.push(n % 256), i.push(r);
                                return i
                            }(e, this.length - l), this, l, d);
                        default:
                            if (f) throw TypeError("Unknown encoding: " + r);
                            r = ("" + r).toLowerCase(), f = !0
                    }
                }, s.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, s.prototype.slice = function(e, t) {
                    var n = this.length;
                    e = ~~e, t = void 0 === t ? n : ~~t, e < 0 ? (e += n) < 0 && (e = 0) : e > n && (e = n), t < 0 ? (t += n) < 0 && (t = 0) : t > n && (t = n), t < e && (t = e);
                    var r = this.subarray(e, t);
                    return Object.setPrototypeOf(r, s.prototype), r
                }, s.prototype.readUIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || b(e, t, this.length);
                    for (var r = this[e], i = 1, a = 0; ++a < t && (i *= 256);) r += this[e + a] * i;
                    return r
                }, s.prototype.readUIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || b(e, t, this.length);
                    for (var r = this[e + --t], i = 1; t > 0 && (i *= 256);) r += this[e + --t] * i;
                    return r
                }, s.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || b(e, 1, this.length), this[e]
                }, s.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || b(e, 2, this.length), this[e] | this[e + 1] << 8
                }, s.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || b(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, s.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, s.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, s.prototype.readIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || b(e, t, this.length);
                    for (var r = this[e], i = 1, a = 0; ++a < t && (i *= 256);) r += this[e + a] * i;
                    return r >= (i *= 128) && (r -= Math.pow(2, 8 * t)), r
                }, s.prototype.readIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || b(e, t, this.length);
                    for (var r = t, i = 1, a = this[e + --r]; r > 0 && (i *= 256);) a += this[e + --r] * i;
                    return a >= (i *= 128) && (a -= Math.pow(2, 8 * t)), a
                }, s.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || b(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, s.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || b(e, 2, this.length);
                    var n = this[e] | this[e + 1] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, s.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || b(e, 2, this.length);
                    var n = this[e + 1] | this[e] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, s.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, s.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, s.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), i.read(this, e, !0, 23, 4)
                }, s.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || b(e, 4, this.length), i.read(this, e, !1, 23, 4)
                }, s.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || b(e, 8, this.length), i.read(this, e, !0, 52, 8)
                }, s.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || b(e, 8, this.length), i.read(this, e, !1, 52, 8)
                }, s.prototype.writeUIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n) - 1;
                        w(this, e, t, n, i, 0)
                    }
                    var a = 1,
                        o = 0;
                    for (this[t] = 255 & e; ++o < n && (a *= 256);) this[t + o] = e / a & 255;
                    return t + n
                }, s.prototype.writeUIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n) - 1;
                        w(this, e, t, n, i, 0)
                    }
                    var a = n - 1,
                        o = 1;
                    for (this[t + a] = 255 & e; --a >= 0 && (o *= 256);) this[t + a] = e / o & 255;
                    return t + n
                }, s.prototype.writeUInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, s.prototype.writeUInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeUInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeUInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, s.prototype.writeUInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n - 1);
                        w(this, e, t, n, i - 1, -i)
                    }
                    var a = 0,
                        o = 1,
                        s = 0;
                    for (this[t] = 255 & e; ++a < n && (o *= 256);) e < 0 && 0 === s && 0 !== this[t + a - 1] && (s = 1), this[t + a] = (e / o | 0) - s & 255;
                    return t + n
                }, s.prototype.writeIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n - 1);
                        w(this, e, t, n, i - 1, -i)
                    }
                    var a = n - 1,
                        o = 1,
                        s = 0;
                    for (this[t + a] = 255 & e; --a >= 0 && (o *= 256);) e < 0 && 0 === s && 0 !== this[t + a + 1] && (s = 1), this[t + a] = (e / o | 0) - s & 255;
                    return t + n
                }, s.prototype.writeInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, s.prototype.writeInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, s.prototype.writeInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeFloatLE = function(e, t, n) {
                    return S(this, e, t, !0, n)
                }, s.prototype.writeFloatBE = function(e, t, n) {
                    return S(this, e, t, !1, n)
                }, s.prototype.writeDoubleLE = function(e, t, n) {
                    return T(this, e, t, !0, n)
                }, s.prototype.writeDoubleBE = function(e, t, n) {
                    return T(this, e, t, !1, n)
                }, s.prototype.copy = function(e, t, n, r) {
                    if (!s.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (n || (n = 0), r || 0 === r || (r = this.length), t >= e.length && (t = e.length), t || (t = 0), r > 0 && r < n && (r = n), r === n || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (n < 0 || n >= this.length) throw RangeError("Index out of range");
                    if (r < 0) throw RangeError("sourceEnd out of bounds");
                    r > this.length && (r = this.length), e.length - t < r - n && (r = e.length - t + n);
                    var i = r - n;
                    if (this === e && "function" == typeof Uint8Array.prototype.copyWithin) this.copyWithin(t, n, r);
                    else if (this === e && n < t && t < r)
                        for (var a = i - 1; a >= 0; --a) e[a + t] = this[a + n];
                    else Uint8Array.prototype.set.call(e, this.subarray(n, r), t);
                    return i
                }, s.prototype.fill = function(e, t, n, r) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (r = t, t = 0, n = this.length) : "string" == typeof n && (r = n, n = this.length), void 0 !== r && "string" != typeof r) throw TypeError("encoding must be a string");
                        if ("string" == typeof r && !s.isEncoding(r)) throw TypeError("Unknown encoding: " + r);
                        if (1 === e.length) {
                            var i, a = e.charCodeAt(0);
                            ("utf8" === r && a < 128 || "latin1" === r) && (e = a)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < n) throw RangeError("Out of range index");
                    if (n <= t) return this;
                    if (t >>>= 0, n = void 0 === n ? this.length : n >>> 0, e || (e = 0), "number" == typeof e)
                        for (i = t; i < n; ++i) this[i] = e;
                    else {
                        var o = s.isBuffer(e) ? e : s.from(e, r),
                            c = o.length;
                        if (0 === c) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (i = 0; i < n - t; ++i) this[i + t] = o[i % c]
                    }
                    return this
                };
                var C = /[^+/0-9A-Za-z-_]/g;

                function E(e, t) {
                    t = t || 1 / 0;
                    for (var n, r = e.length, i = null, a = [], o = 0; o < r; ++o) {
                        if ((n = e.charCodeAt(o)) > 55295 && n < 57344) {
                            if (!i) {
                                if (n > 56319 || o + 1 === r) {
                                    (t -= 3) > -1 && a.push(239, 191, 189);
                                    continue
                                }
                                i = n;
                                continue
                            }
                            if (n < 56320) {
                                (t -= 3) > -1 && a.push(239, 191, 189), i = n;
                                continue
                            }
                            n = (i - 55296 << 10 | n - 56320) + 65536
                        } else i && (t -= 3) > -1 && a.push(239, 191, 189);
                        if (i = null, n < 128) {
                            if ((t -= 1) < 0) break;
                            a.push(n)
                        } else if (n < 2048) {
                            if ((t -= 2) < 0) break;
                            a.push(n >> 6 | 192, 63 & n | 128)
                        } else if (n < 65536) {
                            if ((t -= 3) < 0) break;
                            a.push(n >> 12 | 224, n >> 6 & 63 | 128, 63 & n | 128)
                        } else if (n < 1114112) {
                            if ((t -= 4) < 0) break;
                            a.push(n >> 18 | 240, n >> 12 & 63 | 128, n >> 6 & 63 | 128, 63 & n | 128)
                        } else throw Error("Invalid code point")
                    }
                    return a
                }

                function D(e) {
                    for (var t = [], n = 0; n < e.length; ++n) t.push(255 & e.charCodeAt(n));
                    return t
                }

                function x(e) {
                    return r.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(C, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function I(e, t, n, r) {
                    for (var i = 0; i < r && !(i + n >= t.length) && !(i >= e.length); ++i) t[i + n] = e[i];
                    return i
                }

                function U(e, t) {
                    return e instanceof t || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var _ = function() {
                    for (var e = "0123456789abcdef", t = Array(256), n = 0; n < 16; ++n)
                        for (var r = 16 * n, i = 0; i < 16; ++i) t[r + i] = e[n] + e[i];
                    return t
                }()
            },
            321: function(e, t) {
                t.read = function(e, t, n, r, i) {
                    var a, o, s = 8 * i - r - 1,
                        c = (1 << s) - 1,
                        u = c >> 1,
                        l = -7,
                        d = n ? i - 1 : 0,
                        h = n ? -1 : 1,
                        f = e[t + d];
                    for (d += h, a = f & (1 << -l) - 1, f >>= -l, l += s; l > 0; a = 256 * a + e[t + d], d += h, l -= 8);
                    for (o = a & (1 << -l) - 1, a >>= -l, l += r; l > 0; o = 256 * o + e[t + d], d += h, l -= 8);
                    if (0 === a) a = 1 - u;
                    else {
                        if (a === c) return o ? 0 / 0 : (f ? -1 : 1) * 2e308;
                        o += Math.pow(2, r), a -= u
                    }
                    return (f ? -1 : 1) * o * Math.pow(2, a - r)
                }, t.write = function(e, t, n, r, i, a) {
                    var o, s, c, u = 8 * a - i - 1,
                        l = (1 << u) - 1,
                        d = l >> 1,
                        h = 5960464477539062e-23 * (23 === i),
                        f = r ? 0 : a - 1,
                        p = r ? 1 : -1,
                        m = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || 1 / 0 === t ? (s = +!!isNaN(t), o = l) : (o = Math.floor(Math.log(t) / Math.LN2), t * (c = Math.pow(2, -o)) < 1 && (o--, c *= 2), o + d >= 1 ? t += h / c : t += h * Math.pow(2, 1 - d), t * c >= 2 && (o++, c /= 2), o + d >= l ? (s = 0, o = l) : o + d >= 1 ? (s = (t * c - 1) * Math.pow(2, i), o += d) : (s = t * Math.pow(2, d - 1) * Math.pow(2, i), o = 0)); i >= 8; e[n + f] = 255 & s, f += p, s /= 256, i -= 8);
                    for (o = o << i | s, u += i; u > 0; e[n + f] = 255 & o, f += p, o /= 256, u -= 8);
                    e[n + f - p] |= 128 * m
                }
            }
        },
        i = {};

    function a(e) {
        var t = i[e];
        if (void 0 !== t) return t.exports;
        var n = i[e] = {
                exports: {}
            },
            o = !0;
        try {
            r[e](n, n.exports, a), o = !1
        } finally {
            o && delete i[e]
        }
        return n.exports
    }
    a.ab = "/ROOT/links/@/next/16.4.5/0de1122c89b9724448b83052600528d4b1dce37d3127900fabdf5af34275552d/node_modules/next/dist/compiled/buffer/", t.exports = a(230)
}, 805386, e => {
    "use strict";
    e.s(["f", 0, 8])
}, 545154, 456954, 22600, e => {
    "use strict";
    var t = e.i(31611),
        n = e.i(739167),
        r = e.i(663196),
        i = e.i(927868),
        a = e.i(908374),
        o = e.i(570098),
        s = {},
        c = function(e, t, n, r, i) {
            var a = new Worker(s[t] || (s[t] = URL.createObjectURL(new Blob([e + ';addEventListener("error",function(e){e=e.error;postMessage({$e$:[e.message,e.code,e.stack]})})'], {
                type: "text/javascript"
            }))));
            return a.onmessage = function(e) {
                var t = e.data,
                    n = t.$e$;
                if (n) {
                    var r = Error(n[0]);
                    r.code = n[1], r.stack = n[2], i(r, null)
                } else i(null, t)
            }, a.postMessage(n, r), a
        },
        u = Uint8Array,
        l = Uint16Array,
        d = Int32Array,
        h = new u([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 0, 0, 0]),
        f = new u([0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 0, 0]),
        p = new u([16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]),
        m = function(e, t) {
            for (var n = new l(31), r = 0; r < 31; ++r) n[r] = t += 1 << e[r - 1];
            for (var i = new d(n[30]), r = 1; r < 30; ++r)
                for (var a = n[r]; a < n[r + 1]; ++a) i[a] = a - n[r] << 5 | r;
            return {
                b: n,
                r: i
            }
        },
        y = m(h, 2),
        v = y.b,
        g = y.r;
    v[28] = 258, g[258] = 28;
    for (var b = m(f, 0), w = b.b, A = b.r, S = new l(32768), T = 0; T < 32768; ++T) {
        var C = (43690 & T) >> 1 | (21845 & T) << 1;
        C = (61680 & (C = (52428 & C) >> 2 | (13107 & C) << 2)) >> 4 | (3855 & C) << 4, S[T] = ((65280 & C) >> 8 | (255 & C) << 8) >> 1
    }
    for (var E = function(e, t, n) {
            for (var r, i = e.length, a = 0, o = new l(t); a < i; ++a) e[a] && ++o[e[a] - 1];
            var s = new l(t);
            for (a = 1; a < t; ++a) s[a] = s[a - 1] + o[a - 1] << 1;
            if (n) {
                r = new l(1 << t);
                var c = 15 - t;
                for (a = 0; a < i; ++a)
                    if (e[a])
                        for (var u = a << 4 | e[a], d = t - e[a], h = s[e[a] - 1]++ << d, f = h | (1 << d) - 1; h <= f; ++h) r[S[h] >> c] = u
            } else
                for (r = new l(i), a = 0; a < i; ++a) e[a] && (r[a] = S[s[e[a] - 1]++] >> 15 - e[a]);
            return r
        }, D = new u(288), T = 0; T < 144; ++T) D[T] = 8;
    for (var T = 144; T < 256; ++T) D[T] = 9;
    for (var T = 256; T < 280; ++T) D[T] = 7;
    for (var T = 280; T < 288; ++T) D[T] = 8;
    for (var x = new u(32), T = 0; T < 32; ++T) x[T] = 5;
    var I = E(D, 9, 0),
        U = E(D, 9, 1),
        _ = E(x, 5, 0),
        O = E(x, 5, 1),
        k = function(e) {
            for (var t = e[0], n = 1; n < e.length; ++n) e[n] > t && (t = e[n]);
            return t
        },
        R = function(e, t, n) {
            var r = t / 8 | 0;
            return (e[r] | e[r + 1] << 8) >> (7 & t) & n
        },
        P = function(e, t) {
            var n = t / 8 | 0;
            return (e[n] | e[n + 1] << 8 | e[n + 2] << 16) >> (7 & t)
        },
        B = function(e) {
            return (e + 7) / 8 | 0
        },
        N = function(e, t, n) {
            return (null == t || t < 0) && (t = 0), (null == n || n > e.length) && (n = e.length), new u(e.subarray(t, n))
        },
        M = ["unexpected EOF", "invalid block type", "invalid length/literal", "invalid distance", "stream finished", "no stream handler", , "no callback", "invalid UTF-8 data", "extra field too long", "date not in range 1980-2099", "filename too long", "stream finishing", "invalid zip data"],
        L = function(e, t, n) {
            var r = Error(t || M[e]);
            if (r.code = e, Error.captureStackTrace && Error.captureStackTrace(r, L), !n) throw r;
            return r
        },
        G = function(e, t, n, r) {
            var i = e.length,
                a = r ? r.length : 0;
            if (!i || t.f && !t.l) return n || new u(0);
            var o = !n,
                s = o || 2 != t.i,
                c = t.i;
            o && (n = new u(3 * i));
            var l = function(e) {
                    var t = n.length;
                    if (e > t) {
                        var r = new u(Math.max(2 * t, e));
                        r.set(n), n = r
                    }
                },
                d = t.f || 0,
                m = t.p || 0,
                y = t.b || 0,
                g = t.l,
                b = t.d,
                A = t.m,
                S = t.n,
                T = 8 * i;
            do {
                if (!g) {
                    d = R(e, m, 1);
                    var C = R(e, m + 1, 3);
                    if (m += 3, C)
                        if (1 == C) g = U, b = O, A = 9, S = 5;
                        else if (2 == C) {
                        var D = R(e, m, 31) + 257,
                            x = R(e, m + 10, 15) + 4,
                            I = D + R(e, m + 5, 31) + 1;
                        m += 14;
                        for (var _ = new u(I), M = new u(19), G = 0; G < x; ++G) M[p[G]] = R(e, m + 3 * G, 7);
                        m += 3 * x;
                        for (var H = k(M), K = (1 << H) - 1, V = E(M, H, 1), G = 0; G < I;) {
                            var F = V[R(e, m, K)];
                            m += 15 & F;
                            var W = F >> 4;
                            if (W < 16) _[G++] = W;
                            else {
                                var j = 0,
                                    z = 0;
                                for (16 == W ? (z = 3 + R(e, m, 3), m += 2, j = _[G - 1]) : 17 == W ? (z = 3 + R(e, m, 7), m += 3) : 18 == W && (z = 11 + R(e, m, 127), m += 7); z--;) _[G++] = j
                            }
                        }
                        var q = _.subarray(0, D),
                            Y = _.subarray(D);
                        A = k(q), S = k(Y), g = E(q, A, 1), b = E(Y, S, 1)
                    } else L(1);
                    else {
                        var W = B(m) + 4,
                            X = e[W - 4] | e[W - 3] << 8,
                            Q = W + X;
                        if (Q > i) {
                            c && L(0);
                            break
                        }
                        s && l(y + X), n.set(e.subarray(W, Q), y), t.b = y += X, t.p = m = 8 * Q, t.f = d;
                        continue
                    }
                    if (m > T) {
                        c && L(0);
                        break
                    }
                }
                s && l(y + 131072);
                for (var $ = (1 << A) - 1, J = (1 << S) - 1, Z = m;; Z = m) {
                    var j = g[P(e, m) & $],
                        ee = j >> 4;
                    if ((m += 15 & j) > T) {
                        c && L(0);
                        break
                    }
                    if (j || L(2), ee < 256) n[y++] = ee;
                    else if (256 == ee) {
                        Z = m, g = null;
                        break
                    } else {
                        var et = ee - 254;
                        if (ee > 264) {
                            var G = ee - 257,
                                en = h[G];
                            et = R(e, m, (1 << en) - 1) + v[G], m += en
                        }
                        var er = b[P(e, m) & J],
                            ei = er >> 4;
                        er || L(3), m += 15 & er;
                        var Y = w[ei];
                        if (ei > 3) {
                            var en = f[ei];
                            Y += P(e, m) & (1 << en) - 1, m += en
                        }
                        if (m > T) {
                            c && L(0);
                            break
                        }
                        s && l(y + 131072);
                        var ea = y + et;
                        if (y < Y) {
                            var eo = a - Y,
                                es = Math.min(Y, ea);
                            for (eo + y < 0 && L(3); y < es; ++y) n[y] = r[eo + y]
                        }
                        for (; y < ea; ++y) n[y] = n[y - Y]
                    }
                }
                t.l = g, t.p = Z, t.b = y, t.f = d, g && (d = 1, t.m = A, t.d = b, t.n = S)
            } while (!d) return y != n.length && o ? N(n, 0, y) : n.subarray(0, y)
        },
        H = function(e, t, n) {
            n <<= 7 & t;
            var r = t / 8 | 0;
            e[r] |= n, e[r + 1] |= n >> 8
        },
        K = function(e, t, n) {
            n <<= 7 & t;
            var r = t / 8 | 0;
            e[r] |= n, e[r + 1] |= n >> 8, e[r + 2] |= n >> 16
        },
        V = function(e, t) {
            for (var n = [], r = 0; r < e.length; ++r) e[r] && n.push({
                s: r,
                f: e[r]
            });
            var i = n.length,
                a = n.slice();
            if (!i) return {
                t: X,
                l: 0
            };
            if (1 == i) {
                var o = new u(n[0].s + 1);
                return o[n[0].s] = 1, {
                    t: o,
                    l: 1
                }
            }
            n.sort(function(e, t) {
                return e.f - t.f
            }), n.push({
                s: -1,
                f: 25001
            });
            var s = n[0],
                c = n[1],
                d = 0,
                h = 1,
                f = 2;
            for (n[0] = {
                    s: -1,
                    f: s.f + c.f,
                    l: s,
                    r: c
                }; h != i - 1;) s = n[n[d].f < n[f].f ? d++ : f++], c = n[d != h && n[d].f < n[f].f ? d++ : f++], n[h++] = {
                s: -1,
                f: s.f + c.f,
                l: s,
                r: c
            };
            for (var p = a[0].s, r = 1; r < i; ++r) a[r].s > p && (p = a[r].s);
            var m = new l(p + 1),
                y = F(n[h - 1], m, 0);
            if (y > t) {
                var r = 0,
                    v = 0,
                    g = y - t,
                    b = 1 << g;
                for (a.sort(function(e, t) {
                        return m[t.s] - m[e.s] || e.f - t.f
                    }); r < i; ++r) {
                    var w = a[r].s;
                    if (m[w] > t) v += b - (1 << y - m[w]), m[w] = t;
                    else break
                }
                for (v >>= g; v > 0;) {
                    var A = a[r].s;
                    m[A] < t ? v -= 1 << t - m[A]++ - 1 : ++r
                }
                for (; r >= 0 && v; --r) {
                    var S = a[r].s;
                    m[S] == t && (--m[S], ++v)
                }
                y = t
            }
            return {
                t: new u(m),
                l: y
            }
        },
        F = function(e, t, n) {
            return -1 == e.s ? Math.max(F(e.l, t, n + 1), F(e.r, t, n + 1)) : t[e.s] = n
        },
        W = function(e) {
            for (var t = e.length; t && !e[--t];);
            for (var n = new l(++t), r = 0, i = e[0], a = 1, o = function(e) {
                    n[r++] = e
                }, s = 1; s <= t; ++s)
                if (e[s] == i && s != t) ++a;
                else {
                    if (!i && a > 2) {
                        for (; a > 138; a -= 138) o(32754);
                        a > 2 && (o(a > 10 ? a - 11 << 5 | 28690 : a - 3 << 5 | 12305), a = 0)
                    } else if (a > 3) {
                        for (o(i), --a; a > 6; a -= 6) o(8304);
                        a > 2 && (o(a - 3 << 5 | 8208), a = 0)
                    }
                    for (; a--;) o(i);
                    a = 1, i = e[s]
                } return {
                c: n.subarray(0, r),
                n: t
            }
        },
        j = function(e, t) {
            for (var n = 0, r = 0; r < t.length; ++r) n += e[r] * t[r];
            return n
        },
        z = function(e, t, n) {
            var r = n.length,
                i = B(t + 2);
            e[i] = 255 & r, e[i + 1] = r >> 8, e[i + 2] = 255 ^ e[i], e[i + 3] = 255 ^ e[i + 1];
            for (var a = 0; a < r; ++a) e[i + a + 4] = n[a];
            return (i + 4 + r) * 8
        },
        q = function(e, t, n, r, i, a, o, s, c, u, d) {
            H(t, d++, n), ++i[256];
            for (var m, y, v, g, b = V(i, 15), w = b.t, A = b.l, S = V(a, 15), T = S.t, C = S.l, U = W(w), O = U.c, k = U.n, R = W(T), P = R.c, B = R.n, N = new l(19), M = 0; M < O.length; ++M) ++N[31 & O[M]];
            for (var M = 0; M < P.length; ++M) ++N[31 & P[M]];
            for (var L = V(N, 7), G = L.t, F = L.l, q = 19; q > 4 && !G[p[q - 1]]; --q);
            var Y = u + 5 << 3,
                X = j(i, D) + j(a, x) + o,
                Q = j(i, w) + j(a, T) + o + 14 + 3 * q + j(N, G) + 2 * N[16] + 3 * N[17] + 7 * N[18];
            if (c >= 0 && Y <= X && Y <= Q) return z(t, d, e.subarray(c, c + u));
            if (H(t, d, 1 + (Q < X)), d += 2, Q < X) {
                m = E(w, A, 0), y = w, v = E(T, C, 0), g = T;
                var $ = E(G, F, 0);
                H(t, d, k - 257), H(t, d + 5, B - 1), H(t, d + 10, q - 4), d += 14;
                for (var M = 0; M < q; ++M) H(t, d + 3 * M, G[p[M]]);
                d += 3 * q;
                for (var J = [O, P], Z = 0; Z < 2; ++Z)
                    for (var ee = J[Z], M = 0; M < ee.length; ++M) {
                        var et = 31 & ee[M];
                        H(t, d, $[et]), d += G[et], et > 15 && (H(t, d, ee[M] >> 5 & 127), d += ee[M] >> 12)
                    }
            } else m = I, y = D, v = _, g = x;
            for (var M = 0; M < s; ++M) {
                var en = r[M];
                if (en > 255) {
                    var et = en >> 18 & 31;
                    K(t, d, m[et + 257]), d += y[et + 257], et > 7 && (H(t, d, en >> 23 & 31), d += h[et]);
                    var er = 31 & en;
                    K(t, d, v[er]), d += g[er], er > 3 && (K(t, d, en >> 5 & 8191), d += f[er])
                } else K(t, d, m[en]), d += y[en]
            }
            return K(t, d, m[256]), d + y[256]
        },
        Y = new d([65540, 131080, 131088, 131104, 262176, 1048704, 1048832, 2114560, 2117632]),
        X = new u(0),
        Q = function(e, t, n, r, i, a) {
            var o = a.z || e.length,
                s = new u(r + o + 5 * (1 + Math.ceil(o / 7e3)) + i),
                c = s.subarray(r, s.length - i),
                p = a.l,
                m = 7 & (a.r || 0);
            if (t) {
                m && (c[0] = a.r >> 3);
                for (var y = Y[t - 1], v = y >> 13, b = 8191 & y, w = (1 << n) - 1, S = a.p || new l(32768), T = a.h || new l(w + 1), C = Math.ceil(n / 3), E = 2 * C, D = function(t) {
                        return (e[t] ^ e[t + 1] << C ^ e[t + 2] << E) & w
                    }, x = new d(25e3), I = new l(288), U = new l(32), _ = 0, O = 0, k = a.i || 0, R = 0, P = a.w || 0, M = 0; k + 2 < o; ++k) {
                    var L = D(k),
                        G = 32767 & k,
                        H = T[L];
                    if (S[G] = H, T[L] = G, P <= k) {
                        var K = o - k;
                        if ((_ > 7e3 || R > 24576) && (K > 423 || !p)) {
                            m = q(e, c, 0, x, I, U, O, R, M, k - M, m), R = _ = O = 0, M = k;
                            for (var V = 0; V < 286; ++V) I[V] = 0;
                            for (var V = 0; V < 30; ++V) U[V] = 0
                        }
                        var F = 2,
                            W = 0,
                            j = b,
                            X = G - H & 32767;
                        if (K > 2 && L == D(k - X))
                            for (var Q = Math.min(v, K) - 1, $ = Math.min(32767, k), J = Math.min(258, K); X <= $ && --j && G != H;) {
                                if (e[k + F] == e[k + F - X]) {
                                    for (var Z = 0; Z < J && e[k + Z] == e[k + Z - X]; ++Z);
                                    if (Z > F) {
                                        if (F = Z, W = X, Z > Q) break;
                                        for (var ee = Math.min(X, Z - 2), et = 0, V = 0; V < ee; ++V) {
                                            var en = k - X + V & 32767,
                                                er = S[en],
                                                ei = en - er & 32767;
                                            ei > et && (et = ei, H = en)
                                        }
                                    }
                                }
                                H = S[G = H], X += G - H & 32767
                            }
                        if (W) {
                            x[R++] = 0x10000000 | g[F] << 18 | A[W];
                            var ea = 31 & g[F],
                                eo = 31 & A[W];
                            O += h[ea] + f[eo], ++I[257 + ea], ++U[eo], P = k + F, ++_
                        } else x[R++] = e[k], ++I[e[k]]
                    }
                }
                for (k = Math.max(k, P); k < o; ++k) x[R++] = e[k], ++I[e[k]];
                m = q(e, c, p, x, I, U, O, R, M, k - M, m), p || (a.r = 7 & m | c[m / 8 | 0] << 3, m -= 7, a.h = T, a.p = S, a.i = k, a.w = P)
            } else {
                for (var k = a.w || 0; k < o + p; k += 65535) {
                    var es = k + 65535;
                    es >= o && (c[m / 8 | 0] = p, es = o), m = z(c, m + 1, e.subarray(k, es))
                }
                a.i = o
            }
            return N(s, 0, r + B(m) + i)
        },
        $ = function() {
            for (var e = new Int32Array(256), t = 0; t < 256; ++t) {
                for (var n = t, r = 9; --r;) n = (1 & n && -0x12477ce0) ^ n >>> 1;
                e[t] = n
            }
            return e
        }(),
        J = function() {
            var e = -1;
            return {
                p: function(t) {
                    for (var n = e, r = 0; r < t.length; ++r) n = $[255 & n ^ t[r]] ^ n >>> 8;
                    e = n
                },
                d: function() {
                    return ~e
                }
            }
        },
        Z = function() {
            var e = 1,
                t = 0;
            return {
                p: function(n) {
                    for (var r = e, i = t, a = 0 | n.length, o = 0; o != a;) {
                        for (var s = Math.min(o + 2655, a); o < s; ++o) i += r += n[o];
                        r = (65535 & r) + 15 * (r >> 16), i = (65535 & i) + 15 * (i >> 16)
                    }
                    e = r, t = i
                },
                d: function() {
                    return e %= 65521, t %= 65521, (255 & e) << 24 | (65280 & e) << 8 | (255 & t) << 8 | t >> 8
                }
            }
        },
        ee = function(e, t, n, r, i) {
            if (!i && (i = {
                    l: 1
                }, t.dictionary)) {
                var a = t.dictionary.subarray(-32768),
                    o = new u(a.length + e.length);
                o.set(a), o.set(e, a.length), e = o, i.w = a.length
            }
            return Q(e, null == t.level ? 6 : t.level, null == t.mem ? i.l ? Math.ceil(1.5 * Math.max(8, Math.min(13, Math.log(e.length)))) : 20 : 12 + t.mem, n, r, i)
        },
        et = function(e, t) {
            var n = {};
            for (var r in e) n[r] = e[r];
            for (var r in t) n[r] = t[r];
            return n
        },
        en = function(e, t, n) {
            for (var r = e(), i = e.toString(), a = i.slice(i.indexOf("[") + 1, i.lastIndexOf("]")).replace(/\s+/g, "").split(","), o = 0; o < r.length; ++o) {
                var s = r[o],
                    c = a[o];
                if ("function" == typeof s) {
                    t += ";" + c + "=";
                    var u = s.toString();
                    if (s.prototype)
                        if (-1 != u.indexOf("[native code]")) {
                            var l = u.indexOf(" ", 8) + 1;
                            t += u.slice(l, u.indexOf("(", l))
                        } else
                            for (var d in t += u, s.prototype) t += ";" + c + ".prototype." + d + "=" + s.prototype[d].toString();
                    else t += u
                } else n[c] = s
            }
            return t
        },
        er = [],
        ei = function(e) {
            var t = [];
            for (var n in e) e[n].buffer && t.push((e[n] = new e[n].constructor(e[n])).buffer);
            return t
        },
        ea = function(e, t, n, r) {
            if (!er[n]) {
                for (var i = "", a = {}, o = e.length - 1, s = 0; s < o; ++s) i = en(e[s], i, a);
                er[n] = {
                    c: en(e[o], i, a),
                    e: a
                }
            }
            var u = et({}, er[n].e);
            return c(er[n].c + ";onmessage=function(e){for(var k in e.data)self[k]=e.data[k];onmessage=" + t.toString() + "}", n, u, ei(u), r)
        },
        eo = function() {
            return [u, l, d, h, f, p, v, w, U, O, S, M, E, k, R, P, B, N, L, G, e_, el, ed]
        },
        es = function() {
            return [u, l, d, h, f, p, g, A, I, D, _, x, S, Y, X, E, H, K, V, F, W, j, z, q, B, N, Q, ee, ex, el]
        },
        ec = function() {
            return [eb, ew]
        },
        eu = function() {
            return [eT]
        },
        el = function(e) {
            return postMessage(e, [e.buffer])
        },
        ed = function(e) {
            return e && {
                out: e.size && new u(e.size),
                dictionary: e.dictionary
            }
        },
        eh = function(e) {
            return e.ondata = function(e, t) {
                    return postMessage([e, t], [e.buffer])
                },
                function(t) {
                    t.data[0] ? (e.push(t.data[0], t.data[1]), postMessage([t.data[0].length])) : e.flush(t.data[1])
                }
        },
        ef = function(e, t, n, r, i, a, o) {
            var s, c = ea(e, r, i, function(e, n) {
                e ? (c.terminate(), t.ondata.call(t, e)) : Array.isArray(n) ? 1 == n.length ? (t.queuedSize -= n[0], t.ondrain && t.ondrain(n[0])) : (n[1] && c.terminate(), t.ondata.call(t, e, n[0], n[1])) : o(n)
            });
            c.postMessage(n), t.queuedSize = 0, t.push = function(e, n) {
                t.ondata || L(5), s && t.ondata(L(4, 0, 1), null, !!n), t.queuedSize += e.length, c.postMessage([e, s = n], e.buffer instanceof ArrayBuffer ? [e.buffer] : [])
            }, t.terminate = function() {
                c.terminate()
            }, a && (t.flush = function(e) {
                c.postMessage([0, e])
            })
        },
        ep = function(e, t) {
            return e[t] | e[t + 1] << 8
        },
        em = function(e, t) {
            return (e[t] | e[t + 1] << 8 | e[t + 2] << 16 | e[t + 3] << 24) >>> 0
        },
        ey = function(e, t) {
            return em(e, t) + 0x100000000 * em(e, t + 4)
        },
        ev = function(e, t, n) {
            for (; n; ++t) e[t] = n, n >>>= 8
        },
        eg = function(e, t) {
            var n = t.filename;
            if (e[0] = 31, e[1] = 139, e[2] = 8, e[8] = t.level < 2 ? 4 : 2 * (9 == t.level), e[9] = 3, 0 != t.mtime && ev(e, 4, Math.floor(new Date(t.mtime || Date.now()) / 1e3)), n) {
                e[3] = 8;
                for (var r = 0; r <= n.length; ++r) e[r + 10] = n.charCodeAt(r)
            }
        },
        eb = function(e) {
            (31 != e[0] || 139 != e[1] || 8 != e[2]) && L(6, "invalid gzip data");
            var t = e[3],
                n = 10;
            4 & t && (n += (e[10] | e[11] << 8) + 2);
            for (var r = (t >> 3 & 1) + (t >> 4 & 1); r > 0; r -= !e[n++]);
            return n + (2 & t)
        },
        ew = function(e) {
            var t = e.length;
            return (e[t - 4] | e[t - 3] << 8 | e[t - 2] << 16 | e[t - 1] << 24) >>> 0
        },
        eA = function(e) {
            return 10 + (e.filename ? e.filename.length + 1 : 0)
        },
        eS = function(e, t) {
            var n = t.level;
            if (e[0] = 120, e[1] = (0 == n ? 0 : n < 6 ? 1 : 9 == n ? 3 : 2) << 6 | (t.dictionary && 32), e[1] |= 31 - (e[0] << 8 | e[1]) % 31, t.dictionary) {
                var r = Z();
                r.p(t.dictionary), ev(e, 2, r.d())
            }
        },
        eT = function(e, t) {
            return ((15 & e[0]) != 8 || e[0] >> 4 > 7 || (e[0] << 8 | e[1]) % 31) && L(6, "invalid zlib data"), (e[1] >> 5 & 1) == +!t && L(6, "invalid zlib data: " + (32 & e[1] ? "need" : "unexpected") + " dictionary"), (e[1] >> 3 & 4) + 2
        };

    function eC(e, t) {
        return "function" == typeof e && (t = e, e = {}), this.ondata = t, e
    }
    var eE = function() {
            function e(e, t) {
                if ("function" == typeof e && (t = e, e = {}), this.ondata = t, this.o = e || {}, this.s = {
                        l: 0,
                        i: 32768,
                        w: 32768,
                        z: 32768
                    }, this.b = new u(98304), this.o.dictionary) {
                    var n = this.o.dictionary.subarray(-32768);
                    this.b.set(n, 32768 - n.length), this.s.i = 32768 - n.length
                }
            }
            return e.prototype.p = function(e, t) {
                this.ondata(ee(e, this.o, 0, 0, this.s), t)
            }, e.prototype.push = function(e, t) {
                this.ondata || L(5), this.s.l && L(4);
                var n = e.length + this.s.z;
                if (n > this.b.length) {
                    if (n > 2 * this.b.length - 32768) {
                        var r = new u(-32768 & n);
                        r.set(this.b.subarray(0, this.s.z)), this.b = r
                    }
                    var i = this.b.length - this.s.z;
                    this.b.set(e.subarray(0, i), this.s.z), this.s.z = this.b.length, this.p(this.b, !1), this.b.set(this.b.subarray(-32768)), this.b.set(e.subarray(i), 32768), this.s.z = e.length - i + 32768, this.s.i = 32766, this.s.w = 32768
                } else this.b.set(e, this.s.z), this.s.z += e.length;
                this.s.l = 1 & t, (this.s.z > this.s.w + 8191 || t) && (this.p(this.b, t || !1), this.s.w = this.s.i, this.s.i -= 2), t && (this.s = this.o = {}, this.b = X)
            }, e.prototype.flush = function(e) {
                if (this.ondata || L(5), this.s.l && L(4), this.p(this.b, !1), this.s.w = this.s.i, this.s.i -= 2, e) {
                    var t = new u(6);
                    t[0] = this.s.r >> 3;
                    var n = z(t, this.s.r, X);
                    this.s.r = 0, this.ondata(t.subarray(0, n >> 3), !1)
                }
            }, e
        }(),
        eD = function(e, t) {
            ef([es, function() {
                return [eh, eE]
            }], this, eC.call(this, e, t), function(e) {
                onmessage = eh(new eE(e.data))
            }, 6, 1)
        };

    function ex(e, t) {
        return ee(e, t || {}, 0, 0)
    }
    var eI = function() {
            function e(e, t) {
                "function" == typeof e && (t = e, e = {}), this.ondata = t;
                var n = e && e.dictionary && e.dictionary.subarray(-32768);
                this.s = {
                    i: 0,
                    b: n ? n.length : 0
                }, this.o = new u(32768), this.p = new u(0), n && this.o.set(n)
            }
            return e.prototype.e = function(e) {
                if (this.ondata || L(5), this.d && L(4), this.p.length) {
                    if (e.length) {
                        var t = new u(this.p.length + e.length);
                        t.set(this.p), t.set(e, this.p.length), this.p = t
                    }
                } else this.p = e
            }, e.prototype.c = function(e) {
                this.s.i = +(this.d = e || !1);
                var t = this.s.b,
                    n = G(this.p, this.s, this.o);
                this.ondata(N(n, t, this.s.b), this.d), this.o = N(n, this.s.b - 32768), this.s.b = this.o.length, this.p = N(this.p, this.s.p / 8 | 0), this.s.p &= 7
            }, e.prototype.push = function(e, t) {
                this.e(e), this.c(t)
            }, e
        }(),
        eU = function(e, t) {
            ef([eo, function() {
                return [eh, eI]
            }], this, eC.call(this, e, t), function(e) {
                onmessage = eh(new eI(e.data))
            }, 7, 0)
        };

    function e_(e, t) {
        return G(e, {
            i: 2
        }, t && t.out, t && t.dictionary)
    }(function() {
        function e(e, t) {
            this.c = J(), this.l = 0, this.v = 1, eE.call(this, e, t)
        }
        e.prototype.push = function(e, t) {
            this.c.p(e), this.l += e.length, eE.prototype.push.call(this, e, t)
        }, e.prototype.p = function(e, t) {
            var n = ee(e, this.o, this.v && eA(this.o), t && 8, this.s);
            this.v && (eg(n, this.o), this.v = 0), t && (ev(n, n.length - 8, this.c.d()), ev(n, n.length - 4, this.l)), this.ondata(n, t)
        }, e.prototype.flush = function(e) {
            eE.prototype.flush.call(this, e)
        }
    })();
    var eO = function() {
            function e(e, t) {
                this.v = 1, this.r = 0, eI.call(this, e, t)
            }
            return e.prototype.push = function(e, t) {
                if (eI.prototype.e.call(this, e), this.r += e.length, this.v) {
                    var n = this.p.subarray(this.v - 1),
                        r = n.length > 3 ? eb(n) : 4;
                    if (r > n.length) {
                        if (!t) return
                    } else this.v > 1 && this.onmember && this.onmember(this.r - n.length);
                    this.p = n.subarray(r), this.v = 0
                }
                eI.prototype.c.call(this, 0), this.s.f && !this.s.l ? (this.v = B(this.s.p) + 9, this.s = {
                    i: 0
                }, this.o = new u(0), this.push(new u(0), t)) : t && eI.prototype.c.call(this, t)
            }, e
        }(),
        ek = function(e, t) {
            var n = this;
            ef([eo, ec, function() {
                return [eh, eI, eO]
            }], this, eC.call(this, e, t), function(e) {
                var t = new eO(e.data);
                t.onmember = function(e) {
                    return postMessage(e)
                }, onmessage = eh(t)
            }, 9, 0, function(e) {
                return n.onmember && n.onmember(e)
            })
        },
        eR = (function() {
            function e(e, t) {
                this.c = Z(), this.v = 1, eE.call(this, e, t)
            }
            e.prototype.push = function(e, t) {
                this.c.p(e), eE.prototype.push.call(this, e, t)
            }, e.prototype.p = function(e, t) {
                var n = ee(e, this.o, this.v && (this.o.dictionary ? 6 : 2), t && 4, this.s);
                this.v && (eS(n, this.o), this.v = 0), t && ev(n, n.length - 4, this.c.d()), this.ondata(n, t)
            }, e.prototype.flush = function(e) {
                eE.prototype.flush.call(this, e)
            }
        }(), function() {
            function e(e, t) {
                eI.call(this, e, t), this.v = e && e.dictionary ? 2 : 1
            }
            return e.prototype.push = function(e, t) {
                if (eI.prototype.e.call(this, e), this.v) {
                    if (this.p.length < 6 && !t) return;
                    this.p = this.p.subarray(eT(this.p, this.v - 1)), this.v = 0
                }
                t && (this.p.length < 4 && L(6, "invalid zlib data"), this.p = this.p.subarray(0, -4)), eI.prototype.c.call(this, t)
            }, e
        }()),
        eP = function(e, t) {
            ef([eo, eu, function() {
                return [eh, eI, eR]
            }], this, eC.call(this, e, t), function(e) {
                onmessage = eh(new eR(e.data))
            }, 11, 0)
        },
        eB = function() {
            function e(e, t) {
                this.o = eC.call(this, e, t) || {}, this.G = eO, this.I = eI, this.Z = eR
            }
            return e.prototype.i = function() {
                var e = this;
                this.s.ondata = function(t, n) {
                    e.ondata(t, n)
                }
            }, e.prototype.push = function(e, t) {
                if (this.ondata || L(5), this.s) this.s.push(e, t);
                else {
                    if (this.p && this.p.length) {
                        var n = new u(this.p.length + e.length);
                        n.set(this.p), n.set(e, this.p.length)
                    } else this.p = e;
                    this.p.length > 2 && (this.s = 31 == this.p[0] && 139 == this.p[1] && 8 == this.p[2] ? new this.G(this.o) : (15 & this.p[0]) != 8 || this.p[0] >> 4 > 7 || (this.p[0] << 8 | this.p[1]) % 31 ? new this.I(this.o) : new this.Z(this.o), this.i(), this.s.push(this.p, t), this.p = null)
                }
            }, e
        }();

    function eN(e, t) {
        eB.call(this, e, t), this.queuedSize = 0, this.G = ek, this.I = eU, this.Z = eP
    }
    eN.prototype.i = function() {
        var e = this;
        this.s.ondata = function(t, n, r) {
            e.ondata(t, n, r)
        }, this.s.ondrain = function(t) {
            e.queuedSize -= t, e.ondrain && e.ondrain(t)
        }
    }, eN.prototype.push = function(e, t) {
        this.queuedSize += e.length, eB.prototype.push.call(this, e, t)
    };
    var eM = "u" > typeof TextEncoder && new TextEncoder,
        eL = "u" > typeof TextDecoder && new TextDecoder,
        eG = 0;
    try {
        eL.decode(X, {
            stream: !0
        }), eG = 1
    } catch (e) {}
    var eH = function(e) {
        for (var t = "", n = 0;;) {
            var r = e[n++],
                i = (r > 127) + (r > 223) + (r > 239);
            if (n + i > e.length) return {
                s: t,
                r: N(e, n - 1)
            };
            i ? 3 == i ? t += String.fromCharCode(55296 | (r = ((15 & r) << 18 | (63 & e[n++]) << 12 | (63 & e[n++]) << 6 | 63 & e[n++]) - 65536) >> 10, 56320 | 1023 & r) : 1 & i ? t += String.fromCharCode((31 & r) << 6 | 63 & e[n++]) : t += String.fromCharCode((15 & r) << 12 | (63 & e[n++]) << 6 | 63 & e[n++]) : t += String.fromCharCode(r)
        }
    };

    function eK(e, t) {
        if (t) {
            for (var n = new u(e.length), r = 0; r < e.length; ++r) n[r] = e.charCodeAt(r);
            return n
        }
        if (eM) return eM.encode(e);
        for (var i = e.length, a = new u(e.length + (e.length >> 1)), o = 0, s = function(e) {
                a[o++] = e
            }, r = 0; r < i; ++r) {
            if (o + 5 > a.length) {
                var c = new u(o + 8 + (i - r << 1));
                c.set(a), a = c
            }
            var l = e.charCodeAt(r);
            l < 128 || t ? s(l) : (l < 2048 ? s(192 | l >> 6) : (l > 55295 && l < 57344 ? (s(240 | (l = 65536 + (1047552 & l) | 1023 & e.charCodeAt(++r)) >> 18), s(128 | l >> 12 & 63)) : s(224 | l >> 12), s(128 | l >> 6 & 63)), s(128 | 63 & l))
        }
        return N(a, 0, o)
    }

    function eV(e, t) {
        if (t) {
            for (var n = "", r = 0; r < e.length; r += 16384) n += String.fromCharCode.apply(null, e.subarray(r, r + 16384));
            return n
        }
        if (eL) return eL.decode(e);
        var i = eH(e),
            a = i.s,
            n = i.r;
        return n.length && L(8), a
    }(function(e) {
        this.ondata = e, eG ? this.t = new TextDecoder : this.p = X
    }).prototype.push = function(e, t) {
        if (this.ondata || L(5), t = !!t, this.t) {
            this.ondata(this.t.decode(e, {
                stream: !0
            }), t), t && (this.t.decode().length && L(8), this.t = null);
            return
        }
        this.p || L(4);
        var n = new u(this.p.length + e.length);
        n.set(this.p), n.set(e, this.p.length);
        var r = eH(n),
            i = r.s,
            a = r.r;
        t ? (a.length && L(8), this.p = null) : this.p = a, this.ondata(i, t)
    }, (function(e) {
        this.ondata = e
    }).prototype.push = function(e, t) {
        this.ondata || L(5), this.d && L(4), this.ondata(eK(e), this.d = t || !1)
    };
    var eF = function(e) {
            return 1 == e ? 3 : e < 6 ? 2 : +(9 == e)
        },
        eW = function(e, t, n, r, i, a, o) {
            var s = 0xffffffff == i,
                c = 0xffffffff == a,
                u = 0xffffffff == o,
                l = t + n;
            if (r && s + c + u) {
                for (; t + 4 < l; t += 4 + ep(e, t + 2))
                    if (1 == ep(e, t)) return [s ? ey(e, t + 4 + 8 * c) : i, c ? ey(e, t + 4) : a, u ? ey(e, t + 4 + 8 * (c + s)) : o, 1];
                r < 2 && L(13)
            }
            return [i, a, o, 0]
        },
        ej = function(e) {
            var t = 0;
            if (e)
                for (var n in e) {
                    var r = e[n].length;
                    r > 65535 && L(9), t += r + 4
                }
            return t
        },
        ez = function(e, t, n, r, i, a, o, s) {
            var c = r.length,
                u = n.extra,
                l = s && s.length,
                d = ej(u);
            ev(e, t, null != o ? 0x2014b50 : 0x4034b50), t += 4, null != o && (e[t++] = 20, e[t++] = n.os), e[t] = 20, t += 2, e[t++] = n.flag << 1 | (a < 0 && 8), e[t++] = i && 8, e[t++] = 255 & n.compression, e[t++] = n.compression >> 8;
            var h = new Date(null == n.mtime ? Date.now() : n.mtime),
                f = h.getFullYear() - 1980;
            if ((f < 0 || f > 119) && L(10), ev(e, t, f << 25 | h.getMonth() + 1 << 21 | h.getDate() << 16 | h.getHours() << 11 | h.getMinutes() << 5 | h.getSeconds() >> 1), t += 4, -1 != a && (ev(e, t, n.crc), ev(e, t + 4, a < 0 ? -a - 2 : a), ev(e, t + 8, n.size)), ev(e, t + 12, c), ev(e, t + 14, d), t += 16, null != o && (ev(e, t, l), ev(e, t + 6, n.attrs), ev(e, t + 10, o), t += 14), e.set(r, t), t += c, d)
                for (var p in u) {
                    var m = u[p],
                        y = m.length;
                    ev(e, t, +p), ev(e, t + 2, y), e.set(m, t + 4), t += 4 + y
                }
            return l && (e.set(s, t), t += l), t
        },
        eq = function(e, t, n, r, i) {
            ev(e, t, 0x6054b50), ev(e, t + 8, n), ev(e, t + 10, n), ev(e, t + 12, r), ev(e, t + 16, i)
        },
        eY = function() {
            function e(e) {
                this.filename = e, this.c = J(), this.size = 0, this.compression = 0
            }
            return e.prototype.process = function(e, t) {
                this.ondata(null, e, t)
            }, e.prototype.push = function(e, t) {
                this.ondata || L(5), this.c.p(e), this.size += e.length, t && (this.crc = this.c.d()), this.process(e, t || !1)
            }, e
        }();

    function eX(e, t) {
        var n = this;
        t || (t = {}), eY.call(this, e), this.d = new eE(t, function(e, t) {
            n.ondata(null, e, t)
        }), this.compression = 8, this.flag = eF(t.level)
    }

    function eQ(e, t) {
        var n = this;
        t || (t = {}), eY.call(this, e), this.d = new eD(t, function(e, t, r) {
            n.ondata(e, t, r)
        }), this.compression = 8, this.flag = eF(t.level), this.terminate = this.d.terminate
    }

    function e$(e) {
        this.ondata = e, this.u = [], this.d = 1
    }
    eX.prototype.process = function(e, t) {
        try {
            this.d.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eX.prototype.push = function(e, t) {
        eY.prototype.push.call(this, e, t)
    }, eQ.prototype.process = function(e, t) {
        this.d.push(e, t)
    }, eQ.prototype.push = function(e, t) {
        eY.prototype.push.call(this, e, t)
    }, e$.prototype.add = function(e) {
        var t = this;
        if (this.ondata || L(5), 2 & this.d) this.ondata(L(4 + (1 & this.d) * 8, 0, 1), null, !1);
        else {
            var n = eK(e.filename),
                r = n.length,
                i = e.comment,
                a = i && eK(i),
                o = r != e.filename.length || a && i.length != a.length,
                s = r + ej(e.extra) + 30;
            r > 65535 && this.ondata(L(11, 0, 1), null, !1);
            var c = new u(s);
            ez(c, 0, e, n, o, -1);
            var l = [c],
                d = function() {
                    for (var e = 0, n = l; e < n.length; e++) {
                        var r = n[e];
                        t.ondata(null, r, !1)
                    }
                    l = []
                },
                h = this.d;
            this.d = 0;
            var f = this.u.length,
                p = et(e, {
                    f: n,
                    u: o,
                    o: a,
                    t: function() {
                        e.terminate && e.terminate()
                    },
                    r: function() {
                        if (d(), h) {
                            var e = t.u[f + 1];
                            e ? e.r() : t.d = 1
                        }
                        h = 1
                    }
                }),
                m = 0;
            e.ondata = function(n, r, i) {
                if (n) t.ondata(n, r, i), t.terminate();
                else if (m += r.length, l.push(r), i) {
                    var a = new u(16);
                    ev(a, 0, 0x8074b50), ev(a, 4, e.crc), ev(a, 8, m), ev(a, 12, e.size), l.push(a), p.c = m, p.b = s + m + 16, p.crc = e.crc, p.size = e.size, h && p.r(), h = 1
                } else h && d()
            }, this.u.push(p)
        }
    }, e$.prototype.end = function() {
        var e = this;
        2 & this.d ? this.ondata(L(4 + (1 & this.d) * 8, 0, 1), null, !0) : (this.d ? this.e() : this.u.push({
            r: function() {
                1 & e.d && (e.u.splice(-1, 1), e.e())
            },
            t: function() {}
        }), this.d = 3)
    }, e$.prototype.e = function() {
        for (var e = 0, t = 0, n = 0, r = 0, i = this.u; r < i.length; r++) {
            var a = i[r];
            n += 46 + a.f.length + ej(a.extra) + (a.o ? a.o.length : 0)
        }
        for (var o = new u(n + 22), s = 0, c = this.u; s < c.length; s++) {
            var a = c[s];
            ez(o, e, a, a.f, a.u, -a.c - 2, t, a.o), e += 46 + a.f.length + ej(a.extra) + (a.o ? a.o.length : 0), t += a.b
        }
        eq(o, e, this.u.length, n, t), this.ondata(null, o, !0), this.d = 2
    }, e$.prototype.terminate = function() {
        for (var e = 0, t = this.u; e < t.length; e++) t[e].t();
        this.d = 2
    };
    var eJ = function() {
        function e() {}
        return e.prototype.push = function(e, t) {
            this.ondata(null, e, t)
        }, e.compression = 0, e
    }();

    function eZ() {
        var e = this;
        this.i = new eI(function(t, n) {
            e.ondata(null, t, n)
        })
    }

    function e0(e, t) {
        var n = this;
        t < 32e4 ? this.i = new eI(function(e, t) {
            n.ondata(null, e, t)
        }) : (this.i = new eU(function(e, t, r) {
            n.ondata(e, t, r)
        }), this.terminate = this.i.terminate)
    }

    function e1(e) {
        this.onfile = e, this.k = [], this.o = {
            0: eJ
        }, this.p = X
    }
    eZ.prototype.push = function(e, t) {
        try {
            this.i.push(e, t)
        } catch (e) {
            this.ondata(e, null, t)
        }
    }, eZ.compression = 8, e0.prototype.push = function(e, t) {
        this.i.terminate && (e = N(e, 0)), this.i.push(e, t)
    }, e0.compression = 8, e1.prototype.push = function(e, t) {
        var n = this;
        if (this.onfile || L(5), this.p || L(4), this.c > 0) {
            var r = Math.min(this.c, e.length),
                i = e.subarray(0, r);
            if (this.c -= r, this.d ? this.d.push(i, !this.c) : this.k[0].push(i), (e = e.subarray(r)).length) return this.push(e, t)
        } else {
            var a = 0,
                o = 0,
                s = void 0,
                c = void 0;
            this.p.length ? e.length ? ((c = new u(this.p.length + e.length)).set(this.p), c.set(e, this.p.length)) : c = this.p : c = e;
            for (var l = c.length, d = this.c, h = d && this.d, f = this; o < l - 4 && "break" !== function() {
                    var e = em(c, o);
                    if (0x4034b50 == e) {
                        a = 1, s = o, f.d = null, f.c = 0;
                        var t = ep(c, o + 6),
                            r = ep(c, o + 8),
                            i = ep(c, o + 26),
                            u = ep(c, o + 28);
                        if (l > o + 30 + i + u) {
                            var h, p = [];
                            f.k.unshift(p), a = 2;
                            var m = em(c, o + 18),
                                y = em(c, o + 22),
                                v = eV(c.subarray(o + 30, o += 30 + i), !(2048 & t)),
                                g = eW(c, o, u, 2, m, y, 0),
                                b = g[0],
                                w = g[1],
                                A = g[3];
                            8 & t && (b = -1 - A), o += u, f.c = b;
                            var S = {
                                name: v,
                                compression: r,
                                start: function() {
                                    if (S.ondata || L(5), b) {
                                        var e = n.o[r];
                                        e || S.ondata(L(14, "unknown compression type " + r, 1), null, !1), (h = b < 0 ? new e(v) : new e(v, b, w)).ondata = function(e, t, n) {
                                            S.ondata(e, t, n)
                                        };
                                        for (var t = 0; t < p.length; t++) {
                                            var i = p[t];
                                            h.push(i, !1)
                                        }
                                        n.k[0] == p && n.c ? n.d = h : h.push(X, !0)
                                    } else S.ondata(null, X, !0)
                                },
                                terminate: function() {
                                    h && h.terminate && h.terminate()
                                }
                            };
                            b >= 0 && (S.size = b, S.originalSize = w), f.onfile(S)
                        }
                        return "break"
                    }
                    if (d) {
                        if (0x8074b50 == e) return s = o += 12 + (-2 == d && 8), a = 3, f.c = 0, "break";
                        else if (0x2014b50 == e) return s = o -= 4, a = 3, f.c = 0, "break"
                    }
                }(); ++o);
            if (this.p = X, d < 0) {
                var p = a ? c.subarray(0, s - 12 - (-2 == d && 8) - (0x8074b50 == em(c, s - 16) && 4)) : c.subarray(0, o);
                h ? h.push(p, !!a) : this.k[+(2 == a)].push(p)
            }
            if (2 & a) return this.push(c.subarray(o), t);
            this.p = c.subarray(o)
        }
        t && (this.c && L(13), this.p = null)
    }, e1.prototype.register = function(e) {
        this.o[e.compression] = e
    }, "function" == typeof queueMicrotask && queueMicrotask;
    let e2 = e => (e => {
            let t = "";
            for (let n = 0; n < e.length; n += 32768) t += String.fromCharCode(...e.subarray(n, n + 32768));
            return btoa(t).replaceAll("+", "-").replaceAll("/", "_").replace(/=+$/u, "")
        })(ex(eK(e))),
        e3 = (e, t) => {
            let n = (e => {
                if (!e || !/^[A-Za-z0-9_-]+$/u.test(e)) return null;
                let t = e.replaceAll("-", "+").replaceAll("_", "/"),
                    n = "".concat(t).concat("=".repeat((4 - t.length % 4) % 4));
                try {
                    if (void 0 !== o.Buffer) return new Uint8Array(o.Buffer.from(n, "base64"));
                    let e = atob(n),
                        t = new Uint8Array(e.length);
                    for (let n = 0; n < e.length; n += 1) t[n] = e.charCodeAt(n);
                    return t
                } catch (e) {
                    return null
                }
            })(e);
            if (!n) return null;
            try {
                let e = eV(e_(n));
                return e.length <= t ? e : null
            } catch (e) {
                return null
            }
        };
    e.s(["V", 0, e2, "J", 0, e3], 456954);
    var e5 = e.i(973005),
        e6 = e.i(11517),
        e8 = r;
    e.s(["f", () => e8.f], 22600);
    var e8 = r,
        e4 = e.i(805290);
    class e7 extends Error {
        constructor(e, t, n, r) {
            super(null != r ? r : "unsupported-version" === e ? "Document version ".concat(t, " is not supported; target version ").concat(n, ".") : "No migration path from version ".concat(t, " to version ").concat(n, ".")), (0, e4._)(this, "kind", void 0), (0, e4._)(this, "fromVersion", void 0), (0, e4._)(this, "targetVersion", void 0), this.name = "VersionedMigrationError", this.kind = e, this.fromVersion = t, this.targetVersion = n
        }
    }
    let e9 = (e, t) => new e7("unsupported-version", e, t),
        te = (e, t, n) => new e7("migration-gap", e, t, n),
        tt = e => !!e && "object" == typeof e && !Array.isArray(e),
        tn = e => {
            if (!tt(e)) return 2;
            let {
                v: t
            } = e;
            return void 0 === t ? 1 : "number" == typeof t ? t : 3
        },
        tr = (e, t) => tt(e) ? {
            ...e,
            v: t
        } : e,
        ti = e => {
            let n, r;
            if (!tt(e)) return e;
            let a = e.f;
            if (!Array.isArray(a)) return e;
            let {
                customEventName: o,
                realFilters: s
            } = (r = a.filter(e => {
                var r, a;
                let o, s;
                return !(tt(r = e) && r.dimension === t.zA.CustomEventName && Array.isArray(o = r.values) && o.every(e => "string" == typeof e) && (void 0 === r.operation || ("string" == typeof(s = a = r.operation) || "number" == typeof s) && (0, i.s)(e8.f, a) && a !== e8.f.Invalid)) || (null != n || (n = e.values[0]), !1)
            }), {
                customEventName: n,
                realFilters: r.length > 0 ? r : void 0
            });
            return {
                ...e,
                ...s ? {
                    f: s
                } : {
                    f: void 0
                },
                ...void 0 === e.c && o ? {
                    c: o
                } : {}
            }
        },
        ta = [{
            fromVersion: 1,
            toVersion: 2,
            description: "Lift CustomEventName filters into source identity",
            migrate: e => tt(e) && Array.isArray(e.s) ? {
                ...e,
                s: e.s.map(ti)
            } : e
        }],
        to = "cm2.",
        ts = e => "string" == typeof e && e.trim().length > 0,
        tc = e => ts(e) && (0, a.y)(e),
        tu = e => "string" == typeof e || "number" == typeof e,
        tl = e => {
            let t = (0, e6.Y)(e.metric);
            if (!tc(t)) return (0, n.f)('Cannot serialize non-numeric computed metric source "'.concat(String(t), '".')), null;
            let r = {
                k: e.key,
                m: t
            };
            e.filters && e.filters.length > 0 && (r.f = [...e.filters]), (0, e6.Q)(e.metric) && (r.c = e.metric.customEventName);
            let i = ((e, t) => {
                if (!e && !t) return;
                let n = {};
                if (null != t ? t : null == e ? void 0 : e.aggregationType) {
                    var r;
                    n.a = null != (r = null != t ? t : null == e ? void 0 : e.aggregationType) ? r : void 0
                }
                return (null == e ? void 0 : e.percentile) && (n.p = e.percentile), Object.keys(n).length > 0 ? n : void 0
            })(e.pseudoDimensionValues, (0, e6.Q)(e.metric) ? e.metric.aggregationType : void 0);
            return i && (r.p = i), r
        },
        td = e => {
            let n, r = (e => {
                var t, n;
                if (e && (void 0 !== e.a || void 0 !== e.p)) return {
                    aggregationType: null != (t = e.a) ? t : null,
                    percentile: null != (n = e.p) ? n : null
                }
            })(e.p);
            if (e.m === t.Ea.CustomEventsV2) {
                var i;
                let t = e.c;
                if (!t) return null;
                n = {
                    metric: e.m,
                    customEventName: t,
                    ...(null == (i = e.p) ? void 0 : i.a) ? {
                        aggregationType: e.p.a
                    } : {}
                }
            } else n = e.m;
            return {
                key: e.k,
                metric: n,
                filters: e.f,
                ...r && r.percentile ? {
                    pseudoDimensionValues: {
                        aggregationType: null,
                        percentile: r.percentile
                    }
                } : {}
            }
        };
    e.s(["B", 0, e => {
        if (!e || e.length > 4096 || !e.startsWith(to)) return null;
        let n = e3(e.slice(to.length), 4096);
        if (!n) return null;
        let a = (e => {
            try {
                return JSON.parse(e)
            } catch (e) {
                return null
            }
        })(n);
        if (null === a) return null;
        let o = (e => {
            try {
                return (e => {
                    let {
                        document: t,
                        registry: n,
                        targetVersion: r,
                        getVersion: i,
                        setVersion: a,
                        createUnsupportedVersionError: o = e9,
                        createMigrationGapError: s = te
                    } = e, c = t, u = i(t);
                    if (u > r) throw o(u, r);
                    let l = u,
                        d = n.length + 1,
                        h = 0;
                    for (; l < r && h < d;) {
                        let e = l,
                            t = n.find(t => t.fromVersion === e);
                        if (!t) throw s(e, r);
                        let o = t.migrate(c),
                            u = i(o);
                        if (u !== e && u !== t.toVersion) throw s(e, r, "Migration step ".concat(e, " -> ").concat(t.toVersion, " produced version ").concat(u, "."));
                        c = a(o, t.toVersion), l = t.toVersion, h += 1
                    }
                    if (l !== r) throw s(l, r, "Migration pipeline did not converge after ".concat(h, " steps (stopped at version ").concat(l, ")."));
                    return a(c, r)
                })({
                    document: e,
                    registry: ta,
                    targetVersion: 2,
                    getVersion: tn,
                    setVersion: tr
                })
            } catch (e) {
                return null
            }
        })(a);
        if (!(o && "object" == typeof o && 2 === o.v && Array.isArray(o.s) && 0 !== o.s.length && ts(o.f) && (void 0 === o.n || "string" == typeof o.n) && o.s.every(e => {
                var n, a;
                let o;
                return !(!(n = e) || "object" != typeof n || Array.isArray(n)) && !!ts(n.k) && !!tc(n.m) && (void 0 === n.f || !!(Array.isArray(o = n.f) && o.every(e => (e => {
                    if (!e || "object" != typeof e) return !1;
                    let {
                        dimension: n,
                        values: a,
                        operation: o
                    } = e;
                    return !(!tu(n) || !(0, i.s)(t.zA, n) || (0, e5.U)(n)) && n !== t.zA.CustomEventName && Array.isArray(a) && a.every(e => "string" == typeof e) && (void 0 === o || tu(o) && (0, i.s)(r.f, o) && o !== r.f.Invalid)
                })(e)))) && (void 0 === n.c || !!ts(n.c)) && (void 0 === n.p || !!((a = n.p) && "object" == typeof a && (void 0 === a.a || tu(a.a) && (0, i.s)(t.W4, a.a)) && (void 0 === a.p || tu(a.p) && (0, i.s)(t.G6, a.p)) && 1))
            }))) return null;
        let [s, ...c] = o.s, u = td(s), l = [];
        for (let e of c) {
            let t = td(e);
            if (!t) return null;
            l.push(t)
        }
        return u ? {
            sources: [u, ...l],
            formula: o.f,
            name: ts(o.n) ? o.n : void 0,
            l7Smoothing: 1 === o.l
        } : null
    }, "c", 0, e => {
        let t = [];
        for (let n of e.sources) {
            let e = tl(n);
            if (!e) return null;
            t.push(e)
        }
        let n = {
            v: 2,
            s: t,
            f: e.formula,
            n: ts(e.name) ? e.name.trim() : void 0,
            l: e.l7Smoothing ? 1 : void 0
        };
        return "".concat(to).concat(e2(JSON.stringify(n)))
    }], 545154)
}, 841383, e => {
    "use strict";
    var t = e.i(31611);
    let n = new Set([t.ST.ForwardD1Retention, t.ST.ForwardD7Retention, t.ST.ForwardD30Retention]),
        r = t.Ka,
        i = e => {
            let i = r[e];
            return i && n.has(e) ? i.filter(e => e !== t.L1.None) : i
        };
    e.s(["v", 0, i, "a", 0, (e, t) => {
        var n, r;
        return null != (n = null == (r = i(e)) ? void 0 : r.includes(t)) && n
    }])
}, 257969, e => {
    "use strict";
    let t = {
            canCreate: !1,
            canEdit: !1,
            canPublish: !1,
            canDelete: !1,
            limits: {}
        },
        n = ["maxDashboardsPerUniverse", "maxPinnedDashboardsPerUniverse", "maxSummaryCardsPerDashboard", "maxChartTilesPerDashboard", "maxTableMetricColumns", "maxDashboardNameLength", "maxDashboardDescriptionLength", "maxTileTitleLength"];

    function r(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }
    e.s(["X", 0, t, "M", 0, function(e) {
        return r(e) ? {
            canCreate: !0 === e.canCreate,
            canEdit: !0 === e.canEdit,
            canPublish: !0 === e.canPublish,
            canDelete: !0 === e.canDelete,
            limits: function(e) {
                if (!r(e)) return {};
                let t = {};
                return n.forEach(n => {
                    var r;
                    let i = "number" == typeof(r = e[n]) && Number.isSafeInteger(r) && r > 0 ? r : void 0;
                    void 0 !== i && (t[n] = i)
                }), t
            }(e.limits)
        } : t
    }])
}, 731197, e => {
    "use strict";
    let t = {
            maxDashboardsPerUniverse: 16,
            maxSummaryCardsPerDashboard: 6,
            maxChartTilesPerDashboard: 12,
            maxTableMetricColumns: e.i(805386).f
        },
        n = {
            maxDashboardsPerUniverse: t.maxDashboardsPerUniverse,
            maxPinnedDashboardsPerUniverse: 5,
            maxSummaryCardsPerDashboard: t.maxSummaryCardsPerDashboard,
            maxChartTilesPerDashboard: t.maxChartTilesPerDashboard,
            maxTableMetricColumns: 8,
            maxDashboardNameLength: 80,
            maxDashboardDescriptionLength: 280,
            maxTileTitleLength: 80
        };

    function r(e) {
        return {
            maxDashboardsPerUniverse: i("maxDashboardsPerUniverse", e.maxDashboardsPerUniverse),
            maxPinnedDashboardsPerUniverse: i("maxPinnedDashboardsPerUniverse", e.maxPinnedDashboardsPerUniverse),
            maxSummaryCardsPerDashboard: i("maxSummaryCardsPerDashboard", e.maxSummaryCardsPerDashboard),
            maxChartTilesPerDashboard: i("maxChartTilesPerDashboard", e.maxChartTilesPerDashboard),
            maxTableMetricColumns: i("maxTableMetricColumns", e.maxTableMetricColumns),
            maxDashboardNameLength: i("maxDashboardNameLength", e.maxDashboardNameLength),
            maxDashboardDescriptionLength: i("maxDashboardDescriptionLength", e.maxDashboardDescriptionLength),
            maxTileTitleLength: i("maxTileTitleLength", e.maxTileTitleLength)
        }
    }

    function i(e, r) {
        var i;
        return void 0 === r ? n[e] : Math.min(r, null != (i = t[e]) ? i : r)
    }
    e.s(["j", 0, n, "S", 0, 2, "A", 0, r, "b", 0, function(e) {
        var t;
        return {
            ...r(null != (t = null == e ? void 0 : e.limits) ? t : {}),
            maxDashboardsPerUniverse: 1 / 0
        }
    }])
}, 283561, e => {
    "use strict";
    var t = e.i(805290);
    class n extends Error {
        constructor(e, n, r) {
            super(n, r), (0, t._)(this, "code", void 0), this.name = new.target.name, this.code = e
        }
    }
    e.s(["g", 0, class extends n {
        constructor(e, n, r) {
            super("MIGRATION_GAP", null != r ? r : "No migration step registered for schema version ".concat(e, " → ").concat(n, ".")), (0, t._)(this, "fromVersion", void 0), (0, t._)(this, "currentVersion", void 0), this.fromVersion = e, this.currentVersion = n
        }
    }, "X", 0, class extends n {
        constructor() {
            super("NOT_AVAILABLE", "Custom dashboards are not available in this context.")
        }
    }, "u", 0, class extends n {
        constructor(e) {
            super("NOT_FOUND", "Custom dashboard ".concat(e, " was not found.")), (0, t._)(this, "dashboardId", void 0), this.dashboardId = e
        }
    }, "c", 0, class extends n {
        constructor(e) {
            super("PERMISSION_DENIED", null != e ? e : "You do not have permission to modify this dashboard.")
        }
    }, "b", 0, class extends n {
        constructor(e) {
            super("QUOTA_EXCEEDED", null != e ? e : "Custom dashboard quota has been exceeded. Delete a dashboard and try again.")
        }
    }, "V", 0, n, "W", 0, class extends n {
        constructor(e, n) {
            super("STORAGE_UNREADABLE", 'Custom dashboard storage is unreadable; raw bytes preserved at "'.concat(e, '".'), void 0 !== n ? {
                cause: n
            } : void 0), (0, t._)(this, "sidecarKey", void 0), this.sidecarKey = e
        }
    }, "z", 0, class extends n {
        constructor(e) {
            super("STORAGE_WRITE_FAILED", "Failed to write custom dashboard storage.", void 0 !== e ? {
                cause: e
            } : void 0)
        }
    }, "Y", 0, class extends n {
        constructor(e) {
            super("UNAUTHENTICATED", null != e ? e : "Sign in to continue using custom dashboards.")
        }
    }, "m", 0, class extends n {
        constructor(e, n) {
            super("UNSUPPORTED_NEWER_SCHEMA", "Stored custom dashboard schema v".concat(e, " is newer than the client's v").concat(n, ".")), (0, t._)(this, "schemaVersion", void 0), (0, t._)(this, "currentVersion", void 0), this.schemaVersion = e, this.currentVersion = n
        }
    }, "C", 0, class extends n {
        constructor(e, n) {
            super("VALIDATION", n), (0, t._)(this, "field", void 0), this.field = e
        }
    }, "h", 0, class extends n {
        constructor(e) {
            super("VERSION_CONFLICT", "Custom dashboard ".concat(e, " has been modified elsewhere. Reload to continue.")), (0, t._)(this, "dashboardId", void 0), this.dashboardId = e
        }
    }])
}, 964956, e => {
    "use strict";
    e.s(["X", 0, 3e5, "b", 0, 3e4, "Z", 0, 3e4, "D", 0, {
        universe: e => ["custom-dashboards", "universe", e],
        list: (e, t) => {
            var n, r;
            let i = ["custom-dashboards", "universe", e, "list"];
            return t ? [...i, null != (n = t.pageSize) ? n : null, null != (r = t.pageToken) ? r : null] : i
        },
        listInfinite: (e, t) => ["custom-dashboards", "universe", e, "list", "infinite", null != t ? t : null],
        pinned: e => ["custom-dashboards", "universe", e, "pinned"],
        detail: (e, t) => ["custom-dashboards", "universe", e, "detail", t],
        suggestedName: e => ["custom-dashboards", "universe", e, "suggested-name"],
        capabilities: e => ["custom-dashboards", "universe", e, "capabilities"]
    }])
}, 258576, 466386, e => {
    "use strict";
    var t = e.i(910272),
        n = e.i(257969),
        r = e.i(964956);
    e.s(["f", 0, function(e, i, a) {
        var o;
        let s = (0, t.f)({
            queryKey: r.D.capabilities(e),
            queryFn: () => {
                var t, r;
                return null != (t = null == (r = i.getCapabilities) ? void 0 : r.call(i, e)) ? t : Promise.resolve(n.X)
            },
            staleTime: r.X,
            refetchOnWindowFocus: !0,
            enabled: a.enabled && Number.isFinite(e) && e > 0
        });
        return {
            capabilities: null != (o = s.data) ? o : n.X,
            isResolved: void 0 !== s.data,
            isError: s.isError && void 0 === s.data
        }
    }], 258576);
    var i = e.i(759283);
    e.s(["f", 0, e => {
        if (!e.pathname.includes("/creations/experiences/")) return i.h;
        let t = e.query.id;
        if ("string" != typeof t) return i.h;
        let n = Number.parseInt(t, 10);
        return !Number.isFinite(n) || n <= 0 ? i.h : n
    }], 466386)
}, 650040, 318727, 413311, e => {
    "use strict";
    var t = e.i(379843),
        n = e.i(731197);

    function r(e) {
        return e.tiles
    }

    function i(e) {
        return e.columnCount
    }
    e.s(["t", 0, i, "y", 0, r, "g", 0, function(e) {
        return {
            tiles: [e],
            columnCount: 2
        }
    }, "O", 0, function(e) {
        return {
            tiles: [e],
            columnCount: 1
        }
    }, "d", 0, function(e, t) {
        return {
            tiles: [e, t],
            columnCount: 2
        }
    }], 318727);
    let a = "chart-empty-slot:",
        o = e => "Component" === e.type && "Chart" === e.component.type ? e.component.chart : null;

    function s(e) {
        return e.flatMap(e => {
            let t;
            if ("Component" === e.type) {
                let t = o(e);
                return t ? [{
                    columnCount: 1,
                    tiles: [t]
                }] : []
            }
            let r = (t = e.children.map(o)).length > 0 && t.every(e => null !== e) ? t.filter(e => null !== e) : null;
            if (r) return function(e, t) {
                if (0 === e.length) return [];
                let r = 1 === t ? 1 : n.S;
                if (1 === r) return e.map(e => ({
                    columnCount: r,
                    tiles: [e]
                }));
                let i = [];
                for (let t = 0; t < e.length; t += n.S) i.push({
                    columnCount: r,
                    tiles: e.slice(t, t + n.S)
                });
                return i
            }(r, "Grid" === e.type ? 1 === e.columnCount ? 1 : n.S : r.length > 1 ? n.S : 1);
            return s(e.children)
        })
    }
    e.s(["H", 0, e => {
        if (!(null == e ? void 0 : e.startsWith(a))) return null;
        let t = Number.parseInt(e.slice(a.length), 10);
        return Number.isInteger(t) && t >= 0 ? {
            rowIndex: t
        } : null
    }, "g", 0, function(e) {
        let t = [],
            n = 0;
        return e.forEach((e, o) => {
            let s = r(e),
                c = i(e),
                u = 1 === c ? 2 : 1;
            (s.forEach((e, r) => {
                t.push({
                    kind: "tile",
                    tileId: e.tileId,
                    tile: e,
                    rowIndex: o,
                    itemIndex: r,
                    order: n,
                    columnSpan: u
                }), n += 1
            }), !(c <= s.length)) && (t.push({
                kind: "empty-slot",
                emptySlotId: "".concat(a).concat(o),
                rowIndex: o,
                order: n,
                columnSpan: 1
            }), n += 1)
        }), t
    }, "L", 0, s], 413311);
    let c = [];

    function u(e) {
        return e.page.surface
    }

    function l(e, n) {
        return {
            ...e,
            page: {
                mode: t.G.Untabbed,
                surface: n
            }
        }
    }

    function d(e) {
        return {
            type: "Component",
            component: {
                type: "Chart",
                chart: e
            }
        }
    }

    function h(e) {
        return {
            type: "Component",
            component: {
                type: "SummaryCard",
                summaryCard: e
            }
        }
    }

    function f(e) {
        return {
            type: "Flex",
            children: e.map(h)
        }
    }

    function p(e) {
        return {
            type: "Grid",
            columnCount: e.columnCount,
            children: e.tiles.map(d)
        }
    }

    function m(e) {
        let t = "Component" === e.type ? e.component : null;
        return (null == t ? void 0 : t.type) === "SummaryCard" ? t.summaryCard : null
    }

    function y(e) {
        return ("Flex" === e.type || "Grid" === e.type) && e.children.length > 0 && e.children.every(e => null !== m(e))
    }

    function v(e) {
        return u(e).bodyNodes.flatMap(e => {
            if (y(e) && ("Flex" === e.type || "Grid" === e.type)) return e.children.map(m).filter(e => null !== e);
            let t = m(e);
            return t ? [t] : []
        })
    }
    e.s(["W", 0, function(e) {
        return s(u(e).bodyNodes.filter(e => !y(e)))
    }, "u", 0, u, "Q", 0, v, "d", 0, function(e, t) {
        let n = u(e),
            r = v(e);
        return l(e, {
            ...n,
            bodyNodes: [...r.length > 0 ? [f(r)] : c, ...t.map(p)]
        })
    }, "O", 0, l, "r", 0, function(e, t) {
        let n = u(e);
        return l(e, {
            ...n,
            bodyNodes: [...t.length > 0 ? [f(t)] : c, ...u(e).bodyNodes.filter(e => !y(e) && null === m(e))]
        })
    }], 650040)
}, 479236, 322172, e => {
    "use strict";
    var t = e.i(785517),
        n = e.i(435968),
        r = e.i(643766),
        i = e.i(341260),
        a = e.i(228096),
        o = e.i(500758),
        s = e.i(118413),
        c = e.i(257969),
        u = e.i(731197),
        l = e.i(283561),
        d = e.i(964956),
        h = e.i(258576),
        f = e.i(466386),
        p = e.i(805290),
        m = e.i(650040),
        y = e.i(379843),
        v = e.i(296150),
        g = e.i(743209),
        b = e.i(436025),
        w = e.i(593431),
        A = e.i(582078),
        S = e.i(852209),
        T = e.i(482922),
        C = e.i(31611),
        E = e.i(531007),
        D = e.i(11517),
        x = e.i(405005),
        I = e.i(302610),
        U = e.i(787202),
        _ = e.i(646877);
    let O = y.y,
        k = {
            [E.f.Spline]: 1,
            [E.f.Area]: 2,
            [E.f.DurationSpline]: 7,
            [E.f.DurationArea]: 8,
            [E.f.Bar]: 3,
            [E.f.Column]: 4,
            [E.f.Pie]: 5,
            [E.f.Table]: 6
        },
        R = {
            DASHBOARD_CHART_TYPE_SPLINE: E.f.Spline,
            DASHBOARD_CHART_TYPE_AREA: E.f.Area,
            DASHBOARD_CHART_TYPE_DURATION_SPLINE: E.f.DurationSpline,
            DASHBOARD_CHART_TYPE_DURATION_AREA: E.f.DurationArea,
            DASHBOARD_CHART_TYPE_BAR: E.f.Bar,
            DASHBOARD_CHART_TYPE_COLUMN: E.f.Column,
            DASHBOARD_CHART_TYPE_PIE: E.f.Pie,
            DASHBOARD_CHART_TYPE_TABLE: E.f.Table,
            1: E.f.Spline,
            2: E.f.Area,
            7: E.f.DurationSpline,
            8: E.f.DurationArea,
            3: E.f.Bar,
            4: E.f.Column,
            5: E.f.Pie,
            6: E.f.Table
        },
        P = {
            Cumulative: 1,
            Minute: 2,
            HalfHour: 3,
            Hour: 4,
            Day: 5,
            Week: 6
        },
        B = {
            DASHBOARD_GRANULARITY_CUMULATIVE: "Cumulative",
            DASHBOARD_GRANULARITY_MINUTE: "Minute",
            DASHBOARD_GRANULARITY_HALF_HOUR: "HalfHour",
            DASHBOARD_GRANULARITY_HOUR: "Hour",
            DASHBOARD_GRANULARITY_DAY: "Day",
            DASHBOARD_GRANULARITY_WEEK: "Week",
            1: "Cumulative",
            2: "Minute",
            3: "HalfHour",
            4: "Hour",
            5: "Day",
            6: "Week"
        },
        N = {
            [C.L1.None]: 1,
            [C.L1.OneMinute]: 2,
            [C.L1.HalfHour]: 3,
            [C.L1.OneHour]: 4,
            [C.L1.OneDay]: 5,
            [C.L1.OneWeek]: 6
        },
        M = {
            DASHBOARD_GRANULARITY_CUMULATIVE: C.L1.None,
            DASHBOARD_GRANULARITY_MINUTE: C.L1.OneMinute,
            DASHBOARD_GRANULARITY_HALF_HOUR: C.L1.HalfHour,
            DASHBOARD_GRANULARITY_HOUR: C.L1.OneHour,
            DASHBOARD_GRANULARITY_DAY: C.L1.OneDay,
            DASHBOARD_GRANULARITY_WEEK: C.L1.OneWeek,
            1: C.L1.None,
            2: C.L1.OneMinute,
            3: C.L1.HalfHour,
            4: C.L1.OneHour,
            5: C.L1.OneDay,
            6: C.L1.OneWeek
        },
        L = {
            [C.W4.Sum]: 1,
            [C.W4.Count]: 2,
            [C.W4.Average]: 3,
            [C.W4.Min]: 4,
            [C.W4.Max]: 5,
            [C.W4.CountUser]: 7,
            [C.W4.AveragePerUser]: 25,
            [C.G6.AVG]: 10,
            [C.G6.P10]: 11,
            [C.G6.P50]: 12,
            [C.G6.P90]: 13,
            [y.g.Total]: 20,
            [y.g.AverageOverTimePeriod]: 21,
            [y.g.MostRecentDataPoint]: 22,
            [y.g.Median]: 23,
            [y.g.Cumulative]: 24,
            [y.g.AveragePerUniqueUser]: 25
        },
        G = {
            DASHBOARD_AGGREGATION_SUM: C.W4.Sum,
            DASHBOARD_AGGREGATION_COUNT: C.W4.Count,
            DASHBOARD_AGGREGATION_AVERAGE: C.W4.Average,
            DASHBOARD_AGGREGATION_MIN: C.W4.Min,
            DASHBOARD_AGGREGATION_MAX: C.W4.Max,
            DASHBOARD_AGGREGATION_DISTINCT_COUNT: C.W4.CountUser,
            DASHBOARD_AGGREGATION_UNIQUE_COUNT: C.W4.CountUser,
            DASHBOARD_AGGREGATION_PERCENTILE_AVG: C.G6.AVG,
            DASHBOARD_AGGREGATION_PERCENTILE_P10: C.G6.P10,
            DASHBOARD_AGGREGATION_PERCENTILE_P50: C.G6.P50,
            DASHBOARD_AGGREGATION_PERCENTILE_P90: C.G6.P90,
            DASHBOARD_AGGREGATION_TOTAL: y.g.Total,
            DASHBOARD_AGGREGATION_AVERAGE_OVER_TIME_PERIOD: y.g.AverageOverTimePeriod,
            DASHBOARD_AGGREGATION_MOST_RECENT_DATA_POINT: y.g.MostRecentDataPoint,
            DASHBOARD_AGGREGATION_MEDIAN: y.g.Median,
            DASHBOARD_AGGREGATION_CUMULATIVE: y.g.Cumulative,
            DASHBOARD_AGGREGATION_AVERAGE_PER_UNIQUE_USER: C.W4.AveragePerUser,
            1: C.W4.Sum,
            2: C.W4.Count,
            3: C.W4.Average,
            4: C.W4.Min,
            5: C.W4.Max,
            6: C.W4.CountUser,
            7: C.W4.CountUser,
            10: C.G6.AVG,
            11: C.G6.P10,
            12: C.G6.P50,
            13: C.G6.P90,
            20: y.g.Total,
            21: y.g.AverageOverTimePeriod,
            22: y.g.MostRecentDataPoint,
            23: y.g.Median,
            24: y.g.Cumulative,
            25: C.W4.AveragePerUser
        },
        H = {
            [y.x.Auto]: 1,
            [y.x.Custom]: 2
        },
        K = {
            DASHBOARD_TITLE_SOURCE_AUTO: y.x.Auto,
            DASHBOARD_TITLE_SOURCE_CUSTOM: y.x.Custom,
            1: y.x.Auto,
            2: y.x.Custom
        },
        V = {
            none: 1,
            weekly: 2
        },
        F = {
            DASHBOARD_CHART_SMOOTHING_NONE: "none",
            DASHBOARD_CHART_SMOOTHING_WEEKLY: "weekly",
            1: "none",
            2: "weekly"
        },
        W = {
            "7d": 1,
            "14d": 2,
            "28d": 3
        },
        j = {
            DASHBOARD_COMPARISON_RELATIVE_OFFSET_SEVEN_DAYS: "7d",
            DASHBOARD_COMPARISON_RELATIVE_OFFSET_FOURTEEN_DAYS: "14d",
            DASHBOARD_COMPARISON_RELATIVE_OFFSET_TWENTY_EIGHT_DAYS: "28d",
            1: "7d",
            2: "14d",
            3: "28d"
        };

    function z(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function q(e) {
        return String(e)
    }

    function Y(e) {
        throw new l.C("backendContract", e)
    }

    function X(e, t, n) {
        let r = t[q(e)];
        return void 0 === r && Y("Unsupported ".concat(n, " value ").concat(String(e), ".")), r
    }

    function Q(e, t, n) {
        let r = t[q(e)];
        return void 0 === r && Y("Unsupported backend ".concat(n, " value ").concat(String(e), ".")), r
    }

    function $(e) {
        let t = new Date(e).toISOString();
        return Number.isNaN(Date.parse(t)) && Y("Timestamp is outside the supported RFC3339 range."), t
    }

    function J(e, t) {
        if ("string" == typeof e) {
            let n = Date.parse(e);
            return Number.isFinite(n) || Y("".concat(t, " is not a valid timestamp.")), n
        }
        if (z(e)) {
            var n, r;
            let i = Number(null != (n = e.seconds) ? n : 0),
                a = Number(null != (r = e.nanos) ? r : 0);
            return Number.isFinite(i) && Number.isFinite(a) || Y("".concat(t, " is not a valid timestamp.")), 1e3 * i + Math.floor(a / 1e6)
        }
        return Y("".concat(t, " is not a valid timestamp."))
    }

    function Z(e) {
        return e.map(e => ({
            dimensionKey: e.dimension,
            values: [...e.values]
        }))
    }

    function ee(e, t) {
        return null == e ? [] : (Array.isArray(e) || Y("".concat(t, " must be an array.")), e.map((e, n) => {
            var r, i;
            z(e) || Y("".concat(t, "[").concat(n, "] must be an object."));
            let a = null != (r = null != (i = e.dimensionKey) ? i : e.dimension_key) ? r : e.dimension;
            ("string" != typeof a || 0 === a.length) && Y("".concat(t, "[").concat(n, "].dimensionKey must be a non-empty string."));
            let {
                values: o
            } = e;
            return Array.isArray(o) && o.every(e => "string" == typeof e) || Y("".concat(t, "[").concat(n, "].values must be an array of strings.")), {
                dimension: a,
                values: o
            }
        }))
    }

    function et(e, t, n) {
        if (null != e) return Array.isArray(e) && e.every(e => "string" == typeof e) || Y("".concat(t, " must be an array of strings.")), e.map((e, r) => n(e) ? e : Y("".concat(t, "[").concat(r, "] is unsupported.")))
    }

    function en(e, t) {
        var n;
        return (n = e.dimension) !== C.zA.CustomEventName && (0, _._)(n) ? {
            dimension: e.dimension,
            values: [...e.values]
        } : Y("".concat(t, " contains an unsupported dimension."))
    }

    function er(e) {
        if (e && 0 !== e.length) return e.map(e => {
            let {
                pseudoDimensionKey: t,
                variantKey: n
            } = e, r = t === C.EM.AggregationType ? C.EM.AggregationType : t === C.EM.PercentileType ? C.EM.PercentileType : Y("Unsupported metric variant dimension ".concat(t, "."));
            return {
                pseudoDimensionKey: r,
                variantKey: (0, x.N)(r, n)
            }
        })
    }

    function ei(e, t) {
        if (Array.isArray(e) && 0 !== e.length) return e.map((e, n) => {
            var r, i;
            let a, o, {
                    pseudoDimensionKey: s,
                    variantKey: c
                } = (z(e) || Y("variantSelections[".concat(n, "] must be an object.")), a = null != (r = e.pseudoDimensionKey) ? r : e.pseudo_dimension_key, o = null != (i = e.variantKey) ? i : e.variant_key, ("string" != typeof a || "string" != typeof o) && Y("variantSelections[".concat(n, "] is missing keys.")), {
                    pseudoDimensionKey: a,
                    variantKey: o
                }),
                u = s === C.EM.AggregationType,
                l = s === C.EM.PercentileType,
                d = u ? Object.values(C.W4).find(e => (0, x.N)(C.EM.AggregationType, e) === c) : l ? Object.values(C.G6).find(e => (0, x.N)(C.EM.PercentileType, e) === c) : void 0;
            return 3 === t && (u || l) && !d && Y("Unsupported ".concat(u ? "aggregation" : "percentile", " variant ").concat(c, ".")), {
                pseudoDimensionKey: s,
                variantKey: null != d ? d : c
            }
        })
    }

    function ea(e) {
        if (!e || 0 === e.length) return;
        let t = null,
            n = null,
            r = C.EM.AggregationType,
            i = C.EM.PercentileType;
        for (let a of e) a.pseudoDimensionKey === r && ((0, _.d)(a.variantKey) || Y("Unsupported aggregation variant ".concat(a.variantKey, ".")), t = a.variantKey), a.pseudoDimensionKey === i && ((0, _.n)(a.variantKey) || Y("Unsupported percentile variant ".concat(a.variantKey, ".")), n = a.variantKey);
        if (null !== t || null !== n) return {
            aggregationType: t,
            percentile: n
        }
    }

    function eo(e) {
        let t = er(e.variantSelections);
        if (e.computedMetric) {
            var n;
            return {
                computedMetric: {
                    sources: (n = e.computedMetric).sources.map(e => {
                        let t = e.metric,
                            n = function(e) {
                                if (!e) return;
                                let t = [];
                                return e.aggregationType && t.push({
                                    pseudoDimensionKey: C.EM.AggregationType,
                                    variantKey: e.aggregationType
                                }), e.percentile && t.push({
                                    pseudoDimensionKey: C.EM.PercentileType,
                                    variantKey: e.percentile
                                }), t.length > 0 ? t : void 0
                            }(e.pseudoDimensionValues),
                            r = e.filters ? Z(e.filters) : void 0;
                        if ((0, D.Q)(t)) {
                            let i = er([...t.aggregationType ? [{
                                pseudoDimensionKey: C.EM.AggregationType,
                                variantKey: t.aggregationType
                            }] : [], ...(null != n ? n : []).filter(e => e.pseudoDimensionKey !== C.EM.AggregationType)]);
                            return {
                                sourceKey: e.key,
                                metricKey: t.metric,
                                filters: [{
                                    dimensionKey: C.zA.CustomEventName,
                                    values: [t.customEventName]
                                }, ...null != r ? r : []],
                                ...i ? {
                                    variantSelections: i
                                } : {}
                            }
                        }
                        let i = er(n);
                        return {
                            sourceKey: e.key,
                            metricKey: t,
                            ...r ? {
                                filters: r
                            } : {},
                            ...i ? {
                                variantSelections: i
                            } : {}
                        }
                    }),
                    formula: n.formula,
                    ...void 0 !== n.name ? {
                        displayName: n.name
                    } : {},
                    ...void 0 !== n.l7Smoothing ? {
                        l7Smoothing: n.l7Smoothing
                    } : {}
                },
                ...t ? {
                    variantSelections: t
                } : {}
            }
        }
        return {
            metricKey: e.metricKey,
            ...t ? {
                variantSelections: t
            } : {}
        }
    }

    function es(e, t, n) {
        var r, i, a;
        z(e) || Y("".concat(t, " must be an object."));
        let o = ei(null != (r = e.variantSelections) ? r : e.variant_selections, n),
            s = null != (i = e.computedMetric) ? i : e.computed_metric;
        if (void 0 !== s) return {
            computedMetric: function(e, t, n) {
                z(e) || Y("".concat(t, " must be an object."));
                let {
                    sources: r,
                    formula: i,
                    displayName: a,
                    l7Smoothing: o
                } = e;
                Array.isArray(r) && 0 !== r.length && "string" == typeof i || Y("".concat(t, " is not a valid computed metric."));
                let [s, ...c] = r.map((e, r) => {
                    var i, a, o, s, c, u, l, d, h;
                    let f, p, m;
                    z(e) || Y("".concat(t, ".sources[").concat(r, "] must be an object."));
                    let y = null != (i = null != (a = e.sourceKey) ? a : e.source_key) ? i : e.key;
                    ("string" != typeof y || 0 === y.length) && Y("".concat(t, ".sources[").concat(r, "].sourceKey must be set."));
                    let v = void 0 === e.filters ? void 0 : ee(e.filters, "".concat(t, ".sources[").concat(r, "].filters")),
                        g = ei(null != (o = e.variantSelections) ? o : e.variant_selections, n),
                        b = e.metric,
                        w = null != (s = e.metricKey) ? s : e.metric_key;
                    if (void 0 !== b && void 0 !== w && Y("".concat(t, ".sources[").concat(r, "] must not contain both metric and metricKey representations.")), void 0 !== w)
                        if ("string" != typeof w && Y("".concat(t, ".sources[").concat(r, "].metricKey must be a string.")), w === C.Ea.CustomEventsV2) {
                            let e = null != (c = null == v ? void 0 : v.filter(e => e.dimension === C.zA.CustomEventName)) ? c : [],
                                n = e[0],
                                i = null == n ? void 0 : n.values[0];
                            (1 !== e.length || (null == n ? void 0 : n.values.length) !== 1 || "string" != typeof i || 0 === i.trim().length) && Y("".concat(t, ".sources[").concat(r, "] must contain exactly one non-empty ") + "".concat(C.zA.CustomEventName, " filter for a canonical custom event."));
                            let a = null != (u = null == g ? void 0 : g.filter(e => e.pseudoDimensionKey === C.EM.AggregationType)) ? u : [];
                            a.length > 1 && Y("".concat(t, ".sources[").concat(r, "] must not contain multiple ") + "".concat(C.EM.AggregationType, " selections for a canonical custom event."));
                            let o = a[0],
                                s = null == o ? void 0 : o.variantKey;
                            void 0 === s || (0, _.d)(s) || Y("".concat(t, ".sources[").concat(r, "] has an invalid custom-event aggregation.")), f = {
                                metric: C.Ea.CustomEventsV2,
                                customEventName: i,
                                ...void 0 !== s ? {
                                    aggregationType: s
                                } : {}
                            }, p = null == v ? void 0 : v.filter(e => e.dimension !== C.zA.CustomEventName).map(e => en(e, "".concat(t, ".sources[").concat(r, "].filters"))), m = ea(null == g ? void 0 : g.filter(e => e.pseudoDimensionKey !== C.EM.AggregationType))
                        } else(0, _.c)(w) || Y("".concat(t, ".sources[").concat(r, "].metricKey is unsupported.")), f = w, p = null == v ? void 0 : v.map(e => en(e, "".concat(t, ".sources[").concat(r, "].filters"))), m = ea(g);
                    else {
                        z(b) || Y("".concat(t, ".sources[").concat(r, "] must contain either metric or metricKey."));
                        let e = null != (l = b.customEventMetric) ? l : b.custom_event_metric;
                        if (z(e)) {
                            let n, i = null != (d = e.customEventName) ? d : e.custom_event_name;
                            ("string" != typeof i || 0 === i.trim().length) && Y("".concat(t, ".sources[").concat(r, "].metric.customEventMetric is invalid.")), f = {
                                metric: C.Ea.CustomEventsV2,
                                customEventName: i,
                                ...void 0 !== e.aggregation ? {
                                    aggregationType: (n = Q(e.aggregation, G, "aggregation"), (0, _.d)(n) ? n : Y("Unsupported custom-event aggregation ".concat(n, ".")))
                                } : {}
                            }
                        } else {
                            let e = null != (h = b.metricKey) ? h : b.metric_key;
                            "string" != typeof e && Y("".concat(t, ".sources[").concat(r, "].metric.metricKey must be set.")), (0, _.c)(e) || Y("".concat(t, ".sources[").concat(r, "].metric.metricKey is unsupported.")), f = e
                        }
                        p = null == v ? void 0 : v.map(e => en(e, "".concat(t, ".sources[").concat(r, "].filters"))), m = ea(z(e) ? null == g ? void 0 : g.filter(e => e.pseudoDimensionKey !== C.EM.AggregationType) : g)
                    }
                    return {
                        key: y,
                        metric: f,
                        ...void 0 !== p ? {
                            filters: p
                        } : {},
                        ...void 0 !== m ? {
                            pseudoDimensionValues: m
                        } : {}
                    }
                });
                return s || Y("".concat(t, ".sources must be non-empty.")), {
                    sources: [s, ...c],
                    formula: i,
                    ..."string" == typeof a ? {
                        name: a
                    } : {},
                    ..."boolean" == typeof o ? {
                        l7Smoothing: o
                    } : {}
                }
            }(s, "".concat(t, ".computedMetric"), n),
            variantSelections: o
        };
        let c = null != (a = e.metricKey) ? a : e.metric_key;
        return ("string" != typeof c || 0 === c.length) && Y("".concat(t, ".metricKey must be set.")), {
            metricKey: (0, _.c)(c) ? c : Y("".concat(t, ".metricKey is not a supported numeric metric.")),
            variantSelections: o
        }
    }

    function ec(e, t) {
        var n, r, i, a, o, s, c, u, l;
        let d;
        if (null == e) return {};
        z(e) || Y("".concat(t, " must be an object."));
        let h = z(e.granularity) ? null != (n = e.granularity.fixed) ? n : e.granularity : void 0,
            f = z(h) ? h.granularity : void 0,
            p = void 0 === f ? void 0 : M[q(f)],
            m = null != (r = e.annotationOptions) ? r : e.annotation_options,
            y = z(m) ? (d = null != (u = et(null != (l = m.defaultAnnotationTypeKeys) ? l : m.default_annotation_type_keys, "".concat(t, ".annotationOptions.defaultAnnotationTypeKeys"), _.z)) ? u : [], {
                supportedAnnotationTypes: (0, I.b)(d),
                defaultAnnotationTypes: d,
                showAnnotationsControl: "boolean" == typeof m.showAnnotationsControl ? m.showAnnotationsControl : "boolean" != typeof m.show_annotations_control || m.show_annotations_control
            }) : void 0,
            v = null != (i = e.defaultFilters) ? i : e.default_filters,
            g = void 0 === v ? void 0 : ee(v, "".concat(t, ".defaultFilters")),
            b = et(null != (a = e.filterDimensionKeys) ? a : e.filter_dimension_keys, "".concat(t, ".filterDimensionKeys"), _._),
            w = et(null != (o = e.breakdownDimensionKeys) ? o : e.breakdown_dimension_keys, "".concat(t, ".breakdownDimensionKeys"), _._),
            A = et(null != (s = e.defaultBreakdownDimensionKeys) ? s : e.default_breakdown_dimension_keys, "".concat(t, ".defaultBreakdownDimensionKeys"), _.a);
        return {
            timeRangeOptions: function(e, t) {
                var n, r;
                if (null == e) return;
                if (z(e) || Y("".concat(t, " must be an object.")), void 0 !== e.none) return {
                    type: "None"
                };
                let i = null != (n = e.dateRange) ? n : e.date_range;
                if (void 0 !== i) return z(i) || Y("".concat(t, ".dateRange must be an object.")), {
                    type: "DateRange",
                    defaultSelection: function(e, t) {
                        var n, r, i, a;
                        if (null == e) return;
                        z(e) || Y("".concat(t, " must be an object."));
                        let o = null != (n = e.relativeRangeKey) ? n : e.relative_range_key;
                        if ("string" == typeof o) return (0, _.y)(o) || Y("".concat(t, ".relativeRangeKey is unsupported.")), {
                            type: "Relative",
                            rangeType: o
                        };
                        let s = null != (r = e.customRange) ? r : e.custom_range;
                        if (z(s)) return {
                            type: "Custom",
                            startTimeMs: J(null != (i = s.startTime) ? i : s.start_time, "".concat(t, ".customRange.startTime")),
                            endTimeMs: J(null != (a = s.endTime) ? a : s.end_time, "".concat(t, ".customRange.endTime"))
                        }
                    }(null != (r = i.defaultSelection) ? r : i.default_selection, "".concat(t, ".dateRange.defaultSelection"))
                }
            }(null != (c = e.timeRangeOptions) ? c : e.time_range_options, "".concat(t, ".timeRangeOptions")),
            filterDimensions: b,
            defaultFilters: g,
            breakdownDimensions: w,
            defaultBreakdown: A,
            defaultGranularity: p,
            annotationOptions: y
        }
    }

    function eu(e) {
        return {
            metric: eo(e.metric),
            seriesKey: e.seriesKey,
            ...e.filters ? {
                filters: Z(e.filters)
            } : {},
            ...e.aggregation ? {
                aggregation: X(e.aggregation, L, "aggregation")
            } : {}
        }
    }

    function el(e, t, n) {
        var r, i, a, o;
        z(e) || Y("".concat(t, " must be an object."));
        let s = null != (r = e.summaryCard) ? r : e.summary_card;
        if (void 0 !== s) {
            let e, r;
            return {
                type: "Component",
                component: {
                    type: "SummaryCard",
                    summaryCard: (i = "".concat(t, ".summaryCard"), z(s) || Y("".concat(i, " must be an object.")), ("string" != typeof(e = null != (a = s.tileId) ? a : s.tile_id) || 0 === e.length) && Y("".concat(i, ".tileId must be set.")), r = null != (o = s.titleSource) ? o : s.title_source, {
                        type: "SummaryCard",
                        tileId: e,
                        ..."string" == typeof s.title ? {
                            title: s.title
                        } : {},
                        metric: es(s.metric, "".concat(i, ".metric"), n),
                        aggregation: Q(s.aggregation, G, "aggregation"),
                        filters: ee(s.filters, "".concat(i, ".filters")),
                        ...void 0 !== r ? {
                            titleSource: Q(r, K, "titleSource")
                        } : {}
                    })
                }
            }
        }
        let c = e.chart;
        return void 0 !== c ? {
            type: "Component",
            component: {
                type: "Chart",
                chart: function(e, t, n) {
                    var r, i, a, o, s;
                    let c, u;
                    z(e) || Y("".concat(t, " must be an object."));
                    let l = null != (r = e.tileId) ? r : e.tile_id;
                    ("string" != typeof l || 0 === l.length) && Y("".concat(t, ".tileId must be set."));
                    let d = null != (i = e.dataSpec) ? i : e.data_spec,
                        h = null != (a = e.chartSpec) ? a : e.chart_spec;
                    z(d) && z(h) || Y("".concat(t, " must include dataSpec and chartSpec.")), Array.isArray(d.metrics) || Y("".concat(t, ".dataSpec.metrics must be an array."));
                    let f = Q(null != (o = h.chartType) ? o : h.chart_type, R, "chartType"),
                        p = d.granularity,
                        m = h.smoothing;
                    if (void 0 !== d.aggregation) {
                        let e = Q(d.aggregation, G, "aggregation");
                        (0, _.P)(e) || Y("Unsupported chart aggregation ".concat(e, ".")), c = e
                    }
                    let v = null != (s = d.breakdownDimensionKeys) ? s : d.breakdown_dimension_keys;
                    Array.isArray(v) && (v.every(e => "string" == typeof e) || Y("".concat(t, ".dataSpec.breakdownDimensionKeys must contain strings.")), u = v);
                    let g = void 0 !== p ? Q(p, B, "granularity") : y.i;
                    return {
                        type: "Chart",
                        tileId: l,
                        ..."string" == typeof e.title ? {
                            title: e.title
                        } : {},
                        dataSpec: {
                            metrics: d.metrics.map((e, r) => {
                                var i, a;
                                let o, s;
                                return i = "".concat(t, ".dataSpec.metrics[").concat(r, "]"), z(e) || Y("".concat(i, " must be an object.")), ("string" != typeof(o = null != (a = e.seriesKey) ? a : e.series_key) || 0 === o.length) && Y("".concat(i, ".seriesKey must be set.")), {
                                    metric: es(e.metric, "".concat(i, ".metric"), n),
                                    seriesKey: o,
                                    ...void 0 === e.filters ? {} : {
                                        filters: ee(e.filters, "".concat(i, ".filters"))
                                    },
                                    ...void 0 !== e.aggregation ? {
                                        aggregation: (s = Q(e.aggregation, G, "aggregation"), (0, _.P)(s) ? s : Y("Unsupported chart aggregation ".concat(s, ".")))
                                    } : {}
                                }
                            }),
                            ...void 0 !== c ? {
                                aggregation: c
                            } : {},
                            ...void 0 !== u ? {
                                breakdownDimensions: u
                            } : {},
                            granularity: g,
                            filters: ee(d.filters, "".concat(t, ".dataSpec.filters"))
                        },
                        chartSpec: {
                            chartType: f,
                            overlays: function(e) {
                                var t, n, r;
                                if (!z(e)) return;
                                let i = function(e) {
                                        var t, n, r, i;
                                        let a = null != (t = e.previousPeriod) ? t : e.previous_period;
                                        if (!1 === a) return !1;
                                        let o = null != (n = e.previousPeriodConfig) ? n : e.previous_period_config;
                                        if (void 0 === o) return !0 === a || void 0;
                                        z(o) || Y("previousPeriodConfig must be an object.");
                                        let s = {},
                                            c = null != (r = o.relativeOffset) ? r : o.relative_offset;
                                        void 0 !== c && 0 !== c && "DASHBOARD_COMPARISON_RELATIVE_OFFSET_INVALID" !== c && (s.relativeOffset = Q(c, j, "comparison offset"));
                                        let u = null != (i = o.customStartTime) ? i : o.custom_start_time;
                                        return void 0 !== u && (s.customStartTimeMs = J(u, "customStartTime")), 0 === Object.keys(s).length || s
                                    }(e),
                                    a = {
                                        ..."boolean" == typeof e.genreBenchmark || "boolean" == typeof e.genre_benchmark ? {
                                            genreBenchmark: !!(null != (t = e.genreBenchmark) ? t : e.genre_benchmark)
                                        } : {},
                                        ..."boolean" == typeof e.similarExperienceBenchmark || "boolean" == typeof e.similar_experience_benchmark ? {
                                            similarExperienceBenchmark: !!(null != (n = e.similarExperienceBenchmark) ? n : e.similar_experience_benchmark)
                                        } : {},
                                        ..."boolean" == typeof e.topExperienceBenchmark || "boolean" == typeof e.top_experience_benchmark ? {
                                            topExperienceBenchmark: !!(null != (r = e.topExperienceBenchmark) ? r : e.top_experience_benchmark)
                                        } : {},
                                        ...void 0 !== i ? {
                                            previousPeriod: i
                                        } : {},
                                        ..."boolean" == typeof e.quota ? {
                                            quota: e.quota
                                        } : {}
                                    };
                                return Object.keys(a).length > 0 ? a : void 0
                            }(h.overlays),
                            ...void 0 !== m ? {
                                smoothing: Q(m, F, "smoothing")
                            } : {}
                        }
                    }
                }(c, "".concat(t, ".chart"), n)
            }
        } : Y("".concat(t, " must set chart or summaryCard."))
    }

    function ed(e) {
        switch (e.type) {
            case "Component":
                var t, n, r, i, a, o;
                let s, c, u;
                return {
                    component: "SummaryCard" === (t = e.component).type ? {
                        summaryCard: {
                            tileId: (n = t.summaryCard).tileId,
                            ...void 0 !== n.title ? {
                                title: n.title
                            } : {},
                            metric: eo(n.metric),
                            aggregation: X(n.aggregation, L, "aggregation"),
                            filters: Z(n.filters),
                            titleSource: X(null != (r = n.titleSource) ? r : y.x.Auto, H, "titleSource")
                        }
                    } : {
                        chart: (s = function(e) {
                            if (!e) return;
                            let t = function(e) {
                                if (void 0 === e) return {};
                                if ("boolean" == typeof e) return {
                                    previousPeriod: e
                                };
                                let t = {};
                                void 0 !== e.relativeOffset && (t.relativeOffset = X(e.relativeOffset, W, "comparison offset")), void 0 !== e.customStartTimeMs && (t.customStartTime = $(e.customStartTimeMs));
                                let n = {
                                    previousPeriod: !0
                                };
                                return Object.keys(t).length > 0 && (n.previousPeriodConfig = t), n
                            }(e.previousPeriod);
                            return void 0 !== e.genreBenchmark && (t.genreBenchmark = e.genreBenchmark), void 0 !== e.similarExperienceBenchmark && (t.similarExperienceBenchmark = e.similarExperienceBenchmark), void 0 !== e.topExperienceBenchmark && (t.topExperienceBenchmark = e.topExperienceBenchmark), void 0 !== e.quota && (t.quota = e.quota), Object.keys(t).length > 0 ? t : void 0
                        }((i = t.chart).chartSpec.overlays), c = null == (o = i.dataSpec.metrics[0]) ? void 0 : o.metric, u = null != (a = i.dataSpec.aggregation) ? a : void 0 !== c ? (0, U.f)(c) : C.W4.Average, {
                            tileId: i.tileId,
                            ...void 0 !== i.title ? {
                                title: i.title
                            } : {},
                            dataSpec: {
                                metrics: i.dataSpec.metrics.map(eu),
                                aggregation: X(u, L, "aggregation"),
                                ...i.dataSpec.breakdownDimensions ? {
                                    breakdownDimensionKeys: [...i.dataSpec.breakdownDimensions]
                                } : {},
                                granularity: X(i.dataSpec.granularity, P, "granularity"),
                                filters: Z(i.dataSpec.filters)
                            },
                            chartSpec: {
                                chartType: X(i.chartSpec.chartType, k, "chartType"),
                                ...s ? {
                                    overlays: s
                                } : {},
                                ...i.chartSpec.smoothing ? {
                                    smoothing: X(i.chartSpec.smoothing, V, "smoothing")
                                } : {}
                            }
                        })
                    }
                };
            case "Stack":
                return {
                    stack: {
                        children: e.children.map(ed)
                    }
                };
            case "Flex":
                return {
                    flex: {
                        children: e.children.map(ed)
                    }
                };
            case "Grid":
                return {
                    grid: {
                        columnCount: e.columnCount,
                        children: e.children.map(ed)
                    }
                };
            default:
                return Y("Unsupported layout node ".concat(JSON.stringify(e), "."))
        }
    }

    function eh(e, t, n) {
        var r, i;
        if (z(e) || Y("".concat(t, " must be an object.")), "string" == typeof e.type) {
            if ("Component" === e.type) return el(e.component, "".concat(t, ".component"), n);
            if ("Stack" === e.type || "Flex" === e.type) return Array.isArray(e.children) || Y("".concat(t, ".children must be an array.")), {
                type: e.type,
                children: e.children.map((e, r) => eh(e, "".concat(t, ".children[").concat(r, "]"), n))
            };
            if ("Grid" === e.type) {
                Array.isArray(e.children) || Y("".concat(t, ".children must be an array."));
                let i = null != (r = e.columnCount) ? r : e.column_count;
                return 1 !== i && 2 !== i && Y("".concat(t, ".columnCount must be 1 or 2.")), {
                    type: "Grid",
                    columnCount: i,
                    children: e.children.map((e, r) => eh(e, "".concat(t, ".children[").concat(r, "]"), n))
                }
            }
        }
        if (void 0 !== e.component) return el(e.component, "".concat(t, ".component"), n);
        if (void 0 !== e.stack) return z(e.stack) && Array.isArray(e.stack.children) || Y("".concat(t, ".stack.children must be an array.")), {
            type: "Stack",
            children: e.stack.children.map((e, r) => eh(e, "".concat(t, ".stack.children[").concat(r, "]"), n))
        };
        if (void 0 !== e.flex) return z(e.flex) && Array.isArray(e.flex.children) || Y("".concat(t, ".flex.children must be an array.")), {
            type: "Flex",
            children: e.flex.children.map((e, r) => eh(e, "".concat(t, ".flex.children[").concat(r, "]"), n))
        };
        if (void 0 !== e.grid) {
            z(e.grid) && Array.isArray(e.grid.children) || Y("".concat(t, ".grid.children must be an array."));
            let r = null != (i = e.grid.columnCount) ? i : e.grid.column_count;
            return 1 !== r && 2 !== r && Y("".concat(t, ".grid.columnCount must be 1 or 2.")), {
                type: "Grid",
                columnCount: r,
                children: e.grid.children.map((e, r) => eh(e, "".concat(t, ".grid.children[").concat(r, "]"), n))
            }
        }
        return Y("".concat(t, " must set component, stack, flex, or grid."))
    }

    function ef(e) {
        var t, n;
        let r;
        return {
            schemaVersion: y.I,
            config: {
                page: ((t = e.page).mode !== y.G.Untabbed && Y("Only untabbed dashboard pages can be serialized to the backend."), {
                    untabbed: {
                        surface: {
                            resourceTypeKeys: [1],
                            controls: (r = (n = t.surface.controls).defaultGranularity ? N[n.defaultGranularity] : void 0, {
                                ...n.timeRangeOptions ? {
                                    timeRangeOptions: function(e) {
                                        if ("None" === e.type) return {
                                            none: {}
                                        };
                                        if (e.defaultSelection) {
                                            var t;
                                            return {
                                                dateRange: {
                                                    defaultSelection: "Relative" === (t = e.defaultSelection).type ? {
                                                        relativeRangeKey: t.rangeType
                                                    } : {
                                                        customRange: {
                                                            startTime: $(t.startTimeMs),
                                                            endTime: $(t.endTimeMs)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        return {
                                            dateRange: {}
                                        }
                                    }(n.timeRangeOptions)
                                } : {},
                                ...n.filterDimensions ? {
                                    filterDimensionKeys: [...n.filterDimensions]
                                } : {},
                                ...n.defaultFilters ? {
                                    defaultFilters: Z(n.defaultFilters)
                                } : {},
                                ...n.breakdownDimensions ? {
                                    breakdownDimensionKeys: [...n.breakdownDimensions]
                                } : {},
                                ...n.defaultBreakdown ? {
                                    defaultBreakdownDimensionKeys: [...n.defaultBreakdown]
                                } : {},
                                ...void 0 !== r ? {
                                    granularity: {
                                        fixed: {
                                            granularity: r
                                        }
                                    }
                                } : {},
                                ...n.annotationOptions ? {
                                    annotationOptions: {
                                        defaultAnnotationTypeKeys: [...n.annotationOptions.defaultAnnotationTypes],
                                        showAnnotationsControl: n.annotationOptions.showAnnotationsControl
                                    }
                                } : {}
                            }),
                            bodyNodes: t.surface.bodyNodes.map(ed)
                        }
                    }
                })
            }
        }
    }

    function ep(e) {
        var t;
        z(e) || Y("Backend custom dashboard document is missing config.");
        let n = z(e) ? null != (t = e.schemaVersion) ? t : e.schema_version : void 0;
        return "number" == typeof n && O.includes(n) || Y("Unsupported backend custom dashboard schema version ".concat(String(n), ".")), z(e.config) || Y("Backend custom dashboard document is missing config."), z(e.config.page) || Y("config.page must be an object."), (0, _.N)({
            page: function(e, t, n) {
                var r, i, a;
                if (z(e) || Y("".concat(t, " must be an object.")), e.mode === y.G.Untabbed) {
                    let r = e.surface;
                    z(r) || Y("".concat(t, ".surface must be an object."));
                    let i = null != (a = r.bodyNodes) ? a : r.body_nodes;
                    return Array.isArray(i) || Y("".concat(t, ".surface.bodyNodes must be an array.")), {
                        mode: y.G.Untabbed,
                        surface: {
                            controls: ec(r.controls, "".concat(t, ".surface.controls")),
                            bodyNodes: i.map((e, r) => eh(e, "".concat(t, ".surface.bodyNodes[").concat(r, "]"), n))
                        }
                    }
                }
                let o = e.untabbed;
                z(o) || Y("".concat(t, ".untabbed must be an object."));
                let s = o.surface;
                z(s) || Y("".concat(t, ".untabbed.surface must be an object."));
                let c = null != (r = null != (i = s.bodyNodes) ? i : s.body_nodes) ? r : [];
                return Array.isArray(c) || Y("".concat(t, ".untabbed.surface.bodyNodes must be an array.")), {
                    mode: y.G.Untabbed,
                    surface: {
                        controls: ec(s.controls, "".concat(t, ".untabbed.surface.controls")),
                        bodyNodes: c.map((e, r) => eh(e, "".concat(t, ".untabbed.surface.bodyNodes[").concat(r, "]"), n))
                    }
                }
            }(e.config.page, "config.page", n)
        }, {
            limits: null
        })
    }

    function em(e) {
        if ("string" == typeof e) return e;
        if (!("object" == typeof e && null !== e && !Array.isArray(e))) return;
        let {
            seconds: t
        } = e;
        if ("number" == typeof t || "string" == typeof t) {
            let n = "number" == typeof t ? t : Number(t),
                r = e.nanos,
                i = "number" == typeof r ? r : "string" == typeof r ? Number(r) : 0;
            if (Number.isFinite(n) && Number.isFinite(i)) return new Date(1e3 * n + Math.floor(i / 1e6)).toISOString()
        }
    }

    function ey(e) {
        let t = "number" == typeof e ? e : "string" == typeof e && e.trim().length > 0 ? Number(e) : 0 / 0;
        return Number.isSafeInteger(t) && t > 0 ? t : void 0
    }

    function ev(e) {
        var t;
        return null != (t = e.dashboardId) ? t : ""
    }

    function eg(e) {
        var t, n, r, i, a, o, s;
        let c, u, l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : y.z,
            d = ev(e),
            h = null != (t = ey(e.universeId)) ? t : 0,
            f = null != (n = em(e.createdTime)) ? n : new Date(0).toISOString(),
            p = null != (r = em(e.updatedTime)) ? r : f,
            m = em(e.publishedTime),
            v = !0 === e.isPinned,
            g = e.createdBy,
            b = e.updatedBy,
            w = ey(null == g ? void 0 : g.userId),
            A = ey(null == b ? void 0 : b.userId);
        return (0, _.h)({
            id: d,
            schemaVersion: y.b,
            universeId: h,
            name: (0, _.H)(null != (i = e.name) ? i : "", null),
            description: (0, _.q)(null != (a = e.description) ? a : void 0, null),
            status: (c = (o = e).latestPublishedDocumentId, u = null != (s = o.latestPublishedVersion) ? s : 0, c || u > 0 ? "published" : "draft"),
            isPinned: v,
            pinnedAt: v ? em(e.pinnedTime) : void 0,
            createdAt: f,
            updatedAt: p,
            publishedAt: m,
            createdByUserId: null != w ? w : 0,
            createdByUsername: "",
            ...void 0 !== A ? {
                updatedByUserId: A
            } : {},
            config: l
        })
    }

    function eb(e) {
        var t;
        if (!e.metadata) throw Error("Custom dashboard API response is missing metadata.");
        return eg(e.metadata, (t = e.document) ? ep(t) : y.z)
    }

    function ew(e, t) {
        return "".concat(e, ":").concat(t)
    }
    let eA = class {
        async list(e, t) {
            return this.withApiErrors(e, void 0, async () => {
                var n, r;
                this.ensureAvailable();
                let i = t ? await this.client.listDashboards(e, t) : await this.listAllDashboards(e),
                    a = (null != (n = i.dashboards) ? n : []).map(t => (this.rememberMetadata(e, t), eg(t)));
                return {
                    items: (0, w.f)(a),
                    migrationFailedCount: 0,
                    nextPageToken: t && null != (r = i.nextPageToken) ? r : void 0,
                    capabilities: void 0 === i.capabilities ? void 0 : (0, c.M)(i.capabilities)
                }
            })
        }
        async listPinned(e) {
            return this.withApiErrors(e, void 0, async () => {
                var t;
                return this.ensureAvailable(), (null != (t = (await this.client.listPinnedDashboards(e)).dashboards) ? t : []).filter(e => "string" == typeof e.dashboardId && e.dashboardId.length > 0 && "string" == typeof e.name).map(e => ({
                    id: e.dashboardId,
                    name: e.name
                })).toSorted((e, t) => e.name !== t.name ? e.name < t.name ? -1 : 1 : e.id === t.id ? 0 : e.id < t.id ? -1 : 1)
            })
        }
        async getCapabilities(e) {
            return this.withApiErrors(e, void 0, async () => {
                this.ensureAvailable();
                let t = await this.client.getDashboardCapabilities(e);
                return (0, c.M)(t)
            })
        }
        async get(e, t) {
            return this.withApiErrors(e, t, async () => (this.ensureAvailable(), this.read(e, t)))
        }
        async read(e, t) {
            let n = await this.client.getDashboard({
                universeId: e,
                dashboardId: t
            });
            return this.rememberMetadata(e, n.metadata), eb(n)
        }
        async getVersion(e, t) {
            return this.withApiErrors(e, t, async () => {
                var n, r;
                this.ensureAvailable();
                let i = this.tokens.get(ew(e, t));
                return i ? i.revision : (await this.read(e, t), null != (n = null == (r = this.tokens.get(ew(e, t))) ? void 0 : r.revision) ? n : null)
            })
        }
        async create(e) {
            return this.withApiErrors(e.universeId, void 0, async () => {
                var t;
                this.ensureAvailable();
                let n = null != (t = e.config) ? t : y.z,
                    r = await this.client.createDashboard({
                        universeId: e.universeId,
                        name: e.name,
                        description: e.description,
                        document: ef(n)
                    });
                this.rememberMetadata(e.universeId, r.metadata);
                let i = eb(r);
                return this.emit({
                    universeId: e.universeId,
                    dashboardId: i.id,
                    eventType: "create"
                }), i
            })
        }
        async update(e, t, n, r) {
            return this.withApiErrors(e, t, async () => {
                let i;
                this.ensureAvailable();
                let a = {};
                void 0 !== n.name && (a.name = n.name), void 0 !== n.description && (a.description = n.description);
                let {
                    config: o
                } = n, s = void 0 !== a.name || void 0 !== a.description, c = void 0 !== o;
                if (!s && !c) return this.read(e, t);
                let u = await this.ensureTokens(e, t),
                    l = null == r ? void 0 : r.expectedVersion;
                if (void 0 !== o) {
                    let n = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(u, t, l),
                        document: ef(o),
                        ...s ? {
                            metadataPatch: a
                        } : {}
                    });
                    this.rememberMetadata(e, n.metadata), i = eb(n)
                } else if (s) {
                    let n = await this.client.updateDashboardMetadata({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(u, t, l),
                        patch: a
                    });
                    this.rememberMetadata(e, n)
                }
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "update"
                }), null != i ? i : this.read(e, t)
            })
        }
        async createAndPublish(e) {
            let t = await this.create(e);
            try {
                return await this.publish(e.universeId, t.id)
            } catch (n) {
                try {
                    let n = await this.read(e.universeId, t.id);
                    if ("published" === n.status) return n;
                    await this.delete(e.universeId, t.id)
                } catch (e) {
                    console.warn("ApiCustomDashboardService createAndPublish: could not confirm publish status; leftover draft may exist", {
                        dashboardId: t.id,
                        publishError: n,
                        confirmError: e
                    })
                }
                throw n
            }
        }
        async addChartTile(e, t, n, r) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let i = await this.read(e, t),
                    {
                        config: a,
                        tile: o
                    } = (0, v.f)({
                        config: i.config,
                        tile: n.tile,
                        nextTileId: (0, b.K)(),
                        limits: n.limits
                    }),
                    s = await this.ensureTokens(e, t),
                    c = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(s, t, null == r ? void 0 : r.expectedVersion),
                        document: ef(a)
                    });
                this.rememberMetadata(e, c.metadata);
                let u = eb(c);
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "add-chart-tile"
                }), {
                    document: u,
                    tile: o
                }
            })
        }
        async delete(e, t) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable(), await this.client.deleteDashboard({
                    universeId: e,
                    dashboardId: t
                }), this.tokens.delete(ew(e, t)), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "delete"
                })
            })
        }
        async duplicate(e, t, n) {
            return this.withApiErrors(e, t, async () => {
                var n;
                let r, i;
                this.ensureAvailable();
                let [a, o] = await Promise.all([this.read(e, t), this.list(e)]), s = this.dedupeName(a.name, o.items.map(e => e.name)), c = await this.client.duplicateDashboard({
                    universeId: e,
                    dashboardId: t,
                    destinationUniverseId: e,
                    name: s
                });
                this.rememberMetadata(e, c.metadata);
                let u = eb(c),
                    l = (n = u.config, r = (0, m.Q)(n).map(e => (0, g.f)(e)), i = (0, m.W)(n).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, g.f)(e))
                    })), (0, m.d)((0, m.r)(n, r), i));
                if ("published" !== u.status) {
                    let t = {
                        ...u,
                        config: l
                    };
                    return this.emit({
                        universeId: e,
                        dashboardId: t.id,
                        eventType: "duplicate"
                    }), t
                }
                let d = await this.ensureTokens(e, u.id),
                    h = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: u.id,
                        expectedHeadEtag: this.requireHeadEtag(d, u.id),
                        document: ef(l)
                    });
                this.rememberMetadata(e, h.metadata);
                let f = eb(h);
                return this.emit({
                    universeId: e,
                    dashboardId: f.id,
                    eventType: "duplicate"
                }), f
            })
        }
        async publish(e, t, n) {
            return this.withApiErrors(e, t, async () => {
                this.ensureAvailable();
                let r = await this.read(e, t),
                    i = await this.ensureTokens(e, t),
                    a = await this.client.publishDashboard({
                        universeId: e,
                        dashboardId: t,
                        expectedHeadEtag: this.requireHeadEtag(i, t, null == n ? void 0 : n.expectedVersion),
                        document: ef(r.config)
                    });
                this.rememberMetadata(e, a.metadata);
                let o = eb(a);
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "publish"
                }), o
            })
        }
        async unpublish(e, t) {
            return this.withApiErrors(e, t, async () => {
                throw this.ensureAvailable(), new l.X
            })
        }
        async pin(e, t) {
            return this.updatePinned(e, t, !0)
        }
        async unpin(e, t) {
            return this.updatePinned(e, t, !1)
        }
        async suggestDefaultName(e) {
            let t = await this.list(e);
            return (0, A.L)(t.items.map(e => e.name))
        }
        subscribe(e) {
            return this.ensureAvailable(), this.listeners.add(e), () => {
                this.listeners.delete(e)
            }
        }
        dispose() {
            this.disposed = !0, this.listeners.clear(), this.tokens.clear()
        }
        async updatePinned(e, t, n) {
            let r;
            this.ensureAvailable();
            for (let i = 0; i < 3; i += 1) try {
                return await this.withApiErrors(e, t, async () => {
                    this.ensureAvailable();
                    let r = await this.ensureTokens(e, t),
                        i = await this.client.updateDashboardMetadata({
                            universeId: e,
                            dashboardId: t,
                            expectedHeadEtag: this.requireHeadEtag(r, t),
                            patch: {
                                isPinned: n
                            }
                        });
                    return this.rememberMetadata(e, i), this.emit({
                        universeId: e,
                        dashboardId: t,
                        eventType: n ? "pin" : "unpin"
                    }), this.read(e, t)
                })
            } catch (e) {
                if (r = e, !(e instanceof l.h) || 2 === i) throw e
            }
            throw r
        }
        async ensureTokens(e, t) {
            let n = this.tokens.get(ew(e, t));
            if (n) return n;
            await this.read(e, t);
            let r = this.tokens.get(ew(e, t));
            if (!r) throw new l.h(t);
            return r
        }
        rememberMetadata(e, t) {
            var n, r;
            let i = t ? ev(t) : "",
                a = ew(e, i),
                o = this.tokens.get(a),
                s = t && null != (r = t.headEtag) ? r : void 0,
                c = o && o.headEtag === s ? o.revision : (null != (n = null == o ? void 0 : o.revision) ? n : 0) + 1,
                u = new Map(null == o ? void 0 : o.headEtagsByRevision);
            s && u.set(c, s);
            let l = {
                headEtag: s,
                revision: c,
                headEtagsByRevision: u
            };
            return i && this.tokens.set(a, l), l
        }
        requireHeadEtag(e, t, n) {
            let r = void 0 === n ? e.headEtag : e.headEtagsByRevision.get(n);
            if (!r) throw new l.h(t);
            return r
        }
        async refreshTokens(e, t) {
            try {
                let n = await this.client.getDashboard({
                    universeId: e,
                    dashboardId: t
                });
                this.rememberMetadata(e, n.metadata)
            } catch (e) {}
        }
        dedupeName(e, t) {
            let n = new Set(t.map(e => e.trim())),
                r = "".concat(e, " (copy)");
            return n.has(r) ? (0, A.K)(t, t => "".concat(e, " (copy ").concat(t, ")"), A.T) : r
        }
        async listAllDashboards(e, t) {
            var n, r;
            let i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [],
                a = arguments.length > 3 ? arguments[3] : void 0,
                o = await this.client.listDashboards(e, t ? {
                    pageToken: t
                } : void 0),
                s = [...i, ...null != (n = o.dashboards) ? n : []],
                c = null != (r = o.nextPageToken) ? r : void 0,
                u = null != a ? a : o.capabilities;
            return c ? this.listAllDashboards(e, c, s, u) : {
                dashboards: s,
                ...void 0 === u ? {} : {
                    capabilities: u
                }
            }
        }
        emit(e) {
            Array.from(this.listeners).forEach(t => {
                try {
                    t(e)
                } catch (e) {
                    console.warn("CustomDashboardService listener threw", e)
                }
            })
        }
        ensureAvailable() {
            if (this.disposed) throw new l.X
        }
        async withApiErrors(e, t, n) {
            try {
                return await n()
            } catch (r) {
                let n = (0, T.f)(r, t);
                throw n instanceof l.h && void 0 !== e && t && await this.refreshTokens(e, t), n
            }
        }
        constructor(e = (0, S.y)()) {
            (0, p._)(this, "pagesOnServer", !0), (0, p._)(this, "client", void 0), (0, p._)(this, "listeners", new Set), (0, p._)(this, "tokens", new Map), (0, p._)(this, "disposed", !1), this.client = e
        }
    };

    function eS(e) {
        return e instanceof l.u
    }

    function eT(e) {
        return {
            ...e,
            hybridOrigin: "localCopy"
        }
    }

    function eC(e) {
        return {
            ...e,
            hybridOrigin: "localCopy"
        }
    }

    function eE(e) {
        return {
            ...e,
            hybridOrigin: "server"
        }
    }
    let eD = class {
            async list(e, t) {
                var n;
                let [r, i] = await Promise.all([this.apiService.list(e, t), this.localService.list(e)]);
                return {
                    items: r.items.map(eE),
                    capabilities: null != (n = r.capabilities) ? n : c.X,
                    localItems: i.items.map(eC),
                    nextPageToken: r.nextPageToken,
                    migrationFailedCount: r.migrationFailedCount + i.migrationFailedCount
                }
            }
            listPinned(e) {
                return this.apiService.listPinned(e)
            }
            async getCapabilities(e) {
                var t, n, r;
                return null != (t = null == (n = (r = this.apiService).getCapabilities) ? void 0 : n.call(r, e)) ? t : c.X
            }
            async get(e, t) {
                try {
                    return eT(await this.localService.get(e, t))
                } catch (e) {
                    if (!eS(e)) throw e
                }
                return {
                    ...await this.apiService.get(e, t),
                    hybridOrigin: "server"
                }
            }
            async create(e) {
                return eT(await this.localService.create(e))
            }
            async createAndPublish(e) {
                return eT(await this.localService.createAndPublish(e))
            }
            async update(e, t, n, r) {
                return await this.ensureLocalDashboard(e, t), eT(await this.localService.update(e, t, n, r))
            }
            async addChartTile(e, t, n, r) {
                await this.ensureLocalDashboard(e, t);
                let i = await this.localService.addChartTile(e, t, n, r);
                return {
                    ...i,
                    document: eT(i.document)
                }
            }
            async delete(e, t) {
                await this.ensureLocalDashboard(e, t), await this.localService.delete(e, t)
            }
            async duplicate(e, t, n) {
                try {
                    return await this.ensureLocalDashboard(e, t), eT(await this.localService.duplicate(e, t, n))
                } catch (e) {
                    if (!eS(e) && !(e instanceof l.X)) throw e
                }
                return this.forkApiDashboardToLocal(e, t, n)
            }
            async forkApiDashboardToLocal(e, t, n) {
                var r, i, a;
                let o, s, c, u, l = await this.apiService.get(e, t),
                    d = await this.localService.list(e);
                return eT(await this.localService.create({
                    universeId: e,
                    name: (r = d.items.map(e => e.name), i = l.name, o = (0, A.u)("".concat(i).concat(" (local copy)")), (s = new Set(Array.from(r, e => e.trim()))).has(o) ? (0, A.K)(s, e => (0, A.u)("".concat(i, " (local copy ").concat(e, ")")), A.T) : o),
                    description: l.description,
                    createdByUserId: n.createdByUserId,
                    createdByUsername: n.createdByUsername,
                    config: (a = l.config, c = (0, m.Q)(a).map(e => (0, g.f)(e)), u = (0, m.W)(a).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, g.f)(e))
                    })), (0, m.d)((0, m.r)(a, c), u))
                }))
            }
            async publish(e, t, n) {
                return await this.ensureLocalDashboard(e, t), eT(await this.localService.publish(e, t, n))
            }
            async unpublish(e, t) {
                return await this.ensureLocalDashboard(e, t), eT(await this.localService.unpublish(e, t))
            }
            async pin(e, t) {
                return await this.ensureLocalDashboard(e, t), eT(await this.localService.pin(e, t))
            }
            async unpin(e, t) {
                return await this.ensureLocalDashboard(e, t), eT(await this.localService.unpin(e, t))
            }
            async suggestDefaultName(e) {
                return this.localService.suggestDefaultName(e)
            }
            async getVersion(e, t) {
                try {
                    await this.ensureLocalDashboard(e, t)
                } catch (e) {
                    if (e instanceof l.X) return null;
                    throw e
                }
                return this.localService.getVersion(e, t)
            }
            subscribe(e) {
                let t = this.localService.subscribe(e),
                    n = this.apiService.subscribe(e);
                return () => {
                    t(), n()
                }
            }
            dispose() {
                var e, t, n, r;
                null == (e = (t = this.localService).dispose) || e.call(t), null == (n = (r = this.apiService).dispose) || n.call(r)
            }
            async ensureLocalDashboard(e, t) {
                try {
                    return eT(await this.localService.get(e, t))
                } catch (e) {
                    if (eS(e)) throw new l.X;
                    throw e
                }
            }
            constructor(e) {
                (0, p._)(this, "pagesOnServer", !0), (0, p._)(this, "localService", void 0), (0, p._)(this, "apiService", void 0), this.localService = e.localService, this.apiService = e.apiService
            }
        },
        ex = {
            isoNow: () => new Date().toISOString()
        };
    var eI = e.i(730530),
        eU = e.i(881670);
    let e_ = {
        first: "(copy)",
        numbered: e => "(copy ".concat(e, ")")
    };

    function eO(e, t) {
        let n = null == t ? void 0 : t.pageSize;
        if (void 0 === n || n <= 0) return {
            items: e
        };
        let r = function(e) {
                if (!e) return 0;
                let t = Number(e);
                return Number.isFinite(t) && t >= 0 ? Math.floor(t) : 0
            }(null == t ? void 0 : t.pageToken),
            i = r + n;
        return {
            items: e.slice(r, i),
            nextPageToken: i < e.length ? String(i) : void 0
        }
    }
    e.s(["R", 0, function(e) {
        return {
            first: e.tPendingTranslation("(copy)", "Suffix appended to a duplicated dashboard name when the first copy is free; a leading space is added when concatenating with the base name", (0, eI.Q)("Label.CustomDashboards.DuplicateName.FirstSuffix", eU.f.Analytics)),
            numbered: t => e.tPendingTranslation("(copy {n})", "Suffix appended when a duplicate dashboard name collides; {n} is the disambiguation number (2, 3, …); a leading space is added when concatenating with the base name", (0, eI.Q)("Label.CustomDashboards.DuplicateName.NumberedSuffix", eU.f.Analytics), {
                n: String(t)
            })
        }
    }, "z", 0, e_], 322172);
    let ek = class {
            peekUniverseMap(e) {
                return this.store.get(e)
            }
            getOrCreateUniverseMap(e) {
                let t = this.store.get(e);
                return t || (t = new Map, this.store.set(e, t)), t
            }
            emit(e) {
                Array.from(this.listeners).forEach(t => {
                    try {
                        t(e)
                    } catch (e) {
                        console.warn("[CustomDashboardService] listener threw; ignoring.", e)
                    }
                })
            }
            assertUnderUniverseCap(e) {
                var t, n;
                let r = null != (t = null == (n = this.peekUniverseMap(e)) ? void 0 : n.size) ? t : 0,
                    i = this.getLimits(e).maxDashboardsPerUniverse;
                if (r >= i) throw new l.b("Universe ".concat(e, " is at the per-universe cap of ").concat(i, " dashboards. Delete one to create another."))
            }
            assertUnderPinnedCap(e, t) {
                let n = this.peekUniverseMap(e);
                if (!n) return;
                let r = Array.from(n.values()).filter(e => e.document.isPinned && e.document.id !== t).length,
                    i = this.getLimits(e).maxPinnedDashboardsPerUniverse;
                if (r >= i) throw new l.b("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(i, ". Unpin one to pin another."))
            }
            loadOrThrow(e, t) {
                let n = this.peekUniverseMap(e),
                    r = null == n ? void 0 : n.get(t);
                if (!n || !r) throw new l.u(t);
                return {
                    universeMap: n,
                    record: r
                }
            }
            async applyMutation(e, t, n, r, i) {
                let {
                    universeMap: a,
                    record: o
                } = this.loadOrThrow(e, t);
                if ((null == i ? void 0 : i.expectedVersion) !== void 0 && i.expectedVersion !== o.version) throw new l.h(t);
                let s = this.clock.isoNow(),
                    c = {
                        ...o.document,
                        ...r(s),
                        updatedAt: s
                    };
                return a.set(t, {
                    document: c,
                    version: o.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: n
                }), c
            }
            async applyUpdateMutation(e, t, n, r, i) {
                let {
                    universeMap: a,
                    record: o
                } = this.loadOrThrow(e, t);
                if ((null == i ? void 0 : i.expectedVersion) !== void 0 && i.expectedVersion !== o.version) throw new l.h(t);
                let {
                    document: s,
                    result: c
                } = r(o, this.clock.isoNow());
                return a.set(t, {
                    document: s,
                    version: o.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: n
                }), c
            }
            async list(e, t) {
                let n = this.peekUniverseMap(e);
                return {
                    ...eO(n ? (0, w.f)([...n.values()].map(e => e.document)) : [], t),
                    migrationFailedCount: 0
                }
            }
            async listPinned(e) {
                let t = this.peekUniverseMap(e);
                return t ? (0, w.f)([...t.values()].map(e => e.document)).filter(e => e.isPinned).map(e => {
                    let {
                        id: t,
                        name: n
                    } = e;
                    return {
                        id: t,
                        name: n
                    }
                }) : []
            }
            async get(e, t) {
                return this.loadOrThrow(e, t).record.document
            }
            async getVersion(e, t) {
                var n, r, i;
                return null != (n = null == (i = this.peekUniverseMap(e)) || null == (r = i.get(t)) ? void 0 : r.version) ? n : null
            }
            insertNewDocument(e, t) {
                this.assertUnderUniverseCap(e.universeId);
                let n = this.getLimits(e.universeId),
                    r = (0, _.H)(e.name, n),
                    i = (0, _.q)(e.description, n),
                    a = void 0 !== e.config ? (0, _.N)(e.config, {
                        limits: n
                    }) : y.z,
                    o = this.clock.isoNow(),
                    s = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: y.b,
                        universeId: e.universeId,
                        name: r,
                        description: i,
                        status: t,
                        isPinned: !1,
                        createdAt: o,
                        updatedAt: o,
                        ..."published" === t ? {
                            publishedAt: o
                        } : {},
                        createdByUserId: e.createdByUserId,
                        createdByUsername: e.createdByUsername,
                        updatedByUserId: e.createdByUserId,
                        updatedByUsername: e.createdByUsername,
                        config: a
                    };
                return this.getOrCreateUniverseMap(e.universeId).set(s.id, {
                    document: s,
                    version: 1
                }), this.emit({
                    universeId: e.universeId,
                    dashboardId: s.id,
                    eventType: "create"
                }), s
            }
            async create(e) {
                return this.insertNewDocument(e, "draft")
            }
            async createAndPublish(e) {
                return this.insertNewDocument(e, "published")
            }
            async update(e, t, n, r) {
                let {
                    universeMap: i,
                    record: a
                } = this.loadOrThrow(e, t), o = this.getLimits(e);
                if ((null == r ? void 0 : r.expectedVersion) !== void 0 && r.expectedVersion !== a.version) throw new l.h(t);
                let s = void 0 !== n.name ? (0, _.H)(n.name, o) : a.document.name,
                    c = void 0 !== n.description ? (0, _.q)(n.description, o) : a.document.description,
                    u = void 0 !== n.config ? (0, _.N)(n.config, {
                        limits: o
                    }) : a.document.config,
                    d = {
                        ...a.document,
                        name: s,
                        description: c,
                        config: u,
                        updatedAt: this.clock.isoNow(),
                        ...(null == r ? void 0 : r.actor) ? {
                            updatedByUserId: r.actor.userId,
                            updatedByUsername: r.actor.username
                        } : {}
                    };
                return i.set(t, {
                    document: d,
                    version: a.version + 1
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "update"
                }), d
            }
            async addChartTile(e, t, n, r) {
                return this.applyUpdateMutation(e, t, "add-chart-tile", (e, t) => {
                    let {
                        config: i,
                        tile: a
                    } = (0, v.f)({
                        config: e.document.config,
                        tile: n.tile,
                        nextTileId: this.idFactory.nextTileId(),
                        limits: n.limits
                    }), o = {
                        ...e.document,
                        config: i,
                        updatedAt: t,
                        ...(null == r ? void 0 : r.actor) ? {
                            updatedByUserId: r.actor.userId,
                            updatedByUsername: r.actor.username
                        } : {}
                    };
                    return {
                        document: o,
                        result: {
                            document: o,
                            tile: a
                        }
                    }
                }, r)
            }
            async delete(e, t) {
                let {
                    universeMap: n
                } = this.loadOrThrow(e, t);
                n.delete(t), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "delete"
                })
            }
            async duplicate(e, t, n) {
                let r = this.loadOrThrow(e, t).record.document;
                this.assertUnderUniverseCap(e);
                let i = this.clock.isoNow(),
                    a = this.dedupeName(e, r.name),
                    o = () => this.idFactory.nextTileId(),
                    s = (0, m.Q)(r.config).map(e => (0, g.f)(e, o)),
                    c = (0, m.W)(r.config).map(e => ({
                        ...e,
                        tiles: e.tiles.map(e => (0, g.f)(e, o))
                    })),
                    u = {
                        ...r,
                        id: this.idFactory.nextDashboardId(),
                        name: a,
                        status: "draft",
                        isPinned: !1,
                        pinnedAt: void 0,
                        publishedAt: void 0,
                        createdAt: i,
                        updatedAt: i,
                        createdByUserId: n.createdByUserId,
                        createdByUsername: n.createdByUsername,
                        updatedByUserId: n.createdByUserId,
                        updatedByUsername: n.createdByUsername,
                        config: (0, m.d)((0, m.r)(r.config, s), c)
                    };
                return this.getOrCreateUniverseMap(e).set(u.id, {
                    document: u,
                    version: 1
                }), this.emit({
                    universeId: e,
                    dashboardId: u.id,
                    eventType: "duplicate"
                }), u
            }
            async publish(e, t, n) {
                return this.applyMutation(e, t, "publish", e => ({
                    status: "published",
                    publishedAt: e
                }), n)
            }
            async unpublish(e, t) {
                return this.applyMutation(e, t, "unpublish", () => ({
                    status: "draft"
                }))
            }
            async pin(e, t) {
                return this.assertUnderPinnedCap(e, t), this.applyMutation(e, t, "pin", e => ({
                    isPinned: !0,
                    pinnedAt: e
                }))
            }
            async unpin(e, t) {
                return this.applyMutation(e, t, "unpin", () => ({
                    isPinned: !1,
                    pinnedAt: void 0
                }))
            }
            async suggestDefaultName(e) {
                let t = this.peekUniverseMap(e);
                return (0, A.L)(t ? [...t.values()].map(e => e.document.name) : [])
            }
            subscribe(e) {
                return this.listeners.add(e), () => {
                    this.listeners.delete(e)
                }
            }
            dedupeName(e, t) {
                let n = this.peekUniverseMap(e),
                    r = n ? [...n.values()].map(e => e.document.name) : [];
                return (0, A.r)(r, t, this.duplicateNameSuffixes)
            }
            constructor(e = {}) {
                var t, n, r, i, a;
                (0, p._)(this, "pagesOnServer", void 0), (0, p._)(this, "store", new Map), (0, p._)(this, "listeners", new Set), (0, p._)(this, "clock", void 0), (0, p._)(this, "idFactory", void 0), (0, p._)(this, "duplicateNameSuffixes", void 0), (0, p._)(this, "getLimits", void 0), this.getLimits = null != (t = e.getLimits) ? t : () => u.j, this.clock = null != (n = e.clock) ? n : ex, this.idFactory = null != (r = e.idFactory) ? r : b.q, this.duplicateNameSuffixes = null != (i = e.duplicateNameSuffixes) ? i : e_, this.pagesOnServer = null != (a = e.pagesOnServer) && a
            }
        },
        eR = [{
            fromVersion: 0,
            toVersion: 1,
            description: "v0 → v1 identity: alpha records had no schemaVersion field but were v1-shaped.",
            migrate: e => e
        }, {
            fromVersion: 1,
            toVersion: 3,
            description: "v1 → v3: store config with stable variant keys and generic computed sources.",
            migrate: e => ({
                ...e,
                ...ef((0, _.N)(e.config, {
                    limits: null
                }))
            })
        }];
    var eP = e.i(115232);
    let eB = "creator-hub:custom-dashboards:v1:universe:",
        eN = /^\d+$/;

    function eM(e) {
        return "".concat(eB).concat(e)
    }

    function eL(e, t, n) {
        let r = "".concat("creator-hub:custom-dashboards:v1:unreadable:universe:").concat(t);
        try {
            e.setItem(r, n)
        } catch (e) {}
        return {
            ok: !1,
            unreadableSidecarKey: r
        }
    }

    function eG(e, t, n, r) {
        let i = {};
        Object.entries(n).forEach(e => {
            let [t, n] = e;
            i[t] = {
                document: {
                    ...n.document,
                    ...ef(n.document.config)
                },
                version: n.version
            }
        }), Object.entries(r).forEach(e => {
            let [t, n] = e;
            t in i || (i[t] = n)
        });
        try {
            e.setItem(eM(t), JSON.stringify({
                records: i
            }))
        } catch (e) {
            if (function(e) {
                    if (!(0, eP.s)(e)) return !1;
                    let t = e.code,
                        n = e.name;
                    return 22 === t || "QuotaExceededError" === n || "NS_ERROR_DOM_QUOTA_REACHED" === n
                }(e)) throw new l.b;
            if (e instanceof l.z) throw e;
            throw new l.z(e)
        }
    }

    function eH(e, t, n) {
        if (Object.keys(t).length >= n) throw new l.b("Universe ".concat(e, " is at the per-universe cap of ").concat(n, " dashboards. Delete one to create another."))
    }
    let eK = class {
            getCorruptedRecordsForUniverse(e) {
                var t;
                return null != (t = this.corruptedByUniverse.get(e)) ? t : []
            }
            getStorageUnreadableSidecarKey(e) {
                var t;
                return null != (t = this.storageUnreadableByUniverse.get(e)) ? t : null
            }
            dispose() {
                this.storageListenerAttached && window.removeEventListener("storage", this.handleStorageEvent), this.storageListenerAttached = !1, this.listeners.clear(), this.materialisedByUniverse.clear(), this.disposed = !0
            }
            ensureStorageListener() {
                this.disposed || this.storageListenerAttached || (window.addEventListener("storage", this.handleStorageEvent), this.storageListenerAttached = !0)
            }
            requireStorage() {
                if (this.disposed) throw new l.X;
                let e = function() {
                    try {
                        var e;
                        return null != (e = window.localStorage) ? e : null
                    } catch (e) {
                        return null
                    }
                }();
                if (!e) throw new l.X;
                return this.ensureStorageListener(), e
            }
            emit(e) {
                Array.from(this.listeners).forEach(t => {
                    try {
                        t(e)
                    } catch (e) {
                        console.warn("[CustomDashboardService] listener threw; ignoring.", e)
                    }
                })
            }
            assertUnderUniverseCap(e) {
                let {
                    records: t
                } = this.readMaterialised(e, "swallowUnreadable");
                eH(e, t, this.getLimits(e).maxDashboardsPerUniverse)
            }
            readMaterialised(e) {
                var t, n, r;
                let i, a, o, s, c = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "throwOnUnreadable",
                    u = this.requireStorage(),
                    d = u.getItem(eM(e)),
                    h = this.materialisedByUniverse.get(e);
                if (h && h.rawString === d) return {
                    storage: u,
                    records: h.records,
                    quarantine: h.quarantine
                };
                let f = function(e, t, n) {
                    let r;
                    if (!n) return {
                        ok: !0,
                        bucket: {
                            records: {}
                        }
                    };
                    try {
                        r = JSON.parse(n)
                    } catch (r) {
                        return eL(e, t, n)
                    }
                    return (0, eP.s)(r) && (0, eP.s)(r.records) ? {
                        ok: !0,
                        bucket: {
                            records: r.records
                        }
                    } : eL(e, t, n)
                }(u, e, d);
                if (!f.ok) {
                    if (this.storageUnreadableByUniverse.set(e, f.unreadableSidecarKey), "throwOnUnreadable" === c) throw new l.W(f.unreadableSidecarKey);
                    return {
                        storage: u,
                        records: {},
                        quarantine: {}
                    }
                }
                this.storageUnreadableByUniverse.delete(e);
                let {
                    records: p,
                    quarantine: m,
                    corrupted: v,
                    mutatedOnRead: g
                } = (t = f.bucket, i = {}, a = {}, o = [], s = !1, Object.entries(null != (n = t.records) ? n : {}).forEach(t => {
                    var n, r, c;
                    let [u, d] = t;
                    if (!d || "object" != typeof d) {
                        a[u] = {
                            version: 1,
                            migrationFailed: !0,
                            reason: "record was not an object",
                            raw: d
                        }, o.push({
                            id: u,
                            reason: "record was not an object",
                            code: "OTHER"
                        });
                        return
                    }
                    if (n = d, (0, eP.s)(n) && !0 === n.migrationFailed) {
                        if (! function(e) {
                                if (!(0, eP.s)(e.raw) || "number" != typeof e.raw.schemaVersion) return !1;
                                let {
                                    schemaVersion: t
                                } = e.raw;
                                if (t > y.b) return !1;
                                if ("NEWER" === e.code) return !0;
                                let n = /^Stored custom dashboard schema v(\d+) is newer than the client's v(\d+)\.$/.exec(e.reason);
                                return null !== n && Number(n[1]) === t && Number(n[2]) < t
                            }(d)) {
                            a[u] = d, o.push({
                                id: u,
                                reason: d.reason,
                                code: "NEWER" === d.code ? "NEWER" : "OTHER"
                            });
                            return
                        }
                        d = {
                            document: d.raw,
                            version: d.version
                        }, s = !0
                    }
                    if (r = d, !(0, eP.s)(r) || "number" != typeof r.version || !("document" in r)) {
                        a[u] = {
                            version: 1,
                            migrationFailed: !0,
                            reason: "record was not a live persisted record",
                            raw: d
                        }, o.push({
                            id: u,
                            reason: "record was not a live persisted record",
                            code: "OTHER"
                        });
                        return
                    }
                    let {
                        document: h,
                        version: f
                    } = d, p = (0, eP.s)(h) ? h : {}, m = "number" == typeof p.schemaVersion ? p.schemaVersion : void 0;
                    try {
                        let t = (c = {
                            schemaVersion: m,
                            ...p
                        }, function(e, t, n) {
                            let r = {
                                    ...e
                                },
                                i = "number" == typeof e.schemaVersion ? e.schemaVersion : 0;
                            if (i > n) throw new l.m(i, n);
                            let a = i,
                                o = t.length + 1,
                                s = 0;
                            for (; a < n && s < o;) {
                                let e = a,
                                    i = t.find(t => t.fromVersion === e);
                                if (!i) throw new l.g(e, n);
                                let o = i.migrate(r),
                                    c = o.schemaVersion;
                                if ("number" == typeof c && c !== e && c !== i.toVersion) throw new l.g(e, n, "Migration step ".concat(e, " → ").concat(i.toVersion, " produced schemaVersion ").concat(c, "."));
                                r = {
                                    ...o,
                                    schemaVersion: i.toVersion
                                }, a = i.toVersion, s += 1
                            }
                            if (a !== n) throw new l.g(a, n, "Migration pipeline did not converge after ".concat(s, " steps (stopped at version ").concat(a, ")."));
                            return {
                                ...r,
                                schemaVersion: n
                            }
                        }(c, eR, y.b));
                        m !== t.schemaVersion && (s = !0);
                        let n = (0, _.h)({
                            ...t,
                            universeId: e,
                            config: ep(t)
                        });
                        if (n.id !== u) {
                            let e = 'bucket key "'.concat(u, '" does not match document.id "').concat(n.id, '"');
                            a[u] = {
                                version: "number" == typeof f ? f : 1,
                                migrationFailed: !0,
                                reason: e,
                                raw: h
                            }, o.push({
                                id: u,
                                reason: e,
                                code: "OTHER"
                            }), s = !0;
                            return
                        }
                        i[n.id] = {
                            document: n,
                            version: "number" == typeof f ? f : 1
                        }
                    } catch (n) {
                        let e = n instanceof l.m,
                            t = n instanceof Error ? n.message : String(n);
                        a[u] = {
                            version: "number" == typeof f ? f : 1,
                            migrationFailed: !0,
                            reason: t,
                            code: e ? "NEWER" : "OTHER",
                            raw: h
                        }, o.push({
                            id: u,
                            reason: t,
                            code: e ? "NEWER" : "OTHER"
                        }), s = !0
                    }
                }), {
                    records: i,
                    quarantine: a,
                    corrupted: o,
                    mutatedOnRead: s
                });
                if (this.corruptedByUniverse.set(e, v), g) try {
                    eG(u, e, p, m);
                    let t = u.getItem(eM(e));
                    this.materialisedByUniverse.set(e, {
                        rawString: t,
                        records: p,
                        quarantine: m
                    })
                } catch (e) {
                    null == (r = this.onPersistError) || r.call(this, e)
                } else this.materialisedByUniverse.set(e, {
                    rawString: d,
                    records: p,
                    quarantine: m
                });
                return {
                    storage: u,
                    records: p,
                    quarantine: m
                }
            }
            async list(e, t) {
                var n, r;
                let {
                    records: i
                } = this.readMaterialised(e), a = (0, w.f)(Object.values(i).map(e => e.document)), o = null != (n = null == (r = this.corruptedByUniverse.get(e)) ? void 0 : r.length) ? n : 0;
                return {
                    ...eO(a, t),
                    migrationFailedCount: o
                }
            }
            async listPinned(e) {
                let {
                    records: t
                } = this.readMaterialised(e);
                return (0, w.f)(Object.values(t).map(e => e.document)).filter(e => e.isPinned).map(e => {
                    let {
                        id: t,
                        name: n
                    } = e;
                    return {
                        id: t,
                        name: n
                    }
                })
            }
            async get(e, t) {
                let {
                    records: n
                } = this.readMaterialised(e), r = n[t];
                if (!r) throw new l.u(t);
                return r.document
            }
            async getVersion(e, t) {
                var n, r;
                let {
                    records: i
                } = this.readMaterialised(e);
                return null != (n = null == (r = i[t]) ? void 0 : r.version) ? n : null
            }
            commit(e, t) {
                let {
                    storage: n,
                    records: r,
                    quarantine: i
                } = this.readMaterialised(e), {
                    next: a,
                    result: o
                } = t(r, i);
                eG(n, e, a, i);
                let s = n.getItem(eM(e));
                return this.materialisedByUniverse.set(e, {
                    rawString: s,
                    records: a,
                    quarantine: i
                }), o
            }
            insertNewDocument(e, t) {
                this.assertUnderUniverseCap(e.universeId);
                let n = this.getLimits(e.universeId),
                    r = (0, _.H)(e.name, n),
                    i = (0, _.q)(e.description, n),
                    a = void 0 !== e.config ? (0, _.N)(e.config, {
                        limits: n
                    }) : y.z,
                    o = this.clock.isoNow(),
                    s = {
                        id: this.idFactory.nextDashboardId(),
                        schemaVersion: y.b,
                        universeId: e.universeId,
                        name: r,
                        description: i,
                        status: t,
                        isPinned: !1,
                        createdAt: o,
                        updatedAt: o,
                        ..."published" === t ? {
                            publishedAt: o
                        } : {},
                        createdByUserId: e.createdByUserId,
                        createdByUsername: e.createdByUsername,
                        updatedByUserId: e.createdByUserId,
                        updatedByUsername: e.createdByUsername,
                        config: a
                    };
                return this.commit(e.universeId, t => (eH(e.universeId, t, n.maxDashboardsPerUniverse), {
                    next: {
                        ...t,
                        [s.id]: {
                            document: s,
                            version: 1
                        }
                    },
                    result: void 0
                })), this.emit({
                    universeId: e.universeId,
                    dashboardId: s.id,
                    eventType: "create"
                }), s
            }
            async create(e) {
                return this.insertNewDocument(e, "draft")
            }
            async createAndPublish(e) {
                return this.insertNewDocument(e, "published")
            }
            async update(e, t, n, r) {
                let i = this.getLimits(e),
                    a = {};
                return void 0 !== n.name && (a.name = (0, _.H)(n.name, i)), void 0 !== n.description && (a.description = (0, _.q)(n.description, i)), void 0 !== n.config && (a.config = (0, _.N)(n.config, {
                    limits: i
                })), this.applyMutation(e, t, "update", () => ({
                    ...a,
                    ...(null == r ? void 0 : r.actor) ? {
                        updatedByUserId: r.actor.userId,
                        updatedByUsername: r.actor.username
                    } : {}
                }), {
                    expectedVersion: null == r ? void 0 : r.expectedVersion
                })
            }
            async addChartTile(e, t, n, r) {
                let i = this.commit(e, e => {
                    let i = e[t];
                    if (!i) throw new l.u(t);
                    if ((null == r ? void 0 : r.expectedVersion) !== void 0 && r.expectedVersion !== i.version) throw new l.h(t);
                    let {
                        config: a,
                        tile: o
                    } = (0, v.f)({
                        config: i.document.config,
                        tile: n.tile,
                        nextTileId: this.idFactory.nextTileId(),
                        limits: n.limits
                    }), s = this.clock.isoNow(), c = {
                        ...i.document,
                        config: a,
                        updatedAt: s,
                        ...(null == r ? void 0 : r.actor) ? {
                            updatedByUserId: r.actor.userId,
                            updatedByUsername: r.actor.username
                        } : {}
                    };
                    return {
                        next: {
                            ...e,
                            [t]: {
                                document: c,
                                version: i.version + 1
                            }
                        },
                        result: {
                            document: c,
                            tile: o
                        }
                    }
                });
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "add-chart-tile"
                }), i
            }
            async delete(e, t) {
                this.commit(e, e => {
                    if (!e[t]) throw new l.u(t);
                    let n = {
                        ...e
                    };
                    return delete n[t], {
                        next: n,
                        result: void 0
                    }
                }), this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "delete"
                })
            }
            async duplicate(e, t, n) {
                this.assertUnderUniverseCap(e);
                let r = this.commit(e, r => {
                    var i;
                    let a = null == (i = r[t]) ? void 0 : i.document;
                    if (!a) throw new l.u(t);
                    eH(e, r, this.getLimits(e).maxDashboardsPerUniverse);
                    let o = Object.values(r).map(e => e.document.name),
                        s = (0, A.r)(o, a.name, this.duplicateNameSuffixes),
                        c = this.clock.isoNow(),
                        u = () => this.idFactory.nextTileId(),
                        d = (0, m.Q)(a.config).map(e => (0, g.f)(e, u)),
                        h = (0, m.W)(a.config).map(e => ({
                            ...e,
                            tiles: e.tiles.map(e => (0, g.f)(e, u))
                        })),
                        f = {
                            ...a,
                            id: this.idFactory.nextDashboardId(),
                            name: s,
                            status: "draft",
                            isPinned: !1,
                            pinnedAt: void 0,
                            publishedAt: void 0,
                            createdAt: c,
                            updatedAt: c,
                            createdByUserId: n.createdByUserId,
                            createdByUsername: n.createdByUsername,
                            updatedByUserId: n.createdByUserId,
                            updatedByUsername: n.createdByUsername,
                            config: (0, m.d)((0, m.r)(a.config, d), h)
                        };
                    return {
                        next: {
                            ...r,
                            [f.id]: {
                                document: f,
                                version: 1
                            }
                        },
                        result: f
                    }
                });
                return this.emit({
                    universeId: e,
                    dashboardId: r.id,
                    eventType: "duplicate"
                }), r
            }
            async publish(e, t, n) {
                return this.applyMutation(e, t, "publish", e => ({
                    status: "published",
                    publishedAt: e
                }), n)
            }
            async unpublish(e, t) {
                return this.applyMutation(e, t, "unpublish", () => ({
                    status: "draft"
                }))
            }
            async pin(e, t) {
                let n = this.commit(e, n => {
                    let r = n[t];
                    if (!r) throw new l.u(t);
                    var i = this.getLimits(e).maxPinnedDashboardsPerUniverse;
                    if (Object.values(n).filter(e => e.document.isPinned && e.document.id !== t).length >= i) throw new l.b("Universe ".concat(e, " is at the pinned-dashboard cap of ").concat(i, ". Unpin one to pin another."));
                    let a = this.clock.isoNow(),
                        o = {
                            ...r.document,
                            isPinned: !0,
                            pinnedAt: a,
                            updatedAt: a
                        };
                    return {
                        next: {
                            ...n,
                            [t]: {
                                document: o,
                                version: r.version + 1
                            }
                        },
                        result: o
                    }
                });
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: "pin"
                }), n
            }
            async unpin(e, t) {
                return this.applyMutation(e, t, "unpin", () => ({
                    isPinned: !1,
                    pinnedAt: void 0
                }))
            }
            async suggestDefaultName(e) {
                let {
                    records: t
                } = this.readMaterialised(e, "swallowUnreadable");
                return (0, A.L)(Object.values(t).map(e => e.document.name))
            }
            subscribe(e) {
                return this.disposed ? () => void 0 : (this.ensureStorageListener(), this.listeners.add(e), () => {
                    this.listeners.delete(e)
                })
            }
            async applyMutation(e, t, n, r, i) {
                let a = this.commit(e, e => {
                    let n = e[t];
                    if (!n) throw new l.u(t);
                    if ((null == i ? void 0 : i.expectedVersion) !== void 0 && i.expectedVersion !== n.version) throw new l.h(t);
                    let a = this.clock.isoNow(),
                        o = {
                            ...n.document,
                            ...r(a),
                            updatedAt: a
                        };
                    return {
                        next: {
                            ...e,
                            [t]: {
                                document: o,
                                version: n.version + 1
                            }
                        },
                        result: o
                    }
                });
                return this.emit({
                    universeId: e,
                    dashboardId: t,
                    eventType: n
                }), a
            }
            constructor(e = {}) {
                var t, n, r, i;
                (0, p._)(this, "listeners", new Set), (0, p._)(this, "storageListenerAttached", !1), (0, p._)(this, "disposed", !1), (0, p._)(this, "corruptedByUniverse", new Map), (0, p._)(this, "storageUnreadableByUniverse", new Map), (0, p._)(this, "materialisedByUniverse", new Map), (0, p._)(this, "clock", void 0), (0, p._)(this, "idFactory", void 0), (0, p._)(this, "onPersistError", void 0), (0, p._)(this, "duplicateNameSuffixes", void 0), (0, p._)(this, "getLimits", void 0), (0, p._)(this, "handleStorageEvent", e => {
                    if (!e.key) return;
                    let t = function(e) {
                        if (!e.startsWith(eB)) return null;
                        let t = e.slice(eB.length);
                        if (!eN.test(t)) return null;
                        let n = Number(t);
                        return Number.isSafeInteger(n) ? n : null
                    }(e.key);
                    null !== t && (this.materialisedByUniverse.delete(t), this.emit({
                        universeId: t,
                        eventType: "external"
                    }))
                }), this.getLimits = null != (t = e.getLimits) ? t : () => u.j, this.clock = null != (n = e.clock) ? n : ex, this.onPersistError = e.onPersistError, this.idFactory = null != (r = e.idFactory) ? r : b.q, this.duplicateNameSuffixes = null != (i = e.duplicateNameSuffixes) ? i : e_
            }
        },
        eV = {
            canCreate: !1,
            canEdit: !1,
            canPublish: !1,
            canDelete: !1
        },
        eF = {
            actions: eV,
            limits: (0, u.A)(c.X.limits),
            isResolved: !1
        },
        eW = {
            ...eF,
            isResolved: !0
        },
        ej = {
            ...eW,
            actions: {
                canCreate: !0,
                canEdit: !0,
                canPublish: !0,
                canDelete: !0
            }
        },
        ez = {
            kind: "fixed",
            state: eF
        },
        eq = {
            list: async () => ({
                items: [],
                migrationFailedCount: 0
            }),
            listPinned: async () => [],
            async get() {
                throw new l.X
            },
            async create() {
                throw new l.X
            },
            async createAndPublish() {
                throw new l.X
            },
            async update() {
                throw new l.X
            },
            async addChartTile() {
                throw new l.X
            },
            async delete() {
                throw new l.X
            },
            async duplicate() {
                throw new l.X
            },
            async publish() {
                throw new l.X
            },
            async unpublish() {
                throw new l.X
            },
            async pin() {
                throw new l.X
            },
            async unpin() {
                throw new l.X
            },
            async suggestDefaultName() {
                throw new l.X
            },
            getVersion: async () => null,
            subscribe: () => () => void 0
        },
        eY = (0, r.createContext)(null),
        eX = (0, r.createContext)(!1);

    function eQ(e, t) {
        var i, a, o;
        let s, c, l = (0, n.c)(9),
            d = (0, r.useContext)(eX),
            f = null != (i = null == e ? void 0 : e.capabilitySource) ? i : ez,
            p = "fixed" === f.kind ? null : f,
            m = "server" === f.kind && t && !d;
        l[0] !== m ? (s = {
            enabled: m
        }, l[0] = m, l[1] = s) : s = l[1];
        let {
            capabilities: y,
            isResolved: v,
            isError: g
        } = (0, h.f)(null != (a = null == p ? void 0 : p.universeId) ? a : 0, null != (o = null == e ? void 0 : e.backends.api) ? o : eq, s);
        return l[2] !== y || l[3] !== g || l[4] !== v || l[5] !== f.isBackendChosen || l[6] !== f.kind || l[7] !== f.state ? (c = "fixed" === f.kind ? f.state : "hybrid" === f.kind ? {
            ...ej,
            limits: (0, u.b)(v ? y : void 0)
        } : function(e, t) {
            let {
                capabilities: n,
                isResolved: r,
                isError: i
            } = e;
            return t ? i ? eW : {
                actions: {
                    canCreate: n.canCreate,
                    canEdit: n.canEdit,
                    canPublish: n.canPublish,
                    canDelete: n.canDelete
                },
                limits: (0, u.A)(n.limits),
                isResolved: r
            } : eF
        }({
            capabilities: y,
            isResolved: v,
            isError: g
        }, f.isBackendChosen), l[2] = y, l[3] = g, l[4] = v, l[5] = f.isBackendChosen, l[6] = f.kind, l[7] = f.state, l[8] = c) : c = l[8], c
    }
    e.s(["K", 0, e => {
        let r, i = (0, n.c)(2),
            {
                children: a
            } = e;
        return i[0] !== a ? (r = (0, t.jsx)(eX.Provider, {
            value: !0,
            children: a
        }), i[0] = a, i[1] = r) : r = i[1], r
    }, "H", 0, e => {
        let i, o, s, c, l, h = (0, n.c)(22),
            {
                service: f,
                canMutateDashboards: p,
                children: m
            } = e,
            y = (0, a.d)();
        h[0] !== y ? (i = () => {
            let e, t, n;
            return e = new eA((0, S.y)()), t = null, n = e => (0, u.b)(y.getQueryData(d.D.capabilities(e))), {
                api: e,
                getHybrid: () => (null != t || (t = new eD({
                    apiService: e,
                    localService: function(e) {
                        try {
                            if (window.localStorage) return new eK({
                                getLimits: e
                            })
                        } catch (e) {}
                        return new ek({
                            getLimits: e
                        })
                    }(n)
                })), t),
                dispose: () => {
                    null == t || t.dispose(), e.dispose()
                }
            }
        }, h[0] = y, h[1] = i) : i = h[1];
        let [v] = (0, r.useState)(i);
        h[2] !== v.dispose ? (o = () => v.dispose, h[2] = v.dispose, h[3] = o) : o = h[3], h[4] !== v ? (s = [v], h[4] = v, h[5] = s) : s = h[5], (0, r.useEffect)(o, s);
        e: {
            let e, t, n, r;
            if (!f) {
                let e;
                h[6] !== v ? (e = {
                    service: eq,
                    isReady: !1,
                    capabilitySource: ez,
                    backends: v
                }, h[6] = v, h[7] = e) : e = h[7], c = e;
                break e
            }
            let i = void 0 === p || p ? ej : eW;h[8] !== i ? (e = {
                kind: "fixed",
                state: i
            }, h[8] = i, h[9] = e) : e = h[9],
            h[10] !== f ? (t = () => f, h[10] = f, h[11] = t) : t = h[11],
            h[12] !== f || h[13] !== t ? (n = {
                api: f,
                getHybrid: t
            }, h[12] = f, h[13] = t, h[14] = n) : n = h[14],
            h[15] !== f || h[16] !== e || h[17] !== n ? (r = {
                service: f,
                isReady: !0,
                capabilitySource: e,
                backends: n
            }, h[15] = f, h[16] = e, h[17] = n, h[18] = r) : r = h[18],
            c = r
        }
        let g = c;
        return h[19] !== m || h[20] !== g ? (l = (0, t.jsx)(eY.Provider, {
            value: g,
            children: m
        }), h[19] = m, h[20] = g, h[21] = l) : l = h[21], l
    }, "N", 0, e => {
        let a, c, u, l, d, p, m = (0, n.c)(26),
            {
                children: y
            } = e,
            v = (0, r.useContext)(eY);
        if (!v) throw Error("UniverseFlaggedCustomDashboardProvider must be used within CustomDashboardServiceProvider.");
        let g = (d = (0, n.c)(2), p = (0, i.useRouter)(), d[0] !== p ? (l = (0, f.f)(p), d[0] = p, d[1] = l) : l = d[1], l),
            b = Number.isFinite(g) && g > 0,
            {
                ready: w,
                value: A
            } = (0, o.f)(s.y),
            S = w && A,
            {
                backends: T
            } = v;
        m[0] !== S ? (a = {
            enabled: S
        }, m[0] = S, m[1] = a) : a = m[1];
        let C = function(e) {
                let {
                    isFlagReady: t,
                    isHybridCandidate: n,
                    hasUniverse: r,
                    capabilitiesQuery: {
                        capabilities: i,
                        isResolved: a,
                        isError: o
                    }
                } = e;
                return t ? n ? !r || a || o ? !o && r && (i.canCreate || i.canEdit) ? "api" : "hybrid" : "pending" : "api" : "pending"
            }({
                isFlagReady: w,
                isHybridCandidate: S,
                hasUniverse: b,
                capabilitiesQuery: (0, h.f)(g, T.api, a)
            }),
            [E, D] = (0, r.useState)(null);
        "pending" !== C && (null == E ? void 0 : E.universeId) !== g && D({
            universeId: g,
            mode: C
        });
        let x = (null == E ? void 0 : E.universeId) === g ? E.mode : C;
        e: {
            let e, t;
            if ("hybrid" === x) {
                let e, t, n;
                m[2] !== T ? (e = T.getHybrid(), m[2] = T, m[3] = e) : e = m[3], m[4] !== g ? (t = {
                    kind: "hybrid",
                    universeId: g
                }, m[4] = g, m[5] = t) : t = m[5], m[6] !== T || m[7] !== e || m[8] !== t ? (n = {
                    backends: T,
                    service: e,
                    isReady: !0,
                    capabilitySource: t
                }, m[6] = T, m[7] = e, m[8] = t, m[9] = n) : n = m[9], c = n;
                break e
            }
            if ("api" === x) {
                let e, t;
                m[10] !== b || m[11] !== g ? (e = b ? {
                    kind: "server",
                    universeId: g,
                    isBackendChosen: !0
                } : {
                    kind: "fixed",
                    state: eW
                }, m[10] = b, m[11] = g, m[12] = e) : e = m[12], m[13] !== T || m[14] !== e ? (t = {
                    backends: T,
                    service: T.api,
                    isReady: !0,
                    capabilitySource: e
                }, m[13] = T, m[14] = e, m[15] = t) : t = m[15], c = t;
                break e
            }
            m[16] !== b || m[17] !== g ? (e = b ? {
                kind: "server",
                universeId: g,
                isBackendChosen: !1
            } : ez, m[16] = b, m[17] = g, m[18] = e) : e = m[18],
            m[19] !== T || m[20] !== v.service || m[21] !== e ? (t = {
                backends: T,
                service: v.service,
                isReady: !1,
                capabilitySource: e
            }, m[19] = T, m[20] = v.service, m[21] = e, m[22] = t) : t = m[22],
            c = t
        }
        let I = c;
        return m[23] !== y || m[24] !== I ? (u = (0, t.jsx)(eY.Provider, {
            value: I,
            children: y
        }), m[23] = y, m[24] = I, m[25] = u) : u = m[25], u
    }, "S", 0, function() {
        let e = (0, r.useContext)(eY),
            {
                actions: t
            } = eQ(e, !0);
        if (!e) throw Error("useCustomDashboardActions() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "V", 0, function() {
        let e = (0, r.useContext)(eY),
            {
                isResolved: t
            } = eQ(e, !0);
        if (!e) throw Error("useCustomDashboardActionsResolved() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "W", 0, function() {
        let e = (0, r.useContext)(eY),
            {
                limits: t
            } = eQ(e, !0);
        if (!e) throw Error("useCustomDashboardLimits() must be used within a CustomDashboardServiceProvider.");
        return t
    }, "a", 0, function() {
        let e = (0, r.useContext)(eY);
        if (!e) throw Error("useCustomDashboardService() must be used within a CustomDashboardServiceProvider.");
        return e.service
    }, "Z", 0, function() {
        let e, t = (0, n.c)(2),
            i = (0, r.useContext)(eY);
        if (!i) throw Error("useCustomDashboardsBackendState() must be used within CustomDashboardServiceProvider.");
        return t[0] !== i.isReady ? (e = {
            isReady: i.isReady
        }, t[0] = i.isReady, t[1] = e) : e = t[1], e
    }, "J", 0, function(e) {
        let t, i = (0, n.c)(4),
            {
                isRequested: a
            } = e,
            o = (0, r.useContext)(eY),
            {
                actions: s,
                isResolved: c
            } = eQ(o, a);
        return i[0] !== s || i[1] !== o || i[2] !== c ? (t = o ? {
            actions: s,
            isResolved: c
        } : {
            actions: eV,
            isResolved: !0
        }, i[0] = s, i[1] = o, i[2] = c, i[3] = t) : t = i[3], t
    }, "w", 0, function() {
        var e, t;
        return null != (e = null == (t = (0, r.useContext)(eY)) ? void 0 : t.service) ? e : null
    }, "j", 0, function() {
        var e;
        let t, i = (0, n.c)(2),
            a = (0, r.useContext)(eY),
            o = null != (e = null == a ? void 0 : a.isReady) && e;
        return i[0] !== o ? (t = {
            isReady: o
        }, i[0] = o, i[1] = t) : t = i[1], t
    }], 479236)
}, 379843, e => {
    "use strict";
    var t = e.i(531007);
    let n = [t.f.Spline, t.f.Area, t.f.DurationSpline, t.f.DurationArea, t.f.Bar, t.f.Column, t.f.Pie, t.f.Table],
        r = {
            Untabbed: "Untabbed"
        },
        i = {
            page: {
                mode: r.Untabbed,
                surface: {
                    controls: {},
                    bodyNodes: []
                }
            }
        };
    e.s(["I", 0, 3, "H", 0, n, "g", 0, {
        AverageOverTimePeriod: "AverageOverTimePeriod",
        AveragePerUniqueUser: "AveragePerUniqueUser",
        MostRecentDataPoint: "MostRecentDataPoint",
        Total: "Total",
        Median: "Median",
        Cumulative: "Cumulative"
    }, "i", 0, "Day", "G", 0, r, "z", 0, i, "b", 0, 3, "y", 0, [1, 2, 3], "x", 0, {
        Auto: "Auto",
        Custom: "Custom"
    }])
}, 296150, 98949, 115232, 646877, e => {
    "use strict";
    var t = e.i(650040),
        n = e.i(318727),
        r = e.i(31611),
        i = e.i(531007),
        a = e.i(36826),
        o = e.i(908374),
        s = e.i(545154),
        c = e.i(731197),
        u = e.i(283561),
        l = e.i(379843),
        d = e.i(102716),
        h = e.i(377396),
        f = e.i(841383);
    let p = r.L1.OneDay;

    function m(e, t) {
        return (0, f.a)(e, t === l.g.Cumulative ? r.L1.None : p)
    }

    function y(e, t) {
        return m(e, t) ? t : m(e, l.g.AverageOverTimePeriod) ? l.g.AverageOverTimePeriod : m(e, l.g.Cumulative) ? l.g.Cumulative : null
    }
    e.s(["J", 0, p, "y", 0, m, "s", 0, y], 98949);
    var v = e.i(956154);
    let g = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{3})?Z$/;

    function b(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function w(e, t) {
        if (!b(e)) throw new u.C(t, "".concat(t, " must be an object."));
        return e
    }

    function A(e, t) {
        if ("string" != typeof e) throw new u.C(t, "".concat(t, " must be a string."));
        return e
    }

    function S(e, t) {
        let n = A(e, t);
        if (0 === n.length) throw new u.C(t, "".concat(t, " must be non-empty."));
        return n
    }

    function T(e, t) {
        if ("number" != typeof e || !Number.isFinite(e)) throw new u.C(t, "".concat(t, " must be a finite number."));
        return e
    }

    function C(e, t) {
        if ("boolean" == typeof e) return e;
        if (void 0 === e) return;
        let n = w(e, t);
        return {
            relativeOffset: function(e, t) {
                if (void 0 !== e) {
                    if ("string" == typeof e && v.J.some(t => t === e)) return e;
                    throw new u.C(t, "".concat(t, " must be a valid comparison offset."))
                }
            }(n.relativeOffset, "".concat(t, ".relativeOffset")),
            customStartTimeMs: function(e, t) {
                if (void 0 !== e) return T(e, t)
            }(n.customStartTimeMs, "".concat(t, ".customStartTimeMs"))
        }
    }

    function E(e, t) {
        if ("boolean" != typeof e) throw new u.C(t, "".concat(t, " must be a boolean."));
        return e
    }

    function D(e, t) {
        let n = A(e, t),
            r = Date.parse(n);
        if (!g.test(n) || !Number.isFinite(r)) throw new u.C(t, "".concat(t, " must be an ISO-8601 timestamp."));
        return n
    }

    function x(e) {
        return (t, n) => {
            let r;
            return null != t && (r = e(t, n)), r
        }
    }
    let I = x(D),
        U = x(S),
        _ = x(E);

    function O(e) {
        return e.trim()
    }
    e.s(["h", 0, E, "B", 0, D, "u", 0, S, "L", 0, T, "N", 0, I, "x", 0, U, "E", 0, w, "v", 0, A, "s", 0, b, "Y", 0, x, "b", 0, O, "P", 0, _, "c", 0, C], 115232);
    let k = new Set([l.g.AverageOverTimePeriod, l.g.MostRecentDataPoint, l.g.Total, r.W4.Average, r.W4.AveragePerUser, r.W4.Count, r.W4.CountUser, r.W4.Max, r.W4.Min, r.W4.Sum, l.g.Median, l.g.Cumulative, r.G6.AVG, r.G6.P10, r.G6.P50, r.G6.P90]),
        R = new Set([r.W4.Average, r.W4.AveragePerUser, r.W4.Count, r.W4.CountUser, r.W4.Max, r.W4.Min, r.W4.Sum, r.G6.AVG, r.G6.P10, r.G6.P50, r.G6.P90]),
        P = new Set(["Cumulative", "Day", "Week", "Hour", "HalfHour", "Minute"]),
        B = new Set(l.H),
        N = new Set(["draft", "published"]),
        M = /^Percentile\d+$/,
        L = new Set(Object.values(r.zP)),
        G = Object.values(r.zA),
        H = Object.values(r.EM),
        K = Object.values(r.L1),
        V = Object.values(a.W),
        F = r.EM.PercentileType,
        W = r.EM.AggregationType,
        j = r.EM.LatestPlaceVersion,
        z = new Set(Object.values(r.W4)),
        q = new Set(Object.values(r.G6));

    function Y(e, t) {
        for (let n of e)
            if (n === t) return !0;
        return !1
    }

    function X(e) {
        return G.includes(e) || H.includes(e)
    }

    function Q(e) {
        return G.includes(e)
    }

    function $(e) {
        return Q(e) || e === j || e === F || e === W
    }

    function J(e) {
        return V.includes(e)
    }

    function Z(e) {
        return Y(R, e) || M.test(e)
    }

    function ee(e) {
        return "string" == typeof e && L.has(e)
    }

    function et(e) {
        return "string" == typeof e && Y(z, e)
    }

    function en(e) {
        return "string" == typeof e && Y(q, e)
    }

    function er(e) {
        return (0, o.y)(e)
    }

    function ei(e) {
        return "string" == typeof e && e.length > 0
    }
    let ea = x(function(e, t) {
            let n = A(e, t);
            if (!Z(n)) throw new u.C(t, "".concat(t, ' "').concat(n, '" is not a known chart aggregation.'));
            return n
        }),
        eo = x(function(e, t) {
            if ("none" !== e && "weekly" !== e) throw new u.C(t, "".concat(t, ' must be "none" or "weekly".'));
            return e
        }),
        es = x(function(e, t) {
            let n = A(e, t);
            if (n !== l.x.Auto && n !== l.x.Custom) throw new u.C(t, "".concat(t, ' must be "Auto" or "Custom".'));
            return n
        });

    function ec(e, t) {
        let n = w(e, t),
            r = S(n.pseudoDimensionKey, "".concat(t, ".pseudoDimensionKey"));
        if (r !== F && r !== W) throw new u.C("".concat(t, ".pseudoDimensionKey"), "".concat(t, ".pseudoDimensionKey must be a supported pseudo-dimension key."));
        let i = S(n.variantKey, "".concat(t, ".variantKey"));
        if (r === F && !en(i)) throw new u.C("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI percentile for PercentileType."));
        if (r === W && !et(i)) throw new u.C("".concat(t, ".variantKey"), "".concat(t, ".variantKey must be a known RAQI aggregation for AggregationType."));
        return {
            pseudoDimensionKey: r,
            variantKey: i
        }
    }

    function eu(e, t) {
        if (function(e) {
                for (let t of e) {
                    let e = t.codePointAt(0);
                    if (void 0 === e) continue;
                    let n = e <= 31 && 9 !== e && 10 !== e && 13 !== e || 127 === e,
                        r = e >= 8234 && e <= 8238 || e >= 8294 && e <= 8297;
                    if (n || r) return !0
                }
                return !1
            }(e)) throw new u.C(t, "".concat(t, " contains unsupported control characters."));
        return e
    }

    function el(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : c.j,
            n = eu(O(e), "name");
        if (0 === n.length) throw new u.C("name", "Dashboard name is required.");
        if (t && n.length > t.maxDashboardNameLength) throw new u.C("name", "Dashboard name cannot exceed ".concat(t.maxDashboardNameLength, " characters."));
        return n
    }

    function ed(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : c.j;
        if (void 0 === e) return;
        let n = eu(O(e), "description");
        if (t && n.length > t.maxDashboardDescriptionLength) throw new u.C("description", "Description cannot exceed ".concat(t.maxDashboardDescriptionLength, " characters."));
        return 0 === n.length ? void 0 : n
    }

    function eh(e, t) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new u.C(t, "".concat(t, " must be an array."));
        return e.map((e, n) => {
            let r = w(e, "".concat(t, "[").concat(n, "]")),
                i = eu(S(r.dimension, "".concat(t, "[").concat(n, "].dimension")), "".concat(t, "[").concat(n, "].dimension")),
                {
                    values: a
                } = r;
            if (!Array.isArray(a) || 0 === a.length || !a.every(ei)) throw new u.C("".concat(t, "[").concat(n, "].values"), "".concat(t, "[").concat(n, "].values must be a non-empty array of non-empty strings."));
            return {
                dimension: i,
                values: a.map((e, r) => eu(e, "".concat(t, "[").concat(n, "].values[").concat(r, "]")))
            }
        })
    }

    function ef(e, t) {
        if (null == e) throw new u.C(t, "".concat(t, " must be an array."));
        return eh(e, t)
    }

    function ep(e, t, n) {
        if (null == e) return;
        let r = eu(O(A(e, t)), t);
        if (n && r.length > n.maxTileTitleLength) throw new u.C(t, "Tile title cannot exceed ".concat(n.maxTileTitleLength, " characters."));
        return 0 === r.length ? void 0 : r
    }

    function em(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new u.C(t, "".concat(t, " must be an array."));
        let n = e.map((e, n) => {
            let r = S(e, "".concat(t, "[").concat(n, "]"));
            if (!Q(r)) throw new u.C("".concat(t, "[").concat(n, "]"), "".concat(t, "[").concat(n, "] must be a canonical RAQI dimension."));
            return r
        });
        return n.length > 0 ? n : void 0
    }

    function ey(e, t) {
        if (null == e) return;
        if (!Array.isArray(e)) throw new u.C(t, "".concat(t, " must be an array."));
        let n = e.map((e, n) => {
            let r = S(e, "".concat(t, "[").concat(n, "]"));
            if (!J(r)) throw new u.C("".concat(t, "[").concat(n, "]"), "".concat(t, "[").concat(n, "] must be a known annotation type."));
            return r
        });
        return n.length > 0 ? n : void 0
    }

    function ev(e, t) {
        let n, r = w(e, t),
            i = (n = eb(r.variantSelections, "".concat(t, ".variantSelections"), ec)).length > 0 ? n : void 0;
        if (void 0 !== r.metricKey && null !== r.metricKey && void 0 !== r.computedMetric && null !== r.computedMetric) throw new u.C(t, "".concat(t, " must not include both metricKey and computedMetric."));
        return void 0 !== r.computedMetric && null !== r.computedMetric ? {
            computedMetric: function(e, t) {
                if (! function(e) {
                        if (!b(e)) return !1;
                        let {
                            sources: t,
                            formula: n,
                            name: r,
                            l7Smoothing: i
                        } = e;
                        return !!Array.isArray(t) && 0 !== t.length && "string" == typeof n && 0 !== n.trim().length && (void 0 === r || "string" == typeof r) && (void 0 === i || "boolean" == typeof i) && t.every(e => b(e) && "string" == typeof e.key && e.key.length > 0 && void 0 !== e.metric)
                    }(e)) throw new u.C(t, "".concat(t, " must be a computed metric object."));
                let n = (0, s.c)(e),
                    r = (0, s.B)(n);
                if (!n || !r) throw new u.C(t, "".concat(t, " is not a supported computed metric."));
                return r
            }(r.computedMetric, "".concat(t, ".computedMetric")),
            variantSelections: i
        } : {
            metricKey: function(e, t) {
                let n = A(e, t);
                if (!er(n)) throw new u.C(t, "".concat(t, ' "').concat(n, '" is not a known RAQI metric.'));
                return n
            }(r.metricKey, "".concat(t, ".metricKey")),
            variantSelections: i
        }
    }

    function eg(e, t) {
        let n = w(e, t);
        return {
            metric: ev(n.metric, "".concat(t, ".metric")),
            seriesKey: eu(S(n.seriesKey, "".concat(t, ".seriesKey")), "".concat(t, ".seriesKey")),
            displayName: void 0 !== n.displayName && null !== n.displayName ? eu(O(A(n.displayName, "".concat(t, ".displayName"))), "".concat(t, ".displayName")) : void 0,
            aggregation: ea(n.aggregation, "".concat(t, ".aggregation")),
            filters: void 0 === n.filters ? void 0 : ef(n.filters, "".concat(t, ".filters"))
        }
    }

    function eb(e, t, n) {
        if (null == e) return [];
        if (!Array.isArray(e)) throw new u.C(t, "".concat(t, " must be an array."));
        return e.map((e, r) => n(e, "".concat(t, "[").concat(r, "]")))
    }

    function ew(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            {
                limits: n = c.j
            } = t,
            a = w(e, "config"),
            o = w(a.page, "config.page");
        if (o.mode !== l.G.Untabbed) throw new u.C("config.page.mode", 'config.page.mode must be "Untabbed" in v1.');
        let s = w(o.surface, "config.page.surface"),
            f = eb(s.bodyNodes, "config.page.surface.bodyNodes", (e, t) => (function e(t, n, r) {
                let a = w(t, n),
                    o = (t, n) => e(t, n, r);
                if ("Component" === a.type) {
                    let e = w(a.component, "".concat(n, ".component"));
                    if ("Chart" === e.type) return {
                        type: "Component",
                        component: {
                            type: "Chart",
                            chart: function(e, t, n) {
                                let r = w(e, t);
                                if ("Chart" !== r.type) throw new u.C("".concat(t, ".type"), "".concat(t, '.type must be "Chart".'));
                                return function(e, t, n) {
                                    let r = w(e.dataSpec, "".concat(t, ".dataSpec")),
                                        a = w(e.chartSpec, "".concat(t, ".chartSpec")),
                                        o = A(a.chartType, "".concat(t, ".chartSpec.chartType"));
                                    if (!Y(B, o)) throw new u.C("".concat(t, ".chartSpec.chartType"), "".concat(t, '.chartSpec.chartType "').concat(o, '" is not supported.'));
                                    let s = b(a.overlays) ? a.overlays : void 0,
                                        c = s ? {
                                            genreBenchmark: _(s.genreBenchmark, "".concat(t, ".chartSpec.overlays.genreBenchmark")),
                                            similarExperienceBenchmark: _(s.similarExperienceBenchmark, "".concat(t, ".chartSpec.overlays.similarExperienceBenchmark")),
                                            topExperienceBenchmark: _(s.topExperienceBenchmark, "".concat(t, ".chartSpec.overlays.topExperienceBenchmark")),
                                            previousPeriod: C(s.previousPeriod, "".concat(t, ".chartSpec.overlays.previousPeriod")),
                                            quota: _(s.quota, "".concat(t, ".chartSpec.overlays.quota"))
                                        } : void 0,
                                        l = eb(r.metrics, "".concat(t, ".dataSpec.metrics"), eg),
                                        d = o === i.f.Table;
                                    if (!d && 1 !== l.length) throw new u.C("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain exactly one metric."));
                                    if (d && l.length < 1) throw new u.C("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain at least 1 metric for table charts."));
                                    if (d && n && l.length > n.maxTableMetricColumns) throw new u.C("".concat(t, ".dataSpec.metrics"), "".concat(t, ".dataSpec.metrics must contain between 1 and ").concat(n.maxTableMetricColumns, " metrics for table charts."));
                                    let h = r.breakdownDimensions,
                                        f = null == h ? void 0 : eb(h, "".concat(t, ".dataSpec.breakdownDimensions"), (e, t) => {
                                            var n;
                                            let r = null != (n = U(e, t)) ? n : "";
                                            if (r.length > 0 && !$(r)) throw new u.C(t, "".concat(t, " must be a persistable breakdown dimension."));
                                            return r
                                        }).filter(e => e.length > 0);
                                    return {
                                        type: "Chart",
                                        tileId: S(e.tileId, "".concat(t, ".tileId")),
                                        title: ep(e.title, "".concat(t, ".title"), n),
                                        dataSpec: {
                                            metrics: l,
                                            aggregation: ea(r.aggregation, "".concat(t, ".dataSpec.aggregation")),
                                            breakdownDimensions: f,
                                            granularity: function(e, t) {
                                                let n = A(e, t);
                                                if (!Y(P, n)) throw new u.C(t, "".concat(t, ' "').concat(n, '" is not a known time interval.'));
                                                return n
                                            }(r.granularity, "".concat(t, ".dataSpec.granularity")),
                                            filters: ef(r.filters, "".concat(t, ".dataSpec.filters"))
                                        },
                                        chartSpec: {
                                            chartType: o,
                                            overlays: c,
                                            smoothing: eo(a.smoothing, "".concat(t, ".chartSpec.smoothing"))
                                        }
                                    }
                                }(r, t, n)
                            }(e.chart, "".concat(n, ".component.chart"), r)
                        }
                    };
                    if ("SummaryCard" === e.type) return {
                        type: "Component",
                        component: {
                            type: "SummaryCard",
                            summaryCard: function(e, t, n) {
                                let r = w(e, t);
                                if ("SummaryCard" !== r.type) throw new u.C("".concat(t, ".type"), "".concat(t, '.type must be "SummaryCard".'));
                                let i = b(r.overlays) ? r.overlays : void 0,
                                    a = ev(r.metric, "".concat(t, ".metric")),
                                    o = function(e, t) {
                                        let n = A(e, t);
                                        if (!(Y(k, n) || M.test(n))) throw new u.C(t, "".concat(t, ' "').concat(n, '" is not a known summary-card aggregation.'));
                                        return n
                                    }(r.aggregation, "".concat(t, ".aggregation")),
                                    s = a.metricKey ? y(a.metricKey, o) : o;
                                if (!s) throw new u.C("".concat(t, ".aggregation"), "".concat(t, ".aggregation is not supported by the selected metric."));
                                return {
                                    type: "SummaryCard",
                                    tileId: S(r.tileId, "".concat(t, ".tileId")),
                                    title: ep(r.title, "".concat(t, ".title"), n),
                                    titleSource: es(r.titleSource, "".concat(t, ".titleSource")),
                                    metric: a,
                                    aggregation: s,
                                    overlays: i ? {
                                        periodOverPeriod: _(i.periodOverPeriod, "".concat(t, ".overlays.periodOverPeriod"))
                                    } : void 0,
                                    filters: ef(r.filters, "".concat(t, ".filters"))
                                }
                            }(e.summaryCard, "".concat(n, ".component.summaryCard"), r)
                        }
                    };
                    throw new u.C("".concat(n, ".component.type"), "".concat(n, '.component.type must be "Chart" or "SummaryCard".'))
                }
                if ("Grid" === a.type) {
                    let e = a.columnCount;
                    if (1 !== e && 2 !== e) throw new u.C("".concat(n, ".columnCount"), "".concat(n, ".columnCount must be 1 or 2."));
                    let t = eb(a.children, "".concat(n, ".children"), o);
                    if (0 === t.length || t.length > e && !t.every(d.f)) throw new u.C("".concat(n, ".children"), "".concat(n, ".children must contain between 1 and ").concat(e, " child node(s)."));
                    return {
                        type: "Grid",
                        columnCount: e,
                        children: t
                    }
                }
                if ("Flex" === a.type || "Stack" === a.type) return {
                    type: a.type,
                    children: eb(a.children, "".concat(n, ".children"), o)
                };
                throw new u.C("".concat(n, ".type"), "".concat(n, '.type must be "Component", "Grid", "Flex", or "Stack".'))
            })(e, t, n)),
            p = new Set,
            m = 0,
            v = 0,
            g = (e, t, n) => {
                if (p.has(e)) throw new u.C(n, 'Duplicate tileId "'.concat(e, '".'));
                p.add(e), "Chart" === t ? v += 1 : m += 1
            };
        if (f.forEach((e, t) => (function e(t, n, r) {
                "Component" === t.type ? n("Chart" === t.component.type ? t.component.chart.tileId : t.component.summaryCard.tileId, t.component.type, "".concat(r, ".component.").concat("Chart" === t.component.type ? "chart" : "summaryCard", ".tileId")) : t.children.forEach((t, i) => e(t, n, "".concat(r, ".children[").concat(i, "]")))
            })(e, g, "config.page.surface.bodyNodes[".concat(t, "]"))), n) {
            if (m > n.maxSummaryCardsPerDashboard) throw new u.C("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(n.maxSummaryCardsPerDashboard, " summary cards."));
            if (v > n.maxChartTilesPerDashboard) throw new u.C("config.page.surface.bodyNodes", "A dashboard may have at most ".concat(n.maxChartTilesPerDashboard, " chart tiles."))
        }
        return {
            page: {
                mode: l.G.Untabbed,
                surface: {
                    controls: function(e, t) {
                        let n;
                        if (null == e) return {};
                        let i = w(e, t);
                        return {
                            timeRangeOptions: function(e, t) {
                                if (null == e) return;
                                let n = w(e, t);
                                if ("None" === n.type) return {
                                    type: "None"
                                };
                                if ("DateRange" !== n.type) throw new u.C("".concat(t, ".type"), "".concat(t, '.type must be "None" or "DateRange".'));
                                return {
                                    type: "DateRange",
                                    defaultSelection: function(e, t) {
                                        if (null == e) return;
                                        let n = w(e, t);
                                        if ("Relative" === n.type) {
                                            if (!ee(n.rangeType) || n.rangeType === r.zP.Custom) throw new u.C("".concat(t, ".rangeType"), "".concat(t, ".rangeType must be a preset date range."));
                                            if (!(0, h.i)(n.rangeType)) throw new u.C("".concat(t, ".rangeType"), "".concat(t, ".rangeType must span less than ").concat(h.h, " days."));
                                            return {
                                                type: "Relative",
                                                rangeType: n.rangeType
                                            }
                                        }
                                        if ("Custom" === n.type) {
                                            let e = T(n.startTimeMs, "".concat(t, ".startTimeMs")),
                                                r = T(n.endTimeMs, "".concat(t, ".endTimeMs"));
                                            if (e > r) throw new u.C(t, "".concat(t, " custom startTimeMs must be before endTimeMs."));
                                            if (!(0, h.K)(e, r)) throw new u.C(t, "".concat(t, " custom date range must span less than ").concat(h.h, " days."));
                                            return {
                                                type: "Custom",
                                                startTimeMs: e,
                                                endTimeMs: r
                                            }
                                        }
                                        throw new u.C("".concat(t, ".type"), "".concat(t, '.type must be "Relative" or "Custom".'))
                                    }(n.defaultSelection, "".concat(t, ".defaultSelection"))
                                }
                            }(i.timeRangeOptions, "".concat(t, ".timeRangeOptions")),
                            filterDimensions: em(i.filterDimensions, "".concat(t, ".filterDimensions")),
                            defaultFilters: (n = eh(i.defaultFilters, "".concat(t, ".defaultFilters"))).length > 0 ? n : void 0,
                            breakdownDimensions: em(i.breakdownDimensions, "".concat(t, ".breakdownDimensions")),
                            defaultBreakdown: function(e, t) {
                                if (null == e) return;
                                if (!Array.isArray(e)) throw new u.C(t, "".concat(t, " must be an array."));
                                let n = e.map((e, n) => {
                                    let r = S(e, "".concat(t, "[").concat(n, "]"));
                                    if (!X(r)) throw new u.C("".concat(t, "[").concat(n, "]"), "".concat(t, "[").concat(n, "] must be a known RAQI dimension."));
                                    return r
                                });
                                return n.length > 0 ? n : void 0
                            }(i.defaultBreakdown, "".concat(t, ".defaultBreakdown")),
                            defaultGranularity: function(e, t) {
                                if (null == e) return;
                                let n = S(e, t);
                                if (!K.includes(n)) throw new u.C(t, "".concat(t, " must be a known granularity."));
                                return n
                            }(i.defaultGranularity, "".concat(t, ".defaultGranularity")),
                            annotationOptions: function(e, t) {
                                var n, r;
                                if (null == e) return;
                                let i = w(e, t);
                                return {
                                    supportedAnnotationTypes: null != (n = ey(i.supportedAnnotationTypes, "".concat(t, ".supportedAnnotationTypes"))) ? n : [],
                                    defaultAnnotationTypes: null != (r = ey(i.defaultAnnotationTypes, "".concat(t, ".defaultAnnotationTypes"))) ? r : [],
                                    showAnnotationsControl: void 0 === i.showAnnotationsControl || null === i.showAnnotationsControl || E(i.showAnnotationsControl, "".concat(t, ".showAnnotationsControl"))
                                }
                            }(i.annotationOptions, "".concat(t, ".annotationOptions"))
                        }
                    }(s.controls, "config.page.surface.controls"),
                    bodyNodes: f
                }
            }
        }
    }
    e.s(["_", 0, Q, "P", 0, Z, "y", 0, ee, "z", 0, J, "a", 0, X, "c", 0, er, "$", 0, $, "d", 0, et, "n", 0, en, "N", 0, ew, "h", 0, function(e) {
        var t;
        let n, r = w(e, "document");
        if (r.schemaVersion !== l.b) throw new u.C("schemaVersion", "schemaVersion must equal ".concat(l.b, " (got ").concat(String(r.schemaVersion), "). Run applyMigrations first."));
        let {
            status: i
        } = r;
        if (!("string" == typeof i && Y(N, i))) throw new u.C("status", 'status must be "draft" or "published".');
        void 0 !== r.description && null !== r.description && (n = ed(A(r.description, "description"), null));
        let a = E(r.isPinned, "isPinned"),
            o = a ? I(r.pinnedAt, "pinnedAt") : void 0;
        if (void 0 === r.config || null === r.config) throw new u.C("config", "config is required. Service-layer create() must substitute EMPTY_DASHBOARD_CONFIG before validation.");
        return {
            ...r,
            id: S(r.id, "id"),
            schemaVersion: l.b,
            universeId: T(r.universeId, "universeId"),
            name: el(A(r.name, "name"), null),
            description: n,
            status: i,
            isPinned: a,
            pinnedAt: o,
            createdAt: D(r.createdAt, "createdAt"),
            updatedAt: D(r.updatedAt, "updatedAt"),
            publishedAt: I(r.publishedAt, "publishedAt"),
            createdByUserId: T(r.createdByUserId, "createdByUserId"),
            createdByUsername: A(null != (t = r.createdByUsername) ? t : "", "createdByUsername"),
            updatedByUserId: x(T)(r.updatedByUserId, "updatedByUserId"),
            updatedByUsername: x(S)(r.updatedByUsername, "updatedByUsername"),
            config: ew(r.config, {
                limits: null
            })
        }
    }, "q", 0, ed, "H", 0, el], 646877), e.s(["f", 0, function(e) {
        let {
            config: r,
            tile: i,
            nextTileId: a,
            limits: o
        } = e, s = {
            ...i,
            tileId: a
        };
        return {
            config: ew((0, t.d)(r, [...(0, t.W)(r), (0, n.O)(s)]), {
                limits: o
            }),
            tile: s
        }
    }], 296150)
}, 743209, 593431, 582078, 852209, 482922, 302610, e => {
    "use strict";
    var t = e.i(512725),
        n = e.i(436025);
    e.s(["f", 0, function(e) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : n.K;
        return {
            ...(0, t.f)(e),
            tileId: r()
        }
    }], 743209), e.s(["f", 0, function(e) {
        return e.toSorted((e, t) => e.isPinned !== t.isPinned ? e.isPinned ? -1 : 1 : e.updatedAt !== t.updatedAt ? e.updatedAt < t.updatedAt ? 1 : -1 : e.id === t.id ? 0 : e.id < t.id ? -1 : 1)
    }], 593431);
    let r = e.i(731197).j.maxDashboardNameLength;

    function i(e) {
        return e.length > r ? e.slice(0, r) : e
    }

    function a(e, t) {
        let n = r - t.length;
        return n <= 0 ? "" : e.length > n ? e.slice(0, n) : e
    }

    function o(e, t) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1,
            r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 1e3,
            i = new Set(Array.from(e, e => e.trim())),
            a = Math.max(1, n),
            o = 0;
        for (; i.has(t(a)) && o < r;) a += 1, o += 1;
        return t(a)
    }
    e.s(["T", 0, 2, "r", 0, function(e, t, n) {
        let r = new Set(Array.from(e, e => e.trim())),
            s = " ".concat(n.first),
            c = "".concat(a(t, s)).concat(s);
        return r.has(c) ? i(o(e, e => {
            let r = " ".concat(n.numbered(e));
            return "".concat(a(t, r)).concat(r)
        }, 2, 1e3)) : c
    }, "u", 0, i, "K", 0, o, "L", 0, function(e) {
        return i(o(e, e => "Dashboard #".concat(e)))
    }], 582078);
    var s = e.i(805290),
        c = e.i(336268),
        u = e.i(650502);
    let l = (0, c.f)({
        baseUrl: (0, u.l)("analytics-custom-dashboards"),
        credentials: "include",
        enableMrRouter: !0
    });
    class d extends Error {
        constructor(e, t, n) {
            super(t), (0, s._)(this, "status", void 0), (0, s._)(this, "body", void 0), this.name = "CustomDashboardsApiRequestError", this.status = e, this.body = n
        }
    }

    function h(e) {
        let t = {};
        return void 0 !== e.name && (t.name = e.name), void 0 !== e.description && (t.description = e.description), void 0 !== e.isPinned && (t.isPinned = e.isPinned), t
    }

    function f(e) {
        return "object" == typeof e && null !== e && !Array.isArray(e)
    }

    function p(e) {
        if (!f(e)) return;
        let {
            code: t,
            message: n,
            status: r
        } = e;
        return {
            ..."string" == typeof t || "number" == typeof t ? {
                code: t
            } : {},
            ..."string" == typeof n ? {
                message: n
            } : {},
            ..."string" == typeof r ? {
                status: r
            } : {}
        }
    }

    function m(e, t) {
        var n, r, i, a, o;
        let s = null != (n = null == e ? void 0 : e.status) ? n : 0,
            c = function(e) {
                if (!f(e)) return;
                let {
                    code: t,
                    reason: n,
                    message: r,
                    errors: i,
                    error: a,
                    details: o
                } = e, s = p(a), c = Array.isArray(i) ? i[0] : void 0, u = p(c);
                return {
                    ..."string" == typeof t || "number" == typeof t ? {
                        code: t
                    } : {},
                    ..."string" == typeof n || "number" == typeof n ? {
                        reason: n
                    } : {},
                    ..."string" == typeof r ? {
                        message: r
                    } : {},
                    ...u && f(c) ? {
                        errors: [{
                            ...u,
                            ...f(c.details) ? {
                                details: c.details
                            } : {},
                            ..."string" == typeof c.referenceId ? {
                                referenceId: c.referenceId
                            } : {}
                        }]
                    } : {},
                    ...s ? {
                        error: s
                    } : {},
                    ...Array.isArray(o) ? {
                        details: o
                    } : {}
                }
            }(t),
            u = null != (r = [null == c || null == (a = c.errors) || null == (i = a[0]) ? void 0 : i.message, null == c ? void 0 : c.message, null == c || null == (o = c.error) ? void 0 : o.message].find(e => null == e ? void 0 : e.trim())) ? r : "HTTP ".concat(s);
        throw new d(s, u, c)
    }
    e.s(["W", 0, d, "y", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : l;
        return {
            async listDashboards(t, n) {
                let {
                    data: r,
                    error: i,
                    response: a
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards", {
                    params: {
                        path: {
                            universeId: t
                        },
                        query: {
                            pageSize: null == n ? void 0 : n.pageSize,
                            pageToken: null == n ? void 0 : n.pageToken
                        }
                    }
                });
                return (i || !r) && m(a, i), r
            },
            async listPinnedDashboards(t) {
                let {
                    data: n,
                    error: r,
                    response: i
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/pinned", {
                    params: {
                        path: {
                            universeId: t
                        }
                    }
                });
                return (r || !n) && m(i, r), n
            },
            async getDashboardCapabilities(t) {
                var n;
                let {
                    data: r,
                    error: i,
                    response: a
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/capabilities", {
                    params: {
                        path: {
                            universeId: t
                        }
                    }
                });
                return (i || !r) && m(a, i), null != (n = r.capabilities) ? n : {}
            },
            async getDashboard(t) {
                var n;
                let {
                    universeId: r,
                    dashboardId: i
                } = t, {
                    data: a,
                    error: o,
                    response: s
                } = await e.GET("/v1/universes/{universeId}/custom-dashboards/{dashboardId}", {
                    params: {
                        path: {
                            universeId: r,
                            dashboardId: i
                        }
                    }
                });
                return (o || !a) && m(s, o), null != (n = a.dashboard) ? n : {}
            },
            async createDashboard(t) {
                var n;
                let {
                    universeId: r,
                    name: i,
                    description: a,
                    document: o
                } = t, {
                    data: s,
                    error: c,
                    response: u
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards", {
                    params: {
                        path: {
                            universeId: r
                        }
                    },
                    body: {
                        universeId: r,
                        name: i,
                        description: a,
                        document: o
                    }
                });
                return (c || !s) && m(u, c), null != (n = s.dashboard) ? n : {}
            },
            async updateDashboardMetadata(t) {
                var n;
                let {
                    universeId: r,
                    dashboardId: i,
                    expectedHeadEtag: a,
                    patch: o
                } = t, {
                    data: s,
                    error: c,
                    response: u
                } = await e.PATCH("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/metadata", {
                    params: {
                        path: {
                            universeId: r,
                            dashboardId: i
                        }
                    },
                    body: {
                        universeId: r,
                        dashboardId: i,
                        expectedHeadEtag: a,
                        patch: h(o)
                    }
                });
                return (c || !s) && m(u, c), null != (n = s.metadata) ? n : {}
            },
            async publishDashboard(t) {
                var n;
                let {
                    universeId: r,
                    dashboardId: i,
                    expectedHeadEtag: a,
                    document: o,
                    metadataPatch: s
                } = t, c = void 0 === s ? void 0 : h(s), u = {
                    universeId: r,
                    dashboardId: i,
                    expectedHeadEtag: a,
                    document: o,
                    ...void 0 !== c && Object.keys(c).length > 0 ? {
                        metadataPatch: c
                    } : {}
                }, {
                    data: l,
                    error: d,
                    response: f
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/publish", {
                    params: {
                        path: {
                            universeId: r,
                            dashboardId: i
                        }
                    },
                    body: u
                });
                return (d || !l) && m(f, d), null != (n = l.dashboard) ? n : {}
            },
            async duplicateDashboard(t) {
                var n;
                let {
                    universeId: r,
                    dashboardId: i,
                    destinationUniverseId: a,
                    name: o
                } = t, {
                    data: s,
                    error: c,
                    response: u
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/duplicate", {
                    params: {
                        path: {
                            universeId: r,
                            dashboardId: i
                        }
                    },
                    body: {
                        destinationUniverseId: a,
                        name: o
                    }
                });
                return (c || !s) && m(u, c), null != (n = s.dashboard) ? n : {}
            },
            async deleteDashboard(t) {
                let {
                    universeId: n,
                    dashboardId: r
                } = t, {
                    error: i,
                    response: a
                } = await e.POST("/v1/universes/{universeId}/custom-dashboards/{dashboardId}/delete", {
                    params: {
                        path: {
                            universeId: n,
                            dashboardId: r
                        }
                    },
                    body: {
                        universeId: n,
                        dashboardId: r
                    }
                });
                i && m(a, i)
            },
            async filterDashboardText(t) {
                let {
                    universeId: n,
                    text: r,
                    format: i
                } = t, {
                    data: a,
                    error: o,
                    response: s
                } = await e.POST("/v1/universes/{universeId}/custom-dashboard-text/filter", {
                    params: {
                        path: {
                            universeId: n
                        }
                    },
                    body: {
                        universeId: n,
                        text: r,
                        format: "description" === i ? 2 : 1
                    }
                });
                if ((o || !a) && m(s, o), "boolean" != typeof a.isFiltered) {
                    var c;
                    throw new d(null != (c = null == s ? void 0 : s.status) ? c : 0, "Response is missing isFiltered")
                }
                return {
                    isFiltered: a.isFiltered
                }
            }
        }
    }], 852209);
    var y = e.i(283561);

    function v(e) {
        return (null != e ? e : "").toUpperCase().replaceAll("-", "_")
    }

    function g(e, t, n, r) {
        return 404 === e || t.includes("NOT_FOUND") ? new y.u(null != r ? r : "unknown") : 409 === e || t.includes("VERSION_CONFLICT") || t.includes("CONFLICT") ? new y.h(null != r ? r : "unknown") : 429 === e || t.includes("QUOTA_EXCEEDED") || t.includes("RESOURCE_EXHAUSTED") ? new y.b(n) : 401 === e || t.includes("UNAUTHENTICATED") ? new y.Y(n) : 403 === e || t.includes("PERMISSION_DENIED") ? new y.c(n) : 400 === e || t.includes("VALIDATION_FAILED") || t.includes("INVALID_ARGUMENT") ? new y.C("document", null != n ? n : "Invalid custom dashboard.") : 503 === e || t.includes("UNAVAILABLE") ? new y.X : void 0
    }
    e.s(["f", 0, function(e, t) {
        var n, r, i, a, o, s, c, u, l, h, f, p, m, b, w, A, S;
        if (e instanceof y.V) return e;
        if (!(e instanceof d)) return new y.z(e);
        let T = [null == (b = e.body) || null == (m = b.errors) || null == (p = m[0]) ? void 0 : p.message, null == (w = e.body) ? void 0 : w.message, null == (S = e.body) || null == (A = S.error) ? void 0 : A.message, e.message].find(e => null == e ? void 0 : e.trim()),
            C = null != (n = null == (u = e.body) || null == (c = u.errors) || null == (s = c[0]) || null == (o = s.details) ? void 0 : o.reason) ? n : null == (l = e.body) ? void 0 : l.reason,
            E = v("".concat(null != (r = null == (f = e.body) || null == (h = f.error) ? void 0 : h.status) ? r : "", " ").concat("string" == typeof C ? C : ""));
        return null != (i = null != (a = g(e.status, E, T, t)) ? a : g(0, v(T), T, t)) ? i : new y.z(e)
    }], 482922);
    var b = e.i(36826);
    let w = {
        supportedAnnotationTypes: [b.W.PlaceIcon, b.W.PlaceThumbnail, b.W.PlaceVideo, b.W.PlaceVersion, b.W.Benchmark, b.W.LiveEvent, b.W.CustomMatchmaking, b.W.RetentionCorhortDisclaimer, b.W.ConfigVersion, b.W.Announcement],
        defaultAnnotationTypes: [],
        showAnnotationsControl: !0
    };
    e.s(["Q", 0, w, "b", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
            t = w.supportedAnnotationTypes,
            n = e.filter(e => !t.includes(e));
        return 0 === n.length ? [...t] : [...t, ...n]
    }], 302610)
}, 436025, e => {
    "use strict";

    function t() {
        return crypto.randomUUID()
    }

    function n() {
        return "tile_".concat(t())
    }
    e.s(["K", 0, n, "q", 0, {
        nextTileId: n,
        nextDashboardId: function() {
            return "dsh_".concat(t())
        }
    }])
}, 102716, 377396, e => {
    "use strict";
    e.s(["f", 0, function(e) {
        return "Component" === e.type && "SummaryCard" === e.component.type
    }], 102716);
    var t = e.i(31611);
    let n = new Set([t.zP.Last1Hour, t.zP.Last1Day, t.zP.Last3Days, t.zP.Last7Days, t.zP.Last28Days, t.zP.Last56Days, t.zP.Custom]);

    function r(e) {
        return n.has(e)
    }

    function i(e, t) {
        let n = t - e;
        return n >= 0 && n < 48384e5
    }
    e.s(["h", 0, 56, "D", 0, function(e, t) {
        return i(e.getTime(), t.getTime()) ? {
            startDate: e,
            endDate: t
        } : {
            startDate: new Date(t.getTime() - 4752e6),
            endDate: t
        }
    }, "l", 0, function(e) {
        return e.filter(r)
    }, "K", 0, i, "i", 0, r], 377396)
}, 787202, e => {
    "use strict";
    var t = e.i(31611),
        n = e.i(11517),
        r = e.i(339923),
        i = e.i(927868);
    let a = t.EM.AggregationType,
        o = t.EM.PercentileType,
        s = t.W4.Average;
    e.s(["f", 0, function(e) {
        let c = function(e) {
            var n;
            for (let r of null != (n = e.variantSelections) ? n : [])
                if (r.pseudoDimensionKey === a && (0, i.s)(t.W4, r.variantKey) || r.pseudoDimensionKey === o && (0, i.s)(t.G6, r.variantKey)) return r.variantKey
        }(e);
        if (void 0 !== c) return c;
        if (e.computedMetric) {
            let [r] = e.computedMetric.sources;
            if (r && (0, n.Q)(r.metric)) {
                var u;
                return null != (u = r.metric.aggregationType) ? u : t.W4.Sum
            }
            return s
        }
        return void 0 !== e.metricKey ? (0, r.v)(e.metricKey) ? t.W4.Average : t.W4.Sum : s
    }])
}]);

//# debugId=58221bf1-cf74-bb31-ece0-7fa0f2a4b374
//# sourceMappingURL=3m1i35u6snd-c.js.map