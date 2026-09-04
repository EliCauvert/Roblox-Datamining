! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "925ae346147782818d19cd08acb92c8f7ed7ca48"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "32b5b6cf-dc69-454a-bb19-20dc33ad9be7", e._sentryDebugIdIdentifier = "sentry-dbid-32b5b6cf-dc69-454a-bb19-20dc33ad9be7")
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
                        c = new o((a + u) * 3 / 4 - u),
                        s = 0,
                        f = u > 0 ? a - 4 : a;
                    for (r = 0; r < f; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], c[s++] = t >> 16 & 255, c[s++] = t >> 8 & 255, c[s++] = 255 & t;
                    return 2 === u && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, c[s++] = 255 & t), 1 === u && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, c[s++] = t >> 8 & 255, c[s++] = 255 & t), c
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
                    return c(e, t, r)
                }

                function c(e, t, r) {
                    if ("string" == typeof e) {
                        var o = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !l.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var a = 0 | m(o, i),
                            c = u(a),
                            s = c.write(o, i);
                        return s !== a && (c = c.slice(0, s)), c
                    }
                    if (ArrayBuffer.isView(e)) {
                        var f = e;
                        if (N(f, Uint8Array)) {
                            var b = new Uint8Array(f);
                            return d(b.buffer, b.byteOffset, b.byteLength)
                        }
                        return p(f)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)));
                    if (N(e, ArrayBuffer) || e && N(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (N(e, SharedArrayBuffer) || e && N(e.buffer, SharedArrayBuffer))) return d(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var h = e.valueOf && e.valueOf();
                    if (null != h && h !== e) return l.from(h, t, r);
                    var v = function(e) {
                        if (l.isBuffer(e)) {
                            var t = 0 | y(e.length),
                                r = u(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? u(0) : p(e) : "Buffer" === e.type && Array.isArray(e.data) ? p(e.data) : void 0
                    }(e);
                    if (v) return v;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return l.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)))
                }

                function s(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return s(e), u(e < 0 ? 0 : 0 | y(e))
                }

                function p(e) {
                    for (var t = e.length < 0 ? 0 : 0 | y(e.length), r = u(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
                }

                function d(e, t, r) {
                    var n;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), l.prototype), n
                }

                function y(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function m(e, t) {
                    if (l.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || N(e, ArrayBuffer)) return e.byteLength;
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
                            return A(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return k(e).length;
                        default:
                            if (i) return o ? -1 : A(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function b(e, t, r) {
                    var n, i, a, u = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var o = "", i = t; i < r; ++i) o += C[e[i]];
                                return o
                            }(this, t, r);
                        case "utf8":
                        case "utf-8":
                            return O(this, t, r);
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

                function h(e, t, r) {
                    var n = e[t];
                    e[t] = e[r], e[r] = n
                }

                function v(e, t, r, n, o) {
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

                    function c(e, t) {
                        return 1 === a ? e[t] : e.readUInt16BE(t * a)
                    }
                    if (o) {
                        var s = -1;
                        for (i = r; i < u; i++)
                            if (c(e, i) === c(t, -1 === s ? 0 : i - s)) {
                                if (-1 === s && (s = i), i - s + 1 === l) return s * a
                            } else - 1 !== s && (i -= i - s), s = -1
                    } else
                        for (r + l > u && (r = u - l), i = r; i >= 0; i--) {
                            for (var f = !0, p = 0; p < l; p++)
                                if (c(e, i + p) !== c(t, p)) {
                                    f = !1;
                                    break
                                } if (f) return i
                        }
                    return -1
                }

                function O(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], o = t; o < r;) {
                        var i, a, u, l, c = e[o],
                            s = null,
                            f = c > 239 ? 4 : c > 223 ? 3 : c > 191 ? 2 : 1;
                        if (o + f <= r) switch (f) {
                            case 1:
                                c < 128 && (s = c);
                                break;
                            case 2:
                                (192 & (i = e[o + 1])) == 128 && (l = (31 & c) << 6 | 63 & i) > 127 && (s = l);
                                break;
                            case 3:
                                i = e[o + 1], a = e[o + 2], (192 & i) == 128 && (192 & a) == 128 && (l = (15 & c) << 12 | (63 & i) << 6 | 63 & a) > 2047 && (l < 55296 || l > 57343) && (s = l);
                                break;
                            case 4:
                                i = e[o + 1], a = e[o + 2], u = e[o + 3], (192 & i) == 128 && (192 & a) == 128 && (192 & u) == 128 && (l = (15 & c) << 18 | (63 & i) << 12 | (63 & a) << 6 | 63 & u) > 65535 && l < 1114112 && (s = l)
                        }
                        null === s ? (s = 65533, f = 1) : s > 65535 && (s -= 65536, n.push(s >>> 10 & 1023 | 55296), s = 56320 | 1023 & s), n.push(s), o += f
                    }
                    var p = n,
                        d = p.length;
                    if (d <= 4096) return String.fromCharCode.apply(String, p);
                    for (var y = "", m = 0; m < d;) y += String.fromCharCode.apply(String, p.slice(m, m += 4096));
                    return y
                }

                function w(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function j(e, t, r, n, o, i) {
                    if (!l.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > o || t < i) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function x(e, t, r, n, o, i) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function S(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || x(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), i.write(e, t, r, n, 23, 4), r + 4
                }

                function P(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || x(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), i.write(e, t, r, n, 52, 8), r + 8
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
                    return c(e, t, r)
                }, Object.setPrototypeOf(l.prototype, Uint8Array.prototype), Object.setPrototypeOf(l, Uint8Array), l.alloc = function(e, t, r) {
                    return (s(e), e <= 0) ? u(e) : void 0 !== t ? "string" == typeof r ? u(e).fill(t, r) : u(e).fill(t) : u(e)
                }, l.allocUnsafe = function(e) {
                    return f(e)
                }, l.allocUnsafeSlow = function(e) {
                    return f(e)
                }, l.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== l.prototype
                }, l.compare = function(e, t) {
                    if (N(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), N(t, Uint8Array) && (t = l.from(t, t.offset, t.byteLength)), !l.isBuffer(e) || !l.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
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
                        if (N(i, Uint8Array)) o + i.length > n.length ? l.from(i).copy(n, o) : Uint8Array.prototype.set.call(n, i, o);
                        else if (l.isBuffer(i)) i.copy(n, o);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        o += i.length
                    }
                    return n
                }, l.byteLength = m, l.prototype._isBuffer = !0, l.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) h(this, t, t + 1);
                    return this
                }, l.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) h(this, t, t + 3), h(this, t + 1, t + 2);
                    return this
                }, l.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) h(this, t, t + 7), h(this, t + 1, t + 6), h(this, t + 2, t + 5), h(this, t + 3, t + 4);
                    return this
                }, l.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? O(this, 0, e) : b.apply(this, arguments)
                }, l.prototype.toLocaleString = l.prototype.toString, l.prototype.equals = function(e) {
                    if (!l.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === l.compare(this, e)
                }, l.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, a && (l.prototype[a] = l.prototype.inspect), l.prototype.compare = function(e, t, r, o, i) {
                    if (N(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), !l.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : n(e)));
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === o && (o = 0), void 0 === i && (i = this.length), t < 0 || r > e.length || o < 0 || i > this.length) throw RangeError("out of range index");
                    if (o >= i && t >= r) return 0;
                    if (o >= i) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, o >>>= 0, i >>>= 0, this === e) return 0;
                    for (var a = i - o, u = r - t, c = Math.min(a, u), s = this.slice(o, i), f = e.slice(t, r), p = 0; p < c; ++p)
                        if (s[p] !== f[p]) {
                            a = s[p], u = f[p];
                            break
                        } return a < u ? -1 : +(u < a)
                }, l.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, l.prototype.indexOf = function(e, t, r) {
                    return v(this, e, t, r, !0)
                }, l.prototype.lastIndexOf = function(e, t, r) {
                    return v(this, e, t, r, !1)
                }, l.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var o, i, a, u, l, c, s, f, p = this.length - t;
                    if ((void 0 === r || r > p) && (r = p), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var d = !1;;) switch (n) {
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
                            return o = t, i = r, I(A(e, this.length - o), this, o, i);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return a = t, u = r, I(function(e) {
                                for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                                return t
                            }(e), this, a, u);
                        case "base64":
                            return l = t, c = r, I(k(e), this, l, c);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return s = t, f = r, I(function(e, t) {
                                for (var r, n, o = [], i = 0; i < e.length && !((t -= 2) < 0); ++i) n = (r = e.charCodeAt(i)) >> 8, o.push(r % 256), o.push(n);
                                return o
                            }(e, this.length - s), this, s, f);
                        default:
                            if (d) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), d = !0
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
                    e >>>= 0, t >>>= 0, r || w(e, t, this.length);
                    for (var n = this[e], o = 1, i = 0; ++i < t && (o *= 256);) n += this[e + i] * o;
                    return n
                }, l.prototype.readUintBE = l.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || w(e, t, this.length);
                    for (var n = this[e + --t], o = 1; t > 0 && (o *= 256);) n += this[e + --t] * o;
                    return n
                }, l.prototype.readUint8 = l.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || w(e, 1, this.length), this[e]
                }, l.prototype.readUint16LE = l.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || w(e, 2, this.length), this[e] | this[e + 1] << 8
                }, l.prototype.readUint16BE = l.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || w(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, l.prototype.readUint32LE = l.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || w(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, l.prototype.readUint32BE = l.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || w(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, l.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || w(e, t, this.length);
                    for (var n = this[e], o = 1, i = 0; ++i < t && (o *= 256);) n += this[e + i] * o;
                    return n >= (o *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, l.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || w(e, t, this.length);
                    for (var n = t, o = 1, i = this[e + --n]; n > 0 && (o *= 256);) i += this[e + --n] * o;
                    return i >= (o *= 128) && (i -= Math.pow(2, 8 * t)), i
                }, l.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || w(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, l.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || w(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, l.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || w(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, l.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || w(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, l.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || w(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, l.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || w(e, 4, this.length), i.read(this, e, !0, 23, 4)
                }, l.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || w(e, 4, this.length), i.read(this, e, !1, 23, 4)
                }, l.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || w(e, 8, this.length), i.read(this, e, !0, 52, 8)
                }, l.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || w(e, 8, this.length), i.read(this, e, !1, 52, 8)
                }, l.prototype.writeUintLE = l.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        j(this, e, t, r, o, 0)
                    }
                    var i = 1,
                        a = 0;
                    for (this[t] = 255 & e; ++a < r && (i *= 256);) this[t + a] = e / i & 255;
                    return t + r
                }, l.prototype.writeUintBE = l.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        j(this, e, t, r, o, 0)
                    }
                    var i = r - 1,
                        a = 1;
                    for (this[t + i] = 255 & e; --i >= 0 && (a *= 256);) this[t + i] = e / a & 255;
                    return t + r
                }, l.prototype.writeUint8 = l.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, l.prototype.writeUint16LE = l.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeUint16BE = l.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeUint32LE = l.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, l.prototype.writeUint32BE = l.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        j(this, e, t, r, o - 1, -o)
                    }
                    var i = 0,
                        a = 1,
                        u = 0;
                    for (this[t] = 255 & e; ++i < r && (a *= 256);) e < 0 && 0 === u && 0 !== this[t + i - 1] && (u = 1), this[t + i] = (e / a | 0) - u & 255;
                    return t + r
                }, l.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        j(this, e, t, r, o - 1, -o)
                    }
                    var i = r - 1,
                        a = 1,
                        u = 0;
                    for (this[t + i] = 255 & e; --i >= 0 && (a *= 256);) e < 0 && 0 === u && 0 !== this[t + i + 1] && (u = 1), this[t + i] = (e / a | 0) - u & 255;
                    return t + r
                }, l.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, l.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, l.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || j(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeFloatLE = function(e, t, r) {
                    return S(this, e, t, !0, r)
                }, l.prototype.writeFloatBE = function(e, t, r) {
                    return S(this, e, t, !1, r)
                }, l.prototype.writeDoubleLE = function(e, t, r) {
                    return P(this, e, t, !0, r)
                }, l.prototype.writeDoubleBE = function(e, t, r) {
                    return P(this, e, t, !1, r)
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
                var E = /[^+/0-9A-Za-z-_]/g;

                function A(e, t) {
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

                function k(e) {
                    return o.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(E, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function I(e, t, r, n) {
                    for (var o = 0; o < n && !(o + r >= t.length) && !(o >= e.length); ++o) t[o + r] = e[o];
                    return o
                }

                function N(e, t) {
                    return (null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var C = function() {
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
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, r, n, o) {
                    var i, a, u = 8 * o - n - 1,
                        l = (1 << u) - 1,
                        c = l >> 1,
                        s = -7,
                        f = r ? o - 1 : 0,
                        p = r ? -1 : 1,
                        d = e[t + f];
                    for (f += p, i = d & (1 << -s) - 1, d >>= -s, s += u; s > 0; i = 256 * i + e[t + f], f += p, s -= 8);
                    for (a = i & (1 << -s) - 1, i >>= -s, s += n; s > 0; a = 256 * a + e[t + f], f += p, s -= 8);
                    if (0 === i) i = 1 - c;
                    else {
                        if (i === l) return a ? NaN : 1 / 0 * (d ? -1 : 1);
                        a += Math.pow(2, n), i -= c
                    }
                    return (d ? -1 : 1) * a * Math.pow(2, i - n)
                }, t.write = function(e, t, r, n, o, i) {
                    var a, u, l, c = 8 * i - o - 1,
                        s = (1 << c) - 1,
                        f = s >> 1,
                        p = 5960464477539062e-23 * (23 === o),
                        d = n ? 0 : i - 1,
                        y = n ? 1 : -1,
                        m = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (u = +!!isNaN(t), a = s) : (a = Math.floor(Math.log(t) / Math.LN2), t * (l = Math.pow(2, -a)) < 1 && (a--, l *= 2), a + f >= 1 ? t += p / l : t += p * Math.pow(2, 1 - f), t * l >= 2 && (a++, l /= 2), a + f >= s ? (u = 0, a = s) : a + f >= 1 ? (u = (t * l - 1) * Math.pow(2, o), a += f) : (u = t * Math.pow(2, f - 1) * Math.pow(2, o), a = 0)); o >= 8; e[r + d] = 255 & u, d += y, u /= 256, o -= 8);
                    for (a = a << o | u, c += o; c > 0; e[r + d] = 255 & a, d += y, a /= 256, c -= 8);
                    e[r + d - y] |= 128 * m
                }
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

                function u() {
                    throw Error("setTimeout has not been defined")
                }

                function l() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : u
                } catch (e) {
                    r = u
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : l
                } catch (e) {
                    n = l
                }

                function c(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === u || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
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
                                if ((n === l || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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

                function m(e, t) {
                    this.fun = e, this.array = t
                }

                function b() {}

                function h() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new m(e, t)), 1 !== s.length || f || c(y)
                }, m.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = b, a.addListener = b, a.once = b, a.off = b, a.removeListener = b, a.removeAllListeners = b, a.emit = b, a.prependListener = b, a.prependOnceListener = b, a.listeners = function(e) {
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
                var v = i.exports.browser,
                    g = i.exports.binding,
                    O = {},
                    w = "browser",
                    j = "browser",
                    x = "browser",
                    S = [],
                    P = {
                        nextTick: i.exports.nextTick,
                        title: i.exports.title,
                        browser: v,
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
                        emitWarning: h,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: g,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
                        exit: h,
                        pid: 1,
                        features: O,
                        kill: h,
                        dlopen: h,
                        uptime: h,
                        memoryUsage: h,
                        uvCounters: h,
                        platform: w,
                        arch: j,
                        execPath: x,
                        execArgv: S
                    };
                t.addListener = i.exports.addListener, t.arch = j, t.argv = i.exports.argv, t.binding = g, t.browser = v, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = P, t.dlopen = h, t.emit = i.exports.emit, t.emitWarning = h, t.env = i.exports.env, t.execArgv = S, t.execPath = x, t.exit = h, t.features = O, t.kill = h, t.listeners = i.exports.listeners, t.memoryUsage = h, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = w, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = h, t.uvCounters = h, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = P
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
                    var s = r && r.protoAction || "error",
                        f = r && r.constructorAction || "error";
                    if ("ignore" === s && "ignore" === f) return l;
                    if ("ignore" !== s && "ignore" !== f) {
                        if (!1 === a.test(e) && !1 === u.test(e)) return l
                    } else if ("ignore" !== s && "ignore" === f) {
                        if (!1 === a.test(e)) return l
                    } else if (!1 === u.test(e)) return l;
                    return c(l, {
                        protoAction: s,
                        constructorAction: f,
                        safe: r && r.safe
                    })
                }

                function c(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = t.protoAction, n = void 0 === r ? "error" : r, i = t.constructorAction, a = void 0 === i ? "error" : i, u = t.safe, l = [e]; l.length;) {
                        var c = l;
                        l = [];
                        var s = !0,
                            f = !1,
                            p = void 0;
                        try {
                            for (var d, y = c[Symbol.iterator](); !(s = (d = y.next()).done); s = !0) {
                                var m = d.value;
                                if ("ignore" !== n && Object.prototype.hasOwnProperty.call(m, "__proto__")) {
                                    if (!0 === u) return null;
                                    if ("error" === n) throw SyntaxError("Object contains forbidden prototype property");
                                    delete m.__proto__
                                }
                                if ("ignore" !== a && Object.prototype.hasOwnProperty.call(m, "constructor") && null !== m.constructor && "object" === o(m.constructor) && Object.prototype.hasOwnProperty.call(m.constructor, "prototype")) {
                                    if (!0 === u) return null;
                                    if ("error" === a) throw SyntaxError("Object contains forbidden prototype property");
                                    delete m.constructor
                                }
                                for (var b in m) {
                                    var h = m[b];
                                    h && (void 0 === h ? "undefined" : o(h)) === "object" && l.push(h)
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
                        return l(e, t, r)
                    } finally {
                        Error.stackTraceLimit = n
                    }
                }
                e.exports = s, e.exports.default = s, e.exports.parse = s, e.exports.safeParse = function(e, t) {
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
                }, e.exports.scan = c
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
            var e, t, n, o, i, a, u, l, c, s, f, p, d, y, m, b, h, v, g, O, w, j, x, S, P, E, A, k, I, N = window.ReactJSX,
                C = window.Roblox["core-scripts"].util.ready,
                T = r.n(C),
                R = window.Roblox["core-scripts"].react,
                M = window.RobloxThumbnails;

            function D() {
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
            }
            var _ = window.React,
                L = r.n(_);

            function U(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function z(e) {
                if (Array.isArray(e)) return e
            }

            function B() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function F(e, t) {
                if (e) {
                    if ("string" == typeof e) return U(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return U(e, t)
                }
            }
            var K = {
                    Small: {
                        dimension: 16,
                        strokeWidth: 2,
                        textClass: "text-caption-small"
                    },
                    Medium: {
                        dimension: 32,
                        strokeWidth: 3,
                        textClass: "text-caption-small",
                        valueContainerSize: 36
                    },
                    Large: {
                        dimension: 48,
                        strokeWidth: 4,
                        textClass: "text-caption-medium",
                        valueContainerSize: 52
                    }
                },
                W = L().forwardRef(function(e, t) {
                    var r, n = z(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || F(r) || B(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.className,
                        u = o.size,
                        l = void 0 === u ? "Large" : u,
                        c = o.variant,
                        s = o.value,
                        f = o.showValue,
                        p = void 0 !== f && f,
                        d = o.ariaLabel,
                        y = function(e, t) {
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
                        }(o, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        m = (z(i) || function(e) {
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
                        }(i) || F(i, 1) || B())[0],
                        b = K[l],
                        h = b.dimension,
                        v = b.strokeWidth,
                        g = b.textClass,
                        O = b.valueContainerSize,
                        w = (h - v) / 2,
                        j = 2 * Math.PI * w,
                        x = h / 2,
                        S = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        P = p && void 0 !== O ? O : h,
                        E = "Determinate" === (void 0 === c ? "Determinate" : c);
                    return L().createElement("div", function(e) {
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
                        ref: m,
                        className: D("foundation-web-progress-circle inline-flex items-center justify-center", a),
                        role: "progressbar",
                        "aria-label": d,
                        "aria-valuemin": E ? 0 : void 0,
                        "aria-valuemax": E ? 100 : void 0,
                        "aria-valuenow": E ? S : void 0,
                        style: {
                            width: P,
                            height: P
                        }
                    }, y), L().createElement("svg", {
                        width: h,
                        height: h,
                        viewBox: "0 0 ".concat(h, " ").concat(h),
                        className: "relative"
                    }, L().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: w,
                        fill: "none",
                        strokeWidth: v,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), L().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: w,
                        fill: "none",
                        strokeWidth: v,
                        strokeDasharray: E ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: E ? j * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: D(!E && "foundation-web-progress-circle-indeterminate"),
                        style: E ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), E && p && "Large" === l && L().createElement("div", {
                        className: D("absolute content-emphasis flex items-center justify-center", g),
                        "aria-hidden": "true"
                    }, L().createElement("span", null, Math.round(S)), L().createElement("span", null, "%")))
                });
            W.displayName = "ProgressCircle";
            var q = window.Roblox["core-scripts"].meta.device,
                X = "inbox",
                V = "sent",
                $ = "notifications",
                H = "archive",
                G = "list",
                Z = "detail",
                Y = "Roblox",
                J = "Roblox.Messages.CountChanged",
                Q = window.Roblox["core-scripts"].eventStream,
                ee = window.Roblox["core-scripts"].intl.intl,
                et = r.n(ee),
                er = window.Roblox["core-scripts"].endpoints,
                en = window.Roblox["core-scripts"].format.string,
                eo = new(et())().getDateTimeFormatter(),
                ei = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return t.find(function(e) {
                        return null != e
                    })
                },
                ea = function(e) {
                    var t, r, n, o = null != (t = ei(null == e ? void 0 : e.id, null == e ? void 0 : e.UserId, 1)) ? t : 1,
                        i = null != (r = ei(null == e ? void 0 : e.name, null == e ? void 0 : e.UserName, Y)) ? r : Y,
                        a = null != (n = ei(null == e ? void 0 : e.displayName, null == e ? void 0 : e.DisplayName, i)) ? n : i;
                    return {
                        id: o,
                        name: (0, en.escapeHtml)(i),
                        displayName: a,
                        hasVerifiedBadge: !!ei(null == e ? void 0 : e.hasVerifiedBadge, null == e ? void 0 : e.HasVerifiedBadge, !1),
                        profileLink: (0, er.getAbsoluteUrl)("/users/".concat(o, "/profile"))
                    }
                },
                eu = function(e) {
                    var t = (0, er.getAbsoluteUrl)("/my/messages/");
                    return (0, er.getAbsoluteUrl)("/AbuseReport/message?ID=".concat(e, "&RedirectUrl=").concat(t))
                },
                el = function(e) {
                    var t, r, n, o, i = null != (t = ei(e.id, e.Id, 0)) ? t : 0;
                    return {
                        id: i,
                        sender: ea(ei(e.sender, e.Sender)),
                        recipient: ea(ei(e.recipient, e.Recipient)),
                        subject: null != (r = ei(e.subject, e.Subject, "")) ? r : "",
                        body: null != (n = ei(e.body, e.Body, "")) ? n : "",
                        created: null != (o = ei(e.created, e.Created, "")) ? o : "",
                        updated: ei(e.updated, e.Updated),
                        isRead: !!ei(e.isRead, e.IsRead, !1),
                        isSystemMessage: !!ei(e.isSystemMessage, e.IsSystemMessage, !1),
                        isReportAbuseDisplayed: !!ei(e.isReportAbuseDisplayed, e.IsReportAbuseDisplayed, !1),
                        abuseReportUrl: eu(i)
                    }
                },
                ec = function(e) {
                    var t, r, n, o, i = null != (t = ei(e.collection, e.Collection, [])) ? t : [];
                    return {
                        pageNumber: null != (r = ei(e.pageNumber, e.PageNumber, 0)) ? r : 0,
                        totalPages: null != (n = ei(e.totalPages, e.TotalPages, 1)) ? n : 1,
                        totalCollectionSize: null != (o = ei(e.totalCollectionSize, e.TotalCollectionSize, i.length)) ? o : i.length,
                        collection: i.map(el)
                    }
                },
                es = function(e) {
                    var t = document.createElement("div");
                    return t.innerHTML = e, t.textContent || t.innerText || ""
                },
                ef = function(e) {
                    var t = 0,
                        r = "";
                    return e.replace(/(https?:\/\/[^\s<]+)/g, function(n, o, i) {
                        return r += (0, en.escapeHtml)(e.slice(t, i)), r += '<a href="'.concat(n.replace(/[&"]/g, function(e) {
                            return "&" === e ? "&amp;" : "&quot;"
                        }), '" target="_blank" rel="noreferrer">').concat((0, en.escapeHtml)(n), "</a>"), t = i + n.length, n
                    }), (r += (0, en.escapeHtml)(e.slice(t))).replace(/\n/g, "<br />")
                },
                ep = function(e) {
                    var t = new Date(e);
                    if (Number.isNaN(t.getTime())) return "";
                    var r = t.getFullYear() === new Date().getFullYear() ? eo.getCustomDateTime(t, {
                        month: "short",
                        day: "numeric"
                    }) : eo.getShortDate(t);
                    return "".concat(r, " | ").concat(eo.getCustomDateTime(t, {
                        hour: "numeric",
                        minute: "numeric"
                    }))
                },
                ed = function(e) {
                    var t = new Date(e);
                    return Number.isNaN(t.getTime()) ? "" : eo.getFullDate(t)
                },
                ey = function(e) {
                    document.dispatchEvent(new Event(e))
                },
                em = window.Roblox["core-scripts"].environmentUrls,
                eb = r.n(em),
                eh = window.Roblox["core-scripts"].meta.user,
                ev = window.Roblox["core-scripts"].http.http,
                eg = window.Roblox["core-scripts"].guac;

            function eO(e, t, r) {
                return t = eS(t),
                    function(e, t) {
                        var r;
                        if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, ek() ? Reflect.construct(t, r || [], eS(e).constructor) : t.apply(e, r))
            }

            function ew(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function ej(e, t, r) {
                return (ej = ek() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && eE(o, r.prototype), o
                }).apply(null, arguments)
            }

            function ex(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function eS(e) {
                return (eS = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eP(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && eE(e, t)
            }

            function eE(e, t) {
                return (eE = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function eA(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (eA = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return ej(e, arguments, eS(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), eE(r, e)
                })(e)
            }

            function ek() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (ek = function() {
                    return !!e
                })()
            }
            var eI = function(e) {
                    var t;

                    function r(e, t, n) {
                        var o;
                        return ew(this, r), ex(o = eO(this, r, ["".concat(n.status, " ").concat(t.method, " ").concat(e.href)]), "url", void 0), ex(o, "request", void 0), ex(o, "response", void 0), o.url = e, o.request = t, o.response = n, o
                    }
                    return eP(r, e), t = [{
                            key: "new",
                            value: function(e, t, n, o) {
                                return new r(e, t, {
                                    headers: n.headers,
                                    redirected: n.redirected,
                                    status: n.status,
                                    statusText: n.statusText,
                                    type: n.type,
                                    url: n.url,
                                    body: o
                                })
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(r, t), r
                }(eA(Error)),
                eN = function(e) {
                    function t(e) {
                        var r;
                        return ew(this, t), ex(r = eO(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), r.cause = e, r
                    }
                    return eP(t, e), t
                }(eA(Error));

            function eC(e, t, r) {
                return (eC = eD() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && eR(o, r.prototype), o
                }).apply(null, arguments)
            }

            function eT(e) {
                return (eT = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eR(e, t) {
                return (eR = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function eM(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (eM = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return eC(e, arguments, eT(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), eR(r, e)
                })(e)
            }

            function eD() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eD = function() {
                    return !!e
                })()
            }
            var e_ = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e) {
                        var r, n, o, i, a;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return n = t, o = ["Reason" === e.code ? void 0 : e.message, {
                            cause: e
                        }], n = eT(n), r = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, eD() ? Reflect.construct(n, o || [], eT(this).constructor) : n.apply(this, o)), a = void 0, (i = "cause") in r ? Object.defineProperty(r, i, {
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
                    }), e && eR(t, e), t
                }(eM(Error)),
                eL = function(e) {
                    var t;
                    return (null != (t = DOMException) && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) && ("AbortError" === e.name || "TimeoutError" === e.name) ? new e_({
                        code: "AbortError" === e.name ? "Abort" : "Timeout",
                        message: e.message
                    }) : null
                },
                eU = function(e) {
                    var t;
                    return null != (t = eL(e.reason)) ? t : new e_({
                        code: "Reason",
                        reason: e.reason
                    })
                };

            function ez(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eB(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function eF(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            eB(i, n, o, a, u, "next", e)
                        }

                        function u(e) {
                            eB(i, n, o, a, u, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function eK(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function eW(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function eq(e, t, r) {
                return t && eW(e.prototype, t), r && eW(e, r), e
            }

            function eX(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function eV(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function e$(e, t) {
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
                        var c = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
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
            var eH = function() {
                    function e(t) {
                        eK(this, e), eX(this, "value", void 0), this.value = t
                    }
                    return eq(e, [{
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
                            return eZ.fromResult(this.cast())
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
                eG = function() {
                    function e(t) {
                        eK(this, e), eX(this, "error", void 0), this.error = t
                    }
                    return eq(e, [{
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
                            return eZ.fromResult(this.cast())
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
            (A || (A = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new eH(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var eZ = function() {
                    function e(t) {
                        eK(this, e), eX(this, "promise", void 0), this.promise = t
                    }
                    return eq(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return eF(function() {
                                    var r, n;
                                    return e$(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return n = eH.bind, [4, t(e.value)];
                                            case 1:
                                                return r = new(n.apply(eH, [void 0, o.sent()])), [3, 3];
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
                                return eF(function() {
                                    var r, n;
                                    return e$(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return n = eG.bind, [4, t(e.error)];
                                            case 1:
                                                return r = new(n.apply(eG, [void 0, o.sent()])), [3, 3];
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
                                return eV(n, e) ? n.promise : n
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(r) {
                                if (r.isOk()) return r.cast();
                                var n = t(r.error);
                                return eV(n, e) ? n.promise : n
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
                                return new eH(e)
                            }).catch(function(e) {
                                return new eG(r(e))
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
                            return eV(t, e) ? t : eV(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                                return e.fromPromiseResult(t.apply(void 0, function(e) {
                                    if (Array.isArray(e)) return ez(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return ez(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ez(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(A.all))
                        }
                    }]), e
                }(),
                eY = function(e) {
                    return new eH(e)
                },
                eJ = function(e) {
                    return new eG(e)
                },
                eQ = function(e, t) {
                    try {
                        return eY(e())
                    } catch (e) {
                        return eJ(t(e))
                    }
                },
                e0 = function(e) {
                    return eZ.fromResult(eJ(e))
                };

            function e1(e, t, r) {
                return t = e5(t),
                    function(e, t) {
                        var r;
                        if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, e9() ? Reflect.construct(t, r || [], e5(e).constructor) : t.apply(e, r))
            }

            function e2(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function e8(e, t, r) {
                return (e8 = e9() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && e4(o, r.prototype), o
                }).apply(null, arguments)
            }

            function e3(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function e5(e) {
                return (e5 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function e6(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && e4(e, t)
            }

            function e4(e, t) {
                return (e4 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function e7(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (e7 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return e8(e, arguments, e5(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), e4(r, e)
                })(e)
            }

            function e9() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (e9 = function() {
                    return !!e
                })()
            }
            var te = function(e) {
                    function t(e) {
                        var r;
                        return e2(this, t), e3(r = e1(this, t, [e.error.message, {
                            cause: e
                        }]), "cause", void 0), r.cause = e, r
                    }
                    return e6(t, e), t
                }(e7(Error)),
                tt = function(e) {
                    function t(e) {
                        var r;
                        return e2(this, t), e3(r = e1(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), r.cause = e, r
                    }
                    return e6(t, e), t
                }(e7(Error)),
                tr = function(e, t) {
                    try {
                        return eY(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return eJ(new tt(e))
                    }
                },
                tn = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                        r = Number.parseInt(e, t);
                    return Number.isNaN(r) ? null : r
                };

            function to(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function ti(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var ta = [408, 429, 500, 502, 503, 504],
                tu = function(e) {
                    if (!ti(e, eI)) return null;
                    var t = e.response.headers.get("Retry-After");
                    if (null == t) return null;
                    var r = tn(t);
                    if (null != r) return 1e3 * r;
                    var n = eQ(function() {
                        return new Date(t)
                    }, function() {
                        return null
                    }).getOrNull();
                    return null != n ? n.getTime() - Date.now() : null
                },
                tl = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : ta;
                    return ti(e, eN) || ti(e, eI) && t.includes(e.response.status)
                };

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
            var tf = (n = (t = {
                    maxRetries: 3,
                    factor: 1e3,
                    maxDelay: 3e4
                }).maxRetries, o = t.factor, i = t.maxDelay, u = void 0 === (a = t.retryableHttpStatuses) ? ta : a, l = function(e) {
                    return Math.min(Math.pow(2, e) * o, i)
                }, function(e, t) {
                    var r;
                    return e < n && tl(t, u) ? null != (r = tu(t)) ? r : l(e) : NaN
                }),
                tp = (c = function(e, t) {
                    return eZ.fromPromise(globalThis.fetch(e.href, t), function(e) {
                        var t;
                        return null != (t = eL(e)) ? t : new eN(e)
                    }).andThen(function(r) {
                        return r.ok ? eY(r) : t.includeBodyOnError ? r.text().catch(function() {}).then(function(n) {
                            return eJ(eI.new(e, t, r, n))
                        }) : eJ(eI.new(e, t, r))
                    })
                }, function(e, t) {
                    var r = t.retry,
                        n = t.signal;
                    return null == r ? c(e, t) : c(e, t).orElse(function(o) {
                        var i;
                        return (i = function() {
                            var i, a, u, l, s;
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
                                        var c = [u, l];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                                case 0:
                                                case 1:
                                                    o = c;
                                                    break;
                                                case 4:
                                                    return i.label++, {
                                                        value: c[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    i.label++, n = c[1], c = [0];
                                                    continue;
                                                case 7:
                                                    c = i.ops.pop(), i.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                        i = 0;
                                                        continue
                                                    }
                                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                                        i.label = c[1];
                                                        break
                                                    }
                                                    if (6 === c[0] && i.label < o[1]) {
                                                        i.label = o[1], o = c;
                                                        break
                                                    }
                                                    if (o && i.label < o[2]) {
                                                        i.label = o[2], i.ops.push(c);
                                                        break
                                                    }
                                                    o[2] && i.ops.pop(), i.trys.pop();
                                                    continue
                                            }
                                            c = t.call(e, i)
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
                                var p, d;
                                switch (f.label) {
                                    case 0:
                                        u = r(a = 0, i = o), f.label = 1;
                                    case 1:
                                        if (!(null != u && Number.isFinite(u))) return [3, 7];
                                        if (!(u > 0)) return [3, 5];
                                        if (null != n) return [3, 3];
                                        return [4, (p = u, new Promise(function(e) {
                                            setTimeout(e, p)
                                        }))];
                                    case 2:
                                        return f.sent(), [3, 5];
                                    case 3:
                                        return [4, (d = u, eZ.fromExecutor(function(e) {
                                            if (n.aborted) return void e(eJ(eU(n)));
                                            var t = setTimeout(function() {
                                                e(eY(null))
                                            }, d);
                                            n.addEventListener("abort", function() {
                                                clearTimeout(t), e(eJ(eU(n)))
                                            }, {
                                                once: !0
                                            })
                                        }))];
                                    case 4:
                                        if ((l = f.sent()).isErr()) return [2, l.cast()];
                                        f.label = 5;
                                    case 5:
                                        return a += 1, t.headers.set("x-retry-attempt", a.toString()), [4, c(e, t)];
                                    case 6:
                                        if ((s = f.sent()).isOk()) return [2, s];
                                        return i = s.error, u = r(a, i), [3, 1];
                                    case 7:
                                        return [2, e0(i)]
                                }
                            })
                        }, function() {
                            var e = this,
                                t = arguments;
                            return new Promise(function(r, n) {
                                var o = i.apply(e, t);

                                function a(e) {
                                    to(o, r, n, a, u, "next", e)
                                }

                                function u(e) {
                                    to(o, r, n, a, u, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    })
                }),
                td = function(e) {
                    var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = null != (t = r.method) ? t : "GET",
                        o = new Headers(r.headers);
                    return tp(e, ts(tc({}, r), {
                        method: n,
                        headers: o
                    }))
                },
                ty = function(e) {
                    return eZ.fromPromise(e.json(), function(e) {
                        return new te({
                            code: "Syntax",
                            error: e
                        })
                    })
                },
                tm = function(e) {
                    var t = e.headers.get("content-type");
                    return "application/json" === t || (null == t ? void 0 : t.startsWith("application/json;"))
                },
                tb = function(e, t) {
                    return td(e, t).andThen(ty)
                },
                th = function(e, t, r) {
                    var n = tr(t);
                    if (n.isErr()) return e0(n.error);
                    var o = new Headers(null == r ? void 0 : r.headers);
                    return o.set("content-type", "application/json"), td(e, ts(tc({}, r), {
                        method: "POST",
                        headers: o,
                        body: n.value
                    }))
                };

            function tv(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var tg = function() {
                    var e;

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        tv(this, "url", void 0), tv(this, "searchParams", void 0), this.url = e, this.searchParams = r
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
                }(),
                tO = function(e) {
                    return e
                };

            function tw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tj(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function tx(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tS(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function tP(e) {
                return function(e) {
                    if (Array.isArray(e)) return tw(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || tE(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tE(e, t) {
                if (e) {
                    if ("string" == typeof e) return tw(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tw(e, t)
                }
            }
            var tA = function(e) {
                    return tO(new URLSearchParams(e))
                },
                tk = ["__proto__", "prototype", "constructor"],
                tI = function(e) {
                    return tA(tP(e.entries()).filter(function(e) {
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
                            }(e) || tE(e, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return !tk.includes(r) && !tk.includes(n)
                    }))
                },
                tN = function() {
                    var e, t;

                    function r(e) {
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        tx(this, "searchParams", void 0), this.searchParams = e
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
                            return this.searchParams.has(e, t)
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(e, t) {
                            var n = tA(this.searchParams);
                            return n.append(e, t), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(e) {
                            var t = tS(e, URLSearchParams) || tS(e, r) || Array.isArray(e) ? e : Object.entries(e);
                            return r.new(tP(this.searchParams).concat(tP(t)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(e, t) {
                            var n = tA(this.searchParams);
                            return n.set(e, t), r.fromUnique(n)
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(e, t) {
                            if (this.searchParams.has(e, t)) {
                                var n = tA(this.searchParams);
                                return n.delete(e, t), r.fromUnique(n)
                            }
                            return this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var e = tA(this.searchParams);
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
                            if (tS(e, r)) return e;
                            var n = tA(e);
                            return r.fromUnique(t ? tI(n) : n)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return r.fromUnique(t ? tI(e) : tA(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                n = tA(e);
                            return r.fromUnique(t ? tI(n) : n)
                        }
                    }], e && tj(r.prototype, e), t && tj(r, t), r
                }();

            function tC(e, t, r) {
                return t = tD(t),
                    function(e, t) {
                        var r;
                        if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, tz() ? Reflect.construct(t, r || [], tD(e).constructor) : t.apply(e, r))
            }

            function tT(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function tR(e, t, r) {
                return (tR = tz() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && tL(o, r.prototype), o
                }).apply(null, arguments)
            }

            function tM(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tD(e) {
                return (tD = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function t_(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && tL(e, t)
            }

            function tL(e, t) {
                return (tL = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function tU(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (tU = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return tR(e, arguments, tD(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), tL(r, e)
                })(e)
            }

            function tz() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (tz = function() {
                    return !!e
                })()
            }
            tx(tN, "empty", tN.fromUnique(tA("")));
            var tB = function(e) {
                    switch (e.code) {
                        case "ForbiddenScheme":
                            return "forbidden scheme: ".concat(e.scheme);
                        case "ForbiddenHost":
                            return "forbidden host: ".concat(e.host);
                        case "InvalidUrl":
                            return "invalid URL"
                    }
                },
                tF = function(e) {
                    function t(e) {
                        var r;
                        return tT(this, t), tM(r = tC(this, t, [tB(e), {
                            cause: e
                        }]), "cause", void 0), r.cause = e, r
                    }
                    return t_(t, e), t
                }(tU(Error)),
                tK = function(e) {
                    function t(e) {
                        var r;
                        return tT(this, t), tM(r = tC(this, t, [tB(e), {
                            cause: e
                        }]), "cause", void 0), r.cause = e, r
                    }
                    return t_(t, e), t
                }(tU(Error)),
                tW = function(e) {
                    return tO(new URL(e))
                },
                tq = function(e) {
                    try {
                        return eY(tO(new URL(e)))
                    } catch (e) {
                        return eJ(new tK({
                            code: "InvalidUrl"
                        }))
                    }
                },
                tX = function(e, t, r) {
                    var n, o = t.schemeAllowlist,
                        i = t.domainAllowlist,
                        a = t.sanitize;
                    if (e.password = "", e.username = "", n = e.protocol, !o.includes(n)) return eJ({
                        code: "ForbiddenScheme",
                        scheme: e.protocol
                    });
                    if (!i.some(function(t) {
                            return t.startsWith(".") ? e.hostname.endsWith(t) : e.hostname === t
                        })) return eJ({
                        code: "ForbiddenHost",
                        host: e.host
                    });
                    if (a) {
                        var u = tN.fromURLSearchParams(e.searchParams);
                        return e.search = u.toString(), eY(r(e, u))
                    }
                    var l = tN.internalFromUniqueURLSearchParams(tO(e.searchParams));
                    return eY(r(e, l))
                },
                tV = function(e, t, r) {
                    return tX(tW(e), t, r).mapErr(function(e) {
                        return new tF(e)
                    })
                },
                t$ = function(e, t, r) {
                    return tq(e).andThen(function(e) {
                        return tX(e, t, r).mapErr(function(e) {
                            return new tK(e)
                        })
                    })
                };

            function tH(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function tG(e, t, r) {
                return (tG = "u" > typeof Reflect && Reflect.get ? Reflect.get : function(e, t, r) {
                    var n = function(e, t) {
                        for (; !Object.prototype.hasOwnProperty.call(e, t) && null !== (e = tZ(e)););
                        return e
                    }(e, t);
                    if (n) {
                        var o = Object.getOwnPropertyDescriptor(n, t);
                        return o.get ? o.get.call(r || e) : o.value
                    }
                })(e, t, r || e)
            }

            function tZ(e) {
                return (tZ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function tY(e) {
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

            function tJ(e, t) {
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

            function tQ(e, t) {
                return (tQ = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function t0() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (t0 = function() {
                    return !!e
                })()
            }
            var t1 = ["https:"],
                t2 = {
                    schemeAllowlist: t1,
                    domainAllowlist: [".roblox.com", ".robloxlabs.com", ".robloxapp.vnggames.com", "roblox.qq.com", "localhost"],
                    sanitize: !0
                },
                t8 = function(e) {
                    var t, r;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e, t) {
                        var r, o;
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        return r = n, o = [e, t], r = tZ(r),
                            function(e, t) {
                                var r;
                                if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return e
                            }(this, t0() ? Reflect.construct(r, o || [], tZ(this).constructor) : r.apply(this, o))
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: n,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && tQ(n, e), t = [{
                        key: "scheme",
                        get: function() {
                            return tG(tZ(n.prototype), "scheme", this)
                        }
                    }, {
                        key: "port",
                        get: function() {
                            return tG(tZ(n.prototype), "port", this)
                        }
                    }, {
                        key: "with",
                        value: function(e) {
                            var t = e.path,
                                r = e.searchParams,
                                o = e.fragment;
                            if (null == t && null == r && null == o) return this;
                            var i = tW(this.url);
                            if (null != t && (i.pathname = t), null != o && (i.hash = o), null != r) {
                                var a = tN.new(r);
                                return i.search = a.toString(), new n(i, a)
                            }
                            return new n(i, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(e) {
                            var t = tW(this.url);
                            return t.pathname = e, new n(t, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(e) {
                            var t = tN.new(e),
                                r = tW(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(e) {
                            var t = this.searchParams.copyAndAppendAll(e),
                                r = tW(this.url);
                            return r.search = t.toString(), new n(r, t)
                        }
                    }, {
                        key: "withFragment",
                        value: function(e) {
                            var t = tW(this.url);
                            return t.hash = e, new n(t, this.searchParams)
                        }
                    }], r = [{
                        key: "new",
                        value: function(e, t) {
                            return e.port = "", new n(e, t)
                        }
                    }, {
                        key: "fromURLWithOptions",
                        value: function(e, t) {
                            return tV(e, tJ(tY({}, t2, t), {
                                schemeAllowlist: t1
                            }), n.new)
                        }
                    }, {
                        key: "fromURL",
                        value: function(e) {
                            return tV(e, t2, n.new)
                        }
                    }, {
                        key: "parseWithOptions",
                        value: function(e, t) {
                            return t$(e, tJ(tY({}, t2, t), {
                                schemeAllowlist: t1
                            }), n.new)
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            return t$(e, t2, n.new)
                        }
                    }], t && tH(n.prototype, t), r && tH(n, r), n
                }(tg);

            function t3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t5(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function t6(e, t) {
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
                        if ("string" == typeof e) return t3(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t3(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var t4 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return e.getOrThrow().then(function(e) {
                        return t && null == e ? {} : e
                    }, function(e) {
                        throw t5(e, eI) ? Error("Request failed with status code ".concat(e.response.status), {
                            cause: e
                        }) : t5(e, Error) ? e : Error(String(e), {
                            cause: e
                        })
                    })
                },
                t7 = function(e) {
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
                    }({}, e.withCredentials ? {
                        credentials: "include"
                    } : {}, e.retryable ? {
                        retry: tf
                    } : {}, e.noCache ? {
                        headers: {
                            "Cache-Control": "no-cache, no-store, must-revalidate",
                            Pragma: "no-cache"
                        }
                    } : {})
                },
                t9 = function(e, t) {
                    var r = t8.parse(e).getOrThrow();
                    if (!t) return r;
                    var n = Object.fromEntries(Object.entries(t).filter(function(e) {
                        return null != t6(e, 2)[1]
                    }).map(function(e) {
                        var t = t6(e, 2);
                        return [t[0], String(t[1])]
                    }));
                    return r.withSearchParams(n)
                },
                re = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e, t) {
                        return t4(tb(t9(e.url, t), t7(e)))
                    },
                    post: function(e, t) {
                        return t4(th(t9(e.url), null != t ? t : {}, t7(e)).andThen(function(e) {
                            var t;
                            return tm(e) ? ty(e) : (t = void 0, eZ.fromResult(eY(t)))
                        }), !0)
                    },
                    getGuacBundle: function(e) {
                        return t4(tb(t8.parse(eb().apiGatewayUrl).getOrThrow().withPath("/guac-v2/v1/bundles/".concat(e)).withSearchParams({
                            version: "1"
                        }), {
                            credentials: "include"
                        }))
                    }
                } : {
                    get: function(e, t) {
                        return ev.get(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    post: function(e, t) {
                        return ev.post(e, t).then(function(e) {
                            return e.data
                        })
                    },
                    getGuacBundle: function(e) {
                        var t = new URLSearchParams;
                        return t.append("version", "1"), (0, eg.callBehaviour)(e, t)
                    }
                };

            function rt(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function rr(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            rt(i, n, o, a, u, "next", e)
                        }

                        function u(e) {
                            rt(i, n, o, a, u, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function rn(e, t) {
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
                        var c = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
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
            var ro = function(e) {
                    return "".concat(eb().privateMessagesApi).concat(e)
                },
                ri = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    return {
                        url: e,
                        noCache: t,
                        retryable: t,
                        withCredentials: !0
                    }
                },
                ra = function(e, t) {
                    return e === $ ? rr(function() {
                        return rn(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, re.get(ri(ro("/v1/announcements"), !0))];
                                case 1:
                                    return [2, ec(e.sent())]
                            }
                        })
                    })() : rr(function() {
                        return rn(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return [4, re.get(ri(ro("/v1/messages"), !0), {
                                        pageNumber: t,
                                        pageSize: 20,
                                        messageTab: e
                                    })];
                                case 1:
                                    return [2, ec(r.sent())]
                            }
                        })
                    })()
                },
                ru = function(e, t) {
                    return re.post(ri(ro(t ? "/v1/messages/mark-read" : "/v1/messages/mark-unread")), {
                        messageIds: e
                    })
                },
                rl = function(e) {
                    if (e.message) return Error(e.message);
                    var t, r, n = null == (r = e.errors) || null == (t = r[0]) ? void 0 : t.message;
                    return Error(null != n ? n : "Unknown error")
                },
                rc = function(e) {
                    var t = e.subject,
                        r = e.body,
                        n = e.recipientId,
                        o = e.replyMessageId,
                        i = e.includePreviousMessage;
                    return rr(function() {
                        var e, a;
                        return rn(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    return [4, re.post(ri(ro("/v1/messages/send")), {
                                        userId: null != (e = (0, eh.userId)()) ? e : 0,
                                        subject: t,
                                        body: r,
                                        recipientId: n,
                                        replyMessageId: o,
                                        includePreviousMessage: i
                                    })];
                                case 1:
                                    if (!1 === (a = u.sent()).success) throw rl(a);
                                    return [2, a]
                            }
                        })
                    })()
                };

            function rs(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rf(e, t) {
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
                        if ("string" == typeof e) return rs(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rs(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rp = [X, V, $, H],
                rd = function(e) {
                    var t = Array.isArray(e) ? e[0] : e;
                    if (null == t || "" === t || "string" != typeof t && "number" != typeof t) return null;
                    var r = Number.parseInt(String(t), 10);
                    return Number.isNaN(r) ? null : r
                },
                ry = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? "" : window.location.hash,
                        r = rf((t.startsWith("#!") ? t.slice(2) : t.replace(/^#/, "")).split("?"), 2),
                        n = r[0],
                        o = r[1],
                        i = (void 0 === n ? "/inbox" : n).replace(/^\//, ""),
                        a = tN.parse(void 0 === o ? "" : o),
                        u = null != (e = rd(a.get("page"))) ? e : 1;
                    return {
                        tab: rp.includes(i) ? i : X,
                        page: u > 0 ? u : 1,
                        messageIdx: rd(a.get("messageIdx")),
                        conversationId: rd(a.get("conversationId"))
                    }
                },
                rm = function(e) {
                    var t = tN.new(function(e) {
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
                    }({}, e.page > 1 ? {
                        page: String(e.page)
                    } : {}, null != e.messageIdx ? {
                        messageIdx: String(e.messageIdx)
                    } : {}, null != e.conversationId ? {
                        conversationId: String(e.conversationId)
                    } : {})).toString();
                    return "#!/".concat(e.tab).concat(t ? "?".concat(t) : "")
                },
                rb = function() {
                    var e = rf((0, _.useState)(function() {
                            return ry()
                        }), 2),
                        t = e[0],
                        r = e[1];
                    return (0, _.useEffect)(function() {
                        var e = function() {
                            r(ry())
                        };
                        return window.addEventListener("hashchange", e),
                            function() {
                                window.removeEventListener("hashchange", e)
                            }
                    }, []), {
                        route: t,
                        setRoute: (0, _.useCallback)(function(e) {
                            var t = rm(e);
                            window.location.hash === t ? r(e) : window.location.hash = t
                        }, [])
                    }
                };

            function rh(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rv(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function rg(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            rv(i, n, o, a, u, "next", e)
                        }

                        function u(e) {
                            rv(i, n, o, a, u, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function rO(e) {
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

            function rw(e, t) {
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

            function rj(e, t) {
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
                }(e, t) || rP(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rx(e) {
                return function(e) {
                    if (Array.isArray(e)) return rh(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || rP(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rS(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function rP(e, t) {
                if (e) {
                    if ("string" == typeof e) return rh(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rh(e, t)
                }
            }

            function rE(e, t) {
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
                        var c = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, c[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & c[0] ? n.return : c[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, c[1])).done) return o;
                            switch (n = 0, o && (c = [2 & c[0], o.value]), c[0]) {
                                case 0:
                                case 1:
                                    o = c;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!o || c[1] > o[0] && c[1] < o[3])) {
                                        i.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && i.label < o[1]) {
                                        i.label = o[1], o = c;
                                        break
                                    }
                                    if (o && i.label < o[2]) {
                                        i.label = o[2], i.ops.push(c);
                                        break
                                    }
                                    o[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            c = t.call(e, i)
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
            var rA = {
                    replyContent: "",
                    includePreviousMessage: !0,
                    isSending: !1
                },
                rk = function(e) {
                    return e && !e.isSystemMessage ? rw(rO({}, e), {
                        body: ef(e.body)
                    }) : e
                },
                rI = function(e, t) {
                    if (e && (void 0 === e ? "undefined" : rS(e)) === "object") {
                        if ("string" == typeof e.message) return e.message;
                        if (Array.isArray(e.errors)) {
                            var r = e.errors[0];
                            if (r && (void 0 === r ? "undefined" : rS(r)) === "object" && "message" in r) return String(r.message)
                        }
                    }
                    return t
                },
                rN = function(e) {
                    var t = e.translate,
                        r = rb(),
                        n = r.route,
                        o = r.setRoute,
                        i = rj((0, _.useState)({}), 2),
                        a = i[0],
                        u = i[1],
                        l = rj((0, _.useState)(null), 2),
                        c = l[0],
                        s = l[1],
                        f = rj((0, _.useState)(null), 2),
                        p = f[0],
                        d = f[1],
                        y = rj((0, _.useState)(function() {
                            return new Set
                        }), 2),
                        m = y[0],
                        b = y[1],
                        h = rj((0, _.useState)(G), 2),
                        v = h[0],
                        g = h[1],
                        O = rj((0, _.useState)(!0), 2),
                        w = O[0],
                        j = O[1],
                        x = rj((0, _.useState)(null), 2),
                        S = x[0],
                        P = x[1],
                        E = rj((0, _.useState)(null), 2),
                        A = E[0],
                        k = E[1],
                        I = rj((0, _.useState)(rA), 2),
                        N = I[0],
                        C = I[1],
                        T = rj((0, _.useState)(0), 2),
                        R = T[0],
                        M = T[1],
                        D = (0, _.useRef)(!1),
                        L = (0, _.useMemo)(function() {
                            var e = [{
                                name: X,
                                label: t("Label.Inbox")
                            }, {
                                name: V,
                                label: t("Label.Sent")
                            }, {
                                name: $,
                                label: t("Label.News"),
                                count: R
                            }, {
                                name: H,
                                label: t("Label.Archive")
                            }];
                            return a.displayNewsTab ? e : e.filter(function(e) {
                                return e.name !== $
                            })
                        }, [R, a.displayNewsTab, t]),
                        U = (0, _.useCallback)(function() {
                            return rg(function() {
                                var e, r, o, i;
                                return rE(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            j(!0), P(null), b(new Set), a.label = 1;
                                        case 1:
                                            var u;
                                            if (a.trys.push([1, 8, 9, 10]), null == n.conversationId) return [3, 5];
                                            return [4, (u = n.conversationId, rr(function() {
                                                return rn(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return [4, re.get(ri(ro("/v1/messages/".concat(u)), !0))];
                                                        case 1:
                                                            return [2, el(e.sent())]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            if (e = a.sent(), s(null), d(rk(e)), C(rA), g(Z), e.isRead) return [3, 4];
                                            return [4, ru([e.id], !0)];
                                        case 3:
                                            a.sent(), ey(J), a.label = 4;
                                        case 4:
                                            return [3, 7];
                                        case 5:
                                            return [4, ra(n.tab, n.page - 1)];
                                        case 6:
                                            s(o = a.sent()), g(null == n.messageIdx ? G : Z), d(null == n.messageIdx ? null : rk(null != (r = o.collection[n.messageIdx]) ? r : null)), null != n.messageIdx && C(rA), ey(J), a.label = 7;
                                        case 7:
                                            return [3, 10];
                                        case 8:
                                            return i = a.sent(), s(null), d(null), g(G), P(rI(i, t("Message.UnknownError"))), [3, 10];
                                        case 9:
                                            return j(!1), [7];
                                        case 10:
                                            return [2]
                                    }
                                })
                            })()
                        }, [n, t]);
                    return (0, _.useEffect)(function() {
                        re.getGuacBundle("private-messages-ui").then(u).catch(function() {
                            u({})
                        }), re.get(ri(ro("/v1/announcements/metadata"), !0)).then(function(e) {
                            var t;
                            M(null != (t = e.numOfAnnouncements) ? t : 0)
                        }).catch(function() {
                            M(0)
                        })
                    }, []), (0, _.useEffect)(function() {
                        if (D.current) {
                            D.current = !1;
                            return
                        }
                        U()
                    }, [U]), {
                        route: n,
                        rules: a,
                        tabs: L,
                        page: c,
                        selectedMessage: p,
                        selectedMessageIds: m,
                        moduleState: v,
                        loading: w,
                        error: S,
                        feedback: A,
                        sendReplyState: N,
                        openTab: function(e) {
                            e === $ && (0, Q.sendEventWithTarget)("newsOpenContent", "click", {
                                property: R
                            }, Q.targetTypes.WWW), d(null), b(new Set), C(rA), o({
                                tab: e,
                                page: 1,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        openMessage: function(e, t) {
                            return rg(function() {
                                return rE(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (d(rk(e)), b(new Set([e.id])), C(rA), g(Z), D.current = !0, o(rw(rO({}, n), {
                                                    messageIdx: t,
                                                    conversationId: null
                                                })), e.isRead) return [3, 2];
                                            return s(function(t) {
                                                return null == t ? t : rw(rO({}, t), {
                                                    collection: t.collection.map(function(t) {
                                                        return t.id === e.id ? rw(rO({}, t), {
                                                            isRead: !0
                                                        }) : t
                                                    })
                                                })
                                            }), [4, ru([e.id], !0)];
                                        case 1:
                                            r.sent(), ey(J), r.label = 2;
                                        case 2:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        backToList: function() {
                            d(null), b(new Set), C(rA), g(G), D.current = !0, o(rw(rO({}, n), {
                                messageIdx: null,
                                conversationId: null
                            }))
                        },
                        toggleMessageSelection: function(e) {
                            b(function(t) {
                                var r = new Set(t);
                                return r.has(e) ? r.delete(e) : r.add(e), r
                            })
                        },
                        toggleSelectAll: function() {
                            b(function(e) {
                                return c && e.size !== c.collection.length ? new Set(c.collection.map(function(e) {
                                    return e.id
                                })) : new Set
                            })
                        },
                        markRead: function(e) {
                            return rg(function() {
                                var t;
                                return rE(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (0 === (t = rx(m)).length) return [2];
                                            return s(function(r) {
                                                return null == r ? r : rw(rO({}, r), {
                                                    collection: r.collection.map(function(r) {
                                                        return t.includes(r.id) ? rw(rO({}, r), {
                                                            isRead: e
                                                        }) : r
                                                    })
                                                })
                                            }), b(new Set), [4, ru(t, e)];
                                        case 1:
                                            return r.sent(), ey(J), [2]
                                    }
                                })
                            })()
                        },
                        markArchive: function(e) {
                            return rg(function() {
                                var t, r;
                                return rE(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            if (0 === (t = m.size > 0 ? rx(m) : p ? [p.id] : []).length) return [2];
                                            return r = v === Z, [4, re.post(ri(ro(e ? "/v1/messages/archive" : "/v1/messages/unarchive")), {
                                                messageIds: t
                                            })];
                                        case 1:
                                            if (i.sent(), b(new Set), d(null), C(rA), g(G), !r) return [3, 2];
                                            return o(rw(rO({}, n), {
                                                messageIdx: null,
                                                conversationId: null
                                            })), [3, 4];
                                        case 2:
                                            return [4, U()];
                                        case 3:
                                            i.sent(), i.label = 4;
                                        case 4:
                                            return ey(J), [2]
                                    }
                                })
                            })()
                        },
                        changePage: function(e) {
                            C(rA), o({
                                tab: n.tab,
                                page: e,
                                messageIdx: null,
                                conversationId: null
                            })
                        },
                        updateReplyContent: function(e) {
                            C(function(t) {
                                return rw(rO({}, t), {
                                    replyContent: e
                                })
                            })
                        },
                        updateIncludePreviousMessage: function(e) {
                            C(function(t) {
                                return rw(rO({}, t), {
                                    includePreviousMessage: e
                                })
                            })
                        },
                        sendReply: function() {
                            return rg(function() {
                                return rE(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            if (!p || 0 === N.replyContent.length) return [2];
                                            C(function(e) {
                                                return rw(rO({}, e), {
                                                    isSending: !0
                                                })
                                            }), e.label = 1;
                                        case 1:
                                            return e.trys.push([1, 3, 4, 5]), [4, rc({
                                                subject: p.subject,
                                                body: N.replyContent,
                                                recipientId: p.sender.id,
                                                replyMessageId: p.id,
                                                includePreviousMessage: N.includePreviousMessage
                                            })];
                                        case 2:
                                            return e.sent(), k({
                                                type: "success",
                                                message: t("Message.SendSuccessfully")
                                            }), C(rA), ey("Roblox.Messages.MessageSent"), [3, 5];
                                        case 3:
                                            return k({
                                                type: "warning",
                                                message: rI(e.sent(), t("Message.UnknownError"))
                                            }), [3, 5];
                                        case 4:
                                            return C(function(e) {
                                                return rw(rO({}, e), {
                                                    isSending: !1
                                                })
                                            }), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        dismissFeedback: function() {
                            k(null)
                        },
                        shouldShowSystemUser: function(e) {
                            return "sent" !== n.tab && 1 === e.sender.id
                        }
                    }
                };

            function rC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rT(e) {
                if (Array.isArray(e)) return e
            }

            function rR() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rM(e, t) {
                if (e) {
                    if ("string" == typeof e) return rC(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rC(e, t)
                }
            }
            var rD = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                r_ = L().forwardRef(function(e, t) {
                    var r, n = rT(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rM(r) || rR(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.name,
                        u = o.size,
                        l = o.className,
                        c = (o.children, function(e, t) {
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
                        s = (rT(i) || function(e) {
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
                        }(i) || rM(i, 1) || rR())[0];
                    return L().createElement("span", function(e) {
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
                        className: D("grow-0 shrink-0 basis-auto icon", a, rD[void 0 === u ? "Medium" : u], l)
                    }, c))
                });
            r_.displayName = "Icon";
            var rL = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                rU = function(e) {
                    var t = e.className;
                    return L().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: D("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                rz = "opacity-[0.5]",
                rB = function(e) {
                    var t = e.width,
                        r = e.height;
                    return L().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, L().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function rF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rK(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rW() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = rK(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : rK(t[e], null)
                        }
                    }
                }
            }

            function rq() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return _.useCallback(rW.apply(void 0, function(e) {
                    if (Array.isArray(e)) return rF(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rF(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rF(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function rX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rV(e) {
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

            function rH(e, t) {
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

            function rG(e) {
                return function(e) {
                    if (Array.isArray(e)) return rX(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rX(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rX(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rZ(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var rY = Symbol.for("react.lazy"),
                rJ = _[" use ".trim().toString()];

            function rQ(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : rZ(e)) === "object" && "$$typeof" in e && e.$$typeof === rY && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : rZ(t)) === "object" && null !== t && "then" in t
            }
            var r0 = ((e = _.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rH(e, ["children"]);
                    if (rQ(r) && "function" == typeof rJ && (r = rJ(r._payload)), _.isValidElement(r)) {
                        var o, i, a, u, l, c = (l = (u = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning) ? o.ref : (l = (u = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = rV({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        i = t[n];
                                    /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = i.apply(void 0, rG(t));
                                        return o.apply(void 0, rG(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = rV({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                }(n);
                                return rV({}, e, r)
                            }(n, r.props);
                        return r.type !== _.Fragment && (s.ref = t ? rW(t, c) : c), _.cloneElement(r, s)
                    }
                    return _.Children.count(r) > 1 ? _.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), s = e, (f = _.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rH(e, ["children"]);
                    rQ(r) && "function" == typeof rJ && (r = rJ(r._payload));
                    var o = _.Children.toArray(r),
                        i = o.find(r2);
                    if (i) {
                        var a = i.props.children,
                            u = o.map(function(e) {
                                return e !== i ? e : _.Children.count(a) > 1 ? _.Children.only(null) : _.isValidElement(a) ? a.props.children : null
                            });
                        return (0, N.jsx)(s, r$(rV({}, n), {
                            ref: t,
                            children: _.isValidElement(a) ? _.cloneElement(a, void 0, u) : null
                        }))
                    }
                    return (0, N.jsx)(s, r$(rV({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), f),
                r1 = Symbol("radix.slottable");

            function r2(e) {
                return _.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === r1
            }

            function r8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r3(e) {
                if (Array.isArray(e)) return e
            }

            function r5() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function r6(e) {
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

            function r4(e, t) {
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

            function r7(e, t) {
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

            function r9(e, t) {
                if (e) {
                    if ("string" == typeof e) return r8(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r8(e, t)
                }
            }
            var ne = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                nt = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                nr = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nn = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                no = (0, _.forwardRef)(function(e, t) {
                    var r, n = r3(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || r9(r) || r5(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.children,
                        u = o.className,
                        l = o.style,
                        c = o.isDisabled,
                        s = void 0 !== c && c,
                        f = o.isLoading,
                        p = void 0 !== f && f,
                        d = o.icon,
                        y = o.size,
                        m = void 0 === y ? "Large" : y,
                        b = o.variant,
                        h = void 0 === b ? "Emphasis" : b,
                        v = o.asChild,
                        g = r7(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (r3(i) || function(e) {
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
                        }(i) || r9(i, 1) || r5())[0],
                        w = D("foundation-web-button", s ? rz : [rL, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nt[m], s ? nn[h] : nr[h], u),
                        j = r6({
                            textDecoration: "none"
                        }, l),
                        x = function(e) {
                            return L().createElement(L().Fragment, null, L().createElement(rU, null), p && L().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, L().createElement(rB, {
                                width: ne[m],
                                height: ne[m]
                            })), L().createElement("span", {
                                className: D("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, d && L().createElement(r_, {
                                name: d,
                                size: m
                            }), L().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var S = r7(g, ["as"]),
                            P = L().Children.only(a);
                        return L().createElement(r0, r4(r6({
                            ref: O
                        }, S), {
                            className: w,
                            style: j,
                            "aria-disabled": s || void 0
                        }), L().cloneElement(P, {}, x(P.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var E = g.href,
                            A = r7(g, ["as", "href"]);
                        return L().createElement("a", r4(r6({
                            ref: O
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : E,
                            className: w,
                            style: j
                        }), x(a))
                    }
                    g.as;
                    var k = r7(g, ["as"]);
                    return L().createElement("button", r4(r6({
                        ref: O,
                        type: "button"
                    }, k), {
                        disabled: s,
                        className: w,
                        style: j
                    }), x(a))
                }),
                ni = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                na = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                nu = function(e) {
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
                    return L().createElement("button", function(e) {
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
                        className: D("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", rL, na[t], ni[r], n && "radius-circle", o)
                    }, i), L().createElement(rU, null), L().createElement(r_, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function nl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nc(e) {
                if (Array.isArray(e)) return e
            }

            function ns() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nf(e) {
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

            function np(e, t) {
                return nc(e) || function(e, t) {
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
                }(e, t) || nd(e, t) || ns()
            }

            function nd(e, t) {
                if (e) {
                    if ("string" == typeof e) return nl(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nl(e, t)
                }
            }
            var ny = (0, _.forwardRef)(function(e, t) {
                    var r, n, o, i = nc(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || nd(r) || ns(),
                        a = i[0],
                        u = i.slice(1),
                        l = a.title,
                        c = a.icon,
                        s = a.actionLabel,
                        f = a.onAction,
                        p = a.actions,
                        d = a.onClose,
                        y = a.closeIconAriaLabel,
                        m = a.shouldAutoDismiss,
                        b = a.autoDismissDurationMs,
                        h = a.className,
                        v = function(e, t) {
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
                        }(a, ["title", "icon", "actionLabel", "onAction", "actions", "onClose", "closeIconAriaLabel", "shouldAutoDismiss", "autoDismissDurationMs", "className"]),
                        g = np(u, 1)[0],
                        O = np((0, _.useState)("enter"), 2),
                        w = O[0],
                        j = O[1],
                        x = (0, _.useRef)(void 0),
                        S = (0, _.useRef)(void 0),
                        P = (0, _.useRef)(void 0),
                        E = (0, _.useRef)(null),
                        A = null != p ? p : s && f && L().createElement(no, {
                            size: "Small",
                            variant: "Utility",
                            className: "content-inverse-emphasis",
                            onClick: f,
                            ref: E
                        }, s),
                        k = !!A,
                        I = l.length > 80,
                        N = null == m || m,
                        C = 4e3;
                    k && (C = I ? 1e4 : 7e3);
                    var T = null != b ? b : C,
                        R = (0, _.useCallback)(function() {
                            "exit" !== w && (j("exit"), void 0 !== S.current && (window.clearTimeout(S.current), S.current = void 0), P.current = window.setTimeout(function() {
                                null == d || d()
                            }, 150))
                        }, [d, w]);
                    (0, _.useEffect)(function() {
                        return x.current = window.requestAnimationFrame(function() {
                                j("idle")
                            }),
                            function() {
                                void 0 !== x.current && window.cancelAnimationFrame(x.current)
                            }
                    }, []), (0, _.useEffect)(function() {
                        void 0 !== S.current && (window.clearTimeout(S.current), S.current = void 0), N && "exit" !== w && (S.current = window.setTimeout(function() {
                            R()
                        }, T))
                    }, [T, N, w, R]), (0, _.useEffect)(function() {
                        var e;
                        k && (null == (e = E.current) || e.focus())
                    }, [k]), (0, _.useEffect)(function() {
                        return function() {
                            void 0 !== S.current && window.clearTimeout(S.current), void 0 !== P.current && window.clearTimeout(P.current), void 0 !== x.current && window.cancelAnimationFrame(x.current)
                        }
                    }, []);
                    var M = {
                            position: "fixed",
                            left: "50%",
                            bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                            transform: "translate(-50%, ".concat("idle" === w ? "0" : "120%", ")"),
                            zIndex: "var(--foundation-portal-zindex, 9999)"
                        },
                        U = v.style ? nf({}, M, v.style) : M;
                    return L().createElement("div", nf({
                        ref: g,
                        role: "status",
                        "aria-live": "polite",
                        className: D("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === w ? "ease-standard-in" : "ease-standard-out", h),
                        style: (n = nf({}, U), o = o = {
                            transitionDuration: "".concat("exit" === w ? 150 : 200, "ms"),
                            transitionProperty: "transform"
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(o)).forEach(function(e) {
                            Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                        }), n)
                    }, v), L().createElement("div", {
                        className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
                    }, c && L().createElement(r_, {
                        name: c,
                        size: "Small",
                        className: "shrink-0 content-inverse-emphasis"
                    }), L().createElement("div", {
                        className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
                    }, l)), L().createElement("div", {
                        className: "flex items-center justify-end gap-small shrink-0"
                    }, A, d && L().createElement(nu, {
                        variant: "Utility",
                        size: "Small",
                        isCircular: !0,
                        className: "content-inverse-emphasis",
                        "aria-label": void 0 === y ? "Dismiss snackbar" : y,
                        onClick: R
                    })))
                }),
                nm = function(e) {
                    var t = e.feedback,
                        r = e.onClose;
                    return t ? (0, N.jsx)(ny, {
                        title: t.message,
                        onClose: r,
                        shouldAutoDismiss: !0
                    }) : null
                },
                nb = 0,
                nh = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, _.useRef)();
                    return t.current || (nb += 1, t.current = "".concat(e).concat(nb)), t.current
                };

            function nv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ng(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nO(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        ng(e, t, r[t])
                    })
                }
                return e
            }

            function nw(e) {
                return function(e) {
                    if (Array.isArray(e)) return nv(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nv(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nv(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nj(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return _.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return _.useMemo(function() {
                                var t, o;
                                return ng({}, "__scope".concat(e), (t = nO({}, r), o = null != (o = ng({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = _.createContext(n),
                        i = r.length;
                    r = nw(r).concat([n]);
                    var a = function(t) {
                        var r, n = t.scope,
                            a = t.children,
                            u = function(e, t) {
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
                            }(t, ["scope", "children"]),
                            l = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                            c = _.useMemo(function() {
                                return u
                            }, Object.values(u));
                        return (0, N.jsx)(l.Provider, {
                            value: c,
                            children: a
                        })
                    };
                    return a.displayName = t + "Provider", [a, function(r, a) {
                        var u, l = (null == a || null == (u = a[e]) ? void 0 : u[i]) || o,
                            c = _.useContext(l);
                        if (c) return c;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, nx.apply(void 0, [n].concat(nw(t)))]
            }

            function nx() {
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
                            return nO({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return _.useMemo(function() {
                            return ng({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }

            function nS(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }
            "u" > typeof window && window.document && window.document.createElement;
            var nP = (null == (k = globalThis) ? void 0 : k.document) ? _.useLayoutEffect : function() {};

            function nE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nA(e, t) {
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
                        if ("string" == typeof e) return nE(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nE(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nk = _[" useInsertionEffect ".trim().toString()] || nP;

            function nI(e) {
                var t, r, n, o, i, a, u, l, c = e.prop,
                    s = e.defaultProp,
                    f = e.onChange,
                    p = e.caller,
                    d = nA((r = (t = {
                        defaultProp: s,
                        onChange: void 0 === f ? function() {} : f
                    }).defaultProp, n = t.onChange, i = (o = nA(_.useState(r), 2))[0], a = o[1], u = _.useRef(i), l = _.useRef(n), nk(function() {
                        l.current = n
                    }, [n]), _.useEffect(function() {
                        if (u.current !== i) {
                            var e;
                            null == (e = l.current) || e.call(l, i), u.current = i
                        }
                    }, [i, u]), [i, a, l]), 3),
                    y = d[0],
                    m = d[1],
                    b = d[2],
                    h = void 0 !== c,
                    v = h ? c : y,
                    g = _.useRef(void 0 !== c);
                return _.useEffect(function() {
                    var e = g.current;
                    if (e !== h) {
                        var t = h ? "controlled" : "uncontrolled";
                        console.warn("".concat(p, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                    }
                    g.current = h
                }, [h, p]), [v, _.useCallback(function(e) {
                    if (h) {
                        var t, r = "function" == typeof e ? e(c) : e;
                        r !== c && (null == (t = b.current) || t.call(b, r))
                    } else m(e)
                }, [h, c, m, b])]
            }

            function nN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nT(e, t) {
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
                        if ("string" == typeof e) return nC(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nC(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            Symbol("RADIX:SYNC_STATE");
            var nR = function(e) {
                var t, r, n, o, i, a, u, l, c, s, f, p, d, y, m, b, h, v = e.present,
                    g = e.children,
                    O = (t = v, i = (o = nT(_.useState(), 2))[0], a = o[1], u = _.useRef(null), l = _.useRef(t), c = _.useRef("none"), f = (s = nT((r = t ? "mounted" : "unmounted", n = {
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
                    }, _.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], _.useEffect(function() {
                        var e = nM(u.current);
                        c.current = "mounted" === f ? e : "none"
                    }, [f]), nP(function() {
                        var e = u.current,
                            r = l.current;
                        if (r !== t) {
                            var n = c.current,
                                o = nM(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), l.current = t
                        }
                    }, [t, p]), nP(function() {
                        if (i) {
                            var e, t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = nM(u.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && n && (p("ANIMATION_END"), !l.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (c.current = nM(u.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [i, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: _.useCallback(function(e) {
                            u.current = e ? getComputedStyle(e) : null, a(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : _.Children.only(g),
                    j = rq(O.ref, (h = (b = null == (y = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? d.ref : (h = (b = null == (m = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof g || O.isPresent ? _.cloneElement(w, {
                    ref: j
                }) : null
            };

            function nM(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function nD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n_(e) {
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

            function nL(e, t) {
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

            function nz(e) {
                return function(e) {
                    if (Array.isArray(e)) return nD(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nD(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nD(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nB(e) {
                var t, r, n = (t = e, (r = _.forwardRef(function(e, t) {
                        var r = e.children,
                            n = nU(e, ["children"]);
                        if (_.isValidElement(r)) {
                            var o, i, a, u, l, c = (l = (u = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning) ? o.ref : (l = (u = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = n_({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = i.apply(void 0, nz(t));
                                            return o.apply(void 0, nz(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = n_({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return n_({}, e, r)
                                }(n, r.props);
                            return r.type !== _.Fragment && (s.ref = t ? rW(t, c) : c), _.cloneElement(r, s)
                        }
                        return _.Children.count(r) > 1 ? _.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = _.forwardRef(function(e, t) {
                        var r = e.children,
                            o = nU(e, ["children"]),
                            i = _.Children.toArray(r),
                            a = i.find(nK);
                        if (a) {
                            var u = a.props.children,
                                l = i.map(function(e) {
                                    return e !== a ? e : _.Children.count(u) > 1 ? _.Children.only(null) : _.isValidElement(u) ? u.props.children : null
                                });
                            return (0, N.jsx)(n, nL(n_({}, o), {
                                ref: t,
                                children: _.isValidElement(u) ? _.cloneElement(u, void 0, l) : null
                            }))
                        }
                        return (0, N.jsx)(n, nL(n_({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            nR.displayName = "Presence", window.ReactDOM;
            var nF = Symbol("radix.slottable");

            function nK(e) {
                return _.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nF
            }

            function nW(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nq(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nW(e, t, r[t])
                    })
                }
                return e
            }

            function nX(e, t) {
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
            var nV = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = nB("Primitive.".concat(t)),
                    n = _.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, N.jsx)(a, nX(nq({}, i), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), nX(nq({}, e), nW({}, t, n))
            }, {});

            function n$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nH(e) {
                if (Array.isArray(e)) return e
            }

            function nG() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nZ(e) {
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

            function nY(e, t) {
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

            function nJ(e, t) {
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

            function nQ(e, t) {
                return nH(e) || function(e, t) {
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
                }(e, t) || n1(e, t) || nG()
            }

            function n0(e) {
                return nH(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || n1(e) || nG()
            }

            function n1(e, t) {
                if (e) {
                    if ("string" == typeof e) return n$(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n$(e, t)
                }
            }
            var n2 = "Checkbox",
                n8 = nQ(nj(n2), 2),
                n3 = n8[0];
            n8[1];
            var n5 = nQ(n3(n2), 2),
                n6 = n5[0],
                n4 = n5[1];

            function n7(e) {
                var t = e.__scopeCheckbox,
                    r = e.checked,
                    n = e.children,
                    o = e.defaultChecked,
                    i = e.disabled,
                    a = e.form,
                    u = e.name,
                    l = e.onCheckedChange,
                    c = e.required,
                    s = e.value,
                    f = e.internal_do_not_use_render,
                    p = nQ(nI({
                        prop: r,
                        defaultProp: null != o && o,
                        onChange: l,
                        caller: n2
                    }), 2),
                    d = p[0],
                    y = p[1],
                    m = nQ(_.useState(null), 2),
                    b = m[0],
                    h = m[1],
                    v = nQ(_.useState(null), 2),
                    g = v[0],
                    O = v[1],
                    w = _.useRef(!1),
                    j = !b || !!a || !!b.closest("form"),
                    x = {
                        checked: d,
                        disabled: i,
                        setChecked: y,
                        control: b,
                        setControl: h,
                        name: u,
                        form: a,
                        value: void 0 === s ? "on" : s,
                        hasConsumerStoppedPropagationRef: w,
                        required: c,
                        defaultChecked: !oa(o) && o,
                        isFormControl: j,
                        bubbleInput: g,
                        setBubbleInput: O
                    };
                return (0, N.jsx)(n6, nY(nZ({
                    scope: t
                }, x), {
                    children: "function" == typeof f ? f(x) : n
                }))
            }
            var n9 = "CheckboxTrigger",
                oe = _.forwardRef(function(e, t) {
                    var r = n0([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        i = n.__scopeCheckbox,
                        a = n.onKeyDown,
                        u = n.onClick,
                        l = nJ(n, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                        c = nQ(o, 1)[0],
                        s = n4(n9, i),
                        f = s.control,
                        p = s.value,
                        d = s.disabled,
                        y = s.checked,
                        m = s.required,
                        b = s.setControl,
                        h = s.setChecked,
                        v = s.hasConsumerStoppedPropagationRef,
                        g = s.isFormControl,
                        O = s.bubbleInput,
                        w = rq(c, b),
                        j = _.useRef(y);
                    return _.useEffect(function() {
                        var e = null == f ? void 0 : f.form;
                        if (e) {
                            var t = function() {
                                return h(j.current)
                            };
                            return e.addEventListener("reset", t),
                                function() {
                                    return e.removeEventListener("reset", t)
                                }
                        }
                    }, [f, h]), (0, N.jsx)(nV.button, nY(nZ({
                        type: "button",
                        role: "checkbox",
                        "aria-checked": oa(y) ? "mixed" : y,
                        "aria-required": m,
                        "data-state": ou(y),
                        "data-disabled": d ? "" : void 0,
                        disabled: d,
                        value: p
                    }, l), {
                        ref: w,
                        onKeyDown: nS(a, function(e) {
                            "Enter" === e.key && e.preventDefault()
                        }),
                        onClick: nS(u, function(e) {
                            h(function(e) {
                                return !!oa(e) || !e
                            }), O && g && (v.current = e.isPropagationStopped(), v.current || e.stopPropagation())
                        })
                    }))
                });
            oe.displayName = n9;
            var ot = _.forwardRef(function(e, t) {
                var r = e.__scopeCheckbox,
                    n = e.name,
                    o = e.checked,
                    i = e.defaultChecked,
                    a = e.required,
                    u = e.disabled,
                    l = e.value,
                    c = e.onCheckedChange,
                    s = e.form,
                    f = nJ(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
                return (0, N.jsx)(n7, {
                    __scopeCheckbox: r,
                    checked: o,
                    defaultChecked: i,
                    disabled: u,
                    required: a,
                    onCheckedChange: c,
                    name: n,
                    form: s,
                    value: l,
                    internal_do_not_use_render: function(e) {
                        var n = e.isFormControl;
                        return (0, N.jsxs)(N.Fragment, {
                            children: [(0, N.jsx)(oe, nY(nZ({}, f), {
                                ref: t,
                                __scopeCheckbox: r
                            })), n && (0, N.jsx)(oi, {
                                __scopeCheckbox: r
                            })]
                        })
                    }
                })
            });
            ot.displayName = n2;
            var or = "CheckboxIndicator",
                on = _.forwardRef(function(e, t) {
                    var r = e.__scopeCheckbox,
                        n = e.forceMount,
                        o = nJ(e, ["__scopeCheckbox", "forceMount"]),
                        i = n4(or, r);
                    return (0, N.jsx)(nR, {
                        present: n || oa(i.checked) || !0 === i.checked,
                        children: (0, N.jsx)(nV.span, nY(nZ({
                            "data-state": ou(i.checked),
                            "data-disabled": i.disabled ? "" : void 0
                        }, o), {
                            ref: t,
                            style: nZ({
                                pointerEvents: "none"
                            }, e.style)
                        }))
                    })
                });
            on.displayName = or;
            var oo = "CheckboxBubbleInput",
                oi = _.forwardRef(function(e, t) {
                    var r, n, o, i, a, u = n0([e, t]),
                        l = u[0],
                        c = u.slice(1),
                        s = l.__scopeCheckbox,
                        f = nJ(l, ["__scopeCheckbox"]),
                        p = nQ(c, 1)[0],
                        d = n4(oo, s),
                        y = d.control,
                        m = d.hasConsumerStoppedPropagationRef,
                        b = d.checked,
                        h = d.defaultChecked,
                        v = d.required,
                        g = d.disabled,
                        O = d.name,
                        w = d.value,
                        j = d.form,
                        x = d.bubbleInput,
                        S = rq(p, d.setBubbleInput),
                        P = (r = _.useRef({
                            value: b,
                            previous: b
                        }), _.useMemo(function() {
                            return r.current.value !== b && (r.current.previous = r.current.value, r.current.value = b), r.current.previous
                        }, [b])),
                        E = (i = (o = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = _.useState(void 0)) || function(e) {
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
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return nN(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nN(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], a = o[1], nP(function() {
                            if (y) {
                                a({
                                    width: y.offsetWidth,
                                    height: y.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                i = Array.isArray(o) ? o[0] : o;
                                            t = i.inlineSize, r = i.blockSize
                                        } else t = y.offsetWidth, r = y.offsetHeight;
                                        a({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(y, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(y)
                                    }
                            }
                            a(void 0)
                        }, [y]), i);
                    _.useEffect(function() {
                        if (x) {
                            var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                                t = !m.current;
                            if (P !== b && e) {
                                var r = new Event("click", {
                                    bubbles: t
                                });
                                x.indeterminate = oa(b), e.call(x, !oa(b) && b), x.dispatchEvent(r)
                            }
                        }
                    }, [x, P, b, m]);
                    var A = _.useRef(!oa(b) && b);
                    return (0, N.jsx)(nV.input, nY(nZ({
                        type: "checkbox",
                        "aria-hidden": !0,
                        defaultChecked: null != h ? h : A.current,
                        required: v,
                        disabled: g,
                        name: O,
                        value: w,
                        form: j
                    }, f), {
                        tabIndex: -1,
                        ref: S,
                        style: nY(nZ({}, f.style, E), {
                            position: "absolute",
                            pointerEvents: "none",
                            opacity: 0,
                            margin: 0,
                            transform: "translateX(-100%)"
                        })
                    }))
                });

            function oa(e) {
                return "indeterminate" === e
            }

            function ou(e) {
                return oa(e) ? "indeterminate" : e ? "checked" : "unchecked"
            }
            oi.displayName = oo;
            var ol = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                oc = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                os = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                of = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                op = function(e) {
                    var t = e.label,
                        r = e.className,
                        n = e.isChecked,
                        o = e.isDisabled,
                        i = e.size,
                        a = e.hint,
                        u = e.placement,
                        l = e.onCheckedChange,
                        c = e.id,
                        s = function(e, t) {
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
                        }(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]),
                        f = nh(),
                        p = c || f,
                        d = t && L().createElement("label", {
                            htmlFor: p,
                            className: D("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
                        }, L().createElement("span", {
                            className: D(os[i], of [i], "content-emphasis")
                        }, t), a && L().createElement("span", {
                            className: "text-body-medium content-default"
                        }, a));
                    return L().createElement("div", {
                        className: D("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", r)
                    }, "End" === u && d, L().createElement("div", {
                        className: D(oc[i])
                    }, L().createElement(ot, function(e) {
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
                        "data-slot": "checkbox",
                        className: D(ol[i], rL, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: p,
                        checked: n,
                        disabled: o,
                        onCheckedChange: l,
                        "aria-label": t
                    }, s), L().createElement(rU, null), L().createElement(on, {
                        "data-slot": "checkbox-indicator",
                        className: D(ol[i], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === u && d)
                },
                od = function(e) {
                    var t = e.className,
                        r = e.children;
                    return (0, N.jsx)("div", {
                        className: t,
                        onClick: function(e) {
                            e.stopPropagation()
                        },
                        children: r
                    })
                };

            function oy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function om(e) {
                if (Array.isArray(e)) return e
            }

            function ob() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oh(e) {
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

            function ov(e, t) {
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

            function oO(e, t) {
                if (e) {
                    if ("string" == typeof e) return oy(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oy(e, t)
                }
            }
            var ow = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                oj = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                ox = {
                    Large: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Medium: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Small: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    XSmall: {
                        circular: "radius-circle",
                        square: "radius-small"
                    }
                },
                oS = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                oP = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                oE = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                oA = {
                    Default: {
                        Emphasis: "content-action-emphasis",
                        Standard: "content-action-standard",
                        Alert: "content-action-alert",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-emphasis",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-alert",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                ok = {
                    Default: {
                        Emphasis: "content-action-standard",
                        Standard: "content-action-standard",
                        Alert: "content-action-standard",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-standard",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-standard",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                oI = (0, _.forwardRef)(function(e, t) {
                    var r, n, o = om(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oO(r) || ob(),
                        i = o[0],
                        a = o.slice(1),
                        u = i.className,
                        l = i.icon,
                        c = i.ariaLabel,
                        s = i.isDisabled,
                        f = void 0 !== s && s,
                        p = i.isCircular,
                        d = i.isSelected,
                        y = i.size,
                        m = void 0 === y ? "Large" : y,
                        b = i.variant,
                        h = void 0 === b ? "Emphasis" : b,
                        v = i.iconColor,
                        g = void 0 === v ? "Default" : v,
                        O = i.asChild,
                        w = i.children,
                        j = og(i, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        x = (om(a) || function(e) {
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
                        }(a) || oO(a, 1) || ob())[0];
                    n = f ? oP[h] : void 0 !== d && d ? oE[h] : oS[h];
                    var S = D("foundation-web-icon-button", f ? rz : [rL, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", ow[m], ox[m][void 0 !== p && p ? "circular" : "square"], n, u),
                        P = L().createElement(L().Fragment, null, L().createElement(rU, null), L().createElement("span", {
                            className: D("icon", l, oj[m], f ? ok[g][h] : oA[g][h])
                        }));
                    if (O) {
                        j.as;
                        var E = og(j, ["as"]),
                            A = L().Children.only(w);
                        return L().createElement(r0, ov(oh({
                            ref: x
                        }, E), {
                            className: S,
                            "aria-label": c,
                            "aria-disabled": f || void 0
                        }), L().cloneElement(A, {}, P))
                    }
                    if ("a" === j.as) {
                        j.as;
                        var k = j.href,
                            I = og(j, ["as", "href"]);
                        return L().createElement("a", ov(oh({
                            ref: x
                        }, I), {
                            "aria-label": c,
                            "aria-disabled": f,
                            href: f ? void 0 : k,
                            className: S
                        }), P)
                    }
                    j.as;
                    var N = og(j, ["as"]);
                    return L().createElement("button", ov(oh({
                        ref: x,
                        type: "button"
                    }, N), {
                        "aria-label": c,
                        disabled: f,
                        className: S
                    }), P)
                }),
                oN = function(e) {
                    var t = e.translate,
                        r = e.currentPage,
                        n = e.totalPages,
                        o = e.onChangePage;
                    return n <= 1 ? null : (0, N.jsxs)("div", {
                        className: "flex items-center gap-xsmall justify-end",
                        children: [(0, N.jsx)(oI, {
                            icon: "icon-filled-chevron-large-left-to-line",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r <= 1,
                            ariaLabel: t("Action.FirstPage"),
                            onClick: function() {
                                o(1)
                            }
                        }), (0, N.jsx)(oI, {
                            icon: "icon-filled-chevron-large-left",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r <= 1,
                            ariaLabel: t("Action.Previous"),
                            onClick: function() {
                                o(r - 1)
                            }
                        }), (0, N.jsxs)("span", {
                            className: "text-body-large content-muted padding-x-small",
                            children: [r, " / ", n]
                        }), (0, N.jsx)(oI, {
                            icon: "icon-filled-chevron-large-right",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r >= n,
                            ariaLabel: t("Action.Next"),
                            onClick: function() {
                                o(r + 1)
                            }
                        }), (0, N.jsx)(oI, {
                            icon: "icon-filled-chevron-large-right-to-line",
                            variant: "Utility",
                            size: "Medium",
                            isDisabled: r >= n,
                            ariaLabel: t("Action.LastPage"),
                            onClick: function() {
                                o(n)
                            }
                        })]
                    })
                },
                oC = function(e) {
                    var t = e.translate,
                        r = e.activeTab,
                        n = e.moduleState,
                        o = e.selectedCount,
                        i = e.totalCount,
                        a = e.currentPage,
                        u = e.totalPages,
                        l = e.onToggleSelectAll,
                        c = e.onMarkArchive,
                        s = e.onMarkRead,
                        f = e.onBack,
                        p = e.onChangePage,
                        d = r === X,
                        y = r === H;
                    return r === V || r === $ ? n === G ? (0, N.jsx)("div", {
                        className: "flex justify-end margin-y-medium",
                        children: (0, N.jsx)(oN, {
                            translate: t,
                            currentPage: a,
                            totalPages: u,
                            onChangePage: p
                        })
                    }) : (0, N.jsx)("div", {
                        className: "margin-y-medium",
                        children: (0, N.jsx)(no, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: f,
                            children: t("Action.Back")
                        })
                    }) : n === Z ? (0, N.jsxs)("div", {
                        className: "flex items-center gap-small margin-y-medium",
                        children: [(0, N.jsx)(no, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: f,
                            children: t("Action.Back")
                        }), d ? (0, N.jsx)(no, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                c(!0)
                            },
                            children: t("Action.Archive")
                        }) : null, y ? (0, N.jsx)(no, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: function() {
                                c(!1)
                            },
                            children: t("Action.MoveToInbox")
                        }) : null]
                    }) : (0, N.jsxs)("div", {
                        className: "flex items-center justify-between gap-medium margin-y-medium wrap",
                        children: [(0, N.jsxs)("div", {
                            className: "flex items-center gap-small wrap",
                            children: [(0, N.jsx)(od, {
                                className: "padding-left-large",
                                children: (0, N.jsx)(op, {
                                    label: t("Label.All"),
                                    size: "Medium",
                                    placement: "Start",
                                    isChecked: i > 0 && o === i,
                                    onCheckedChange: l
                                })
                            }), (0, N.jsxs)("div", {
                                className: "private-message-action-buttons flex items-center gap-small wrap",
                                children: [d ? (0, N.jsx)(no, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        c(!0)
                                    },
                                    children: t("Action.Archive")
                                }) : null, y ? (0, N.jsx)(no, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        c(!1)
                                    },
                                    children: t("Action.MoveToInbox")
                                }) : null, (0, N.jsx)(no, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!0)
                                    },
                                    children: t("Action.MarkAsRead")
                                }), (0, N.jsx)(no, {
                                    variant: "Standard",
                                    size: "Medium",
                                    onClick: function() {
                                        s(!1)
                                    },
                                    children: t("Action.MarkAsUnread")
                                })]
                            })]
                        }), (0, N.jsx)(oN, {
                            translate: t,
                            currentPage: a,
                            totalPages: u,
                            onChangePage: p
                        })]
                    })
                };

            function oT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oR(e) {
                if (Array.isArray(e)) return e
            }

            function oM() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oD(e, t) {
                if (e) {
                    if ("string" == typeof e) return oT(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oT(e, t)
                }
            }
            var o_ = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                oL = L().forwardRef(function(e, t) {
                    var r, n = oR(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oD(r) || oM(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.name,
                        u = o.size,
                        l = o.className,
                        c = (o.children, function(e, t) {
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
                        s = (oR(i) || function(e) {
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
                        }(i) || oD(i, 1) || oM())[0];
                    return L().createElement("span", function(e) {
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
                        className: D("grow-0 shrink-0 basis-auto icon", a, o_[void 0 === u ? "Medium" : u], l)
                    }, c))
                });
            oL.displayName = "Icon";
            var oU = function(e) {
                    var t = e.titleText,
                        r = e.size,
                        n = void 0 === r ? "XSmall" : r,
                        o = e.className;
                    return (0, N.jsxs)("span", {
                        className: D("relative inline-flex items-center justify-center", o),
                        role: "img",
                        "aria-label": t,
                        title: t,
                        children: [(0, N.jsx)(oL, {
                            name: "icon-filled-verified-backplate",
                            className: "content-system-emphasis",
                            size: n
                        }), (0, N.jsx)(oL, {
                            name: "icon-filled-verified-check",
                            className: "absolute content-[white]",
                            size: n
                        })]
                    })
                },
                oz = r(611),
                oB = r.n(oz),
                oF = function(e) {
                    var t = e.className;
                    return (0, N.jsxs)("span", {
                        "aria-hidden": "true",
                        className: oB()("flex items-center justify-center", t),
                        children: [(0, N.jsx)("img", {
                            alt: "",
                            src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjMzkzYjNkIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+",
                            className: "dark:hidden",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        }), (0, N.jsx)("img", {
                            alt: "",
                            src: "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1NiIgaGVpZ2h0PSI1NiIgZmlsbD0ibm9uZSIgdmlld0JveD0iMCAwIDU2IDU2Ij48cGF0aCBmaWxsPSIjZmZmIiBkPSJNMTEuNjc2IDAgMCA0NC4xNjYgNDMuNTc3IDU2bDExLjY3Ni00NC4xNjZ6bTIwLjQwOSAzNS44MjctMTIuMTc3LTMuMzA4IDMuMjY0LTEyLjM0MiAxMi4xODIgMy4zMDh6Ii8+PC9zdmc+",
                            className: "hidden dark:block",
                            style: {
                                width: "100%",
                                height: "100%"
                            }
                        })]
                    })
                },
                oK = function(e) {
                    var t = e.message,
                        r = e.activeTab,
                        n = e.renderThumbnail,
                        o = r === V ? t.recipient : t.sender,
                        i = r !== V && 1 === t.sender.id;
                    return (0, N.jsx)("a", {
                        href: o.profileLink,
                        className: "size-800 shrink-0 flex items-center justify-center",
                        children: i ? (0, N.jsx)(oF, {
                            className: "size-800"
                        }) : (0, N.jsx)("span", {
                            className: "radius-circle clip size-800",
                            children: n({
                                userId: o.id,
                                altName: o.displayName
                            })
                        })
                    })
                },
                oW = function(e) {
                    var t = e.translate,
                        r = e.renderThumbnail,
                        n = e.formatDetailDate,
                        o = e.message,
                        i = e.activeTab;
                    if (!o) return null;
                    var a = i === V ? o.recipient : o.sender;
                    return (0, N.jsxs)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large",
                        children: [(0, N.jsxs)("div", {
                            className: "flex justify-between gap-medium",
                            children: [(0, N.jsxs)("div", {
                                className: "min-width-0",
                                children: [(0, N.jsx)("h2", {
                                    className: "text-heading-medium content-emphasis margin-none text-wrap",
                                    children: o.subject
                                }), (0, N.jsxs)("div", {
                                    className: "flex gap-small margin-top-medium",
                                    children: [(0, N.jsx)(oK, {
                                        message: o,
                                        activeTab: i,
                                        renderThumbnail: r
                                    }), (0, N.jsxs)("div", {
                                        className: "min-width-0 flex flex-col gap-y-small",
                                        children: [(0, N.jsxs)("a", {
                                            href: a.profileLink,
                                            className: "text-title-medium content-emphasis flex items-center gap-xsmall",
                                            children: [(0, N.jsx)("span", {
                                                children: a.displayName
                                            }), a.hasVerifiedBadge ? (0, N.jsx)(oU, {
                                                size: "Medium",
                                                titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                                            }) : null]
                                        }), (0, N.jsxs)("div", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", a.name]
                                        }), (0, N.jsx)("div", {
                                            className: "text-caption-medium content-muted",
                                            children: n(o.created)
                                        })]
                                    })]
                                })]
                            }), o.isReportAbuseDisplayed ? (0, N.jsx)("a", {
                                href: o.abuseReportUrl,
                                className: "text-body-medium content-muted text-no-wrap abuse-report-modal",
                                children: t("Action.ReportAbuse")
                            }) : null]
                        }), (0, N.jsx)("div", {
                            className: "private-message-body text-body-large content-default margin-top-large",
                            dangerouslySetInnerHTML: {
                                __html: o.body
                            }
                        })]
                    })
                },
                oq = function(e) {
                    var t = e.translate,
                        r = e.message,
                        n = e.activeTab === V ? r.recipient : r.sender;
                    return (0, N.jsxs)("span", {
                        className: "flex items-center gap-xsmall min-width-0",
                        children: [(0, N.jsx)("span", {
                            className: "text-truncate-end",
                            children: n.displayName
                        }), n.hasVerifiedBadge ? (0, N.jsx)(oU, {
                            size: "Medium",
                            titleText: t("Creator.VerifiedBadgeIconAccessibilityText")
                        }) : null, (0, N.jsxs)("span", {
                            className: "text-body-medium content-muted text-truncate-end",
                            children: ["@", n.name]
                        })]
                    })
                },
                oX = function(e) {
                    var t = e.message,
                        r = e.activeTab,
                        n = e.renderThumbnail,
                        o = e.onOpen,
                        i = r === V ? t.recipient : t.sender,
                        a = r !== V && 1 === t.sender.id;
                    return (0, N.jsx)("button", {
                        type: "button",
                        className: "private-message-row-avatar bg-none stroke-none padding-none width-full size-800 flex items-center justify-center",
                        onClick: o,
                        "aria-label": i.displayName,
                        children: a ? (0, N.jsx)(oF, {
                            className: "size-700"
                        }) : (0, N.jsx)("span", {
                            className: "radius-circle clip size-700",
                            children: n({
                                userId: i.id,
                                altName: i.displayName
                            })
                        })
                    })
                },
                oV = function(e) {
                    var t = e.translate,
                        r = e.renderThumbnail,
                        n = e.formatListDate,
                        o = e.message,
                        i = e.index,
                        a = e.activeTab,
                        u = e.isSelected,
                        l = e.isSelectable,
                        c = e.onToggleSelection,
                        s = e.onOpen,
                        f = function() {
                            s(o, i)
                        },
                        p = !o.isRead && a !== V;
                    return (0, N.jsxs)("div", {
                        className: oB()("private-message-row grid items-center gap-medium padding-large stroke-bottom stroke-muted transition-colors", p ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        children: [(0, N.jsx)(od, {
                            className: oB()(!l && "invisible"),
                            children: (0, N.jsx)(op, {
                                "aria-label": o.subject,
                                size: "Medium",
                                placement: "Start",
                                isChecked: u,
                                onCheckedChange: function() {
                                    c(o.id)
                                }
                            })
                        }), (0, N.jsx)(oX, {
                            message: o,
                            activeTab: a,
                            renderThumbnail: r,
                            onOpen: f
                        }), (0, N.jsxs)("button", {
                            type: "button",
                            className: "bg-none stroke-none padding-none text-left min-width-0 flex flex-col gap-y-small",
                            onClick: f,
                            "aria-label": o.subject,
                            children: [(0, N.jsxs)("div", {
                                className: "flex items-center justify-between gap-small min-width-0",
                                children: [(0, N.jsx)("span", {
                                    className: oB()("text-title-large min-width-0", p ? "content-emphasis" : "content-muted"),
                                    children: (0, N.jsx)(oq, {
                                        translate: t,
                                        message: o,
                                        activeTab: a
                                    })
                                }), (0, N.jsx)("span", {
                                    className: "text-caption-medium content-muted text-no-wrap",
                                    children: n(o.created)
                                })]
                            }), (0, N.jsxs)("div", {
                                className: "private-message-row-preview text-body-large content-muted",
                                children: [(0, N.jsx)("span", {
                                    className: p ? "content-emphasis" : "content-muted",
                                    children: o.subject
                                }), (0, N.jsxs)("span", {
                                    children: [" - ", es(o.body)]
                                })]
                            })]
                        })]
                    })
                };

            function o$(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var oH = (o$(I = {}, X, "Label.NoMessagesInInbox"), o$(I, V, "Label.NoSentMessages"), o$(I, $, "Message.NoNews"), o$(I, H, "Label.NoMessagesInArchive"), I),
                oG = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        i = e.page,
                        a = e.activeTab,
                        u = e.selectedMessageIds,
                        l = e.onToggleSelection,
                        c = e.onOpenMessage,
                        s = null != (t = null == i ? void 0 : i.collection) ? t : [];
                    return 0 === s.length ? (0, N.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r(oH[a])
                    }) : (0, N.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: s.map(function(e, t) {
                            return (0, N.jsx)(oV, {
                                translate: r,
                                renderThumbnail: n,
                                formatListDate: o,
                                message: e,
                                index: t,
                                activeTab: a,
                                isSelected: u.has(e.id),
                                isSelectable: a !== V && a !== $,
                                onToggleSelection: l,
                                onOpen: c
                            }, e.id)
                        })
                    })
                };

            function oZ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oY = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        i = e.notification,
                        a = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, _.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return oZ(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oZ(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        u = a[0],
                        l = a[1],
                        c = 1 === i.sender.id;
                    return (0, N.jsx)("button", {
                        type: "button",
                        className: oB()("width-full stroke-none stroke-bottom stroke-muted padding-medium text-left transition-colors", u ? "bg-surface-200 hover:bg-surface-300" : "bg-surface-100 hover:bg-surface-300"),
                        onClick: function() {
                            l(function(e) {
                                return !e
                            })
                        },
                        "aria-expanded": u,
                        "aria-label": i.subject,
                        children: (0, N.jsxs)("div", {
                            className: "flex gap-small",
                            children: [(0, N.jsx)("span", {
                                className: "size-700 shrink-0 flex items-center justify-center",
                                children: c ? (0, N.jsx)(oF, {
                                    className: "size-700"
                                }) : (0, N.jsx)("span", {
                                    className: "radius-circle clip size-700",
                                    children: n({
                                        userId: i.sender.id,
                                        altName: i.sender.displayName
                                    })
                                })
                            }), (0, N.jsxs)("span", {
                                className: "min-width-0 fill flex flex-col gap-y-small",
                                children: [(0, N.jsxs)("span", {
                                    className: "flex justify-between gap-small",
                                    children: [(0, N.jsxs)("span", {
                                        className: "text-title-medium content-emphasis flex items-center gap-xsmall min-width-0",
                                        children: [(0, N.jsx)("span", {
                                            className: "text-truncate-end",
                                            children: i.sender.displayName
                                        }), i.sender.hasVerifiedBadge ? (0, N.jsx)(oU, {
                                            size: "Medium",
                                            titleText: r("Creator.VerifiedBadgeIconAccessibilityText")
                                        }) : null, (0, N.jsxs)("span", {
                                            className: "text-body-medium content-muted",
                                            children: ["@", i.sender.name]
                                        })]
                                    }), (0, N.jsx)("span", {
                                        className: "text-caption-medium content-muted text-no-wrap",
                                        children: o(i.created)
                                    })]
                                }), (0, N.jsx)("span", {
                                    className: "private-message-row-preview text-body-large content-default",
                                    children: i.subject
                                }), u ? (0, N.jsx)("span", {
                                    className: "private-message-body block text-body-medium content-default margin-top-medium",
                                    dangerouslySetInnerHTML: {
                                        __html: i.body
                                    }
                                }) : null]
                            })]
                        })
                    })
                },
                oJ = function(e) {
                    var t, r = e.translate,
                        n = e.renderThumbnail,
                        o = e.formatListDate,
                        i = e.page,
                        a = null != (t = null == i ? void 0 : i.collection) ? t : [];
                    return 0 === a.length ? (0, N.jsx)("div", {
                        className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-medium content-muted text-center",
                        children: r("Message.NoNews")
                    }) : (0, N.jsx)("div", {
                        className: "overflow-hidden radius-medium stroke-standard stroke-muted",
                        children: a.map(function(e) {
                            return (0, N.jsx)(oY, {
                                translate: r,
                                renderThumbnail: n,
                                formatListDate: o,
                                notification: e
                            }, e.id)
                        })
                    })
                };

            function oQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o0(e, t, r) {
                return (o0 = o4() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && o3(o, r.prototype), o
                }).apply(null, arguments)
            }

            function o1(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function o2(e) {
                return (o2 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function o8(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        o1(e, t, r[t])
                    })
                }
                return e
            }

            function o3(e, t) {
                return (o3 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function o5(e, t) {
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
                        if ("string" == typeof e) return oQ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oQ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function o6(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (o6 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return o0(e, arguments, o2(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), o3(r, e)
                })(e)
            }

            function o4() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (o4 = function() {
                    return !!e
                })()
            }

            function o7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            o6(Map);
            var o9 = _[" useId ".trim().toString()] || function() {},
                ie = 0;

            function it(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = _.useState(o9())) || function(e) {
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
                            if ("string" == typeof e) return o7(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o7(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return nP(function() {
                    e || o(function(e) {
                        return null != e ? e : String(ie++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function ir(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var io = _.createContext(void 0);

            function ii(e) {
                var t = _.useContext(io);
                return e || t || "ltr"
            }

            function ia(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iu(e) {
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

            function il(e, t) {
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

            function ic(e, t) {
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

            function is(e, t) {
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
                }(e, t) || ip(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ip(e, t) {
                if (e) {
                    if ("string" == typeof e) return ia(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ia(e, t)
                }
            }
            var id = "rovingFocusGroup.onEntryFocus",
                iy = {
                    bubbles: !1,
                    cancelable: !0
                },
                im = "RovingFocusGroup",
                ib = is((y = (d = o5(nj(p = im + "CollectionProvider"), 2))[0], m = d[1], h = (b = o5(y(p, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], v = b[1], (g = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = L().useRef(null),
                        o = L().useRef(new Map).current;
                    return (0, N.jsx)(h, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = p, w = nB(O = im + "CollectionSlot"), (j = L().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = rq(t, v(O, r).collectionRef);
                    return (0, N.jsx)(w, {
                        ref: o,
                        children: n
                    })
                })).displayName = O, S = "data-radix-collection-item", P = nB(x = im + "CollectionItemSlot"), (E = L().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        i = e.children,
                        a = function(e, t) {
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
                        }(e, ["scope", "children"]),
                        u = L().useRef(null),
                        l = rq(t, u),
                        c = v(x, o);
                    return L().useEffect(function() {
                        return c.itemMap.set(u, o8({
                                ref: u
                            }, a)),
                            function() {
                                c.itemMap.delete(u)
                            }
                    }), (0, N.jsx)(P, (r = o8({}, o1({}, S, "")), n = n = {
                        ref: l,
                        children: i
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
                })).displayName = x, [{
                    Provider: g,
                    Slot: j,
                    ItemSlot: E
                }, function(e) {
                    var t = v(im + "CollectionConsumer", e);
                    return L().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(S, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, m]), 3),
                ih = ib[0],
                iv = ib[1],
                ig = is(nj(im, [ib[2]]), 2),
                iO = ig[0],
                iw = ig[1],
                ij = is(iO(im), 2),
                ix = ij[0],
                iS = ij[1],
                iP = _.forwardRef(function(e, t) {
                    return (0, N.jsx)(ih.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, N.jsx)(ih.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, N.jsx)(iE, il(iu({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            iP.displayName = im;
            var iE = _.forwardRef(function(e, t) {
                    var r, n = e.__scopeRovingFocusGroup,
                        o = e.orientation,
                        i = e.loop,
                        a = e.dir,
                        u = e.currentTabStopId,
                        l = e.defaultCurrentTabStopId,
                        c = e.onCurrentTabStopIdChange,
                        s = e.onEntryFocus,
                        f = e.preventScrollOnEntryFocus,
                        p = void 0 !== f && f,
                        d = ic(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        y = _.useRef(null),
                        m = rq(t, y),
                        b = ii(a),
                        h = is(nI({
                            prop: u,
                            defaultProp: null != l ? l : null,
                            onChange: c,
                            caller: im
                        }), 2),
                        v = h[0],
                        g = h[1],
                        O = is(_.useState(!1), 2),
                        w = O[0],
                        j = O[1],
                        x = (r = _.useRef(s), _.useEffect(function() {
                            r.current = s
                        }), _.useMemo(function() {
                            return function() {
                                for (var e, t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
                                return null == (e = r.current) ? void 0 : e.call.apply(e, [r].concat(function(e) {
                                    if (Array.isArray(e)) return ir(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return ir(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ir(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }, [])),
                        S = iv(n),
                        P = _.useRef(!1),
                        E = is(_.useState(0), 2),
                        A = E[0],
                        k = E[1];
                    return _.useEffect(function() {
                        var e = y.current;
                        if (e) return e.addEventListener(id, x),
                            function() {
                                return e.removeEventListener(id, x)
                            }
                    }, [x]), (0, N.jsx)(ix, {
                        scope: n,
                        orientation: o,
                        dir: b,
                        loop: void 0 !== i && i,
                        currentTabStopId: v,
                        onItemFocus: _.useCallback(function(e) {
                            return g(e)
                        }, [g]),
                        onItemShiftTab: _.useCallback(function() {
                            return j(!0)
                        }, []),
                        onFocusableItemAdd: _.useCallback(function() {
                            return k(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: _.useCallback(function() {
                            return k(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, N.jsx)(nV.div, il(iu({
                            tabIndex: w || 0 === A ? -1 : 0,
                            "data-orientation": o
                        }, d), {
                            ref: m,
                            style: iu({
                                outline: "none"
                            }, e.style),
                            onMouseDown: nS(e.onMouseDown, function() {
                                P.current = !0
                            }),
                            onFocus: nS(e.onFocus, function(e) {
                                var t = !P.current;
                                if (e.target === e.currentTarget && t && !w) {
                                    var r = new CustomEvent(id, iy);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = S().filter(function(e) {
                                            return e.focusable
                                        });
                                        iN([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === v
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return ia(e)
                                        }(n) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || ip(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), p)
                                    }
                                }
                                P.current = !1
                            }),
                            onBlur: nS(e.onBlur, function() {
                                return j(!1)
                            })
                        }))
                    })
                }),
                iA = "RovingFocusGroupItem",
                ik = _.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        i = e.active,
                        a = e.tabStopId,
                        u = e.children,
                        l = ic(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        c = it(),
                        s = a || c,
                        f = iS(iA, r),
                        p = f.currentTabStopId === s,
                        d = iv(r),
                        y = f.onFocusableItemAdd,
                        m = f.onFocusableItemRemove,
                        b = f.currentTabStopId;
                    return _.useEffect(function() {
                        if (o) return y(),
                            function() {
                                return m()
                            }
                    }, [o, y, m]), (0, N.jsx)(ih.ItemSlot, {
                        scope: r,
                        id: s,
                        focusable: o,
                        active: void 0 !== i && i,
                        children: (0, N.jsx)(nV.span, il(iu({
                            tabIndex: p ? 0 : -1,
                            "data-orientation": f.orientation
                        }, l), {
                            ref: t,
                            onMouseDown: nS(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(s) : e.preventDefault()
                            }),
                            onFocus: nS(e.onFocus, function() {
                                return f.onItemFocus(s)
                            }),
                            onKeyDown: nS(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return iI[o]
                                    }(e, f.orientation, f.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var r = d().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) r.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && r.reverse();
                                            var n, o, i = r.indexOf(e.currentTarget);
                                            r = f.loop ? (n = r, o = i + 1, n.map(function(e, t) {
                                                return n[(o + t) % n.length]
                                            })) : r.slice(i + 1)
                                        }
                                        setTimeout(function() {
                                            return iN(r)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof u ? u({
                                isCurrentTabStop: p,
                                hasTabStop: null != b
                            }) : u
                        }))
                    })
                });
            ik.displayName = iA;
            var iI = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function iN(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    n = !0,
                    o = !1,
                    i = void 0;
                try {
                    for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done); n = !0) {
                        var l = a.value;
                        if (l === r || (l.focus({
                                preventScroll: t
                            }), document.activeElement !== r)) return
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
            }

            function iC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iT(e) {
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

            function iR(e, t) {
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

            function iM(e, t) {
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

            function iD(e, t) {
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
                        if ("string" == typeof e) return iC(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iC(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var i_ = "Tabs",
                iL = iD(nj(i_, [iw]), 2),
                iU = iL[0];
            iL[1];
            var iz = iw(),
                iB = iD(iU(i_), 2),
                iF = iB[0],
                iK = iB[1],
                iW = _.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.onValueChange,
                        i = e.defaultValue,
                        a = e.orientation,
                        u = void 0 === a ? "horizontal" : a,
                        l = e.dir,
                        c = e.activationMode,
                        s = iM(e, ["__scopeTabs", "value", "onValueChange", "defaultValue", "orientation", "dir", "activationMode"]),
                        f = ii(l),
                        p = iD(nI({
                            prop: n,
                            onChange: o,
                            defaultProp: null != i ? i : "",
                            caller: i_
                        }), 2),
                        d = p[0],
                        y = p[1];
                    return (0, N.jsx)(iF, {
                        scope: r,
                        baseId: it(),
                        value: d,
                        onValueChange: y,
                        orientation: u,
                        dir: f,
                        activationMode: void 0 === c ? "automatic" : c,
                        children: (0, N.jsx)(nV.div, iR(iT({
                            dir: f,
                            "data-orientation": u
                        }, s), {
                            ref: t
                        }))
                    })
                });
            iW.displayName = i_;
            var iq = "TabsList",
                iX = _.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.loop,
                        o = iM(e, ["__scopeTabs", "loop"]),
                        i = iK(iq, r),
                        a = iz(r);
                    return (0, N.jsx)(iP, iR(iT({
                        asChild: !0
                    }, a), {
                        orientation: i.orientation,
                        dir: i.dir,
                        loop: void 0 === n || n,
                        children: (0, N.jsx)(nV.div, iR(iT({
                            role: "tablist",
                            "aria-orientation": i.orientation
                        }, o), {
                            ref: t
                        }))
                    }))
                });
            iX.displayName = iq;
            var iV = "TabsTrigger",
                i$ = _.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.disabled,
                        i = void 0 !== o && o,
                        a = iM(e, ["__scopeTabs", "value", "disabled"]),
                        u = iK(iV, r),
                        l = iz(r),
                        c = iZ(u.baseId, n),
                        s = iY(u.baseId, n),
                        f = n === u.value;
                    return (0, N.jsx)(ik, iR(iT({
                        asChild: !0
                    }, l), {
                        focusable: !i,
                        active: f,
                        children: (0, N.jsx)(nV.button, iR(iT({
                            type: "button",
                            role: "tab",
                            "aria-selected": f,
                            "aria-controls": s,
                            "data-state": f ? "active" : "inactive",
                            "data-disabled": i ? "" : void 0,
                            disabled: i,
                            id: c
                        }, a), {
                            ref: t,
                            onMouseDown: nS(e.onMouseDown, function(e) {
                                i || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : u.onValueChange(n)
                            }),
                            onKeyDown: nS(e.onKeyDown, function(e) {
                                [" ", "Enter"].includes(e.key) && u.onValueChange(n)
                            }),
                            onFocus: nS(e.onFocus, function() {
                                var e = "manual" !== u.activationMode;
                                f || i || !e || u.onValueChange(n)
                            })
                        }))
                    }))
                });
            i$.displayName = iV;
            var iH = "TabsContent",
                iG = _.forwardRef(function(e, t) {
                    var r = e.__scopeTabs,
                        n = e.value,
                        o = e.forceMount,
                        i = e.children,
                        a = iM(e, ["__scopeTabs", "value", "forceMount", "children"]),
                        u = iK(iH, r),
                        l = iZ(u.baseId, n),
                        c = iY(u.baseId, n),
                        s = n === u.value,
                        f = _.useRef(s);
                    return _.useEffect(function() {
                        var e = requestAnimationFrame(function() {
                            return f.current = !1
                        });
                        return function() {
                            return cancelAnimationFrame(e)
                        }
                    }, []), (0, N.jsx)(nR, {
                        present: o || s,
                        children: function(r) {
                            var n = r.present;
                            return (0, N.jsx)(nV.div, iR(iT({
                                "data-state": s ? "active" : "inactive",
                                "data-orientation": u.orientation,
                                role: "tabpanel",
                                "aria-labelledby": l,
                                hidden: !n,
                                id: c,
                                tabIndex: 0
                            }, a), {
                                ref: t,
                                style: iR(iT({}, e.style), {
                                    animationDuration: f.current ? "0s" : void 0
                                }),
                                children: n && i
                            }))
                        }
                    })
                });

            function iZ(e, t) {
                return "".concat(e, "-trigger-").concat(t)
            }

            function iY(e, t) {
                return "".concat(e, "-content-").concat(t)
            }

            function iJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iQ(e) {
                if (Array.isArray(e)) return e
            }

            function i0() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
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

            function i8(e, t) {
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

            function i3(e, t) {
                return iQ(e) || function(e, t) {
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
                }(e, t) || i6(e, t) || i0()
            }

            function i5(e) {
                return iQ(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || i6(e) || i0()
            }

            function i6(e, t) {
                if (e) {
                    if ("string" == typeof e) return iJ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iJ(e, t)
                }
            }
            iG.displayName = iH;
            var i4 = (0, _.createContext)({
                    size: "Medium",
                    variant: "Contained",
                    fitBehavior: "Fill"
                }),
                i7 = {
                    XSmall: ["text-label-small", "height-700"],
                    Small: ["text-label-small", "height-800"],
                    Medium: ["text-label-medium", "height-1000"],
                    Large: ["text-label-medium", "height-1200"]
                },
                i9 = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-small",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                ae = {
                    XSmall: {
                        Inlined: "",
                        Contained: "padding-top-small"
                    },
                    Small: {
                        Inlined: "",
                        Contained: "padding-top-small"
                    },
                    Medium: {
                        Inlined: "padding-top-xsmall",
                        Contained: "padding-top-medium"
                    },
                    Large: {
                        Inlined: "padding-top-xsmall",
                        Contained: "padding-top-xlarge"
                    }
                },
                at = {
                    XSmall: "padding-bottom-small",
                    Small: "padding-bottom-small",
                    Medium: "padding-bottom-medium",
                    Large: "padding-bottom-xlarge"
                },
                ar = (0, _.forwardRef)(function(e, t) {
                    var r = i5([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        i = n.children,
                        a = n.className,
                        u = n.size,
                        l = n.variant,
                        c = n.fitBehavior,
                        s = i8(n, ["children", "className", "size", "variant", "fitBehavior"]),
                        f = i3(o, 1)[0],
                        p = (0, _.useMemo)(function() {
                            return {
                                size: u || "Large",
                                variant: l || "Contained",
                                fitBehavior: c || "Fill"
                            }
                        }, [u, l, c]);
                    return L().createElement(i4.Provider, {
                        value: p
                    }, L().createElement(iW, i2(i1({
                        ref: f
                    }, s), {
                        className: D("foundation-web-tabs", "flex flex-col", a)
                    }), i))
                }),
                an = (0, _.forwardRef)(function(e, t) {
                    var r = i5([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        i = n.children,
                        a = n.className,
                        u = i8(n, ["children", "className"]),
                        l = i3(o, 1)[0],
                        c = (0, _.useContext)(i4).fitBehavior,
                        s = (0, _.useRef)(null),
                        f = i3((0, _.useState)({
                            width: 0,
                            left: 0,
                            opacity: 0
                        }), 2),
                        p = f[0],
                        d = f[1],
                        y = L().useCallback(function(e) {
                            s.current = e, "function" == typeof l ? l(e) : l && "current" in l && (l.current = e)
                        }, [l]);
                    return (0, _.useEffect)(function() {
                        var e, t = function() {
                            var e = s.current;
                            if (e) {
                                var t = e.querySelector('[data-state="active"]');
                                if (t) {
                                    var r = e.getBoundingClientRect(),
                                        n = t.getBoundingClientRect();
                                    d({
                                        width: n.width,
                                        left: n.left - r.left,
                                        opacity: 1
                                    })
                                }
                            }
                        };
                        t();
                        var r = new MutationObserver(function() {
                                cancelAnimationFrame(e), e = requestAnimationFrame(t)
                            }),
                            n = "u" > typeof ResizeObserver ? new ResizeObserver(t) : null,
                            o = s.current;
                        return o && (r.observe(o, {
                                subtree: !0,
                                attributes: !0,
                                attributeFilter: ["data-state"]
                            }), null == n || n.observe(o)), window.addEventListener("resize", t),
                            function() {
                                cancelAnimationFrame(e), r.disconnect(), null == n || n.disconnect(), window.removeEventListener("resize", t)
                            }
                    }, [i]), L().createElement("div", {
                        className: D("relative scroll-x", a),
                        style: {
                            scrollbarWidth: "none",
                            msOverflowStyle: "none"
                        }
                    }, L().createElement(iX, i2(i1({
                        ref: y
                    }, u), {
                        className: D("flex items-stretch bg-none border-0 stroke-none")
                    }), i), "Fit" === c && L().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute bottom-[0px] left-[0px] right-[0px] height-[var(--stroke-thick)] bg-[var(--color-stroke-muted)] [z-index:0]"
                    }), L().createElement("div", {
                        className: "absolute bottom-[0px] bg-system-contrast transition-all duration-200 ease-standard-out",
                        style: {
                            height: "var(--stroke-thick)",
                            zIndex: 1,
                            width: "".concat(p.width, "px"),
                            left: "".concat(p.left, "px"),
                            opacity: p.opacity
                        }
                    }))
                }),
                ao = (0, _.forwardRef)(function(e, t) {
                    var r = i5([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        i = n.children,
                        a = n.className,
                        u = n.isDisabled,
                        l = void 0 !== u && u,
                        c = i8(n, ["children", "className", "isDisabled"]),
                        s = i3(o, 1)[0],
                        f = (0, _.useContext)(i4),
                        p = f.size,
                        d = f.variant,
                        y = f.fitBehavior;
                    return L().createElement(i$, i2(i1({
                        ref: s
                    }, c), {
                        disabled: l,
                        style: {
                            borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                            borderTop: "none",
                            borderLeft: "none",
                            borderRight: "none"
                        },
                        className: D("relative flex items-center justify-center cursor-pointer bg-none shrink-0", rL, i7[p], "Fill" === y ? "grow-1 ".concat(i9[p]) : "", ae[p][d], at[p], l && "opacity-[0.5]", a)
                    }), L().createElement(rU, null), L().createElement("div", {
                        className: "flex items-center justify-center height-600 relative"
                    }, i))
                });

            function ai(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aa(e) {
                if (Array.isArray(e)) return e
            }

            function au() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function al(e, t) {
                if (e) {
                    if ("string" == typeof e) return ai(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ai(e, t)
                }
            }(0, _.forwardRef)(function(e, t) {
                var r = i5([e, t]),
                    n = r[0],
                    o = r.slice(1),
                    i = n.children,
                    a = n.className,
                    u = i8(n, ["children", "className"]),
                    l = i3(o, 1)[0];
                return L().createElement(iG, i2(i1({
                    ref: l
                }, u), {
                    className: D("padding-top-large", "outline-none", a)
                }), i)
            });
            var ac = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                as = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                af = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                ap = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                ad = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                ay = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                am = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                ab = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                ah = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                av = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                ag = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                aO = L().forwardRef(function(e, t) {
                    var r, n, o, i = aa(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || al(r) || au(),
                        a = i[0],
                        u = i.slice(1),
                        l = a.className,
                        c = a.label,
                        s = a.variant,
                        f = void 0 === s ? "Standard" : s,
                        p = a.icon,
                        d = a.iconPosition,
                        y = void 0 === d ? "Leading" : d,
                        m = a.size,
                        b = void 0 === m ? "Small" : m,
                        h = a.shape,
                        v = function(e, t) {
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
                        }(a, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        g = (aa(u) || function(e) {
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
                        }(u) || al(u, 1) || au())[0],
                        O = p && !c,
                        w = "padding-x-xxsmall";
                    p && (w = "Leading" === y ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var j = p && L().createElement(r_, {
                        name: p,
                        size: av[b],
                        className: af[f]
                    });
                    return L().createElement("div", (n = function(e) {
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
                        ref: g
                    }, v), o = o = {
                        className: D("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", ag[void 0 === h ? "Pill" : h], ad[b], O ? [am[b], "justify-center"] : ["width-[fit-content]", ay[b]], ac[f], as[f], ap[f], l)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n), "Leading" === y && j, c && L().createElement("span", {
                        className: D("text-no-wrap text-truncate-split", ab[b], ah[b], w, as[f])
                    }, c), "Trailing" === y && j)
                });
            aO.displayName = "Badge";
            var aw = function(e) {
                    var t = e.activeTab,
                        r = e.tabs,
                        n = e.onSelectTab;
                    return (0, N.jsx)(ar, {
                        value: t,
                        variant: "Contained",
                        size: "Large",
                        fitBehavior: "Fill",
                        className: "radius-none overflow-hidden",
                        onValueChange: function(e) {
                            var t = r.find(function(t) {
                                return t.name === e
                            });
                            t && n(t.name)
                        },
                        children: (0, N.jsx)(an, {
                            children: r.map(function(e) {
                                return (0, N.jsx)(ao, {
                                    value: e.name,
                                    children: (0, N.jsxs)("span", {
                                        className: "flex items-center justify-center gap-small",
                                        children: [(0, N.jsx)("span", {
                                            children: e.label
                                        }), e.count ? (0, N.jsx)(aO, {
                                            label: String(e.count),
                                            variant: "Contrast"
                                        }) : null]
                                    })
                                }, e.name)
                            })
                        })
                    })
                },
                aj = function(e) {
                    var t, r, n, o, i, a = e.translate,
                        u = e.renderThumbnail,
                        l = e.formatListDate,
                        c = e.formatDetailDate,
                        s = rN({
                            translate: a
                        }),
                        f = (null == (n = (0, q.getDeviceMeta)()) ? void 0 : n.isInApp) === !0,
                        p = s.page ? s.page.pageNumber + 1 : s.route.page,
                        d = null != (t = null == (o = s.page) ? void 0 : o.totalPages) ? t : 1,
                        y = null != (r = null == (i = s.page) ? void 0 : i.collection.length) ? r : 0;
                    return (0, N.jsxs)("main", {
                        className: "private-message-page margin-x-auto padding-medium",
                        children: [f ? null : (0, N.jsx)("h1", {
                            className: "text-heading-large content-emphasis margin-top-none margin-bottom-medium",
                            children: a("Heading.Message")
                        }), (0, N.jsx)(aw, {
                            activeTab: s.route.tab,
                            tabs: s.tabs,
                            onSelectTab: s.openTab
                        }), (0, N.jsx)(oC, {
                            translate: a,
                            activeTab: s.route.tab,
                            moduleState: s.moduleState,
                            selectedCount: s.selectedMessageIds.size,
                            totalCount: y,
                            currentPage: p,
                            totalPages: d,
                            onToggleSelectAll: s.toggleSelectAll,
                            onMarkArchive: function(e) {
                                s.markArchive(e)
                            },
                            onMarkRead: function(e) {
                                s.markRead(e)
                            },
                            onBack: s.backToList,
                            onChangePage: s.changePage
                        }), s.loading ? (0, N.jsx)("div", {
                            className: "flex justify-center padding-xxlarge",
                            children: (0, N.jsx)(W, {
                                ariaLabel: a("Label.Loading"),
                                variant: "Indeterminate",
                                size: "Medium"
                            })
                        }) : null, !s.loading && s.error ? (0, N.jsx)("div", {
                            className: "bg-surface-100 stroke-standard stroke-muted radius-medium padding-large text-body-large content-system-alert",
                            children: s.error
                        }) : null, s.loading || s.error || s.moduleState !== G ? null : s.route.tab === $ ? (0, N.jsx)(oJ, {
                            translate: a,
                            renderThumbnail: u,
                            formatListDate: l,
                            page: s.page
                        }) : (0, N.jsx)(oG, {
                            translate: a,
                            renderThumbnail: u,
                            formatListDate: l,
                            page: s.page,
                            activeTab: s.route.tab,
                            selectedMessageIds: s.selectedMessageIds,
                            onToggleSelection: s.toggleMessageSelection,
                            onOpenMessage: function(e, t) {
                                s.openMessage(e, t)
                            }
                        }), s.loading || s.error || s.moduleState !== Z ? null : (0, N.jsx)(oW, {
                            translate: a,
                            renderThumbnail: u,
                            formatDetailDate: c,
                            message: s.selectedMessage,
                            activeTab: s.route.tab
                        }), (0, N.jsx)(nm, {
                            feedback: s.feedback,
                            onClose: s.dismissFeedback
                        })]
                    })
                },
                ax = JSON.parse('{"P":["Feature.Messages","Feature.ProfileBadges"]}'),
                aS = function(e) {
                    var t = e.userId,
                        r = e.altName;
                    return (0, N.jsx)(M.Thumbnail2d, {
                        targetId: t,
                        type: M.ThumbnailTypes.avatarHeadshot,
                        altName: r
                    })
                },
                aP = function() {
                    var e = (0, R.useTranslation)().translate;
                    return (0, N.jsx)(aj, {
                        translate: e,
                        renderThumbnail: aS,
                        formatListDate: ep,
                        formatDetailDate: ed
                    })
                },
                aE = function() {
                    var e;
                    return null != (e = document.getElementById("private-message")) ? e : document.getElementById("private-message-web-app")
                };
            T()(function() {
                var e = aE();
                e && ("private-message-web-app" === e.id && e.classList.add("messages-container"), (0, R.renderWithErrorBoundary)((0, N.jsx)(R.TranslationProvider, {
                    config: ax.P,
                    children: (0, N.jsx)(aP, {})
                }), e))
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PrivateMessage");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/privateMessage-5ecfee394e7468a8.js.map