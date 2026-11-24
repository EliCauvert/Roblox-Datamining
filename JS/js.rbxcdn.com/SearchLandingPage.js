! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "4a89f82863d778a5359ca3a220ca956c789f29a4"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "16d13cec-4b73-4fa7-a9ad-245a3a40b343", e._sentryDebugIdIdentifier = "sentry-dbid-16d13cec-4b73-4fa7-a9ad-245a3a40b343")
    } catch (e) {}
}(),
function() {
    var e = {
            784: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
                }
                n.r(t), n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            844: function(e, t, n) {
                "use strict";

                function r(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                n.r(t), n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            742: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = l(e),
                        n = t[0],
                        r = t[1];
                    return (n + r) * 3 / 4 - r
                }, t.toByteArray = function(e) {
                    var t, n, i = l(e),
                        a = i[0],
                        s = i[1],
                        u = new o((a + s) * 3 / 4 - s),
                        c = 0,
                        d = s > 0 ? a - 4 : a;
                    for (n = 0; n < d; n += 4) t = r[e.charCodeAt(n)] << 18 | r[e.charCodeAt(n + 1)] << 12 | r[e.charCodeAt(n + 2)] << 6 | r[e.charCodeAt(n + 3)], u[c++] = t >> 16 & 255, u[c++] = t >> 8 & 255, u[c++] = 255 & t;
                    return 2 === s && (t = r[e.charCodeAt(n)] << 2 | r[e.charCodeAt(n + 1)] >> 4, u[c++] = 255 & t), 1 === s && (t = r[e.charCodeAt(n)] << 10 | r[e.charCodeAt(n + 1)] << 4 | r[e.charCodeAt(n + 2)] >> 2, u[c++] = t >> 8 & 255, u[c++] = 255 & t), u
                }, t.fromByteArray = function(e) {
                    for (var t, r = e.length, o = r % 3, i = [], a = 0, s = r - o; a < s; a += 16383) i.push(function(e, t, r) {
                        for (var o, i = [], a = t; a < r; a += 3) o = (e[a] << 16 & 0xff0000) + (e[a + 1] << 8 & 65280) + (255 & e[a + 2]), i.push(n[o >> 18 & 63] + n[o >> 12 & 63] + n[o >> 6 & 63] + n[63 & o]);
                        return i.join("")
                    }(e, a, a + 16383 > s ? s : a + 16383));
                    return 1 === o ? i.push(n[(t = e[r - 1]) >> 2] + n[t << 4 & 63] + "==") : 2 === o && i.push(n[(t = (e[r - 2] << 8) + e[r - 1]) >> 10] + n[t >> 4 & 63] + n[t << 2 & 63] + "="), i.join("")
                };
                for (var n = [], r = [], o = "u" > typeof Uint8Array ? Uint8Array : Array, i = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", a = 0, s = i.length; a < s; ++a) n[a] = i[a], r[i.charCodeAt(a)] = a;

                function l(e) {
                    var t = e.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var n = e.indexOf("="); - 1 === n && (n = t);
                    var r = n === t ? 0 : 4 - n % 4;
                    return [n, r]
                }
                r[45] = 62, r[95] = 63
            },
            564: function(e, t, n) {
                "use strict";
                /*!
                 * The buffer module from node.js, for the browser.
                 *
                 * @author   Feross Aboukhadijeh <https://feross.org>
                 * @license  MIT
                 */
                var r = n(784),
                    o = n(844),
                    i = n(742),
                    a = n(619),
                    s = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function l(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, u.prototype), t
                }

                function u(e, t, n) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return f(e)
                    }
                    return c(e, t, n)
                }

                function c(e, t, n) {
                    if ("string" == typeof e) {
                        var r = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !u.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var a = 0 | m(r, i),
                            s = l(a),
                            c = s.write(r, i);
                        return c !== a && (s = s.slice(0, c)), s
                    }
                    if (ArrayBuffer.isView(e)) {
                        var d = e;
                        if (R(d, Uint8Array)) {
                            var f = new Uint8Array(d);
                            return p(f.buffer, f.byteOffset, f.byteLength)
                        }
                        return h(d)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : o._(e)));
                    if (R(e, ArrayBuffer) || e && R(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (R(e, SharedArrayBuffer) || e && R(e.buffer, SharedArrayBuffer))) return p(e, t, n);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var g = e.valueOf && e.valueOf();
                    if (null != g && g !== e) return u.from(g, t, n);
                    var y = function(e) {
                        if (u.isBuffer(e)) {
                            var t = 0 | v(e.length),
                                n = l(t);
                            return 0 === n.length || e.copy(n, 0, 0, t), n
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? l(0) : h(e) : "Buffer" === e.type && Array.isArray(e.data) ? h(e.data) : void 0
                    }(e);
                    if (y) return y;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return u.from(e[Symbol.toPrimitive]("string"), t, n);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : o._(e)))
                }

                function d(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return d(e), l(e < 0 ? 0 : 0 | v(e))
                }

                function h(e) {
                    for (var t = e.length < 0 ? 0 : 0 | v(e.length), n = l(t), r = 0; r < t; r += 1) n[r] = 255 & e[r];
                    return n
                }

                function p(e, t, n) {
                    var r;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (n || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(r = void 0 === t && void 0 === n ? new Uint8Array(e) : void 0 === n ? new Uint8Array(e, t) : new Uint8Array(e, t, n), u.prototype), r
                }

                function v(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function m(e, t) {
                    if (u.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || R(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + (void 0 === e ? "undefined" : o._(e)));
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
                            return A(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * n;
                        case "hex":
                            return n >>> 1;
                        case "base64":
                            return _(e).length;
                        default:
                            if (i) return r ? -1 : A(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function g(e, t, n) {
                    var r, o, a, s = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === n || n > this.length) && (n = this.length), n <= 0 || (n >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, n) {
                                var r = e.length;
                                (!t || t < 0) && (t = 0), (!n || n < 0 || n > r) && (n = r);
                                for (var o = "", i = t; i < n; ++i) o += O[e[i]];
                                return o
                            }(this, t, n);
                        case "utf8":
                        case "utf-8":
                            return x(this, t, n);
                        case "ascii":
                            return function(e, t, n) {
                                var r = "";
                                n = Math.min(e.length, n);
                                for (var o = t; o < n; ++o) r += String.fromCharCode(127 & e[o]);
                                return r
                            }(this, t, n);
                        case "latin1":
                        case "binary":
                            return function(e, t, n) {
                                var r = "";
                                n = Math.min(e.length, n);
                                for (var o = t; o < n; ++o) r += String.fromCharCode(e[o]);
                                return r
                            }(this, t, n);
                        case "base64":
                            return r = this, o = t, a = n, 0 === o && a === r.length ? i.fromByteArray(r) : i.fromByteArray(r.slice(o, a));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, n) {
                                for (var r = e.slice(t, n), o = "", i = 0; i < r.length - 1; i += 2) o += String.fromCharCode(r[i] + 256 * r[i + 1]);
                                return o
                            }(this, t, n);
                        default:
                            if (s) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), s = !0
                    }
                }

                function y(e, t, n) {
                    var r = e[t];
                    e[t] = e[n], e[n] = r
                }

                function b(e, t, n, r, o) {
                    var i;
                    if (0 === e.length) return -1;
                    if ("string" == typeof n ? (r = n, n = 0) : n > 0x7fffffff ? n = 0x7fffffff : n < -0x80000000 && (n = -0x80000000), (i = n *= 1) != i && (n = o ? 0 : e.length - 1), n < 0 && (n = e.length + n), n >= e.length)
                        if (o) return -1;
                        else n = e.length - 1;
                    else if (n < 0)
                        if (!o) return -1;
                        else n = 0;
                    if ("string" == typeof t && (t = u.from(t, r)), u.isBuffer(t)) return 0 === t.length ? -1 : w(e, t, n, r, o);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (o) return Uint8Array.prototype.indexOf.call(e, t, n);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, n);
                        return w(e, [t], n, r, o)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function w(e, t, n, r, o) {
                    var i, a = 1,
                        s = e.length,
                        l = t.length;
                    if (void 0 !== r && ("ucs2" === (r = String(r).toLowerCase()) || "ucs-2" === r || "utf16le" === r || "utf-16le" === r)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        a = 2, s /= 2, l /= 2, n /= 2
                    }

                    function u(e, t) {
                        return 1 === a ? e[t] : e.readUInt16BE(t * a)
                    }
                    if (o) {
                        var c = -1;
                        for (i = n; i < s; i++)
                            if (u(e, i) === u(t, -1 === c ? 0 : i - c)) {
                                if (-1 === c && (c = i), i - c + 1 === l) return c * a
                            } else - 1 !== c && (i -= i - c), c = -1
                    } else
                        for (n + l > s && (n = s - l), i = n; i >= 0; i--) {
                            for (var d = !0, f = 0; f < l; f++)
                                if (u(e, i + f) !== u(t, f)) {
                                    d = !1;
                                    break
                                } if (d) return i
                        }
                    return -1
                }

                function x(e, t, n) {
                    n = Math.min(e.length, n);
                    for (var r = [], o = t; o < n;) {
                        var i, a, s, l, u = e[o],
                            c = null,
                            d = u > 239 ? 4 : u > 223 ? 3 : u > 191 ? 2 : 1;
                        if (o + d <= n) switch (d) {
                            case 1:
                                u < 128 && (c = u);
                                break;
                            case 2:
                                (192 & (i = e[o + 1])) == 128 && (l = (31 & u) << 6 | 63 & i) > 127 && (c = l);
                                break;
                            case 3:
                                i = e[o + 1], a = e[o + 2], (192 & i) == 128 && (192 & a) == 128 && (l = (15 & u) << 12 | (63 & i) << 6 | 63 & a) > 2047 && (l < 55296 || l > 57343) && (c = l);
                                break;
                            case 4:
                                i = e[o + 1], a = e[o + 2], s = e[o + 3], (192 & i) == 128 && (192 & a) == 128 && (192 & s) == 128 && (l = (15 & u) << 18 | (63 & i) << 12 | (63 & a) << 6 | 63 & s) > 65535 && l < 1114112 && (c = l)
                        }
                        null === c ? (c = 65533, d = 1) : c > 65535 && (c -= 65536, r.push(c >>> 10 & 1023 | 55296), c = 56320 | 1023 & c), r.push(c), o += d
                    }
                    var f = r,
                        h = f.length;
                    if (h <= 4096) return String.fromCharCode.apply(String, f);
                    for (var p = "", v = 0; v < h;) p += String.fromCharCode.apply(String, f.slice(v, v += 4096));
                    return p
                }

                function S(e, t, n) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > n) throw RangeError("Trying to access beyond buffer length")
                }

                function E(e, t, n, r, o, i) {
                    if (!u.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > o || t < i) throw RangeError('"value" argument is out of bounds');
                    if (n + r > e.length) throw RangeError("Index out of range")
                }

                function I(e, t, n, r, o, i) {
                    if (n + r > e.length || n < 0) throw RangeError("Index out of range")
                }

                function T(e, t, n, r, o) {
                    return t *= 1, n >>>= 0, o || I(e, t, n, 4, 34028234663852886e22, -34028234663852886e22), a.write(e, t, n, r, 23, 4), n + 4
                }

                function C(e, t, n, r, o) {
                    return t *= 1, n >>>= 0, o || I(e, t, n, 8, 17976931348623157e292, -17976931348623157e292), a.write(e, t, n, r, 52, 8), n + 8
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
                }), u.poolSize = 8192, u.from = function(e, t, n) {
                    return c(e, t, n)
                }, Object.setPrototypeOf(u.prototype, Uint8Array.prototype), Object.setPrototypeOf(u, Uint8Array), u.alloc = function(e, t, n) {
                    return (d(e), e <= 0) ? l(e) : void 0 !== t ? "string" == typeof n ? l(e).fill(t, n) : l(e).fill(t) : l(e)
                }, u.allocUnsafe = function(e) {
                    return f(e)
                }, u.allocUnsafeSlow = function(e) {
                    return f(e)
                }, u.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== u.prototype
                }, u.compare = function(e, t) {
                    if (R(e, Uint8Array) && (e = u.from(e, e.offset, e.byteLength)), R(t, Uint8Array) && (t = u.from(t, t.offset, t.byteLength)), !u.isBuffer(e) || !u.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var n = e.length, r = t.length, o = 0, i = Math.min(n, r); o < i; ++o)
                        if (e[o] !== t[o]) {
                            n = e[o], r = t[o];
                            break
                        } return n < r ? -1 : +(r < n)
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
                        for (n = 0, t = 0; n < e.length; ++n) t += e[n].length;
                    var n, r = u.allocUnsafe(t),
                        o = 0;
                    for (n = 0; n < e.length; ++n) {
                        var i = e[n];
                        if (R(i, Uint8Array)) o + i.length > r.length ? u.from(i).copy(r, o) : Uint8Array.prototype.set.call(r, i, o);
                        else if (u.isBuffer(i)) i.copy(r, o);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        o += i.length
                    }
                    return r
                }, u.byteLength = m, u.prototype._isBuffer = !0, u.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) y(this, t, t + 1);
                    return this
                }, u.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) y(this, t, t + 3), y(this, t + 1, t + 2);
                    return this
                }, u.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) y(this, t, t + 7), y(this, t + 1, t + 6), y(this, t + 2, t + 5), y(this, t + 3, t + 4);
                    return this
                }, u.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? x(this, 0, e) : g.apply(this, arguments)
                }, u.prototype.toLocaleString = u.prototype.toString, u.prototype.equals = function(e) {
                    if (!u.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === u.compare(this, e)
                }, u.prototype.inspect = function() {
                    var e = "",
                        n = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, n).replace(/(.{2})/g, "$1 ").trim(), this.length > n && (e += " ... "), "<Buffer " + e + ">"
                }, s && (u.prototype[s] = u.prototype.inspect), u.prototype.compare = function(e, t, n, r, i) {
                    if (R(e, Uint8Array) && (e = u.from(e, e.offset, e.byteLength)), !u.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : o._(e)));
                    if (void 0 === t && (t = 0), void 0 === n && (n = e ? e.length : 0), void 0 === r && (r = 0), void 0 === i && (i = this.length), t < 0 || n > e.length || r < 0 || i > this.length) throw RangeError("out of range index");
                    if (r >= i && t >= n) return 0;
                    if (r >= i) return -1;
                    if (t >= n) return 1;
                    if (t >>>= 0, n >>>= 0, r >>>= 0, i >>>= 0, this === e) return 0;
                    for (var a = i - r, s = n - t, l = Math.min(a, s), c = this.slice(r, i), d = e.slice(t, n), f = 0; f < l; ++f)
                        if (c[f] !== d[f]) {
                            a = c[f], s = d[f];
                            break
                        } return a < s ? -1 : +(s < a)
                }, u.prototype.includes = function(e, t, n) {
                    return -1 !== this.indexOf(e, t, n)
                }, u.prototype.indexOf = function(e, t, n) {
                    return b(this, e, t, n, !0)
                }, u.prototype.lastIndexOf = function(e, t, n) {
                    return b(this, e, t, n, !1)
                }, u.prototype.write = function(e, t, n, r) {
                    if (void 0 === t) r = "utf8", n = this.length, t = 0;
                    else if (void 0 === n && "string" == typeof t) r = t, n = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(n) ? (n >>>= 0, void 0 === r && (r = "utf8")) : (r = n, n = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var o, i, a, s, l, u, c, d, f = this.length - t;
                    if ((void 0 === n || n > f) && (n = f), e.length > 0 && (n < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    r || (r = "utf8");
                    for (var h = !1;;) switch (r) {
                        case "hex":
                            return function(e, t, n, r) {
                                n = Number(n) || 0;
                                var o = e.length - n;
                                r ? (r = Number(r)) > o && (r = o) : r = o;
                                var i = t.length;
                                r > i / 2 && (r = i / 2);
                                for (var a = 0; a < r; ++a) {
                                    var s, l = parseInt(t.substr(2 * a, 2), 16);
                                    if ((s = l) != s) break;
                                    e[n + a] = l
                                }
                                return a
                            }(this, e, t, n);
                        case "utf8":
                        case "utf-8":
                            return o = t, i = n, N(A(e, this.length - o), this, o, i);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return a = t, s = n, N(function(e) {
                                for (var t = [], n = 0; n < e.length; ++n) t.push(255 & e.charCodeAt(n));
                                return t
                            }(e), this, a, s);
                        case "base64":
                            return l = t, u = n, N(_(e), this, l, u);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return c = t, d = n, N(function(e, t) {
                                for (var n, r, o = [], i = 0; i < e.length && !((t -= 2) < 0); ++i) r = (n = e.charCodeAt(i)) >> 8, o.push(n % 256), o.push(r);
                                return o
                            }(e, this.length - c), this, c, d);
                        default:
                            if (h) throw TypeError("Unknown encoding: " + r);
                            r = ("" + r).toLowerCase(), h = !0
                    }
                }, u.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, u.prototype.slice = function(e, t) {
                    var n = this.length;
                    e = ~~e, t = void 0 === t ? n : ~~t, e < 0 ? (e += n) < 0 && (e = 0) : e > n && (e = n), t < 0 ? (t += n) < 0 && (t = 0) : t > n && (t = n), t < e && (t = e);
                    var r = this.subarray(e, t);
                    return Object.setPrototypeOf(r, u.prototype), r
                }, u.prototype.readUintLE = u.prototype.readUIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || S(e, t, this.length);
                    for (var r = this[e], o = 1, i = 0; ++i < t && (o *= 256);) r += this[e + i] * o;
                    return r
                }, u.prototype.readUintBE = u.prototype.readUIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || S(e, t, this.length);
                    for (var r = this[e + --t], o = 1; t > 0 && (o *= 256);) r += this[e + --t] * o;
                    return r
                }, u.prototype.readUint8 = u.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || S(e, 1, this.length), this[e]
                }, u.prototype.readUint16LE = u.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || S(e, 2, this.length), this[e] | this[e + 1] << 8
                }, u.prototype.readUint16BE = u.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || S(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, u.prototype.readUint32LE = u.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, u.prototype.readUint32BE = u.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, u.prototype.readIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || S(e, t, this.length);
                    for (var r = this[e], o = 1, i = 0; ++i < t && (o *= 256);) r += this[e + i] * o;
                    return r >= (o *= 128) && (r -= Math.pow(2, 8 * t)), r
                }, u.prototype.readIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || S(e, t, this.length);
                    for (var r = t, o = 1, i = this[e + --r]; r > 0 && (o *= 256);) i += this[e + --r] * o;
                    return i >= (o *= 128) && (i -= Math.pow(2, 8 * t)), i
                }, u.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || S(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, u.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || S(e, 2, this.length);
                    var n = this[e] | this[e + 1] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, u.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || S(e, 2, this.length);
                    var n = this[e + 1] | this[e] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, u.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, u.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, u.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), a.read(this, e, !0, 23, 4)
                }, u.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), a.read(this, e, !1, 23, 4)
                }, u.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || S(e, 8, this.length), a.read(this, e, !0, 52, 8)
                }, u.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || S(e, 8, this.length), a.read(this, e, !1, 52, 8)
                }, u.prototype.writeUintLE = u.prototype.writeUIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var o = Math.pow(2, 8 * n) - 1;
                        E(this, e, t, n, o, 0)
                    }
                    var i = 1,
                        a = 0;
                    for (this[t] = 255 & e; ++a < n && (i *= 256);) this[t + a] = e / i & 255;
                    return t + n
                }, u.prototype.writeUintBE = u.prototype.writeUIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var o = Math.pow(2, 8 * n) - 1;
                        E(this, e, t, n, o, 0)
                    }
                    var i = n - 1,
                        a = 1;
                    for (this[t + i] = 255 & e; --i >= 0 && (a *= 256);) this[t + i] = e / a & 255;
                    return t + n
                }, u.prototype.writeUint8 = u.prototype.writeUInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, u.prototype.writeUint16LE = u.prototype.writeUInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, u.prototype.writeUint16BE = u.prototype.writeUInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, u.prototype.writeUint32LE = u.prototype.writeUInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, u.prototype.writeUint32BE = u.prototype.writeUInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, u.prototype.writeIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var o = Math.pow(2, 8 * n - 1);
                        E(this, e, t, n, o - 1, -o)
                    }
                    var i = 0,
                        a = 1,
                        s = 0;
                    for (this[t] = 255 & e; ++i < n && (a *= 256);) e < 0 && 0 === s && 0 !== this[t + i - 1] && (s = 1), this[t + i] = (e / a | 0) - s & 255;
                    return t + n
                }, u.prototype.writeIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var o = Math.pow(2, 8 * n - 1);
                        E(this, e, t, n, o - 1, -o)
                    }
                    var i = n - 1,
                        a = 1,
                        s = 0;
                    for (this[t + i] = 255 & e; --i >= 0 && (a *= 256);) e < 0 && 0 === s && 0 !== this[t + i + 1] && (s = 1), this[t + i] = (e / a | 0) - s & 255;
                    return t + n
                }, u.prototype.writeInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, u.prototype.writeInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, u.prototype.writeInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, u.prototype.writeInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, u.prototype.writeInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || E(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, u.prototype.writeFloatLE = function(e, t, n) {
                    return T(this, e, t, !0, n)
                }, u.prototype.writeFloatBE = function(e, t, n) {
                    return T(this, e, t, !1, n)
                }, u.prototype.writeDoubleLE = function(e, t, n) {
                    return C(this, e, t, !0, n)
                }, u.prototype.writeDoubleBE = function(e, t, n) {
                    return C(this, e, t, !1, n)
                }, u.prototype.copy = function(e, t, n, r) {
                    if (!u.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (n || (n = 0), r || 0 === r || (r = this.length), t >= e.length && (t = e.length), t || (t = 0), r > 0 && r < n && (r = n), r === n || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (n < 0 || n >= this.length) throw RangeError("Index out of range");
                    if (r < 0) throw RangeError("sourceEnd out of bounds");
                    r > this.length && (r = this.length), e.length - t < r - n && (r = e.length - t + n);
                    var o = r - n;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, n, r) : Uint8Array.prototype.set.call(e, this.subarray(n, r), t), o
                }, u.prototype.fill = function(e, t, n, r) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (r = t, t = 0, n = this.length) : "string" == typeof n && (r = n, n = this.length), void 0 !== r && "string" != typeof r) throw TypeError("encoding must be a string");
                        if ("string" == typeof r && !u.isEncoding(r)) throw TypeError("Unknown encoding: " + r);
                        if (1 === e.length) {
                            var o, i = e.charCodeAt(0);
                            ("utf8" === r && i < 128 || "latin1" === r) && (e = i)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < n) throw RangeError("Out of range index");
                    if (n <= t) return this;
                    if (t >>>= 0, n = void 0 === n ? this.length : n >>> 0, e || (e = 0), "number" == typeof e)
                        for (o = t; o < n; ++o) this[o] = e;
                    else {
                        var a = u.isBuffer(e) ? e : u.from(e, r),
                            s = a.length;
                        if (0 === s) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (o = 0; o < n - t; ++o) this[o + t] = a[o % s]
                    }
                    return this
                };
                var P = /[^+/0-9A-Za-z-_]/g;

                function A(e, t) {
                    t = t || 1 / 0;
                    for (var n, r = e.length, o = null, i = [], a = 0; a < r; ++a) {
                        if ((n = e.charCodeAt(a)) > 55295 && n < 57344) {
                            if (!o) {
                                if (n > 56319 || a + 1 === r) {
                                    (t -= 3) > -1 && i.push(239, 191, 189);
                                    continue
                                }
                                o = n;
                                continue
                            }
                            if (n < 56320) {
                                (t -= 3) > -1 && i.push(239, 191, 189), o = n;
                                continue
                            }
                            n = (o - 55296 << 10 | n - 56320) + 65536
                        } else o && (t -= 3) > -1 && i.push(239, 191, 189);
                        if (o = null, n < 128) {
                            if ((t -= 1) < 0) break;
                            i.push(n)
                        } else if (n < 2048) {
                            if ((t -= 2) < 0) break;
                            i.push(n >> 6 | 192, 63 & n | 128)
                        } else if (n < 65536) {
                            if ((t -= 3) < 0) break;
                            i.push(n >> 12 | 224, n >> 6 & 63 | 128, 63 & n | 128)
                        } else if (n < 1114112) {
                            if ((t -= 4) < 0) break;
                            i.push(n >> 18 | 240, n >> 12 & 63 | 128, n >> 6 & 63 | 128, 63 & n | 128)
                        } else throw Error("Invalid code point")
                    }
                    return i
                }

                function _(e) {
                    return i.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(P, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function N(e, t, n, r) {
                    for (var o = 0; o < r && !(o + n >= t.length) && !(o >= e.length); ++o) t[o + n] = e[o];
                    return o
                }

                function R(e, t) {
                    return r._(e, t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var O = function() {
                    for (var e = "0123456789abcdef", t = Array(256), n = 0; n < 16; ++n)
                        for (var r = 16 * n, o = 0; o < 16; ++o) t[r + o] = e[n] + e[o];
                    return t
                }()
            },
            611: function(e, t, n) {
                var r = n(844);
                !
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var t = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var a = arguments[i];
                            a && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : r._(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var a in e) t.call(e, a) && e[a] && (i = o(i, a));
                                return i
                            }(a)))
                        }
                        return e
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === r._(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, n, r, o) {
                    var i, a, s = 8 * o - r - 1,
                        l = (1 << s) - 1,
                        u = l >> 1,
                        c = -7,
                        d = n ? o - 1 : 0,
                        f = n ? -1 : 1,
                        h = e[t + d];
                    for (d += f, i = h & (1 << -c) - 1, h >>= -c, c += s; c > 0; i = 256 * i + e[t + d], d += f, c -= 8);
                    for (a = i & (1 << -c) - 1, i >>= -c, c += r; c > 0; a = 256 * a + e[t + d], d += f, c -= 8);
                    if (0 === i) i = 1 - u;
                    else {
                        if (i === l) return a ? NaN : 1 / 0 * (h ? -1 : 1);
                        a += Math.pow(2, r), i -= u
                    }
                    return (h ? -1 : 1) * a * Math.pow(2, i - r)
                }, t.write = function(e, t, n, r, o, i) {
                    var a, s, l, u = 8 * i - o - 1,
                        c = (1 << u) - 1,
                        d = c >> 1,
                        f = 5960464477539062e-23 * (23 === o),
                        h = r ? 0 : i - 1,
                        p = r ? 1 : -1,
                        v = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (s = +!!isNaN(t), a = c) : (a = Math.floor(Math.log(t) / Math.LN2), t * (l = Math.pow(2, -a)) < 1 && (a--, l *= 2), a + d >= 1 ? t += f / l : t += f * Math.pow(2, 1 - d), t * l >= 2 && (a++, l /= 2), a + d >= c ? (s = 0, a = c) : a + d >= 1 ? (s = (t * l - 1) * Math.pow(2, o), a += d) : (s = t * Math.pow(2, d - 1) * Math.pow(2, o), a = 0)); o >= 8; e[n + h] = 255 & s, h += p, s /= 256, o -= 8);
                    for (a = a << o | s, u += o; u > 0; e[n + h] = 255 & a, h += p, a /= 256, u -= 8);
                    e[n + h - p] |= 128 * v
                }
            },
            818: function(e, t, n) {
                var r = n(844);
                ! function() {
                    "use strict";
                    if (("u" < typeof window ? "undefined" : r._(window)) === "object") {
                        if ("IntersectionObserver" in window && "IntersectionObserverEntry" in window && "intersectionRatio" in window.IntersectionObserverEntry.prototype) {
                            "isIntersecting" in window.IntersectionObserverEntry.prototype || Object.defineProperty(window.IntersectionObserverEntry.prototype, "isIntersecting", {
                                get: function() {
                                    return this.intersectionRatio > 0
                                }
                            });
                            return
                        }
                        var e = function(e) {
                                for (var t = e, n = i(t); n;) n = i(t = n.ownerDocument);
                                return t
                            }(window.document),
                            t = [],
                            n = null,
                            o = null;
                        s.prototype.THROTTLE_TIMEOUT = 100, s.prototype.POLL_INTERVAL = null, s.prototype.USE_MUTATION_OBSERVER = !0, s._setupCrossOriginUpdater = function() {
                            return n || (n = function(e, n) {
                                o = e && n ? h(e, n) : d(), t.forEach(function(e) {
                                    e._checkForIntersections()
                                })
                            }), n
                        }, s._resetCrossOriginUpdater = function() {
                            n = null, o = null
                        }, s.prototype.observe = function(e) {
                            if (!this._observationTargets.some(function(t) {
                                    return t.element == e
                                })) {
                                if (!(e && 1 == e.nodeType)) throw Error("target must be an Element");
                                this._registerInstance(), this._observationTargets.push({
                                    element: e,
                                    entry: null
                                }), this._monitorIntersections(e.ownerDocument), this._checkForIntersections()
                            }
                        }, s.prototype.unobserve = function(e) {
                            this._observationTargets = this._observationTargets.filter(function(t) {
                                return t.element != e
                            }), this._unmonitorIntersections(e.ownerDocument), 0 == this._observationTargets.length && this._unregisterInstance()
                        }, s.prototype.disconnect = function() {
                            this._observationTargets = [], this._unmonitorAllIntersections(), this._unregisterInstance()
                        }, s.prototype.takeRecords = function() {
                            var e = this._queuedEntries.slice();
                            return this._queuedEntries = [], e
                        }, s.prototype._initThresholds = function(e) {
                            var t = e || [0];
                            return Array.isArray(t) || (t = [t]), t.sort().filter(function(e, t, n) {
                                if ("number" != typeof e || isNaN(e) || e < 0 || e > 1) throw Error("threshold must be a number between 0 and 1 inclusively");
                                return e !== n[t - 1]
                            })
                        }, s.prototype._parseRootMargin = function(e) {
                            var t = (e || "0px").split(/\s+/).map(function(e) {
                                var t = /^(-?\d*\.?\d+)(px|%)$/.exec(e);
                                if (!t) throw Error("rootMargin must be specified in pixels or percent");
                                return {
                                    value: parseFloat(t[1]),
                                    unit: t[2]
                                }
                            });
                            return t[1] = t[1] || t[0], t[2] = t[2] || t[0], t[3] = t[3] || t[1], t
                        }, s.prototype._monitorIntersections = function(t) {
                            var n = t.defaultView;
                            if (n && -1 == this._monitoringDocuments.indexOf(t)) {
                                var r = this._checkForIntersections,
                                    o = null,
                                    a = null;
                                if (this.POLL_INTERVAL ? o = n.setInterval(r, this.POLL_INTERVAL) : (l(n, "resize", r, !0), l(t, "scroll", r, !0), this.USE_MUTATION_OBSERVER && "MutationObserver" in n && (a = new n.MutationObserver(r)).observe(t, {
                                        attributes: !0,
                                        childList: !0,
                                        characterData: !0,
                                        subtree: !0
                                    })), this._monitoringDocuments.push(t), this._monitoringUnsubscribes.push(function() {
                                        var e = t.defaultView;
                                        e && (o && e.clearInterval(o), u(e, "resize", r, !0)), u(t, "scroll", r, !0), a && a.disconnect()
                                    }), t != (this.root && (this.root.ownerDocument || this.root) || e)) {
                                    var s = i(t);
                                    s && this._monitorIntersections(s.ownerDocument)
                                }
                            }
                        }, s.prototype._unmonitorIntersections = function(t) {
                            var n = this._monitoringDocuments.indexOf(t);
                            if (-1 != n) {
                                var r = this.root && (this.root.ownerDocument || this.root) || e;
                                if (!this._observationTargets.some(function(e) {
                                        var n = e.element.ownerDocument;
                                        if (n == t) return !0;
                                        for (; n && n != r;) {
                                            var o = i(n);
                                            if ((n = o && o.ownerDocument) == t) return !0
                                        }
                                        return !1
                                    })) {
                                    var o = this._monitoringUnsubscribes[n];
                                    if (this._monitoringDocuments.splice(n, 1), this._monitoringUnsubscribes.splice(n, 1), o(), t != r) {
                                        var a = i(t);
                                        a && this._unmonitorIntersections(a.ownerDocument)
                                    }
                                }
                            }
                        }, s.prototype._unmonitorAllIntersections = function() {
                            var e = this._monitoringUnsubscribes.slice(0);
                            this._monitoringDocuments.length = 0, this._monitoringUnsubscribes.length = 0;
                            for (var t = 0; t < e.length; t++) e[t]()
                        }, s.prototype._checkForIntersections = function() {
                            if (this.root || !n || o) {
                                var e = this._rootIsInDom(),
                                    t = e ? this._getRootRect() : d();
                                this._observationTargets.forEach(function(r) {
                                    var o = r.element,
                                        i = c(o),
                                        s = this._rootContainsTarget(o),
                                        l = r.entry,
                                        u = e && s && this._computeTargetAndRootIntersection(o, i, t),
                                        f = null;
                                    this._rootContainsTarget(o) ? (!n || this.root) && (f = t) : f = d();
                                    var h = r.entry = new a({
                                        time: window.performance && performance.now && performance.now(),
                                        target: o,
                                        boundingClientRect: i,
                                        rootBounds: f,
                                        intersectionRect: u
                                    });
                                    l ? e && s ? this._hasCrossedThreshold(l, h) && this._queuedEntries.push(h) : l && l.isIntersecting && this._queuedEntries.push(h) : this._queuedEntries.push(h)
                                }, this), this._queuedEntries.length && this._callback(this.takeRecords(), this)
                            }
                        }, s.prototype._computeTargetAndRootIntersection = function(t, r, i) {
                            if ("none" != window.getComputedStyle(t).display) {
                                for (var a = r, s = v(t), l = !1; !l && s;) {
                                    var u = null,
                                        d = 1 == s.nodeType ? window.getComputedStyle(s) : {};
                                    if ("none" == d.display) return null;
                                    if (s == this.root || 9 == s.nodeType)
                                        if (l = !0, s == this.root || s == e) n && !this.root ? o && (0 != o.width || 0 != o.height) ? u = o : (s = null, u = null, a = null) : u = i;
                                        else {
                                            var f = v(s),
                                                p = f && c(f),
                                                m = f && this._computeTargetAndRootIntersection(f, p, i);
                                            p && m ? (s = f, u = h(p, m)) : (s = null, a = null)
                                        }
                                    else {
                                        var g = s.ownerDocument;
                                        s != g.body && s != g.documentElement && "visible" != d.overflow && (u = c(s))
                                    }
                                    if (u && (a = function(e, t) {
                                            var n = Math.max(e.top, t.top),
                                                r = Math.min(e.bottom, t.bottom),
                                                o = Math.max(e.left, t.left),
                                                i = Math.min(e.right, t.right),
                                                a = i - o,
                                                s = r - n;
                                            return a >= 0 && s >= 0 && {
                                                top: n,
                                                bottom: r,
                                                left: o,
                                                right: i,
                                                width: a,
                                                height: s
                                            } || null
                                        }(u, a)), !a) break;
                                    s = s && v(s)
                                }
                                return a
                            }
                        }, s.prototype._getRootRect = function() {
                            var t;
                            if (this.root && !m(this.root)) t = c(this.root);
                            else {
                                var n = m(this.root) ? this.root : e,
                                    r = n.documentElement,
                                    o = n.body;
                                t = {
                                    top: 0,
                                    left: 0,
                                    right: r.clientWidth || o.clientWidth,
                                    width: r.clientWidth || o.clientWidth,
                                    bottom: r.clientHeight || o.clientHeight,
                                    height: r.clientHeight || o.clientHeight
                                }
                            }
                            return this._expandRectByRootMargin(t)
                        }, s.prototype._expandRectByRootMargin = function(e) {
                            var t = this._rootMarginValues.map(function(t, n) {
                                    return "px" == t.unit ? t.value : t.value * (n % 2 ? e.width : e.height) / 100
                                }),
                                n = {
                                    top: e.top - t[0],
                                    right: e.right + t[1],
                                    bottom: e.bottom + t[2],
                                    left: e.left - t[3]
                                };
                            return n.width = n.right - n.left, n.height = n.bottom - n.top, n
                        }, s.prototype._hasCrossedThreshold = function(e, t) {
                            var n = e && e.isIntersecting ? e.intersectionRatio || 0 : -1,
                                r = t.isIntersecting ? t.intersectionRatio || 0 : -1;
                            if (n !== r)
                                for (var o = 0; o < this.thresholds.length; o++) {
                                    var i = this.thresholds[o];
                                    if (i == n || i == r || i < n != i < r) return !0
                                }
                        }, s.prototype._rootIsInDom = function() {
                            return !this.root || p(e, this.root)
                        }, s.prototype._rootContainsTarget = function(t) {
                            var n = this.root && (this.root.ownerDocument || this.root) || e;
                            return p(n, t) && (!this.root || n == t.ownerDocument)
                        }, s.prototype._registerInstance = function() {
                            0 > t.indexOf(this) && t.push(this)
                        }, s.prototype._unregisterInstance = function() {
                            var e = t.indexOf(this); - 1 != e && t.splice(e, 1)
                        }, window.IntersectionObserver = s, window.IntersectionObserverEntry = a
                    }

                    function i(e) {
                        try {
                            return e.defaultView && e.defaultView.frameElement || null
                        } catch (e) {
                            return null
                        }
                    }

                    function a(e) {
                        this.time = e.time, this.target = e.target, this.rootBounds = f(e.rootBounds), this.boundingClientRect = f(e.boundingClientRect), this.intersectionRect = f(e.intersectionRect || d()), this.isIntersecting = !!e.intersectionRect;
                        var t = this.boundingClientRect,
                            n = t.width * t.height,
                            r = this.intersectionRect,
                            o = r.width * r.height;
                        n ? this.intersectionRatio = Number((o / n).toFixed(4)) : this.intersectionRatio = +!!this.isIntersecting
                    }

                    function s(e, t) {
                        var n, r, o, i = t || {};
                        if ("function" != typeof e) throw Error("callback must be a function");
                        if (i.root && 1 != i.root.nodeType && 9 != i.root.nodeType) throw Error("root must be a Document or Element");
                        this._checkForIntersections = (n = this._checkForIntersections.bind(this), r = this.THROTTLE_TIMEOUT, o = null, function() {
                            o || (o = setTimeout(function() {
                                n(), o = null
                            }, r))
                        }), this._callback = e, this._observationTargets = [], this._queuedEntries = [], this._rootMarginValues = this._parseRootMargin(i.rootMargin), this.thresholds = this._initThresholds(i.threshold), this.root = i.root || null, this.rootMargin = this._rootMarginValues.map(function(e) {
                            return e.value + e.unit
                        }).join(" "), this._monitoringDocuments = [], this._monitoringUnsubscribes = []
                    }

                    function l(e, t, n, r) {
                        "function" == typeof e.addEventListener ? e.addEventListener(t, n, r || !1) : "function" == typeof e.attachEvent && e.attachEvent("on" + t, n)
                    }

                    function u(e, t, n, r) {
                        "function" == typeof e.removeEventListener ? e.removeEventListener(t, n, r || !1) : "function" == typeof e.detachEvent && e.detachEvent("on" + t, n)
                    }

                    function c(e) {
                        var t;
                        try {
                            t = e.getBoundingClientRect()
                        } catch (e) {}
                        return t ? (t.width && t.height || (t = {
                            top: t.top,
                            right: t.right,
                            bottom: t.bottom,
                            left: t.left,
                            width: t.right - t.left,
                            height: t.bottom - t.top
                        }), t) : d()
                    }

                    function d() {
                        return {
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            width: 0,
                            height: 0
                        }
                    }

                    function f(e) {
                        return !e || "x" in e ? e : {
                            top: e.top,
                            y: e.top,
                            bottom: e.bottom,
                            left: e.left,
                            x: e.left,
                            right: e.right,
                            width: e.width,
                            height: e.height
                        }
                    }

                    function h(e, t) {
                        var n = t.top - e.top,
                            r = t.left - e.left;
                        return {
                            top: n,
                            left: r,
                            height: t.height,
                            width: t.width,
                            bottom: n + t.height,
                            right: r + t.width
                        }
                    }

                    function p(e, t) {
                        for (var n = t; n;) {
                            if (n == e) return !0;
                            n = v(n)
                        }
                        return !1
                    }

                    function v(t) {
                        var n = t.parentNode;
                        return 9 == t.nodeType && t != e ? i(t) : (n && n.assignedSlot && (n = n.assignedSlot.parentNode), n && 11 == n.nodeType && n.host) ? n.host : n
                    }

                    function m(e) {
                        return e && 9 === e.nodeType
                    }
                }()
            },
            977: function(e, t, n) {
                var r = n(844),
                    o = 0 / 0,
                    i = /^\s+|\s+$/g,
                    a = /^[-+]0x[0-9a-f]+$/i,
                    s = /^0b[01]+$/i,
                    l = /^0o[0-7]+$/i,
                    u = parseInt,
                    c = (void 0 === n.g ? "undefined" : r._(n.g)) == "object" && n.g && n.g.Object === Object && n.g,
                    d = ("u" < typeof self ? "undefined" : r._(self)) == "object" && self && self.Object === Object && self,
                    f = c || d || Function("return this")(),
                    h = Object.prototype.toString,
                    p = Math.max,
                    v = Math.min,
                    m = function() {
                        return f.Date.now()
                    };

                function g(e) {
                    var t = void 0 === e ? "undefined" : r._(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function y(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : r._(t)) == "symbol" || t && (void 0 === t ? "undefined" : r._(t)) == "object" && "[object Symbol]" == h.call(t)) return o;
                    if (g(e)) {
                        var t, n = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = g(n) ? n + "" : n
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(i, "");
                    var c = s.test(e);
                    return c || l.test(e) ? u(e.slice(2), c ? 2 : 8) : a.test(e) ? o : +e
                }
                e.exports = function(e, t, n) {
                    var r, o, i, a, s, l, u = 0,
                        c = !1,
                        d = !1,
                        f = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function h(t) {
                        var n = r,
                            i = o;
                        return r = o = void 0, u = t, a = e.apply(i, n)
                    }

                    function b(e) {
                        var n = e - l,
                            r = e - u;
                        return void 0 === l || n >= t || n < 0 || d && r >= i
                    }

                    function w() {
                        var e, n, r, o = m();
                        if (b(o)) return x(o);
                        s = setTimeout(w, (e = o - l, n = o - u, r = t - e, d ? v(r, i - n) : r))
                    }

                    function x(e) {
                        return (s = void 0, f && r) ? h(e) : (r = o = void 0, a)
                    }

                    function S() {
                        var e, n = m(),
                            i = b(n);
                        if (r = arguments, o = this, l = n, i) {
                            if (void 0 === s) return u = e = l, s = setTimeout(w, t), c ? h(e) : a;
                            if (d) return s = setTimeout(w, t), h(l)
                        }
                        return void 0 === s && (s = setTimeout(w, t)), a
                    }
                    return t = y(t) || 0, g(n) && (c = !!n.leading, i = (d = "maxWait" in n) ? p(y(n.maxWait) || 0, t) : i, f = "trailing" in n ? !!n.trailing : f), S.cancel = function() {
                        void 0 !== s && clearTimeout(s), u = 0, r = l = o = s = void 0
                    }, S.flush = function() {
                        return void 0 === s ? a : x(m())
                    }, S
                }
            },
            848: function(e, t, n) {
                "use strict";
                var r = n(564).Buffer,
                    o = n(844),
                    i = void 0 !== r,
                    a = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    s = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function l(e, t, n) {
                    null == n && null !== t && (void 0 === t ? "undefined" : o._(t)) === "object" && (n = t, t = void 0), i && r.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var l = JSON.parse(e, t);
                    if (null === l || (void 0 === l ? "undefined" : o._(l)) !== "object") return l;
                    var c = n && n.protoAction || "error",
                        d = n && n.constructorAction || "error";
                    if ("ignore" === c && "ignore" === d) return l;
                    if ("ignore" !== c && "ignore" !== d) {
                        if (!1 === a.test(e) && !1 === s.test(e)) return l
                    } else if ("ignore" !== c && "ignore" === d) {
                        if (!1 === a.test(e)) return l
                    } else if (!1 === s.test(e)) return l;
                    return u(l, {
                        protoAction: c,
                        constructorAction: d,
                        safe: n && n.safe
                    })
                }

                function u(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = t.protoAction, r = void 0 === n ? "error" : n, i = t.constructorAction, a = void 0 === i ? "error" : i, s = t.safe, l = [e]; l.length;) {
                        var u = l;
                        l = [];
                        var c = !0,
                            d = !1,
                            f = void 0;
                        try {
                            for (var h, p = u[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                                var v = h.value;
                                if ("ignore" !== r && Object.prototype.hasOwnProperty.call(v, "__proto__")) {
                                    if (!0 === s) return null;
                                    if ("error" === r) throw SyntaxError("Object contains forbidden prototype property");
                                    delete v.__proto__
                                }
                                if ("ignore" !== a && Object.prototype.hasOwnProperty.call(v, "constructor") && null !== v.constructor && "object" === o._(v.constructor) && Object.prototype.hasOwnProperty.call(v.constructor, "prototype")) {
                                    if (!0 === s) return null;
                                    if ("error" === a) throw SyntaxError("Object contains forbidden prototype property");
                                    delete v.constructor
                                }
                                for (var m in v) {
                                    var g = v[m];
                                    g && (void 0 === g ? "undefined" : o._(g)) === "object" && l.push(g)
                                }
                            }
                        } catch (e) {
                            d = !0, f = e
                        } finally {
                            try {
                                c || null == p.return || p.return()
                            } finally {
                                if (d) throw f
                            }
                        }
                    }
                    return e
                }

                function c(e, t, n) {
                    var r = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return l(e, t, n)
                    } finally {
                        Error.stackTraceLimit = r
                    }
                }
                e.exports = c, e.exports.default = c, e.exports.parse = c, e.exports.safeParse = function(e, t) {
                    var n = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return l(e, t, {
                            safe: !0
                        })
                    } catch (e) {
                        return
                    } finally {
                        Error.stackTraceLimit = n
                    }
                }, e.exports.scan = u
            }
        },
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var i = t[r] = {
            exports: {}
        };
        return e[r](i, i.exports, n), i.exports
    }
    n.m = e, n.n = function(e) {
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
        }, n.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, n.nc = void 0, n.rv = function() {
            return "1.7.12"
        }, n.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";

            function e(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function t(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function r(t, n) {
                if (t) {
                    if ("string" == typeof t) return e(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e(t, n)
                }
            }

            function o(n) {
                return function(t) {
                    if (Array.isArray(t)) return e(t)
                }(n) || t(n) || r(n) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x, S, E, I, T, C, P, A, _, N, R, O, k, M, L, D, B, j, F, H, U, z, G, V, W, K, q, X, Z, Y, $, Q, J, ee, et, en, er, eo, ei, ea, es, el, eu, ec, ed, ef, eh, ep, ev, em, eg, ey, eb, ew, ex, eS, eE, eI, eT, eC, eP, eA, e_, eN, eR, eO, ek, eM, eL, eD, eB, ej, eF, eH, eU, ez, eG, eV, eW, eK, eq, eX, eZ, eY, e$, eQ, eJ, e0, e1, e2, e5, e3, e4, e6, e8 = window.ReactJSX,
                e9 = window.Roblox["core-scripts"].util.ready,
                e7 = n.n(e9),
                te = window.Roblox["core-scripts"].react,
                tt = window.TanstackQuery,
                tn = {
                    MountSearchLanding: "MountSearchLanding",
                    ShowSearchLanding: "ShowSearchLanding",
                    UpdateSearchSessionInfo: "UpdateSearchSessionInfo",
                    SetSearchLandingHasContent: "SetSearchLandingHasContent"
                },
                tr = {
                    ModalEvent: tn,
                    mountSearchLanding: function() {
                        return new Promise(function() {
                            var e = new CustomEvent(tn.MountSearchLanding, {
                                detail: {}
                            });
                            window.dispatchEvent(e)
                        })
                    },
                    showSearchLanding: function(e) {
                        return new Promise(function() {
                            var t = new CustomEvent(tn.ShowSearchLanding, {
                                detail: {
                                    sessionInfo: e
                                }
                            });
                            window.dispatchEvent(t)
                        })
                    },
                    updateSessionInfo: function(e) {
                        return new Promise(function() {
                            var t = new CustomEvent(tn.UpdateSearchSessionInfo, {
                                detail: {
                                    sessionInfo: e
                                }
                            });
                            window.dispatchEvent(t)
                        })
                    },
                    setSearchLandingHasContent: function() {
                        return new Promise(function() {
                            var e = new CustomEvent(tn.SetSearchLandingHasContent, {});
                            window.dispatchEvent(e)
                        })
                    }
                },
                to = n(784);

            function ti(e) {
                if (Array.isArray(e)) return e
            }

            function ta() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ts(e, t) {
                return ti(e) || function(e, t) {
                    var n, r, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (o = o.call(e); !(a = (n = o.next()).done) && (i.push(n.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || r(e, t) || ta()
            }
            var tl = window.React,
                tu = n.n(tl);

            function tc(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function td(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        tc(e, t, n[t])
                    })
                }
                return e
            }
            var tf = window.Roblox["core-scripts"].environmentUrls,
                th = n.n(tf),
                tp = window.Roblox["core-lib"].http.index,
                tv = window.Roblox["core-lib"].url.index,
                tm = function() {
                    return tv.Url.parse(th().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                tg = function(e, t, n) {
                    try {
                        tp.postUntyped(e().withSearchParams(td({
                            name: t
                        }, n)), "", {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e4)
                        })
                    } catch (e) {}
                },
                ty = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    t.forEach(function(e) {
                        tg(tm, e)
                    })
                };

            function tb(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(t)).forEach(function(n) {
                    Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
                }), e
            }

            function tw(e) {
                return (tw = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function tx() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (tx = function() {
                    return !!e
                })()
            }
            var tS = n(844);

            function tE(e, t, n) {
                t = tw(t);
                var r = tx() ? Reflect.construct(t, n || [], tw(e).constructor) : t.apply(e, n);
                if (r && ("object" === (0, tS._)(r) || "function" == typeof r)) return r;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function tI(e, t) {
                if (!(0, to._)(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function tT(e, t) {
                return (tT = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function tC(e, t, n) {
                return (tC = tx() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var o = new(Function.bind.apply(e, r));
                    return n && tT(o, n.prototype), o
                }).apply(null, arguments)
            }

            function tP(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && tT(e, t)
            }

            function tA(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (tA = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return tC(e, arguments, tw(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), tT(n, e)
                })(e)
            }

            function t_(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function tN(e, t, n) {
                return t && t_(e.prototype, t), n && t_(e, n), e
            }

            function tR(e, t) {
                var n = t && t.cache ? t.cache : tD,
                    r = t && t.serializer ? t.serializer : tM;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var n, r, o = 1 === e.length ? tO : tk;
                    return n = t.cache.create(), r = t.serializer, o.bind(this, e, n, r)
                })(e, {
                    cache: n,
                    serializer: r
                })
            }

            function tO(e, t, n, r) {
                var o = null == r || "number" == typeof r || "boolean" == typeof r ? r : n(r),
                    i = t.get(o);
                return void 0 === i && (i = e.call(this, r), t.set(o, i)), i
            }

            function tk(e, t, n) {
                var r = Array.prototype.slice.call(arguments, 3),
                    o = n(r),
                    i = t.get(o);
                return void 0 === i && (i = e.apply(this, r), t.set(o, i)), i
            }
            var tM = function() {
                    return JSON.stringify(arguments)
                },
                tL = function() {
                    function e() {
                        tI(this, e), this.cache = Object.create(null)
                    }
                    return tN(e, [{
                        key: "get",
                        value: function(e) {
                            return this.cache[e]
                        }
                    }, {
                        key: "set",
                        value: function(e, t) {
                            this.cache[e] = t
                        }
                    }]), e
                }(),
                tD = {
                    create: function() {
                        return new tL
                    }
                },
                tB = {
                    variadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, tk.bind(this, e, n, r)
                    },
                    monadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, tO.bind(this, e, n, r)
                    }
                },
                tj = function(e) {
                    function t(e, n) {
                        tI(this, t);
                        var r, o = e;
                        return n && (o += ": " + n), (r = tE(this, t, [o])).code = e, n && (r.originalMessage = n), r
                    }
                    return tP(t, e), t
                }(tA(Error)),
                tF = ((y = tF || {}).MISSING_MESSAGE = "MISSING_MESSAGE", y.MISSING_FORMAT = "MISSING_FORMAT", y.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", y.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", y.INVALID_MESSAGE = "INVALID_MESSAGE", y.INVALID_KEY = "INVALID_KEY", y.FORMATTING_ERROR = "FORMATTING_ERROR", y);

            function tH(e, t) {
                return tR(e, {
                    cache: {
                        create: function() {
                            return {
                                get: function(e) {
                                    return t[e]
                                },
                                set: function(e, n) {
                                    t[e] = n
                                }
                            }
                        }
                    },
                    strategy: tB.variadic
                })
            }

            function tU(e, t) {
                return tH(function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return tC(e, o(n))
                }, t)
            }

            function tz(e, t) {
                if (null == e) return {};
                var n, r, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, n = Reflect.ownKeys(Object(e)); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var n, r, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) r = n[o], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                return i
            }

            function tG() {
                return (tG = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }).apply(this, arguments)
            }

            function tV(e) {
                if (null == e) throw TypeError("Cannot destructure " + e);
                return e
            }

            function tW(e) {
                return ti(e) || t(e) || r(e) || ta()
            }
            var tK = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                tq = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                tX = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                tZ = /^(@+)?(\+|#+)?[rs]?$/g,
                tY = /(\*)(0+)|(#+)(0+)|(0+)/g,
                t$ = /^(0+)$/;

            function tQ(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(tZ, function(e, n, r) {
                    return "string" != typeof r ? (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length) : "+" === r ? t.minimumSignificantDigits = n.length : "#" === n[0] ? t.maximumSignificantDigits = n.length : (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length + ("string" == typeof r ? r.length : 0)), ""
                }), t
            }

            function tJ(e) {
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

            function t0(e) {
                var t = tJ(e);
                return t || {}
            }
            var t1 = ((b = {})[b.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", b[b.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", b[b.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", b[b.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", b[b.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", b[b.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", b[b.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", b[b.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", b[b.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", b[b.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", b[b.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", b[b.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", b[b.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", b[b.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", b[b.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", b[b.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", b[b.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", b[b.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", b[b.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", b[b.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", b[b.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", b[b.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", b[b.INVALID_TAG = 23] = "INVALID_TAG", b[b.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", b[b.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", b[b.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", b);

            function t2(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, tS._)(e)) === "object" && 0 === e.type)
            }

            function t5(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, tS._)(e)) === "object" && 1 === e.type)
            }
            var t3 = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                t4 = {
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
                t6 = new RegExp("^".concat(t3.source, "*")),
                t8 = new RegExp("".concat(t3.source, "*$"));

            function t9(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var t7 = !!Object.fromEntries,
                ne = !!String.prototype.trimStart,
                nt = !!String.prototype.trimEnd,
                nn = t7 ? Object.fromEntries : function(e) {
                    var t = {},
                        n = !0,
                        r = !1,
                        o = void 0;
                    try {
                        for (var i, a = e[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                            var s = ts(i.value, 2),
                                l = s[0],
                                u = s[1];
                            t[l] = u
                        }
                    } catch (e) {
                        r = !0, o = e
                    } finally {
                        try {
                            n || null == a.return || a.return()
                        } finally {
                            if (r) throw o
                        }
                    }
                    return t
                },
                nr = ne ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(t6, "")
                },
                no = nt ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(t8, "")
                },
                ni = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                na = function() {
                    function e(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        tI(this, e), this.message = t, this.position = {
                            offset: 0,
                            line: 1,
                            column: 1
                        }, this.ignoreTag = !!n.ignoreTag, this.locale = n.locale, this.requiresOtherClause = !!n.requiresOtherClause, this.shouldParseSkeletons = !!n.shouldParseSkeletons
                    }
                    return tN(e, [{
                        key: "parse",
                        value: function() {
                            if (0 !== this.offset()) throw Error("parser can only be used once");
                            if (this.message.length > 0) {
                                var e = this.message.charCodeAt(0);
                                if (35 !== e && 39 !== e && 60 !== e && 123 !== e && 125 !== e) {
                                    var t = function(e) {
                                        if (0 === e.length) return null;
                                        for (var t = 1, n = 1, r = 0; r < e.length;) {
                                            var o = e.charCodeAt(r);
                                            switch (o) {
                                                case 35:
                                                case 39:
                                                case 60:
                                                case 123:
                                                case 125:
                                                    return null
                                            }
                                            if (10 === o) t++, n = 1, r++;
                                            else if (n++, o >= 55296 && o <= 56319 && r + 1 < e.length) {
                                                var i = e.charCodeAt(r + 1);
                                                r += i >= 56320 && i <= 57343 ? 2 : 1
                                            } else r++
                                        }
                                        return {
                                            offset: e.length,
                                            line: t,
                                            column: n
                                        }
                                    }(this.message);
                                    if (t) {
                                        var n = this.clonePosition();
                                        return this.position = t, {
                                            val: [{
                                                type: 0,
                                                value: this.message,
                                                location: t9(n, this.clonePosition())
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
                        value: function(e, t, n) {
                            for (var r = []; !this.isEOF();) {
                                var o = this.char();
                                if (123 === o) {
                                    var i = this.parseArgument(e, n);
                                    if (i.err) return i;
                                    r.push(i.val)
                                } else if (125 === o && e > 0) break;
                                else if (35 === o && ("plural" === t || "selectordinal" === t)) {
                                    var a = this.clonePosition();
                                    this.bump(), r.push({
                                        type: 7,
                                        location: t9(a, this.clonePosition())
                                    })
                                } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                    if (60 === o && !this.ignoreTag && ns(this.peek() || 0)) {
                                        var s = this.parseTag(e, t);
                                        if (s.err) return s;
                                        r.push(s.val)
                                    } else {
                                        var l = this.parseLiteral(e, t);
                                        if (l.err) return l;
                                        r.push(l.val)
                                    }
                                else if (!n) return this.error(26, t9(this.clonePosition(), this.clonePosition()));
                                else break
                            }
                            return {
                                val: r,
                                err: null
                            }
                        }
                    }, {
                        key: "parseTag",
                        value: function(e, t) {
                            var n = this.clonePosition();
                            this.bump();
                            var r = this.parseTagName();
                            if (this.bumpSpace(), this.bumpIf("/>")) return {
                                val: {
                                    type: 0,
                                    value: "<".concat(r, "/>"),
                                    location: t9(n, this.clonePosition())
                                },
                                err: null
                            };
                            if (!this.bumpIf(">")) return this.error(23, t9(n, this.clonePosition()));
                            var o = this.parseMessage(e + 1, t, !0);
                            if (o.err) return o;
                            var i = o.val,
                                a = this.clonePosition();
                            if (!this.bumpIf("</")) return this.error(27, t9(n, this.clonePosition()));
                            if (this.isEOF() || !ns(this.char())) return this.error(23, t9(a, this.clonePosition()));
                            var s = this.clonePosition();
                            return r !== this.parseTagName() ? this.error(26, t9(s, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                val: {
                                    type: 8,
                                    value: r,
                                    children: i,
                                    location: t9(n, this.clonePosition())
                                },
                                err: null
                            } : this.error(23, t9(a, this.clonePosition()))
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
                            for (var n = this.clonePosition(), r = "";;) {
                                var o = this.tryParseQuote(t);
                                if (o) {
                                    r += o;
                                    continue
                                }
                                var i = this.tryParseUnquoted(e, t);
                                if (i) {
                                    r += i;
                                    continue
                                }
                                var a = this.tryParseLeftAngleBracket();
                                if (a) {
                                    r += a;
                                    continue
                                }
                                break
                            }
                            return {
                                val: {
                                    type: 0,
                                    value: r,
                                    location: t9(n, this.clonePosition())
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseLeftAngleBracket",
                        value: function() {
                            var e;
                            return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (ns(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                            var t, n = [this.char()];
                            for (this.bump(); !this.isEOF();) {
                                var r = this.char();
                                if (39 === r)
                                    if (39 === this.peek()) n.push(39), this.bump();
                                    else {
                                        this.bump();
                                        break
                                    }
                                else n.push(r);
                                this.bump()
                            }
                            return (t = String).fromCodePoint.apply(t, o(n))
                        }
                    }, {
                        key: "tryParseUnquoted",
                        value: function(e, t) {
                            if (this.isEOF()) return null;
                            var n = this.char();
                            return 60 === n || 123 === n || 35 === n && ("plural" === t || "selectordinal" === t) || 125 === n && e > 0 ? null : (this.bump(), String.fromCodePoint(n))
                        }
                    }, {
                        key: "parseArgument",
                        value: function(e, t) {
                            var n = this.clonePosition();
                            if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, t9(n, this.clonePosition()));
                            if (125 === this.char()) return this.bump(), this.error(2, t9(n, this.clonePosition()));
                            var r = this.parseIdentifierIfPossible().value;
                            if (!r) return this.error(3, t9(n, this.clonePosition()));
                            if (this.bumpSpace(), this.isEOF()) return this.error(1, t9(n, this.clonePosition()));
                            switch (this.char()) {
                                case 125:
                                    return this.bump(), {
                                        val: {
                                            type: 1,
                                            value: r,
                                            location: t9(n, this.clonePosition())
                                        },
                                        err: null
                                    };
                                case 44:
                                    if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, t9(n, this.clonePosition()));
                                    return this.parseArgumentOptions(e, t, r, n);
                                default:
                                    return this.error(3, t9(n, this.clonePosition()))
                            }
                        }
                    }, {
                        key: "parseIdentifierIfPossible",
                        value: function() {
                            var e, t, n = this.clonePosition(),
                                r = this.offset(),
                                o = (e = this.message, ni.lastIndex = r, null != (t = ni.exec(e)[1]) ? t : ""),
                                i = r + o.length;
                            return this.bumpTo(i), {
                                value: o,
                                location: t9(n, this.clonePosition())
                            }
                        }
                    }, {
                        key: "parseArgumentOptions",
                        value: function(e, t, n, r) {
                            var o = this.clonePosition(),
                                i = this.parseIdentifierIfPossible().value,
                                a = this.clonePosition();
                            switch (i) {
                                case "":
                                    return this.error(4, t9(o, a));
                                case "number":
                                case "date":
                                case "time":
                                    this.bumpSpace();
                                    var s, l = null;
                                    if (this.bumpIf(",")) {
                                        this.bumpSpace();
                                        var u = this.clonePosition(),
                                            c = this.parseSimpleArgStyleIfPossible();
                                        if (c.err) return c;
                                        var d = no(c.val);
                                        if (0 === d.length) return this.error(6, t9(this.clonePosition(), this.clonePosition()));
                                        l = {
                                            style: d,
                                            styleLocation: t9(u, this.clonePosition())
                                        }
                                    }
                                    var f = this.tryParseArgumentClose(r);
                                    if (f.err) return f;
                                    var h = t9(r, this.clonePosition());
                                    if (l && l.style.startsWith("::")) {
                                        var p = nr(l.style.slice(2));
                                        if ("number" === i) {
                                            var v = this.parseNumberSkeletonFromString(p, l.styleLocation);
                                            if (v.err) return v;
                                            return {
                                                val: {
                                                    type: 2,
                                                    value: n,
                                                    location: h,
                                                    style: v.val
                                                },
                                                err: null
                                            }
                                        }
                                        if (0 === p.length) return this.error(10, h);
                                        var m, g = p;
                                        return this.locale && (g = function(e, t) {
                                            for (var n = "", r = 0; r < e.length; r++) {
                                                var o = e.charAt(r);
                                                if ("j" === o) {
                                                    for (var i = 0; r + 1 < e.length && e.charAt(r + 1) === o;) i++, r++;
                                                    var a = 1 + (1 & i),
                                                        s = i < 2 ? 1 : 3 + (i >> 1),
                                                        l = function(e) {
                                                            var t, n = e.hourCycle;
                                                            if (void 0 === n && e.hourCycles && e.hourCycles.length && (n = e.hourCycles[0]), n) switch (n) {
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
                                                            var r = e.language;
                                                            return "root" !== r && (t = e.maximize().region), (t4[t || ""] || t4[r || ""] || t4["".concat(r, "-001")] || t4["001"])[0]
                                                        }(t);
                                                    for (("H" == l || "k" == l) && (s = 0); s-- > 0;) n += "a";
                                                    for (; a-- > 0;) n = l + n
                                                } else "J" === o ? n += "H" : n += o
                                            }
                                            return n
                                        }(p, this.locale)), {
                                            val: {
                                                type: "date" === i ? 3 : 4,
                                                value: n,
                                                location: h,
                                                style: {
                                                    type: 1,
                                                    pattern: g,
                                                    location: l.styleLocation,
                                                    parsedOptions: this.shouldParseSkeletons ? (m = {}, g.replace(tK, function(e) {
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
                                            value: n,
                                            location: h,
                                            style: null != (s = null == l ? void 0 : l.style) ? s : null
                                        }, err: null
                                    };
                                case "plural":
                                case "selectordinal":
                                case "select":
                                    var y = this.clonePosition();
                                    if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, t9(y, td({}, y)));
                                    this.bumpSpace();
                                    var b = this.parseIdentifierIfPossible(),
                                        w = 0;
                                    if ("select" !== i && "offset" === b.value) {
                                        if (!this.bumpIf(":")) return this.error(13, t9(this.clonePosition(), this.clonePosition()));
                                        this.bumpSpace();
                                        var x = this.tryParseDecimalInteger(13, 14);
                                        if (x.err) return x;
                                        this.bumpSpace(), b = this.parseIdentifierIfPossible(), w = x.val
                                    }
                                    var S = this.tryParsePluralOrSelectOptions(e, i, t, b);
                                    if (S.err) return S;
                                    var E = this.tryParseArgumentClose(r);
                                    if (E.err) return E;
                                    var I = t9(r, this.clonePosition());
                                    if ("select" === i) return {
                                        val: {
                                            type: 5,
                                            value: n,
                                            options: nn(S.val),
                                            location: I
                                        },
                                        err: null
                                    };
                                    return {
                                        val: {
                                            type: 6,
                                            value: n,
                                            options: nn(S.val),
                                            offset: w,
                                            pluralType: "plural" === i ? "cardinal" : "ordinal",
                                            location: I
                                        }, err: null
                                    };
                                default:
                                    return this.error(5, t9(o, a))
                            }
                        }
                    }, {
                        key: "tryParseArgumentClose",
                        value: function(e) {
                            return this.isEOF() || 125 !== this.char() ? this.error(1, t9(e, this.clonePosition())) : (this.bump(), {
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
                                    var n = this.clonePosition();
                                    if (!this.bumpUntil("'")) return this.error(11, t9(n, this.clonePosition()));
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
                            var n = [];
                            try {
                                n = function(e) {
                                    if (0 === e.length) throw Error("Number skeleton cannot be empty");
                                    var t = e.split(tq).filter(function(e) {
                                            return e.length > 0
                                        }),
                                        n = [],
                                        r = !0,
                                        o = !1,
                                        i = void 0;
                                    try {
                                        for (var a, s = t[Symbol.iterator](); !(r = (a = s.next()).done); r = !0) {
                                            var l = a.value.split("/");
                                            if (0 === l.length) throw Error("Invalid number skeleton");
                                            var u = tW(l),
                                                c = u[0],
                                                d = u.slice(1),
                                                f = !0,
                                                h = !1,
                                                p = void 0;
                                            try {
                                                for (var v, m = d[Symbol.iterator](); !(f = (v = m.next()).done); f = !0) {
                                                    var g = v.value;
                                                    if (0 === g.length) throw Error("Invalid number skeleton")
                                                }
                                            } catch (e) {
                                                h = !0, p = e
                                            } finally {
                                                try {
                                                    f || null == m.return || m.return()
                                                } finally {
                                                    if (h) throw p
                                                }
                                            }
                                            n.push({
                                                stem: c,
                                                options: d
                                            })
                                        }
                                    } catch (e) {
                                        o = !0, i = e
                                    } finally {
                                        try {
                                            r || null == s.return || s.return()
                                        } finally {
                                            if (o) throw i
                                        }
                                    }
                                    return n
                                }(e)
                            } catch (e) {
                                return this.error(7, t)
                            }
                            return {
                                val: {
                                    type: 0,
                                    tokens: n,
                                    location: t,
                                    parsedOptions: this.shouldParseSkeletons ? function(e) {
                                        var t = {},
                                            n = !0,
                                            r = !1,
                                            o = void 0;
                                        try {
                                            for (var i, a = e[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                                                var s = i.value;
                                                switch (s.stem) {
                                                    case "percent":
                                                    case "%":
                                                        t.style = "percent";
                                                        continue;
                                                    case "%x100":
                                                        t.style = "percent", t.scale = 100;
                                                        continue;
                                                    case "currency":
                                                        t.style = "currency", t.currency = s.options[0];
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
                                                        t.style = "unit", t.unit = s.options[0].replace(/^(.*?)-/, "");
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
                                                        t = td(tb(td({}, t), {
                                                            notation: "scientific"
                                                        }), s.options.reduce(function(e, t) {
                                                            return td({}, e, t0(t))
                                                        }, {}));
                                                        continue;
                                                    case "engineering":
                                                        t = td(tb(td({}, t), {
                                                            notation: "engineering"
                                                        }), s.options.reduce(function(e, t) {
                                                            return td({}, e, t0(t))
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
                                                        t.scale = parseFloat(s.options[0]);
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
                                                        if (s.options.length > 1) throw RangeError("integer-width stems only accept a single optional option");
                                                        s.options[0].replace(tY, function(e, n, r, o, i, a) {
                                                            if (n) t.minimumIntegerDigits = r.length;
                                                            else if (o && i) throw Error("We currently do not support maximum integer digits");
                                                            else if (a) throw Error("We currently do not support exact integer digits");
                                                            return ""
                                                        });
                                                        continue
                                                }
                                                if (t$.test(s.stem)) {
                                                    t.minimumIntegerDigits = s.stem.length;
                                                    continue
                                                }
                                                if (tX.test(s.stem)) {
                                                    if (s.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                    s.stem.replace(tX, function(e, n, r, o, i, a) {
                                                        return "*" === r ? t.minimumFractionDigits = n.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : i && a ? (t.minimumFractionDigits = i.length, t.maximumFractionDigits = i.length + a.length) : (t.minimumFractionDigits = n.length, t.maximumFractionDigits = n.length), ""
                                                    });
                                                    var l = s.options[0];
                                                    "w" === l ? t = tb(td({}, t), {
                                                        trailingZeroDisplay: "stripIfInteger"
                                                    }) : l && (t = td({}, t, tQ(l)));
                                                    continue
                                                }
                                                if (tZ.test(s.stem)) {
                                                    t = td({}, t, tQ(s.stem));
                                                    continue
                                                }
                                                var u = tJ(s.stem);
                                                u && (t = td({}, t, u));
                                                var c = function(e) {
                                                    var t;
                                                    if ("E" === e[0] && "E" === e[1] ? (t = {
                                                            notation: "engineering"
                                                        }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                            notation: "scientific"
                                                        }, e = e.slice(1)), t) {
                                                        var n = e.slice(0, 2);
                                                        if ("+!" === n ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === n && (t.signDisplay = "exceptZero", e = e.slice(2)), !t$.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                        t.minimumIntegerDigits = e.length
                                                    }
                                                    return t
                                                }(s.stem);
                                                c && (t = td({}, t, c))
                                            }
                                        } catch (e) {
                                            r = !0, o = e
                                        } finally {
                                            try {
                                                n || null == a.return || a.return()
                                            } finally {
                                                if (r) throw o
                                            }
                                        }
                                        return t
                                    }(n) : {}
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParsePluralOrSelectOptions",
                        value: function(e, t, n, r) {
                            for (var o = !1, i = [], a = new Set, s = r.value, l = r.location;;) {
                                if (0 === s.length) {
                                    var u, c = this.clonePosition();
                                    if ("select" !== t && this.bumpIf("=")) {
                                        var d = this.tryParseDecimalInteger(16, 19);
                                        if (d.err) return d;
                                        l = t9(c, this.clonePosition()), s = this.message.slice(c.offset, this.offset())
                                    } else break
                                }
                                if (a.has(s)) return this.error("select" === t ? 21 : 20, l);
                                "other" === s && (o = !0), this.bumpSpace();
                                var f = this.clonePosition();
                                if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, t9(this.clonePosition(), this.clonePosition()));
                                var h = this.parseMessage(e + 1, t, n);
                                if (h.err) return h;
                                var p = this.tryParseArgumentClose(f);
                                if (p.err) return p;
                                i.push([s, {
                                    value: h.val,
                                    location: t9(f, this.clonePosition())
                                }]), a.add(s), this.bumpSpace(), s = (u = this.parseIdentifierIfPossible()).value, l = u.location
                            }
                            return 0 === i.length ? this.error("select" === t ? 15 : 16, t9(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, t9(this.clonePosition(), this.clonePosition())) : {
                                val: i,
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseDecimalInteger",
                        value: function(e, t) {
                            var n = 1,
                                r = this.clonePosition();
                            this.bumpIf("+") || this.bumpIf("-") && (n = -1);
                            for (var o = !1, i = 0; !this.isEOF();) {
                                var a = this.char();
                                if (a >= 48 && a <= 57) o = !0, i = 10 * i + (a - 48), this.bump();
                                else break
                            }
                            var s = t9(r, this.clonePosition());
                            return o ? Number.isSafeInteger(i *= n) ? {
                                val: i,
                                err: null
                            } : this.error(t, s) : this.error(e, s)
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
                                n = this.message.indexOf(e, t);
                            return n >= 0 ? (this.bumpTo(n), !0) : (this.bumpTo(this.message.length), !1)
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
                                n = this.offset();
                            return null != (e = this.message.charCodeAt(n + (t >= 65536 ? 2 : 1))) ? e : null
                        }
                    }]), e
                }();

            function ns(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }
            var nl = function(e) {
                    function t(e, n, r) {
                        var o;
                        return tI(this, t), (o = tE(this, t, [e])).code = n, o.originalMessage = r, o
                    }
                    return tP(t, e), tN(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(tA(Error)),
                nu = function(e) {
                    function t(e, n, r, o) {
                        return tI(this, t), tE(this, t, ['Invalid values for "'.concat(e, '": "').concat(n, '". Options are "').concat(Object.keys(r).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return tP(t, e), t
                }(nl),
                nc = function(e) {
                    function t(e, n, r) {
                        return tI(this, t), tE(this, t, ['Value for "'.concat(e, '" must be of type ').concat(n), "INVALID_VALUE", r])
                    }
                    return tP(t, e), t
                }(nl),
                nd = function(e) {
                    function t(e, n) {
                        return tI(this, t), tE(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(n, '"'), "MISSING_VALUE", n])
                    }
                    return tP(t, e), t
                }(nl);

            function nf(e) {
                return {
                    create: function() {
                        return {
                            get: function(t) {
                                return e[t]
                            },
                            set: function(t, n) {
                                e[t] = n
                            }
                        }
                    }
                }
            }
            var nh = ((eU = function() {
                function e(t) {
                    var n, r = this,
                        i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        a = arguments.length > 2 ? arguments[2] : void 0,
                        s = arguments.length > 3 ? arguments[3] : void 0;
                    if (tI(this, e), this.formatterCache = {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        }, this.format = function(e) {
                            var t = r.formatToParts(e);
                            if (1 === t.length) return t[0].value;
                            var n = t.reduce(function(e, t) {
                                return e.length && 0 === t.type && "string" == typeof e[e.length - 1] ? e[e.length - 1] += t.value : e.push(t.value), e
                            }, []);
                            return n.length <= 1 ? n[0] || "" : n
                        }, this.formatToParts = function(e) {
                            return function e(t, n, r, i, a, s, l) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var u = [],
                                    c = !0,
                                    d = !1,
                                    f = void 0;
                                try {
                                    for (var h, p = t[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                                        var v = h.value;
                                        if (0 === v.type) {
                                            u.push({
                                                type: 0,
                                                value: v.value
                                            });
                                            continue
                                        }
                                        if (7 === v.type) {
                                            "number" == typeof s && u.push({
                                                type: 0,
                                                value: r.getNumberFormat(n).format(s)
                                            });
                                            continue
                                        }
                                        var m = v.value;
                                        if (!(a && m in a)) throw new nd(m, l);
                                        var g = a[m];
                                        if (1 === v.type) {
                                            g && "string" != typeof g && "number" != typeof g && (void 0 === g ? "undefined" : (0, tS._)(g)) !== "bigint" || (g = "string" == typeof g || "number" == typeof g || (void 0 === g ? "undefined" : (0, tS._)(g)) === "bigint" ? String(g) : ""), u.push({
                                                type: +("string" != typeof g),
                                                value: g
                                            });
                                            continue
                                        }
                                        if (3 === v.type) {
                                            var y = "string" == typeof v.style ? i.date[v.style] : t5(v.style) ? v.style.parsedOptions : void 0;
                                            u.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, y).format(g)
                                            });
                                            continue
                                        }
                                        if (4 === v.type) {
                                            var b = "string" == typeof v.style ? i.time[v.style] : t5(v.style) ? v.style.parsedOptions : i.time.medium;
                                            u.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, b).format(g)
                                            });
                                            continue
                                        }
                                        if (2 === v.type) {
                                            var w = "string" == typeof v.style ? i.number[v.style] : t2(v.style) ? v.style.parsedOptions : void 0;
                                            if (w && w.scale) {
                                                var x = w.scale || 1;
                                                if ((void 0 === g ? "undefined" : (0, tS._)(g)) === "bigint") {
                                                    if (!Number.isInteger(x)) throw TypeError("Cannot apply fractional scale ".concat(x, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    g *= BigInt(x)
                                                } else g *= x
                                            }
                                            u.push({
                                                type: 0,
                                                value: r.getNumberFormat(n, w).format(g)
                                            });
                                            continue
                                        }
                                        if (8 === v.type) {
                                            var S = v.children,
                                                E = v.value,
                                                I = a[E];
                                            if ("function" != typeof I) throw new nc(E, "function", l);
                                            var T = I(e(S, n, r, i, a, s).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(T) || (T = [T]), u.push.apply(u, o(T.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === v.type) {
                                            var C = g,
                                                P = (Object.prototype.hasOwnProperty.call(v.options, C) ? v.options[C] : void 0) || v.options.other;
                                            if (!P) throw new nu(v.value, g, Object.keys(v.options), l);
                                            u.push.apply(u, o(e(P.value, n, r, i, a)));
                                            continue
                                        }
                                        if (6 === v.type) {
                                            var A = "=".concat(g),
                                                _ = Object.prototype.hasOwnProperty.call(v.options, A) ? v.options[A] : void 0;
                                            if (!_) {
                                                if (!Intl.PluralRules) throw new nl('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var N = (void 0 === g ? "undefined" : (0, tS._)(g)) === "bigint" ? Number(g) : g,
                                                    R = r.getPluralRules(n, {
                                                        type: v.pluralType
                                                    }).select(N - (v.offset || 0));
                                                _ = (Object.prototype.hasOwnProperty.call(v.options, R) ? v.options[R] : void 0) || v.options.other
                                            }
                                            if (!_) throw new nu(v.value, g, Object.keys(v.options), l);
                                            var O = (void 0 === g ? "undefined" : (0, tS._)(g)) === "bigint" ? Number(g) : g;
                                            u.push.apply(u, o(e(_.value, n, r, i, a, O - (v.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    d = !0, f = e
                                } finally {
                                    try {
                                        c || null == p.return || p.return()
                                    } finally {
                                        if (d) throw f
                                    }
                                }
                                return u.length < 2 ? u : u.reduce(function(e, t) {
                                    var n = e[e.length - 1];
                                    return n && 0 === n.type && 0 === t.type ? n.value += t.value : e.push(t), e
                                }, [])
                            }(r.ast, r.locales, r.formatters, r.formats, e, void 0, r.message)
                        }, this.resolvedOptions = function() {
                            var e;
                            return {
                                locale: (null == (e = r.resolvedLocale) ? void 0 : e.toString()) || Intl.NumberFormat.supportedLocalesOf(r.locales)[0]
                            }
                        }, this.getAst = function() {
                            return r.ast
                        }, this.locales = i, this.resolvedLocale = e.resolveLocale(i), "string" == typeof t) {
                        if (this.message = t, !e.__parse) throw TypeError("IntlMessageFormat.__parse must be set to process `message` of type `string`");
                        var l = s || {},
                            u = (tV(l), tG({}, l));
                        this.ast = e.__parse(t, tb(td({}, u), {
                            locale: this.resolvedLocale
                        }))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (n = e.formats, a ? Object.keys(n).reduce(function(e, t) {
                        var r, o;
                        return e[t] = (r = n[t], (o = a[t]) ? td({}, r, o, Object.keys(r).reduce(function(e, t) {
                            return e[t] = td({}, r[t], o[t]), e
                        }, {})) : r), e
                    }, td({}, n)) : n), this.formatters = s && s.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: tR(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tC(Intl.NumberFormat, o(t))
                            }, {
                                cache: nf(e.number),
                                strategy: tB.variadic
                            }),
                            getDateTimeFormat: tR(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tC(Intl.DateTimeFormat, o(t))
                            }, {
                                cache: nf(e.dateTime),
                                strategy: tB.variadic
                            }),
                            getPluralRules: tR(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tC(Intl.PluralRules, o(t))
                            }, {
                                cache: nf(e.pluralRules),
                                strategy: tB.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return tN(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, eU.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, eU.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = new na(e, t = td({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (n.err) {
                    var r = SyntaxError(t1[n.err.kind]);
                    throw r.location = n.err.location, r.originalMessage = n.err.message, r
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var n in t.options) delete t.options[n].location, e(t.options[n].value);
                        else 2 === t.type && t2(t.style) || (3 === t.type || 4 === t.type) && t5(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(n.val), n.val
            }, eU.formats = {
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
            }, eU);

            function np() {
                for (var e, t, n, r, o, i = arguments.length, a = Array(i), s = 0; s < i; s++) a[s] = arguments[s];
                var l = ts(a, 4),
                    u = (l[0], l[1]),
                    c = l[2],
                    d = l[3];
                if (Array.isArray(u)) throw new tj(tF.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === u ? "undefined" : (0, tS._)(u))) throw new tj(tF.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof u) {
                    var f = c || /'[{}<#|']/.test(u) ? void 0 : u;
                    if (f) return f
                }
                var h = d.cache,
                    p = d.formats,
                    v = d.formatters,
                    m = d.globalFormats,
                    g = d.locale,
                    y = d.timeZone;
                v.getMessageFormat || (v.getMessageFormat = tH(function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return new nh(t[0], t[1], t[2], td({
                        formatters: v
                    }, t[3]))
                }, h.message));
                try {
                    o = v.getMessageFormat(u, g, (e = nh.formats.date, t = nh.formats.time, n = td({}, null == m ? void 0 : m.dateTime, null == p ? void 0 : p.dateTime), r = {
                        date: td({}, e, n),
                        time: td({}, t, n),
                        number: td({}, null == m ? void 0 : m.number, null == p ? void 0 : p.number)
                    }, y && ["date", "time"].forEach(function(e) {
                        var t = r[e],
                            n = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, s = Object.entries(t)[Symbol.iterator](); !(n = (a = s.next()).done); n = !0) {
                                var l = ts(a.value, 2),
                                    u = l[0],
                                    c = l[1];
                                t[u] = td({
                                    timeZone: y
                                }, c)
                            }
                        } catch (e) {
                            o = !0, i = e
                        } finally {
                            try {
                                n || null == s.return || s.return()
                            } finally {
                                if (o) throw i
                            }
                        }
                    }), r), {
                        formatters: tb(td({}, v), {
                            getDateTimeFormat: function(e, t) {
                                var n;
                                return v.getDateTimeFormat(e, tb(td({}, t), {
                                    timeZone: null != (n = null == t ? void 0 : t.timeZone) ? n : y
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new tj(tF.INVALID_MESSAGE, void 0)
                }
                var b = o.format(c);
                return (0, tl.isValidElement)(b) || Array.isArray(b) || "string" == typeof b ? b : String(b)
            }

            function nv() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return t.filter(Boolean).join(".")
            }

            function nm(e) {
                return nv(e.namespace, e.key)
            }

            function ng(e) {
                console.error(e)
            }

            function ny(e, t, n, r) {
                var o = nv(r, n);
                if (!t) throw Error(o);
                var i = t;
                return n.split(".").forEach(function(t) {
                    var n = i[t];
                    if (null == t || null == n) throw Error(o + " (".concat(e, ")"));
                    i = n
                }), i
            }
            np.raw = !0;
            var nb = (0, tl.createContext)(void 0);

            function nw(e) {
                var t = e.children,
                    n = e.formats,
                    r = e.getMessageFallback,
                    o = e.locale,
                    i = e.messages,
                    a = e.now,
                    s = e.onError,
                    l = e.timeZone,
                    u = (0, tl.useContext)(nb),
                    c = (0, tl.useMemo)(function() {
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
                    d = (0, tl.useMemo)(function() {
                        return (null == u ? void 0 : u.formatters) || {
                            getDateTimeFormat: tU(Intl.DateTimeFormat, c.dateTime),
                            getNumberFormat: tU(Intl.NumberFormat, c.number),
                            getPluralRules: tU(Intl.PluralRules, c.pluralRules),
                            getRelativeTimeFormat: tU(Intl.RelativeTimeFormat, c.relativeTime),
                            getListFormat: tU(Intl.ListFormat, c.list),
                            getDisplayNames: tU(Intl.DisplayNames, c.displayNames)
                        }
                    }, [c, null == u ? void 0 : u.formatters]),
                    f = (0, tl.useMemo)(function() {
                        var e, t, f, h, p;
                        return tb(td({}, (t = (e = {
                            locale: o,
                            formats: void 0 === n ? null == u ? void 0 : u.formats : n,
                            getMessageFallback: r || (null == u ? void 0 : u.getMessageFallback),
                            messages: void 0 === i ? null == u ? void 0 : u.messages : i,
                            now: a || (null == u ? void 0 : u.now),
                            onError: s || (null == u ? void 0 : u.onError),
                            timeZone: l || (null == u ? void 0 : u.timeZone)
                        }).formats, f = e.getMessageFallback, h = e.messages, p = e.onError, tb(td({}, tz(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: h || void 0,
                            onError: p || ng,
                            getMessageFallback: f || nm
                        }))), {
                            formatters: d,
                            cache: c
                        })
                    }, [c, n, d, r, o, i, a, s, u, l]);
                return (0, e8.jsx)(nb.Provider, {
                    value: f,
                    children: t
                })
            }

            function nx() {
                var e = (0, tl.useContext)(nb);
                if (!e) throw Error(void 0);
                return e
            }
            var nS = !1,
                nE = "u" < typeof window,
                nI = "__FN_nvfToKPAOuiV__",
                nT = "__FN_END_nvfToKPAOuiV__",
                nC = new RegExp("".concat(nI, "(\\d+)\\|")),
                nP = new RegExp("".concat(nT, "(\\d+)\\|")),
                nA = function(e, t, n) {
                    var r = td({}, n),
                        i = {};
                    t.forEach(function(e, t) {
                        var n = t.toString(),
                            o = "".concat(nI).concat(n, "|"),
                            a = "".concat(nT).concat(n, "|");
                        r[e.opening] = o, r[e.closing] = a, i[n] = {
                            start: o,
                            end: a,
                            render: e.render
                        }
                    });
                    var a = function(e) {
                            var t = [],
                                n = nC.exec(e),
                                r = nP.exec(e);
                            if (r && (!n || r.index < n.index)) return null;
                            if (!n) return [e];
                            n.index > 0 && t.push(e.slice(0, n.index));
                            var s = null == n[1] ? void 0 : i[n[1]];
                            if (null == s) return null;
                            var l = e.indexOf(s.end);
                            if (l < n.index + n[0].length) return null;
                            var u = a(e.slice(n.index + n[0].length, l));
                            if (null == u) return null;
                            t.push(s.render(u));
                            var c = e.slice(l + s.end.length);
                            if (c.length > 0) {
                                var d = a(c);
                                if (null == d) return null;
                                t.push.apply(t, o(d))
                            }
                            return t
                        },
                        s = a(e(r));
                    return null == s ? null : s.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, e8.jsx)(tl.Fragment, {
                            children: e
                        }, t)
                    })
                },
                n_ = function(e) {
                    return e.replaceAll(".", ":")
                };

            function nN(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, o)
            }

            function nR(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            nN(i, r, o, a, s, "next", e)
                        }

                        function s(e) {
                            nN(i, r, o, a, s, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nO(e, t) {
                var n, r, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(a, "next", {
                    value: l(0)
                }), s(a, "throw", {
                    value: l(1)
                }), s(a, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && s(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function l(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                            if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, u[1])).done) return o;
                            switch (r = 0, o && (u = [2 & u[0], o.value]), u[0]) {
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
                                    i.label++, r = u[1], u = [0];
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
                            u = [6, e], r = 0
                        } finally {
                            n = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function nk() {
                return null != ez || (ez = "".concat(th().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), ez
            }
            var nM = function() {},
                nL = function(e, t) {
                    return e << 3 | t
                },
                nD = nL(1, 2),
                nB = nL(2, 2),
                nj = nL(5, 2),
                nF = nL(6, 2),
                nH = nL(8, 2),
                nU = nL(1, 2),
                nz = nL(2, 1),
                nG = nL(3, 0),
                nV = nL(5, 2);
            nL(1, 2), nL(2, 1), nL(3, 0), nL(4, 2), nL(5, 2), nL(6, 0), nL(8, 2);
            var nW = nL(4, 0),
                nK = nL(6, 2),
                nq = nL(7, 2);
            nL(1, 0), nL(2, 2);
            var nX = nL(1, 2),
                nZ = nL(2, 2),
                nY = nL(1, 2);
            nL(1, 2), nL(2, 2), nL(1, 2);
            var n$ = new TextEncoder,
                nQ = function() {
                    function e() {
                        tI(this, e), tc(this, "buf", [])
                    }
                    return tN(e, [{
                        key: "writeVarint",
                        value: function(e) {
                            var t = (void 0 === e ? "undefined" : (0, tS._)(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                            this.buf.push(Number(t))
                        }
                    }, {
                        key: "writeString",
                        value: function(e) {
                            var t = n$.encode(e);
                            this.writeVarint(t.length);
                            var n = !0,
                                r = !1,
                                o = void 0;
                            try {
                                for (var i, a = t[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                                    var s = i.value;
                                    this.buf.push(s)
                                }
                            } catch (e) {
                                r = !0, o = e
                            } finally {
                                try {
                                    n || null == a.return || a.return()
                                } finally {
                                    if (r) throw o
                                }
                            }
                        }
                    }, {
                        key: "writeBytes",
                        value: function(e) {
                            this.writeVarint(e.length);
                            var t = !0,
                                n = !1,
                                r = void 0;
                            try {
                                for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) {
                                    var a = o.value;
                                    this.buf.push(a)
                                }
                            } catch (e) {
                                n = !0, r = e
                            } finally {
                                try {
                                    t || null == i.return || i.return()
                                } finally {
                                    if (n) throw r
                                }
                            }
                        }
                    }, {
                        key: "writeDouble",
                        value: function(e) {
                            var t = new DataView(new ArrayBuffer(8));
                            t.setFloat64(0, e, !0);
                            for (var n = 0; n < 8; n += 1) this.buf.push(t.getUint8(n))
                        }
                    }, {
                        key: "toBytes",
                        value: function() {
                            return new Uint8Array(this.buf)
                        }
                    }]), e
                }();

            function nJ(e, t, n) {
                var r = new nQ;
                return r.writeVarint(nL(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
            }

            function n0(e) {
                var t = new nQ;
                if (t.writeVarint(nU), t.writeString(e.name), t.writeVarint(nz), t.writeDouble(e.value), t.writeVarint(nG), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var n = function(e) {
                        var t = new nQ,
                            n = !0,
                            r = !1,
                            o = void 0;
                        try {
                            for (var i, a = Object.entries(e)[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) ! function() {
                                var e = ts(i.value, 2),
                                    n = e[0],
                                    r = e[1];
                                if ("string" == typeof r) {
                                    var o = nJ(n, nL(2, 2), function(e) {
                                        e.writeString(r)
                                    });
                                    t.writeVarint(nj), t.writeBytes(o)
                                } else if ("boolean" == typeof r) {
                                    var a = nJ(n, nL(2, 0), function(e) {
                                        e.writeVarint(+!!r)
                                    });
                                    t.writeVarint(nF), t.writeBytes(a)
                                } else if ((void 0 === r ? "undefined" : (0, tS._)(r)) === "bigint") {
                                    var s = nJ(n, nL(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(nB), t.writeBytes(s)
                                } else if ("number" == typeof r)
                                    if (Number.isFinite(r))
                                        if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                            var l = nJ(n, nL(2, 0), function(e) {
                                                e.writeVarint(r)
                                            });
                                            t.writeVarint(nD), t.writeBytes(l)
                                        } else if (Number.isInteger(r)) {
                                    var u = nJ(n, nL(2, 0), function(e) {
                                        e.writeVarint(BigInt(r))
                                    });
                                    t.writeVarint(nB), t.writeBytes(u)
                                } else {
                                    var c = nJ(n, nL(2, 1), function(e) {
                                        e.writeDouble(r)
                                    });
                                    t.writeVarint(nH), t.writeBytes(c)
                                } else {
                                    var d = nJ(n, nL(2, 2), function(e) {
                                        e.writeString(String(r))
                                    });
                                    t.writeVarint(nj), t.writeBytes(d)
                                }
                            }()
                        } catch (e) {
                            r = !0, o = e
                        } finally {
                            try {
                                n || null == a.return || a.return()
                            } finally {
                                if (r) throw o
                            }
                        }
                        return t.toBytes()
                    }(e.attributes);
                    t.writeVarint(nV), t.writeBytes(n)
                }
                return t.toBytes()
            }

            function n1(e, t, n) {
                var r = new nQ;
                r.writeVarint(nW), r.writeVarint(n);
                var o = !0,
                    i = !1,
                    a = void 0;
                try {
                    for (var s, l = e[Symbol.iterator](); !(o = (s = l.next()).done); o = !0) {
                        var u = s.value;
                        r.writeVarint(nK), r.writeBytes(u)
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
                    d = !1,
                    f = void 0;
                try {
                    for (var h, p = t[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                        var v = h.value;
                        r.writeVarint(nq), r.writeBytes(v)
                    }
                } catch (e) {
                    d = !0, f = e
                } finally {
                    try {
                        c || null == p.return || p.return()
                    } finally {
                        if (d) throw f
                    }
                }
                return r.toBytes()
            }

            function n2(e) {
                var t = new nQ;
                t.writeVarint(nX), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(nZ), t.writeBytes(e);
                var n = t.toBytes(),
                    r = new nQ;
                return r.writeVarint(nY), r.writeBytes(n), r.toBytes()
            }
            var n5 = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function n3(e) {
                return n5.test(e)
            }
            var n4 = [],
                n6 = !1,
                n8 = !1;

            function n9(e, t) {
                var n, r, o = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    i = BigInt(Date.now());
                !0 === t || n8 || "u" > typeof document && "hidden" === document.visibilityState ? (n = n2(n1(o.map(n0), [], i)).buffer, fetch("".concat(nk()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: n,
                    credentials: "include",
                    keepalive: !0
                }).catch(nM)) : (r = n2(n1(o.map(n0), [], i)), nR(function() {
                    var e, t, n, o, i, a, s, l, u, c, d, f, h;
                    return nO(this, function(p) {
                        switch (p.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: r.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(r).catch(nM), t.close().catch(nM), n = [], [4, (o = e.readable.getReader()).read()];
                            case 1:
                                i = p.sent(), p.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return n.push(i.value), [4, o.read()];
                            case 3:
                                return i = p.sent(), [3, 2];
                            case 4:
                                a = new Uint8Array(n.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), s = 0, l = !0, u = !1, c = void 0;
                                try {
                                    for (d = n[Symbol.iterator](); !(l = (f = d.next()).done); l = !0) h = f.value, a.set(h, s), s += h.length
                                } catch (e) {
                                    u = !0, c = e
                                } finally {
                                    try {
                                        l || null == d.return || d.return()
                                    } finally {
                                        if (u) throw c
                                    }
                                }
                                return [2, {
                                    body: a.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                })()).then(function(e) {
                    var t = e.body,
                        n = e.compressed,
                        r = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return n && (r["Content-Encoding"] = "gzip"), fetch("".concat(nk()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: r,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(nM)
            }

            function n7() {
                var e = !0,
                    t = !1,
                    n = void 0;
                try {
                    for (var r, o = n4[Symbol.iterator](); !(e = (r = o.next()).done); e = !0) {
                        var i = r.value.splice(0);
                        0 !== i.length && n9(i, !0)
                    }
                } catch (e) {
                    t = !0, n = e
                } finally {
                    try {
                        e || null == o.return || o.return()
                    } finally {
                        if (t) throw n
                    }
                }
            }
            var re = "WwwCommon",
                rt = function(e) {
                    var t = e.publish,
                        n = e.captureException,
                        r = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var i = (0, to._)(o, Error) ? o.name || "Error" : "UnknownError",
                                a = r ? "".concat(r, "_").concat(e) : e;
                            return null == n || n(o, {
                                error_counter: a
                            }), tb(td({}, t), {
                                errorType: i
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var o = ts(n, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = ts(n, 3),
                                a = i[0],
                                s = i[1],
                                l = i[2],
                                u = o(a, tb(td({}, null != s ? s : {}), {
                                    severity: "error"
                                }), l);
                            t(a, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = ts(n, 3),
                                a = i[0],
                                s = i[1],
                                l = i[2],
                                u = o(a, tb(td({}, null != s ? s : {}), {
                                    severity: "critical"
                                }), l);
                            t(a, u)
                        }
                    }
                }({
                    publish: function(e) {
                        var t, n = Math.max(1, 10),
                            r = 250;

                        function o(e, t) {
                            console.error(e, t)
                        }
                        if (!n3(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                                name: e
                            }),
                            function() {};
                        var i = [];
                        return n4.push(i), n6 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                                "hidden" === document.visibilityState && n7()
                            }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                                n8 = !0, n7()
                            }), n6 = !0),
                            function(a, s, l) {
                                var u = "".concat(e, "_").concat(a);
                                if (! function(e, t) {
                                        if (!n3(e)) return !1;
                                        if (t) {
                                            var n = !0,
                                                r = !1,
                                                o = void 0;
                                            try {
                                                for (var i, a = Object.keys(t)[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                                                    var s = i.value;
                                                    if (!n3(s)) return !1
                                                }
                                            } catch (e) {
                                                r = !0, o = e
                                            } finally {
                                                try {
                                                    n || null == a.return || a.return()
                                                } finally {
                                                    if (r) throw o
                                                }
                                            }
                                        }
                                        return !0
                                    }(u, s)) return void o("@rbx/web-telemetry: invalid event name or attribute key", {
                                    name: a,
                                    attributes: s
                                });
                                var c = null != l ? l : 1;
                                if (!Number.isFinite(c)) return void o("@rbx/web-telemetry: value must be a finite number", {
                                    name: a,
                                    attributes: s
                                });
                                var d = s && Object.keys(s).length > 0 ? s : void 0;
                                i.push({
                                    name: u,
                                    attributes: d,
                                    value: c,
                                    timestampMs: BigInt(Date.now())
                                }), i.length >= n ? (void 0 !== t && (clearTimeout(t), t = void 0), n9(i.splice(0, n))) : void 0 === t && (t = setTimeout(function() {
                                    for (t = void 0; i.length > 0;) n9(i.splice(0, n))
                                }, r))
                            }
                    }(re)
                });
            rt.trackCounter;
            var rn = rt.trackError;
            rt.trackCriticalError;
            var rr = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                ro = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                ri = function(e, t, n) {
                    var r;
                    "u" > typeof window && rn(e, {
                        key: n,
                        namespace: t,
                        internalPageName: null != (r = rr()) ? r : "unknown"
                    })
                },
                ra = function(e) {
                    var t, n, r, o, i, a, s, l, u, c, d, f, h, p = (t = n_(e), n = {
                        "!": nx().messages
                    }, r = t ? "!.".concat(t) : "!", i = (o = nx()).cache, a = o.formats, s = o.formatters, l = o.getMessageFallback, u = o.locale, c = o.onError, d = o.timeZone, f = n["!"], h = "!" === r ? void 0 : r.slice(2), d || nS || !nE || (nS = !0, c(new tj(tF.ENVIRONMENT_FALLBACK, void 0))), (0, tl.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, n) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var r = n ? ny(e, t, n) : t;
                                    if (!r) throw Error(n);
                                    return r
                                } catch (e) {
                                    return new tj(tF.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: i,
                                formatters: s,
                                getMessageFallback: l,
                                messages: f,
                                namespace: h,
                                onError: c,
                                formats: a,
                                locale: u,
                                timeZone: d
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    n = e.formats,
                                    r = e.formatters,
                                    o = e.getMessageFallback,
                                    i = void 0 === o ? nm : o,
                                    a = e.locale,
                                    s = e.messagesOrError,
                                    l = e.namespace,
                                    u = e.onError,
                                    c = e.timeZone,
                                    d = (0, to._)(s, tj);

                                function f(e, t, n, r) {
                                    var o = new tj(t, n);
                                    return u(o), null != r ? r : i({
                                        error: o,
                                        key: e,
                                        namespace: l
                                    })
                                }

                                function h(e, o, h, p) {
                                    var v, m, g;
                                    if (d) {
                                        if (!p) return u(s), i({
                                            error: s,
                                            key: e,
                                            namespace: l
                                        });
                                        v = p
                                    } else try {
                                        v = ny(a, s, e, l)
                                    } catch (t) {
                                        if (!p) return f(e, tF.MISSING_MESSAGE, t.message, p);
                                        v = p
                                    }
                                    try {
                                        var y, b = nv(l, e);
                                        return np(b, v, o ? (y = {}, Object.keys(o).forEach(function(e) {
                                            var t, n = 0,
                                                r = o[e];
                                            t = "function" == typeof r ? function(t) {
                                                var o = r(t);
                                                return (0, tl.isValidElement)(o) ? (0, tl.cloneElement)(o, {
                                                    key: e + n++
                                                }) : o
                                            } : r, y[e] = t
                                        }), y) : o, {
                                            cache: t,
                                            formatters: r,
                                            globalFormats: n,
                                            formats: h,
                                            locale: a,
                                            timeZone: c
                                        })
                                    } catch (t) {
                                        return (0, to._)(t, tj) ? (m = t.code, g = t.originalMessage) : (m = tF.FORMATTING_ERROR, g = t.message), f(e, m, g, p)
                                    }
                                }

                                function p(e, t, n, r) {
                                    var o = h(e, t, n, r);
                                    return "string" != typeof o ? f(e, tF.INVALID_MESSAGE, void 0) : o
                                }
                                return p.rich = h, p.markup = function(e, t, n, r) {
                                    return h(e, t, n, r)
                                }, p.raw = function(e) {
                                    if (d) return u(s), i({
                                        error: s,
                                        key: e,
                                        namespace: l
                                    });
                                    try {
                                        return ny(a, s, e, l)
                                    } catch (t) {
                                        return f(e, tF.MISSING_MESSAGE, t.message)
                                    }
                                }, p.has = function(e) {
                                    if (d) return !1;
                                    try {
                                        return ny(a, s, e, l), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, p
                            }(tb(td({}, e), {
                                messagesOrError: t
                            }))
                    }, [i, s, l, f, h, c, a, u, d]));
                    return (0, tl.useMemo)(function() {
                        return Object.assign(function(t, n, r) {
                            var o = n_(t);
                            return void 0 === r || p.has(o) ? p(o, n) : (ri("TranslationKeyNotFound", e, o), r)
                        }, {
                            rich: function(e, t) {
                                return p.rich(n_(e), t)
                            },
                            has: function(e) {
                                return ro(e) && p.has(n_(e))
                            },
                            dynamic: function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!ro(t)) return ri("TranslationKeyNotFound", e, String(t)), r;
                                var o = n_(t),
                                    i = p.has(o);
                                return i || ri("TranslationKeyNotFound", e, o), i ? p(o, n) : r
                            },
                            html: function(t, n, r) {
                                if (!ro(t)) return ri("TranslationKeyNotFound", e, String(t)), null;
                                var o = n_(t);
                                if (!p.has(o)) return ri("TranslationKeyNotFound", e, o), null;
                                var i = nA(function(e) {
                                    return p(o, e)
                                }, n, r);
                                return null == i && ri("TranslationMalformed", e, o), i
                            }
                        })
                    }, [p, e])
                },
                rs = window.Roblox["core-scripts"].http.http,
                rl = window.Roblox["core-scripts"].guac,
                ru = th().apiGatewayUrl,
                rc = th().apiGatewayUrl,
                rd = {
                    url: {
                        getOmniRecommendations: {
                            url: "".concat(rc, "/discovery-api/omni-recommendation"),
                            withCredentials: !0
                        },
                        getOmniRecommendationsMetadata: {
                            url: "".concat(rc, "/discovery-api/omni-recommendation-metadata"),
                            withCredentials: !0
                        },
                        getOmniSearch: {
                            url: "".concat(rc, "/search-api/omni-search"),
                            withCredentials: !0
                        },
                        getExploreSorts: {
                            url: "".concat(rc, "/explore-api/v1/get-sorts"),
                            withCredentials: !0
                        },
                        getExploreSortContents: {
                            url: "".concat(rc, "/explore-api/v1/get-sort-content"),
                            withCredentials: !0
                        },
                        getSearchLandingPage: {
                            url: "".concat(rc, "/search-landing-page-api/v1"),
                            withCredentials: !0
                        },
                        getChartsPage: function() {
                            return {
                                url: "".concat(rc, "/charts-api/v1/charts-page"),
                                withCredentials: !0
                            }
                        },
                        getChartsSortDetail: function() {
                            return {
                                url: "".concat(rc, "/charts-api/v1/charts-sort-detail"),
                                withCredentials: !0
                            }
                        },
                        postUserSignal: function() {
                            return {
                                url: "".concat(rc, "/user-signal-http-gateway/v1/user-signal/ingest"),
                                withCredentials: !0
                            }
                        }
                    }
                },
                rf = ((w = {}).Carousel = "Carousel", w.AvatarCarousel = "AvatarCarousel", w.SortlessGrid = "SortlessGrid", w.FriendCarousel = "FriendCarousel", w.InterestGrid = "InterestGrid", w.Pills = "Pills", w.Sdui = "sdui", w.SongCarousel = "SongCarousel", w.SearchPillCarousel = "SearchPillCarousel", w),
                rh = ((x = {}).AppGameTileNoMetadata = "AppGameTileNoMetadata", x.GridTile = "GridTile", x.EventTile = "EventTile", x.InterestTile = "InterestTile", x.ExperienceEventsTile = "ExperienceEventsTile", x),
                rp = ((S = {}).Always = "Always", S.Hover = "Hover", S.Footer = "Footer", S),
                rv = ((E = {}).Game = "Game", E.Text = "Text", E),
                rm = window.Roblox["core-scripts"].intl.intl,
                rg = window.Roblox["core-scripts"].format.number,
                ry = globalThis.window,
                rb = globalThis.document,
                rw = void 0 === ry ? void 0 : ry,
                rx = void 0 === rb ? void 0 : rb,
                rS = window.RobloxPresence,
                rE = n.n(rS),
                rI = n(977),
                rT = n.n(rI);
            n(818);
            var rC = function(e, t) {
                    if (0 === e.length || 0 === t) return [e];
                    for (var n = [], r = 0; r < e.length; r += t) n.push(e.slice(r, r + t));
                    return n
                },
                rP = function(e, t, n) {
                    var r = [];
                    return t.forEach(function(t) {
                        if (null == t ? void 0 : t.isIntersecting) {
                            var o = e.findIndex(function(e) {
                                return e === t.target
                            });
                            o >= 0 && (r.push(o), n.unobserve(t.target))
                        }
                    }), r.sort(function(e, t) {
                        return e - t
                    })
                },
                rA = function(e, t, n) {
                    var r = (0, tl.useRef)(new Set),
                        o = (0, tl.useRef)(new Set),
                        i = (0, tl.useRef)(null),
                        a = (0, tl.useCallback)(function() {
                            rC(Array.from(o.current).filter(function(e) {
                                return !r.current.has(e)
                            }), 25).filter(function(e) {
                                return e.length > 0
                            }).forEach(function(e) {
                                n(e), e.forEach(function(e) {
                                    return r.current.add(e)
                                })
                            }), o.current.clear()
                        }, [n]),
                        s = (0, tl.useMemo)(function() {
                            return rT()(function() {
                                return a()
                            }, 200)
                        }, [a]);
                    (0, tl.useEffect)(function() {
                        var t, n, r = Array.from(null != (t = null == e || null == (n = e.current) ? void 0 : n.children) ? t : []).filter(function(e) {
                            return (0, to._)(e, HTMLElement)
                        });
                        return i.current && (i.current(), i.current = null), i.current = function(e, t) {
                                var n = e.elements,
                                    r = e.threshold;
                                try {
                                    var o = new window.IntersectionObserver(t, {
                                        threshold: r
                                    });
                                    return n.forEach(function(e) {
                                            o.observe(e)
                                        }),
                                        function() {
                                            return o.disconnect()
                                        }
                                } catch (e) {}
                                return function() {}
                            }({
                                elements: r,
                                threshold: .5
                            }, function(e, t) {
                                s.cancel(), rP(r, e, t).forEach(function(e) {
                                    return o.current.add(e)
                                }), s()
                            }),
                            function() {
                                s.cancel(), i.current && (i.current(), i.current = null)
                            }
                    }, [e, t, s, o])
                };
            (I = eG || (eG = {})).ItemImpressions = "itemImpressions", I.ItemAction = "itemAction", (T = eV || (eV = {})).Games = "Games", T.Home = "Home", T.SearchLanding = "SearchLanding", T.Spotlight = "Spotlight", T.UserProfile = "UserProfile", T.GameDetail = "GameDetail", T.SongList = "SongList", T.SearchPage = "SearchPage", T.PreAuthLanding = "PreAuthLanding", (C = eW || (eW = {})).HomePageSessionInfo = "homePageSessionInfo", C.DiscoverPageSessionInfo = "discoverPageSessionInfo", C.GameSearchSessionInfo = "gameSearchSessionInfo", C.SpotlightPageSessionInfo = "spotlightPageSessionInfo", C.PreAuthLandingPageSessionInfo = "preAuthLandingPageSessionInfo", (P = eK || (eK = {})).ContentType = "contentType", P.Context = "context", P.CollectionId = "collectionId", P.CollectionPosition = "collectionPosition", P.CollectionComponentType = "collectionComponentType", P.InteractionUuid = "interactionUuid", (A = eq || (eq = {})).User = "User", A.Game = "Game", A.Song = "Song", A.Look = "Look", A.Description = "Description", (_ = eX || (eX = {})).Online = "online", _.InGame = "inGame", _.InStudio = "inStudio", _.Offline = "offline", (N = eZ || (eZ = {})).Friend = "friend", N.NotFriend = "notFriend", (R = eY || (eY = {})).ItemIds = "itemIds", R.ItemPositions = "itemPositions", R.RowNumbers = "rowNumbers", R.FeedRowNumbers = "feedRowNumbers", R.PositionsInRow = "positionsInRow", R.PositionsInTopic = "positionsInTopic", R.TotalNumberOfItems = "totalNumberOfItems", (O = e$ || (e$ = {})).Presences = "presences", O.PresenceUniverseIds = "presenceUniverseIds", O.FriendStatuses = "friendStatuses", O.SourceCarousel = "sourceCarousel", (k = eQ || (eQ = {})).ItemId = "itemId", k.ItemPosition = "itemPosition", k.ItemComponentType = "itemComponentType", k.RowNumber = "rowNumber", k.FeedRowNumber = "feedRowNumber", k.PositionInRow = "positionInRow", k.PositionInTopic = "positionInTopic", k.TotalNumberOfItems = "totalNumberOfItems", k.ActionType = "actionType", (M = eJ || (eJ = {})).Presence = "presence", M.PresenceUniverseId = "presenceUniverseId", M.FriendStatus = "friendStatus", M.SourceCarousel = "sourceCarousel";
            var r_ = function(e) {
                    return Object.keys(e).reduce(function(t, n) {
                        var r, o = (r = e[n], Array.isArray(r) && 1 ? r.join(",") : (void 0 === r ? "undefined" : (0, tS._)(r)) === "object" && r ? JSON.stringify(r) : "number" == typeof r || "string" == typeof r ? r : "boolean" == typeof r ? +!!r : void 0);
                        return void 0 !== o && (t[n] = o), t
                    }, {})
                },
                rN = window.Roblox["core-scripts"].eventStream,
                rR = "function" == typeof crypto.randomUUID,
                rO = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                rk = function() {
                    return rR ? crypto.randomUUID() : rO()
                },
                rM = "robloxAttributionIds",
                rL = ((L = {}).GameDetailReferral = "gameDetailReferral", L),
                rD = function(e) {
                    var t = window,
                        n = t[rM];
                    n || (n = {}, t[rM] = n);
                    var r = n[e];
                    return r || (r = rk(), n[e] = r), r
                },
                rB = window.Roblox["core-scripts"].meta.user,
                rj = (window.Roblox["core-scripts"].endpoints, window.Roblox["core-scripts"].entityUrl),
                rF = window.Roblox["core-scripts"].util.url,
                rH = window.Roblox["core-scripts"].format.string,
                rU = ((D = {}).SearchPage = "searchPage", D.SortDetailPageDiscover = "sortDetailPageDiscover", D.SortDetailPageHome = "sortDetailPageHome", D.GameDetailPage = "gameDetailPage", D.GamesPage = "gamesPage", D.HomePage = "homePage", D.PeopleListInHomePage = "peopleListInHomePage", D.InterestCatcher = "interestCatcher", D.SearchLandingPage = "searchLandingPage", D.SpotlightPage = "spotlightPage", D.UserProfilePage = "userProfilePage", D.SongListPage = "songListPage", D.PreAuthLandingPage = "preAuthLandingPage", D),
                rz = function() {
                    return document.referrer
                },
                rG = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                        r = arguments.length > 3 ? arguments[3] : void 0,
                        o = r || "".concat(rj.game.getRelativePath(e), "/").concat((0, rH.formatStableSeoName)(t));
                    return (0, rF.getUrlWithQueries)(o, n)
                },
                rV = "{linkStart}",
                rW = "{linkEnd}",
                rK = {
                    numGameCarouselLookAheadWindows: 3,
                    adSortDiscoverId: 27,
                    carouselContainerBufferWidth: 80,
                    gameTileGutterWidth: 14,
                    wideGameTileGutterWidth: 16,
                    scrollerWidth: 30
                },
                rq = {
                    maxTilesInGameImpressionsEvent: 25,
                    gameImpressionsIntersectionThreshold: .5,
                    filterImpressionsIntersectionThreshold: .5,
                    wideTileHoverGrowWidthPx: 26,
                    numberOfInGameAvatarIcons: 3,
                    numberOfInGameNames: 1,
                    maxFacepileFriendCountValue: 99,
                    numberOfGameTilesPerLoad: 60,
                    keyBoardEventCode: {
                        enter: "Enter",
                        escape: "Escape"
                    },
                    RatingPercentageText: "Label.RatingPercentage",
                    NoMatchingEventContextFoundCounterEvent: "NoMatchingEventContextFound",
                    NoMatchingVideoEventPageContextFoundCounterEvent: "NoMatchingVideoEventPageContextFound",
                    NoMatchingVideoCmcdInstanceTypeFoundCounterEvent: "NoMatchingVideoCmcdInstanceTypeFound",
                    NoMatchingSessionInfoTypeFoundCounterEvent: "NoMatchingSessionInfoTypeFound",
                    FetchExperimentationLayerValuesError: "FetchExperimentationLayerValuesError"
                },
                rX = function(e) {
                    switch (e) {
                        case rU.HomePage:
                            return eV.Home;
                        case rU.GamesPage:
                            return eV.Games;
                        case rU.SpotlightPage:
                            return eV.Spotlight;
                        case rU.SearchLandingPage:
                            return eV.SearchLanding;
                        case rU.GameDetailPage:
                            return eV.GameDetail;
                        case rU.SongListPage:
                            return eV.SongList;
                        case rU.SearchPage:
                            return eV.SearchPage;
                        case rU.UserProfilePage:
                            return eV.UserProfile;
                        case rU.PreAuthLandingPage:
                            return eV.PreAuthLanding;
                        default:
                            return ty(rq.NoMatchingEventContextFoundCounterEvent), "UNKNOWN"
                    }
                },
                rZ = function(e) {
                    return Object.keys(e).reduce(function(t, n) {
                        return "object" === (0, tS._)(e[n]) && e[n] && (t[n] = JSON.stringify(e[n])), "number" == typeof e[n] && (t[n] = e[n]), "string" == typeof e[n] && (t[n] = encodeURIComponent(e[n])), "boolean" == typeof e[n] && (t[n] = +!!e[n]), t
                    }, {})
                },
                rY = rN.eventTypes.pageLoad,
                r$ = rN.eventTypes.formInteraction,
                rQ = ((B = {}).ActionType = "actionType", B.AbsPositions = "absPositions", B.AdsPositions = "adsPositions", B.AdFlags = "adFlags", B.Algorithm = "algorithm", B.AppliedFilters = "appliedFilters", B.AttributionId = "attributionId", B.AutoAdvance = "autoAdvance", B.ComponentType = "componentType", B.Context = "ctx", B.ContentType = "contentType", B.Direction = "direction", B.Distance = "distance", B.HttpReferrer = "httpReferrer", B.EmphasisFlag = "emphasisFlag", B.FilterId = "filterId", B.FilterIds = "filterIds", B.FooterTextLiterals = "footerTextLiterals", B.FooterLocalizationKeys = "footerLocalizationKeys", B.GameSetTargetId = "gameSetTargetId", B.GameSetTypeId = "gameSetTypeId", B.HasSponsoredContent = "hasSponsoredContent", B.HeroUnitId = "heroUnitId", B.ImageAssetId = "imageAssetId", B.ImpressionThreshold = "impressionThreshold", B.InteractionType = "interactionType", B.InteractionUuid = "interactionUuid", B.IsAd = "isAd", B.IsButtonExpanded = "isButtonExpanded", B.IsVideo = "isVideo", B.IsYoutubeVideo = "isYoutubeVideo", B.ItemId = "itemId", B.LaunchData = "launchData", B.MediaGalleryEventType = "evt", B.NativeAdData = "nativeAdData", B.AdIds = "adIds", B.NumberOfLoadedTiles = "numberOfLoadedTiles", B.Page = "page", B.PageContext = "pageContext", B.PageSession = "pageSession", B.PlaceId = "placeId", B.PlaceIdOverride = "placeIdOverride", B.PlayContext = "playContext", B.Position = "position", B.PositionsInTopic = "positionsInTopic", B.Pos = "pos", B.PreviousOptionContextTag = "previousOptionContextTag", B.PreviousOptionId = "previousOptionId", B.PreviousIndex = "previousIndex", B.OmniSearchType = "omniSearchType", B.QueryText = "queryText", B.QueryTexts = "queryTexts", B.ResourceId = "resourceId", B.RootPlaceIds = "rootPlaceIds", B.ScreenSizeX = "screenSizeX", B.ScreenSizeY = "screenSizeY", B.ScrollAreaSize = "scrollAreaSize", B.ScrollDepth = "scrollDepth", B.SelectedOptionContextTag = "selectedOptionContextTag", B.SelectedOptionContextTags = "selectedOptionContextTags", B.SelectedOptionId = "selectedOptionId", B.SelectedOptionIds = "selectedOptionIds", B.SelectedIndex = "selectedIndex", B.ShareLinkType = "shareLinkType", B.ShareLinkId = "shareLinkId", B.SortId = "sortId", B.SortPos = "sortPos", B.SortSubId = "sortSubId", B.StartDepth = "startDepth", B.StartPos = "startPos", B.SubPageName = "subPageName", B.SuggestionKwd = "suggestionKwd", B.SuggestionReplacedKwd = "suggestionReplacedKwd", B.SuggestionCorrectedKwd = "suggestionCorrectedKwd", B.SuggestionAlgorithm = "suggestionAlgorithm", B.Topics = "topics", B.TreatmentType = "treatmentType", B.UniverseId = "universeId", B.UniverseIds = "universeIds", B.UnplayableReason = "unplayableReason", B.FriendId = "friendId", B.VideoAssetId = "videoAssetId", B.VideoThumbnailAssetIds = "videoThumbnailAssetIds", B.ThumbnailAssetIds = "thumbnailAssetIds", B.ThumbnailListIds = "thumbnailListIds", B.LinkPath = "linkPath", B.RowOnPage = "rowOnPage", B.RowsOnPage = "rowsOnPage", B.PositionInRow = "positionInRow", B.PositionsInRow = "positionsInRow", B.NavigationUids = "navigationUids", B.TileBadgeContexts = "tileBadgeContexts", B.ButtonName = "buttonName", B.IsInterested = "isInterested", B.IsActive = "isActive", B.InterestedUniverseIds = "interestedUniverseIds", B.MenuItem = "menuItem", B.AvailableMenuItems = "availableMenuItems", B.HiddenReason = "hiddenReason", B.IsDirectAction = "isDirectAction", B),
                rJ = ((j = {}).GameImpressions = "gameImpressions", j.GameDetailReferral = "gameDetailReferral", j.SortDetailReferral = "sortDetailReferral", j.FeedScroll = "feedScroll", j.NavigateToSortLink = "navigateToSortLink", j.InterestCatcherClick = "interestCatcherClick", j.FilterImpressions = "filterImpressions", j.GamesFilterClick = "gamesFilterClick", j.RequestRefundClick = "requestRefundClick", j.GameTileOverflowMenuAction = "gameTileOverflowMenuAction", j.GameTileHiddenAction = "gameTileHiddenAction", j.NotInterestedFeedbackFormAction = "notInterestedFeedbackFormAction", j.MediaGalleryMediaChanged = "mediaGalleryMediaChanged", j.QuerySuggestionClicked = "querySuggestionClicked", j.QueryImpressions = "queryImpressions", j.ExpandableTextImpression = "expandableTextImpression", j.GameDetailUnavailable = "gameDetailUnavailable", j.SafetyResourceBanner = "safetyResourceBanner", j),
                r0 = ((F = {}).HomePageSessionInfo = "homePageSessionInfo", F.GameSearchSessionInfo = "gameSearchSessionInfo", F.OmniSearchSessionInfo = "omniSearchSessionInfo", F.SearchUuid = "searchUuid", F.DiscoverPageSessionInfo = "discoverPageSessionInfo", F.SearchLandingPageSessionInfo = "searchLandingPageSessionInfo", F.SpotlightPageSessionInfo = "spotlightPageSessionInfo", F.PreAuthLandingPageSessionInfo = "preAuthLandingPageSessionInfo", F),
                r1 = ((H = {}).Horizontal = "horizontal", H.Vertical = "vertical", H),
                r2 = ((U = {}).GameTileOverflowMenuItemOpened = "GameTileOverflowMenuItemOpened", U.GameTileOverflowMenuItemClosed = "GameTileOverflowMenuItemClosed", U.GameTileOverflowMenuItemActivated = "GameTileOverflowMenuItemActivated", U),
                r5 = ((z = {}).GameTileHiddenUndone = "GameTileHiddenUndone", z),
                r3 = (tc(e0 = {}, "gameImpressions", function(e) {
                    tV(e);
                    var t, n, r, o = tG({}, e);
                    return [{
                        name: "gameImpressions",
                        type: "gameImpressions",
                        context: r$
                    }, rZ(tb(td((tc(r = {}, "interactionUuid", rk()), tc(r, "hasSponsoredContent", null != (t = null == (n = o.adFlags) ? void 0 : n.includes(1)) && t), r), o), tc({}, "contentType", eq.Game)))]
                }), tc(e0, "gameDetailReferral", function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return [{
                        name: "gameDetailReferral",
                        type: "gameDetailReferral",
                        context: rY
                    }, rZ(td((tc(e = {}, "attributionId", rD(rL.GameDetailReferral)), tc(e, "httpReferrer", rz()), tc(e, "contentType", eq.Game), tc(e, "actionType", "OpenGameDetails"), tc(e, "interactionUuid", rk()), e), t))]
                }), tc(e0, "sortDetailReferral", function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return [{
                        name: "sortDetailReferral",
                        type: "sortDetailReferral",
                        context: rY
                    }, rZ(td({}, e))]
                }), tc(e0, "navigateToSortLink", function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return [{
                        name: "navigateToSortLink",
                        type: "navigateToSortLink",
                        context: r$
                    }, rZ(td({}, e))]
                }), tc(e0, "interestCatcherClick", function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return [{
                        name: "interestCatcherClick",
                        type: "interestCatcherClick",
                        context: r$
                    }, rZ(td({}, e))]
                }), tc(e0, "filterImpressions", function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return [{
                        name: "filterImpressions",
                        type: "filterImpressions",
                        context: r$
                    }, rZ(td({}, e))]
                }), tc(e0, "gamesFilterClick", function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return [{
                        name: "gamesFilterClick",
                        type: "gamesFilterClick",
                        context: r$
                    }, rZ(td({}, e))]
                }), tc(e0, "requestRefundClick", function(e) {
                    return [{
                        name: "requestRefundClick",
                        type: "requestRefundClick",
                        context: r$
                    }, rZ(tc({}, "placeId", e.placeId))]
                }), tc(e0, "gameTileOverflowMenuAction", function(e, t) {
                    return [{
                        name: "gameTileOverflowMenuAction",
                        type: "gameTileOverflowMenuAction",
                        context: rX(t)
                    }, r_(td({}, e))]
                }), tc(e0, "gameTileHiddenAction", function(e, t) {
                    return [{
                        name: "gameTileHiddenAction",
                        type: "gameTileHiddenAction",
                        context: rX(t)
                    }, r_(td({}, e))]
                }), tc(e0, "notInterestedFeedbackFormAction", function(e, t) {
                    return [{
                        name: "notInterestedFeedbackFormAction",
                        type: "notInterestedFeedbackFormAction",
                        context: rX(t)
                    }, r_(td({}, e))]
                }), tc(e0, "mediaGalleryMediaChanged", function(e) {
                    return [{
                        name: "mediaGalleryMediaChanged",
                        type: "mediaGalleryMediaChanged",
                        context: r$
                    }, r_(td({}, e))]
                }), tc(e0, "querySuggestionClicked", function(e) {
                    return [{
                        name: "querySuggestionClicked",
                        type: "querySuggestionClicked",
                        context: r$
                    }, r_(td({}, e))]
                }), tc(e0, "queryImpressions", function(e) {
                    return [{
                        name: "queryImpressions",
                        type: "queryImpressions",
                        context: r$
                    }, r_(td({}, e))]
                }), tc(e0, "expandableTextImpression", function(e) {
                    var t, n = e.pageContext;
                    return [{
                        name: "expandableTextImpression",
                        type: "expandableTextImpression",
                        context: r$
                    }, r_(tb(td({}, tz(e, ["pageContext"])), (tc(t = {}, "pageContext", rX(n)), tc(t, "interactionUuid", rk()), t)))]
                }), tc(e0, "safetyResourceBanner", function(e, t) {
                    return [{
                        name: "safetyResourceBanner",
                        type: "safetyResourceBanner",
                        context: t
                    }, Object.fromEntries(Object.entries(e).filter(function(e) {
                        return void 0 !== ts(e, 2)[1]
                    }))]
                }), tc(e0, "gameDetailUnavailable", function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    return [{
                        name: "gameDetailUnavailable",
                        type: "gameDetailUnavailable",
                        context: rY
                    }, rZ(td(tc({}, "httpReferrer", rz()), e))]
                }), e0),
                r4 = function(e, t) {
                    var n = e.layoutDataBySort && void 0 !== t && e.layoutDataBySort[t] ? e.layoutDataBySort[t] : e.defaultLayoutData;
                    return e.tileBadgesByPosition ? tb(td({}, null != n ? n : {}), {
                        tileBadgesByPosition: e.tileBadgesByPosition
                    }) : n
                },
                r6 = function(e, t) {
                    return (0, tl.useMemo)(function() {
                        return r4(e, t)
                    }, [e, t])
                },
                r8 = function(e) {
                    return e === rh.GridTile || e === rh.EventTile || e === rh.InterestTile || e === rh.ExperienceEventsTile
                },
                r9 = function(e, t) {
                    var n = 0;
                    if (void 0 !== e && void 0 !== t) {
                        if (!Number.isNaN(e) && !Number.isNaN(t)) {
                            if (0 === e && 0 === t) return;
                            n = 0 === e && 0 !== t ? 0 : 0 !== e && 0 === t || (n = Math.floor(e / (e + t) * 100)) > 100 ? 100 : n
                        }
                        return n
                    }
                },
                r7 = function(e, t) {
                    var n;
                    return t.some(function(t) {
                        var n;
                        return null == (n = e[t]) ? void 0 : n.isSponsored
                    }) ? (tc(n = {}, rQ.AdsPositions, t.map(function(t) {
                        return +!!e[t].isSponsored
                    })), tc(n, rQ.AdFlags, t.map(function(t) {
                        return +!!e[t].isSponsored
                    })), tc(n, rQ.AdIds, t.map(function(t) {
                        var n;
                        return (null == (n = e[t]) ? void 0 : n.nativeAdData) || "0"
                    })), n) : {}
                },
                oe = function(e, t) {
                    var n, r = function(e) {
                            var t, n = null == e || null == (t = e.primaryMediaAsset) ? void 0 : t.wideImageAssetId;
                            return n && "0" !== n ? parseInt(n, 10) : null
                        },
                        o = r({
                            primaryMediaAsset: e.contentMetadataMediaAsset
                        });
                    return o || (e.layoutDataBySort && t && e.layoutDataBySort[t] ? n = r(e.layoutDataBySort[t]) : e.defaultLayoutData && (n = r(e.defaultLayoutData)), n || r(e))
                },
                ot = function(e, t) {
                    var n, r, o, i, a = null == (n = e.contentMetadataMediaAsset) ? void 0 : n.wideImageListId;
                    return a || (e.layoutDataBySort && t && e.layoutDataBySort[t] ? null == (o = e.layoutDataBySort[t].primaryMediaAsset) ? void 0 : o.wideImageListId : e.defaultLayoutData ? null == (i = e.defaultLayoutData.primaryMediaAsset) ? void 0 : i.wideImageListId : null == (r = e.primaryMediaAsset) ? void 0 : r.wideImageListId)
                },
                on = function(e) {
                    var t, n = null == e || null == (t = e.primaryMediaAsset) ? void 0 : t.wideVideoAssetId;
                    return n && "0" !== n ? parseInt(n, 10) : null
                },
                or = function(e, t) {
                    var n, r = on({
                        primaryMediaAsset: e.contentMetadataMediaAsset
                    });
                    return r || (e.layoutDataBySort && t && e.layoutDataBySort[t] ? n = on(e.layoutDataBySort[t]) : e.defaultLayoutData && (n = on(e.defaultLayoutData)), n || on(e))
                },
                oo = function(e, t, n, r) {
                    if (r8(r)) {
                        var o, i = null == t ? void 0 : t.toString();
                        return tc(o = {}, rQ.ThumbnailAssetIds, n.map(function(t) {
                            var n;
                            return null != (n = oe(e[t], i)) ? n : "0"
                        })), tc(o, rQ.ThumbnailListIds, n.map(function(t) {
                            var n;
                            return null != (n = ot(e[t], i)) ? n : "0"
                        })), tc(o, rQ.VideoThumbnailAssetIds, n.map(function(t) {
                            var n;
                            return null != (n = or(e[t], i)) ? n : 0
                        })), o
                    }
                    return {}
                },
                oi = function(e) {
                    var t = e.tileBadgesByPosition,
                        n = [];
                    if (t) {
                        if (t.ImageTopLeft) {
                            var r = t.ImageTopLeft.map(function(e) {
                                return e.analyticsId
                            });
                            r && r.length > 0 && n.push("ImageTopLeft=".concat(r.join("+")))
                        }
                        return n.length > 0 ? n.join("&") : void 0
                    }
                },
                oa = function(e, t) {
                    var n = r4(e, t);
                    return n ? oi(n) : void 0
                },
                os = (rg.formatNumber, function(e) {
                    switch (e) {
                        case rU.HomePage:
                            return r0.HomePageSessionInfo;
                        case rU.SearchPage:
                            return r0.GameSearchSessionInfo;
                        case rU.GamesPage:
                            return r0.DiscoverPageSessionInfo;
                        case rU.SearchLandingPage:
                            return r0.SearchLandingPageSessionInfo;
                        case rU.SpotlightPage:
                            return r0.SpotlightPageSessionInfo;
                        case rU.UserProfilePage:
                            return null;
                        case rU.PreAuthLandingPage:
                            return r0.PreAuthLandingPageSessionInfo;
                        default:
                            return ty(rq.NoMatchingSessionInfoTypeFoundCounterEvent), null
                    }
                }),
                ol = function(e, t) {
                    var n = r9(e, t);
                    return void 0 !== n ? "".concat(n, "%") : void 0
                },
                ou = function(e) {
                    return -1 === e ? "--" : (0, rg.abbreviateNumber)(e)
                },
                oc = function() {
                    var e, t, n, r;
                    if ((null == (t = window) || null == (e = t.screen) ? void 0 : e.width) && (null == (r = window) || null == (n = r.screen) ? void 0 : n.height)) return "".concat(window.screen.width, "x").concat(window.screen.height)
                },
                od = function() {
                    if ("deviceMemory" in navigator && "number" == typeof navigator.deviceMemory) return 1024 * navigator.deviceMemory
                },
                of = function() {
                    var e;
                    if ("connection" in navigator && (null == (e = navigator.connection) ? void 0 : e.effectiveType)) return navigator.connection.effectiveType
                },
                oh = function() {
                    try {
                        var e;
                        return {
                            cpuCores: null == (e = navigator) ? void 0 : e.hardwareConcurrency,
                            maxResolution: oc(),
                            maxMemory: od(),
                            networkType: of()
                        }
                    } catch (e) {
                        return {}
                    }
                },
                op = window.Roblox["core-lib"].index,
                ov = ((G = {}).TextLabel = "TextLabel", G.RatingWithGenre = "RatingWithGenre", G),
                om = ((V = {}).Text = "Text", V.Icon = "Icon", V.IconWithText = "IconWithText", V),
                og = ((W = {}).Pill = "Pill", W.RoundedRectangle = "RoundedRectangle", W),
                oy = ((K = {}).INVALID = "Invalid", K.IMAGE_TOP_LEFT = "ImageTopLeft", K.IMAGE_TOP_RIGHT = "ImageTopRight", K.IMAGE_BOTTOM_LEFT = "ImageBottomLeft", K.IMAGE_BOTTOM_RIGHT = "ImageBottomRight", K),
                ob = (tc(e1 = {}, og.Pill, ""), tc(e1, og.RoundedRectangle, "game-card-badge-rounded-rectangle"), e1),
                ow = function(e) {
                    return void 0 === e || "" === e
                },
                ox = function(e) {
                    if (e) {
                        var t = e.badgePosition,
                            n = e.badgeAnalyticsId,
                            r = e.badgeType,
                            o = e.badgeText,
                            i = e.badgeIcon,
                            a = e.badgeComponentType;
                        if (!(ow(t) || ow(n) || ow(r)) && (0, op.isStringEnum)(om, r)) return tc({}, t, [{
                            analyticsId: n,
                            tileBadgeType: r,
                            text: o,
                            icons: i ? [i] : void 0,
                            tileBadgeComponentType: !ow(a) && (0, op.isStringEnum)(og, a) ? a : void 0
                        }])
                    }
                },
                oS = function(e) {
                    switch (e) {
                        case "icons/menu/gem_small":
                            return {
                                class: "icon-gem-dark-stroke", type: "core-ui"
                            };
                        case "icons/menu/lock_closed":
                            return {
                                class: "icon-regular-lock-closed", type: "foundation"
                            };
                        default:
                            return null
                    }
                },
                oE = function(e) {
                    switch (e) {
                        case oy.IMAGE_TOP_LEFT:
                            return "game-card-pill-top-left";
                        case oy.IMAGE_TOP_RIGHT:
                            return "game-card-pill-top-right";
                        case oy.IMAGE_BOTTOM_LEFT:
                            return "game-card-pill-bottom-left";
                        case oy.IMAGE_BOTTOM_RIGHT:
                            return "game-card-pill-bottom-right";
                        default:
                            return ""
                    }
                },
                oI = function(e) {
                    return e ? e.map(function(e) {
                        return oS(e)
                    }).filter(function(e) {
                        return null !== e
                    }) : []
                },
                oT = function(e) {
                    var t = Object.values(oy).filter(function(e) {
                            return e !== oy.INVALID
                        }),
                        n = {};
                    return t.forEach(function(t) {
                        var r, o, i = (null == (o = null == e || null == (r = e.tileBadgesByPosition) ? void 0 : r[t]) ? void 0 : o.length) ? o.map(function(e) {
                            var t = {
                                id: e.analyticsId,
                                componentType: e.tileBadgeComponentType,
                                animationClass: e.isShimmerEnabled ? "shimmer-animation" : null
                            };
                            if (e.tileBadgeType === om.Text && e.text) t.text = e.text;
                            else if (e.tileBadgeType === om.Icon && e.icons) t.icons = oI(e.icons);
                            else {
                                if (e.tileBadgeType !== om.IconWithText || !e.icons || !e.text) return;
                                t.icons = oI(e.icons), t.text = e.text
                            }
                            return t
                        }).filter(function(e) {
                            return void 0 !== e
                        }) : [];
                        i.length && (n[t] = i)
                    }), Object.keys(n).length > 0 ? n : null
                },
                oC = function(e) {
                    var t;
                    return (null == e || null == (t = e.footer) ? void 0 : t.type) === ov.TextLabel ? e.footer : null
                },
                oP = function(e) {
                    var t, n = null == e ? void 0 : e.footer;
                    return (null == n ? void 0 : n.type) === ov.RatingWithGenre && (null == (t = n.genre) ? void 0 : t.textLiteral) ? n : null
                },
                oA = function(e) {
                    return "games" in e
                },
                o_ = function(e, t) {
                    if ("recommendationList" in e) {
                        var n;
                        return n = e.recommendationList, (null != n ? n : []).map(function(e) {
                            var n, r = e.contentType,
                                o = e.contentId,
                                i = e.contentMetadata,
                                a = null == t || null == (n = t[r]) ? void 0 : n[o];
                            if (a) {
                                var s = td({}, a),
                                    l = null == i ? void 0 : i.EncryptedAdTrackingData;
                                s.isSponsored = null != l && l.length > 0, s.nativeAdData = l, s.payerName = null == i ? void 0 : i.PayerName, (null == i ? void 0 : i.PlaceIdOverride) && !isNaN(Number(i.PlaceIdOverride)) && (s.placeIdOverride = Number(i.PlaceIdOverride)), (null == i ? void 0 : i.LaunchDataOverride) && (s.launchDataOverride = i.LaunchDataOverride);
                                var u = null == i ? void 0 : i.PrimaryWideImageAssetId,
                                    c = null == i ? void 0 : i.PrimaryWideImageListId,
                                    d = null == i ? void 0 : i.PrimaryWideVideoAssetId;
                                (u || c || d) && (s.contentMetadataMediaAsset = td({}, u ? {
                                    wideImageAssetId: u
                                } : {}, c ? {
                                    wideImageListId: c
                                } : {}, d ? {
                                    wideVideoAssetId: d
                                } : {}));
                                var f = ox(i);
                                return f && (s.tileBadgesByPosition = f), s
                            }
                            return a
                        }).filter(function(e) {
                            return void 0 !== e
                        })
                    }
                    return oA(e) ? e.games : []
                },
                oN = function(e) {
                    return "queries" in e && e.treatmentType === rf.SearchPillCarousel ? {
                        topic: e.sortDisplayName,
                        topicId: e.gameSetTypeId,
                        treatmentType: e.treatmentType,
                        queries: e.queries,
                        sortId: e.sortId,
                        gameSetTargetId: e.gameSetTargetId,
                        contentType: e.contentType,
                        nextPageToken: e.nextPageToken || "",
                        topicLayoutData: e.topicLayoutData
                    } : "games" in e ? {
                        topic: e.sortDisplayName,
                        topicId: e.gameSetTypeId,
                        treatmentType: e.treatmentType,
                        games: e.games.map(function(e) {
                            var t, n = ox(e.contentMetadata);
                            return td(tb(td({}, e), {
                                placeId: null != (t = e.placeId) ? t : e.rootPlaceId
                            }), n ? {
                                tileBadgesByPosition: n
                            } : {})
                        }),
                        sortId: e.sortId,
                        gameSetTargetId: e.gameSetTargetId,
                        contentType: e.contentType,
                        nextPageToken: e.nextPageToken || "",
                        subtitle: e.subtitle,
                        topicLayoutData: e.topicLayoutData,
                        appliedFilters: e.appliedFilters
                    } : "songs" in e ? {
                        topic: e.sortDisplayName,
                        topicId: e.gameSetTypeId,
                        treatmentType: e.treatmentType,
                        songs: e.songs,
                        sortId: e.sortId,
                        gameSetTargetId: e.gameSetTargetId,
                        contentType: e.contentType,
                        nextPageToken: e.nextPageToken || "",
                        subtitle: e.subtitle,
                        topicLayoutData: e.topicLayoutData
                    } : {
                        topic: e.sortDisplayName,
                        topicId: e.gameSetTypeId,
                        treatmentType: e.treatmentType,
                        filters: e.filters,
                        sortId: e.sortId,
                        gameSetTargetId: e.gameSetTargetId,
                        contentType: e.contentType,
                        nextPageToken: e.nextPageToken || "",
                        subtitle: e.subtitle,
                        topicLayoutData: e.topicLayoutData
                    }
                },
                oR = function(e) {
                    var t;
                    return {
                        header: (null == (t = e.header) ? void 0 : t.sorts) ? {
                            sorts: e.header.sorts.map(function(e) {
                                return oN(e)
                            }),
                            layoutData: e.header.layoutData
                        } : void 0,
                        sorts: e.sorts.map(function(e) {
                            return oN(e)
                        }),
                        nextSortsPageToken: e.nextSortsPageToken
                    }
                },
                oO = function(e) {
                    if (e && oA(e)) return e.gameSetTargetId
                },
                ok = function(e) {
                    var t = oO(e);
                    return void 0 !== t ? tc({}, rQ.GameSetTargetId, t) : {}
                },
                oM = (0, tl.createContext)(void 0),
                oL = (0, tl.createContext)({
                    contentMetadata: null,
                    appendContentMetadata: function() {}
                }),
                oD = function() {
                    var e = (0, tl.useContext)(oL);
                    return {
                        contentMetadata: e.contentMetadata,
                        appendContentMetadata: e.appendContentMetadata
                    }
                },
                oB = window.Roblox["core-scripts"].util.elementVisibility,
                oj = void 0,
                oF = function(e) {
                    var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 300;
                    return [function() {
                        for (var r = arguments.length, o = Array(r), i = 0; i < r; i++) o[i] = arguments[i];
                        clearTimeout(t), t = setTimeout(function() {
                            e.apply(oj, o)
                        }, n)
                    }, function() {
                        clearTimeout(t)
                    }]
                },
                oH = function(e, t, n) {
                    var r = ts((0, tl.useState)(new Set), 2),
                        i = r[0],
                        a = r[1],
                        s = ts((0, tl.useState)(new Set), 2),
                        l = s[0],
                        u = s[1],
                        c = (0, tl.useRef)(null),
                        d = (0, tl.useRef)(n);
                    (0, tl.useEffect)(function() {
                        d.current = n
                    }, [n]);
                    var f = (0, tl.useCallback)(function() {
                            var e, t;
                            (e = Array.from(l).filter(function(e) {
                                return !i.has(e)
                            }), t = rq.maxTilesInGameImpressionsEvent, 0 === e.length || 0 === t ? [e] : Array(Math.ceil(e.length / t)).fill(0).map(function(n, r) {
                                return e.slice(r * t, (r + 1) * t)
                            })).filter(function(e) {
                                return e.length > 0
                            }).forEach(function(e) {
                                var t, n = d.current(e);
                                if (void 0 !== n && (null == (t = n.absPositions) ? void 0 : t.length) > 0) {
                                    var r = r3.gameImpressions(n);
                                    rN.sendEvent.apply(void 0, o(r)), a(function(t) {
                                        return e.forEach(function(e) {
                                            return t.add(e)
                                        }), t
                                    })
                                }
                            })
                        }, [i, l]),
                        h = ts(oF(function() {
                            return f()
                        }), 2),
                        p = h[0],
                        v = h[1];
                    (0, tl.useEffect)(function() {
                        var t, n, r = Array.from(null != (t = null == e || null == (n = e.current) ? void 0 : n.children) ? t : []),
                            o = function(e, t) {
                                var n = [];
                                return e.forEach(function(e) {
                                    if (null == e ? void 0 : e.isIntersecting) {
                                        var o = r.findIndex(function(t) {
                                            return t === e.target
                                        });
                                        o >= 0 && (n.push(o), t.unobserve(e.target))
                                    }
                                }), n.sort(function(e, t) {
                                    return e - t
                                })
                            };
                        return c.current = (0, oB.observeChildrenVisibility)({
                                elements: r,
                                threshold: rq.gameImpressionsIntersectionThreshold
                            }, function(e, t) {
                                v();
                                var n = o(e, t);
                                u(function(e) {
                                    return n.forEach(function(t) {
                                        return e.add(t)
                                    }), e
                                }), p()
                            }),
                            function() {
                                (null == c ? void 0 : c.current) && c.current()
                            }
                    }, [e, t, l, p, v])
                },
                oU = n(611),
                oz = n.n(oU),
                oG = window.ReactRouterDOM,
                oV = function() {
                    for (var e, t, n = 0, r = "", o = arguments.length; n < o; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : (0, tS._)(t)))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (o && (o += " "), o += r)
                            } else
                                for (r in t) t[r] && (o && (o += " "), o += r);
                        return o
                    }(e)) && (r && (r += " "), r += t);
                    return r
                };

            function oW(e) {
                var t = e.className;
                return tu().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: oV("block", t),
                    style: {
                        marginTop: -1
                    }
                }, tu().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function oK(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    o = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === o || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function oq(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function oX() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = oq(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : oq(t[e], null)
                        }
                    }
                }
            }

            function oZ() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return tl.useCallback(oX.apply(void 0, o(t)), t)
            }

            function oY(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = [],
                    r = function() {
                        var t = n.map(function(e) {
                            return tl.createContext(e)
                        });
                        return function(n) {
                            var r = (null == n ? void 0 : n[e]) || t;
                            return tl.useMemo(function() {
                                return tc({}, "__scope".concat(e), tb(td({}, n), tc({}, e, r)))
                            }, [n, r])
                        }
                    };
                return r.scopeName = e, [function(t, r) {
                    var i = tl.createContext(r),
                        a = n.length;
                    n = o(n).concat([r]);
                    var s = function(t) {
                        var n, r = t.scope,
                            o = t.children,
                            s = tz(t, ["scope", "children"]),
                            l = (null == r || null == (n = r[e]) ? void 0 : n[a]) || i,
                            u = tl.useMemo(function() {
                                return s
                            }, Object.values(s));
                        return (0, e8.jsx)(l.Provider, {
                            value: u,
                            children: o
                        })
                    };
                    return s.displayName = t + "Provider", [s, function(n, o) {
                        var s, l = (null == o || null == (s = o[e]) ? void 0 : s[a]) || i,
                            u = tl.useContext(l);
                        if (u) return u;
                        if (void 0 !== r) return r;
                        throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                    }]
                }, o$.apply(void 0, [r].concat(o(t)))]
            }

            function o$() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                o = n.scopeName;
                            return td({}, e, r(t)["__scope".concat(o)])
                        }, {});
                        return tl.useMemo(function() {
                            return tc({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return o.scopeName = r.scopeName, o
            }
            var oQ = window.RadixUI["react-dismissable-layer"],
                oJ = (null == (e2 = globalThis) ? void 0 : e2.document) ? tl.useLayoutEffect : function() {},
                o0 = tl["useId".toString()] || function() {},
                o1 = 0,
                o2 = ["top", "right", "bottom", "left"],
                o5 = Math.min,
                o3 = Math.max,
                o4 = Math.round,
                o6 = Math.floor,
                o8 = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                o9 = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                o7 = {
                    start: "end",
                    end: "start"
                };

            function ie(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function it(e) {
                return e.split("-")[0]
            }

            function ir(e) {
                return e.split("-")[1]
            }

            function io(e) {
                return "x" === e ? "y" : "x"
            }

            function ii(e) {
                return "y" === e ? "height" : "width"
            }
            var ia = new Set(["top", "bottom"]);

            function is(e) {
                return ia.has(it(e)) ? "y" : "x"
            }

            function il(e) {
                return e.replace(/start|end/g, function(e) {
                    return o7[e]
                })
            }
            var iu = ["left", "right"],
                ic = ["right", "left"],
                id = ["top", "bottom"],
                ih = ["bottom", "top"];

            function ip(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return o9[e]
                })
            }

            function iv(e) {
                return "number" != typeof e ? td({
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0
                }, e) : {
                    top: e,
                    right: e,
                    bottom: e,
                    left: e
                }
            }

            function im(e) {
                var t = e.x,
                    n = e.y,
                    r = e.width,
                    o = e.height;
                return {
                    width: r,
                    height: o,
                    top: n,
                    left: t,
                    right: t + r,
                    bottom: n + o,
                    x: t,
                    y: n
                }
            }

            function ig(e, t, n) {
                var r, o = e.reference,
                    i = e.floating,
                    a = is(t),
                    s = io(is(t)),
                    l = ii(s),
                    u = it(t),
                    c = "y" === a,
                    d = o.x + o.width / 2 - i.width / 2,
                    f = o.y + o.height / 2 - i.height / 2,
                    h = o[l] / 2 - i[l] / 2;
                switch (u) {
                    case "top":
                        r = {
                            x: d,
                            y: o.y - i.height
                        };
                        break;
                    case "bottom":
                        r = {
                            x: d,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        r = {
                            x: o.x + o.width,
                            y: f
                        };
                        break;
                    case "left":
                        r = {
                            x: o.x - i.width,
                            y: f
                        };
                        break;
                    default:
                        r = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (ir(t)) {
                    case "start":
                        r[s] -= h * (n && c ? -1 : 1);
                        break;
                    case "end":
                        r[s] += h * (n && c ? -1 : 1)
                }
                return r
            }

            function iy(e, t) {
                return nR(function() {
                    var n, r, o, i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x, S, E, I, T, C, P, A, _, N, R, O;
                    return nO(this, function(k) {
                        switch (k.label) {
                            case 0:
                                return void 0 === t && (t = {}), r = e.x, o = e.y, i = e.platform, a = e.rects, s = e.elements, l = e.strategy, d = void 0 === (c = (u = ie(t, e)).boundary) ? "clippingAncestors" : c, h = void 0 === (f = u.rootBoundary) ? "viewport" : f, v = void 0 === (p = u.elementContext) ? "floating" : p, g = void 0 !== (m = u.altBoundary) && m, b = iv(void 0 === (y = u.padding) ? 0 : y), w = "floating" === v ? "reference" : "floating", x = s[g ? w : v], E = i.getClippingRect, I = {}, [4, null == i.isElement ? void 0 : i.isElement(x)];
                            case 1:
                                if (!(null == (n = k.sent()) || n)) return [3, 2];
                                return T = x, [3, 5];
                            case 2:
                                if (C = x.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(s.floating)];
                            case 3:
                                C = k.sent(), k.label = 4;
                            case 4:
                                T = C, k.label = 5;
                            case 5:
                                return [4, E.apply(i, [(I.element = T, I.boundary = d, I.rootBoundary = h, I.strategy = l, I)])];
                            case 6:
                                return S = im.apply(void 0, [k.sent()]), P = "floating" === v ? {
                                    x: r,
                                    y: o,
                                    width: a.floating.width,
                                    height: a.floating.height
                                } : a.reference, [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(s.floating)];
                            case 7:
                                return A = k.sent(), [4, null == i.isElement ? void 0 : i.isElement(A)];
                            case 8:
                                if (!k.sent()) return [3, 10];
                                return [4, null == i.getScale ? void 0 : i.getScale(A)];
                            case 9:
                                return N = k.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                N = {
                                    x: 1,
                                    y: 1
                                }, k.label = 11;
                            case 11:
                                if (_ = N, !i.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: s,
                                    rect: P,
                                    offsetParent: A,
                                    strategy: l
                                })];
                            case 12:
                                return O = k.sent(), [3, 14];
                            case 13:
                                O = P, k.label = 14;
                            case 14:
                                return R = im.apply(void 0, [O]), [2, {
                                    top: (S.top - R.top + b.top) / _.y,
                                    bottom: (R.bottom - S.bottom + b.bottom) / _.y,
                                    left: (S.left - R.left + b.left) / _.x,
                                    right: (R.right - S.right + b.right) / _.x
                                }]
                        }
                    })
                })()
            }

            function ib(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function iw(e) {
                return o2.some(function(t) {
                    return e[t] >= 0
                })
            }
            var ix = new Set(["left", "top"]);

            function iS() {
                return "u" > typeof window
            }

            function iE(e) {
                return iC(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function iI(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function iT(e) {
                var t;
                return null == (t = (iC(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function iC(e) {
                return !!iS() && ((0, to._)(e, Node) || (0, to._)(e, iI(e).Node))
            }

            function iP(e) {
                return !!iS() && ((0, to._)(e, Element) || (0, to._)(e, iI(e).Element))
            }

            function iA(e) {
                return !!iS() && ((0, to._)(e, HTMLElement) || (0, to._)(e, iI(e).HTMLElement))
            }

            function i_(e) {
                return !(!iS() || "u" < typeof ShadowRoot) && ((0, to._)(e, ShadowRoot) || (0, to._)(e, iI(e).ShadowRoot))
            }
            var iN = new Set(["inline", "contents"]);

            function iR(e) {
                var t = iz(e),
                    n = t.overflow,
                    r = t.overflowX,
                    o = t.overflowY,
                    i = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(n + o + r) && !iN.has(i)
            }
            var iO = new Set(["table", "td", "th"]),
                ik = [":popover-open", ":modal"];

            function iM(e) {
                return ik.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var iL = ["transform", "translate", "scale", "rotate", "perspective"],
                iD = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                iB = ["paint", "layout", "strict", "content"];

            function ij(e) {
                var t = iF(),
                    n = iP(e) ? iz(e) : e;
                return iL.some(function(e) {
                    return !!n[e] && "none" !== n[e]
                }) || !!n.containerType && "normal" !== n.containerType || !t && !!n.backdropFilter && "none" !== n.backdropFilter || !t && !!n.filter && "none" !== n.filter || iD.some(function(e) {
                    return (n.willChange || "").includes(e)
                }) || iB.some(function(e) {
                    return (n.contain || "").includes(e)
                })
            }

            function iF() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var iH = new Set(["html", "body", "#document"]);

            function iU(e) {
                return iH.has(iE(e))
            }

            function iz(e) {
                return iI(e).getComputedStyle(e)
            }

            function iG(e) {
                return iP(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function iV(e) {
                if ("html" === iE(e)) return e;
                var t = e.assignedSlot || e.parentNode || i_(e) && e.host || iT(e);
                return i_(t) ? t.host : t
            }

            function iW(e, t, n) {
                void 0 === t && (t = []), void 0 === n && (n = !0);
                var r, o = function e(t) {
                        var n = iV(t);
                        return iU(n) ? t.ownerDocument ? t.ownerDocument.body : t.body : iA(n) && iR(n) ? n : e(n)
                    }(e),
                    i = o === (null == (r = e.ownerDocument) ? void 0 : r.body),
                    a = iI(o);
                if (i) {
                    var s = iK(a);
                    return t.concat(a, a.visualViewport || [], iR(o) ? o : [], s && n ? iW(s) : [])
                }
                return t.concat(o, iW(o, [], n))
            }

            function iK(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function iq(e) {
                var t = iz(e),
                    n = parseFloat(t.width) || 0,
                    r = parseFloat(t.height) || 0,
                    o = iA(e),
                    i = o ? e.offsetWidth : n,
                    a = o ? e.offsetHeight : r,
                    s = o4(n) !== i || o4(r) !== a;
                return s && (n = i, r = a), {
                    width: n,
                    height: r,
                    $: s
                }
            }

            function iX(e) {
                return iP(e) ? e : e.contextElement
            }

            function iZ(e) {
                var t = iX(e);
                if (!iA(t)) return o8(1);
                var n = t.getBoundingClientRect(),
                    r = iq(t),
                    o = r.width,
                    i = r.height,
                    a = r.$,
                    s = (a ? o4(n.width) : n.width) / o,
                    l = (a ? o4(n.height) : n.height) / i;
                return s && Number.isFinite(s) || (s = 1), l && Number.isFinite(l) || (l = 1), {
                    x: s,
                    y: l
                }
            }
            var iY = o8(0);

            function i$(e) {
                var t = iI(e);
                return iF() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : iY
            }

            function iQ(e, t, n, r) {
                void 0 === t && (t = !1), void 0 === n && (n = !1);
                var o, i = e.getBoundingClientRect(),
                    a = iX(e),
                    s = o8(1);
                t && (r ? iP(r) && (s = iZ(r)) : s = iZ(e));
                var l = (void 0 === (o = n) && (o = !1), r && (!o || r === iI(a)) && o) ? i$(a) : o8(0),
                    u = (i.left + l.x) / s.x,
                    c = (i.top + l.y) / s.y,
                    d = i.width / s.x,
                    f = i.height / s.y;
                if (a)
                    for (var h = iI(a), p = r && iP(r) ? iI(r) : r, v = h, m = iK(v); m && r && p !== v;) {
                        var g = iZ(m),
                            y = m.getBoundingClientRect(),
                            b = iz(m),
                            w = y.left + (m.clientLeft + parseFloat(b.paddingLeft)) * g.x,
                            x = y.top + (m.clientTop + parseFloat(b.paddingTop)) * g.y;
                        u *= g.x, c *= g.y, d *= g.x, f *= g.y, u += w, c += x, m = iK(v = iI(m))
                    }
                return im({
                    width: d,
                    height: f,
                    x: u,
                    y: c
                })
            }

            function iJ(e, t) {
                var n = iG(e).scrollLeft;
                return t ? t.left + n : iQ(iT(e)).left + n
            }

            function i0(e, t) {
                var n = e.getBoundingClientRect();
                return {
                    x: n.left + t.scrollLeft - iJ(e, n),
                    y: n.top + t.scrollTop
                }
            }
            var i1 = new Set(["absolute", "fixed"]);

            function i2(e, t, n) {
                if ("viewport" === t) r = function(e, t) {
                    var n = iI(e),
                        r = iT(e),
                        o = n.visualViewport,
                        i = r.clientWidth,
                        a = r.clientHeight,
                        s = 0,
                        l = 0;
                    if (o) {
                        i = o.width, a = o.height;
                        var u = iF();
                        (!u || u && "fixed" === t) && (s = o.offsetLeft, l = o.offsetTop)
                    }
                    var c = iJ(r);
                    if (c <= 0) {
                        var d = r.ownerDocument,
                            f = d.body,
                            h = getComputedStyle(f),
                            p = "CSS1Compat" === d.compatMode && parseFloat(h.marginLeft) + parseFloat(h.marginRight) || 0,
                            v = Math.abs(r.clientWidth - f.clientWidth - p);
                        v <= 25 && (i -= v)
                    } else c <= 25 && (i += c);
                    return {
                        width: i,
                        height: a,
                        x: s,
                        y: l
                    }
                }(e, n);
                else if ("document" === t) o = iT(e), i = iT(o), a = iG(o), s = o.ownerDocument.body, l = o3(i.scrollWidth, i.clientWidth, s.scrollWidth, s.clientWidth), u = o3(i.scrollHeight, i.clientHeight, s.scrollHeight, s.clientHeight), c = -a.scrollLeft + iJ(o), d = -a.scrollTop, "rtl" === iz(s).direction && (c += o3(i.clientWidth, s.clientWidth) - l), r = {
                    width: l,
                    height: u,
                    x: c,
                    y: d
                };
                else if (iP(t)) h = (f = iQ(t, !0, "fixed" === n)).top + t.clientTop, p = f.left + t.clientLeft, v = iA(t) ? iZ(t) : o8(1), r = {
                    width: t.clientWidth * v.x,
                    height: t.clientHeight * v.y,
                    x: p * v.x,
                    y: h * v.y
                };
                else {
                    var r, o, i, a, s, l, u, c, d, f, h, p, v, m = i$(e);
                    r = {
                        x: t.x - m.x,
                        y: t.y - m.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return im(r)
            }

            function i5(e, t, n) {
                var r = iA(t),
                    o = iT(t),
                    i = "fixed" === n,
                    a = iQ(e, !0, i, t),
                    s = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    l = o8(0);
                if (r || !r && !i)
                    if (("body" !== iE(t) || iR(o)) && (s = iG(t)), r) {
                        var u = iQ(t, !0, i, t);
                        l.x = u.x + t.clientLeft, l.y = u.y + t.clientTop
                    } else o && (l.x = iJ(o));
                i && !r && o && (l.x = iJ(o));
                var c = !o || r || i ? o8(0) : i0(o, s);
                return {
                    x: a.left + s.scrollLeft - l.x - c.x,
                    y: a.top + s.scrollTop - l.y - c.y,
                    width: a.width,
                    height: a.height
                }
            }

            function i3(e) {
                return "static" === iz(e).position
            }

            function i4(e, t) {
                if (!iA(e) || "fixed" === iz(e).position) return null;
                if (t) return t(e);
                var n = e.offsetParent;
                return iT(e) === n && (n = n.ownerDocument.body), n
            }

            function i6(e, t) {
                var n, r = iI(e);
                if (iM(e)) return r;
                if (!iA(e)) {
                    for (var o = iV(e); o && !iU(o);) {
                        if (iP(o) && !i3(o)) return o;
                        o = iV(o)
                    }
                    return r
                }
                for (var i = i4(e, t); i && (n = i, iO.has(iE(n))) && i3(i);) i = i4(i, t);
                return i && iU(i) && i3(i) && !ij(i) ? r : i || function(e) {
                    for (var t = iV(e); iA(t) && !iU(t);) {
                        if (ij(t)) return t;
                        if (iM(t)) break;
                        t = iV(t)
                    }
                    return null
                }(e) || r
            }
            var i8 = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        n = e.rect,
                        r = e.offsetParent,
                        o = "fixed" === e.strategy,
                        i = iT(r),
                        a = !!t && iM(t.floating);
                    if (r === i || a && o) return n;
                    var s = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        l = o8(1),
                        u = o8(0),
                        c = iA(r);
                    if ((c || !c && !o) && (("body" !== iE(r) || iR(i)) && (s = iG(r)), iA(r))) {
                        var d = iQ(r);
                        l = iZ(r), u.x = d.x + r.clientLeft, u.y = d.y + r.clientTop
                    }
                    var f = !i || c || o ? o8(0) : i0(i, s);
                    return {
                        width: n.width * l.x,
                        height: n.height * l.y,
                        x: n.x * l.x - s.scrollLeft * l.x + u.x + f.x,
                        y: n.y * l.y - s.scrollTop * l.y + u.y + f.y
                    }
                },
                getDocumentElement: iT,
                getClippingRect: function(e) {
                    var t = e.element,
                        n = e.boundary,
                        r = e.rootBoundary,
                        i = e.strategy,
                        a = o("clippingAncestors" === n ? iM(t) ? [] : function(e, t) {
                            var n = t.get(e);
                            if (n) return n;
                            for (var r = iW(e, [], !1).filter(function(e) {
                                    return iP(e) && "body" !== iE(e)
                                }), o = null, i = "fixed" === iz(e).position, a = i ? iV(e) : e; iP(a) && !iU(a);) {
                                var s = iz(a),
                                    l = ij(a);
                                l || "fixed" !== s.position || (o = null), (i ? !l && !o : !l && "static" === s.position && !!o && i1.has(o.position) || iR(a) && !l && function e(t, n) {
                                    var r = iV(t);
                                    return !(r === n || !iP(r) || iU(r)) && ("fixed" === iz(r).position || e(r, n))
                                }(e, a)) ? r = r.filter(function(e) {
                                    return e !== a
                                }) : o = s, a = iV(a)
                            }
                            return t.set(e, r), r
                        }(t, this._c) : [].concat(n)).concat([r]),
                        s = a[0],
                        l = a.reduce(function(e, n) {
                            var r = i2(t, n, i);
                            return e.top = o3(r.top, e.top), e.right = o5(r.right, e.right), e.bottom = o5(r.bottom, e.bottom), e.left = o3(r.left, e.left), e
                        }, i2(t, s, i));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: i6,
                getElementRects: function(e) {
                    return nR(function() {
                        var t, n, r, o;
                        return nO(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return t = this.getOffsetParent || i6, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return n = i.sent(), r = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (r.reference = i5.apply(void 0, o.concat([i.sent(), e.strategy])), r.floating = {
                                        x: 0,
                                        y: 0,
                                        width: n.width,
                                        height: n.height
                                    }, r)]
                            }
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = iq(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: iZ,
                isElement: iP,
                isRTL: function(e) {
                    return "rtl" === iz(e).direction
                }
            };

            function i9(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function i7(e, t, n, r) {
                void 0 === r && (r = {});
                var i, a = r.ancestorScroll,
                    s = void 0 === a || a,
                    l = r.ancestorResize,
                    u = void 0 === l || l,
                    c = r.elementResize,
                    d = void 0 === c ? "function" == typeof ResizeObserver : c,
                    f = r.layoutShift,
                    h = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = r.animationFrame,
                    v = void 0 !== p && p,
                    m = iX(e),
                    g = s || u ? o(m ? iW(m) : []).concat(o(iW(t))) : [];
                g.forEach(function(e) {
                    s && e.addEventListener("scroll", n, {
                        passive: !0
                    }), u && e.addEventListener("resize", n)
                });
                var y = m && h ? function(e, t) {
                        var n, r = null,
                            o = iT(e);

                        function i() {
                            var e;
                            clearTimeout(n), null == (e = r) || e.disconnect(), r = null
                        }
                        return ! function a(s, l) {
                            void 0 === s && (s = !1), void 0 === l && (l = 1), i();
                            var u = e.getBoundingClientRect(),
                                c = u.left,
                                d = u.top,
                                f = u.width,
                                h = u.height;
                            if (s || t(), f && h) {
                                var p = {
                                        rootMargin: -o6(d) + "px " + -o6(o.clientWidth - (c + f)) + "px " + -o6(o.clientHeight - (d + h)) + "px " + -o6(c) + "px",
                                        threshold: o3(0, o5(1, l)) || 1
                                    },
                                    v = !0;
                                try {
                                    r = new IntersectionObserver(m, tb(td({}, p), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    r = new IntersectionObserver(m, p)
                                }
                                r.observe(e)
                            }

                            function m(t) {
                                var r = t[0].intersectionRatio;
                                if (r !== l) {
                                    if (!v) return a();
                                    r ? a(!1, r) : n = setTimeout(function() {
                                        a(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== r || i9(u, e.getBoundingClientRect()) || a(), v = !1
                            }
                        }(!0), i
                    }(m, n) : null,
                    b = -1,
                    w = null;
                d && (w = new ResizeObserver(function(e) {
                    var r = ts(e, 1)[0];
                    r && r.target === m && w && (w.unobserve(t), cancelAnimationFrame(b), b = requestAnimationFrame(function() {
                        var e;
                        null == (e = w) || e.observe(t)
                    })), n()
                }), m && !v && w.observe(m), w.observe(t));
                var x = v ? iQ(e) : null;
                return v && function t() {
                        var r = iQ(e);
                        x && !i9(x, r) && n(), x = r, i = requestAnimationFrame(t)
                    }(), n(),
                    function() {
                        var e;
                        g.forEach(function(e) {
                            s && e.removeEventListener("scroll", n), u && e.removeEventListener("resize", n)
                        }), null == y || y(), null == (e = w) || e.disconnect(), w = null, v && cancelAnimationFrame(i)
                    }
            }
            var ae = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return nR(function() {
                                var n, r, o, i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x, S, E, I, T, C, P, A, _, N, R, O, k, M, L, D, B, j;
                                return nO(this, function(F) {
                                    switch (F.label) {
                                        case 0:
                                            if (n = t.x, r = t.y, o = t.placement, i = t.rects, a = t.platform, s = t.elements, l = t.middlewareData, c = (u = ie(e, t) || {}).element, f = void 0 === (d = u.padding) ? 0 : d, null == c) return [2, {}];
                                            return h = iv(f), p = {
                                                x: n,
                                                y: r
                                            }, m = ii(v = io(is(o))), [4, a.getDimensions(c)];
                                        case 1:
                                            return g = F.sent(), b = (y = "y" === v) ? "top" : "left", w = y ? "bottom" : "right", x = y ? "clientHeight" : "clientWidth", S = i.reference[m] + i.reference[v] - p[v] - i.floating[m], E = p[v] - i.reference[v], [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(c)];
                                        case 2:
                                            if (C = !(T = (I = F.sent()) ? I[x] : 0)) return [3, 4];
                                            return [4, null == a.isElement ? void 0 : a.isElement(I)];
                                        case 3:
                                            C = !F.sent(), F.label = 4;
                                        case 4:
                                            return C && (T = s.floating[x] || i.floating[m]), P = S / 2 - E / 2, A = T / 2 - g[m] / 2 - 1, _ = o5(h[b], A), N = o5(h[w], A), R = _, O = T - g[m] - N, M = o3(R, o5(k = T / 2 - g[m] / 2 + P, O)), D = (L = !l.arrow && null != ir(o) && k !== M && i.reference[m] / 2 - (k < R ? _ : N) - g[m] / 2 < 0) ? k < R ? k - R : k - O : 0, [2, (tc(j = {}, v, p[v] + D), tc(j, "data", td((tc(B = {}, v, M), tc(B, "centerOffset", k - M - D), B), L && {
                                                alignmentOffset: D
                                            })), tc(j, "reset", L), j)]
                                    }
                                })
                            })()
                        }
                    }
                },
                at = function(e, t, n) {
                    var r, o = new Map,
                        i = td({
                            platform: i8
                        }, n),
                        a = tb(td({}, i.platform), {
                            _c: o
                        });
                    return r = tb(td({}, i), {
                        platform: a
                    }), nR(function() {
                        var n, o, i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x, S, E, I, T, C, P, A;
                        return nO(this, function(_) {
                            switch (_.label) {
                                case 0:
                                    return o = void 0 === (n = r.placement) ? "bottom" : n, a = void 0 === (i = r.strategy) ? "absolute" : i, l = void 0 === (s = r.middleware) ? [] : s, u = r.platform, c = l.filter(Boolean), [4, null == u.isRTL ? void 0 : u.isRTL(t)];
                                case 1:
                                    return d = _.sent(), [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 2:
                                    p = (h = ig(f = _.sent(), o, d)).x, v = h.y, m = o, g = {}, y = 0, b = 0, _.label = 3;
                                case 3:
                                    if (!(b < c.length)) return [3, 11];
                                    return x = (w = c[b]).name, [4, (0, w.fn)({
                                        x: p,
                                        y: v,
                                        initialPlacement: o,
                                        placement: m,
                                        strategy: a,
                                        middlewareData: g,
                                        rects: f,
                                        platform: u,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    if (E = (S = _.sent()).x, I = S.y, T = S.data, C = S.reset, p = null != E ? E : p, v = null != I ? I : v, g = tb(td({}, g), tc({}, x, td({}, g[x], T))), !(C && y <= 50)) return [3, 10];
                                    if (y++, (void 0 === C ? "undefined" : (0, tS._)(C)) !== "object") return [3, 9];
                                    if (C.placement && (m = C.placement), !C.rects) return [3, 8];
                                    if (!0 !== C.rects) return [3, 6];
                                    return [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: a
                                    })];
                                case 5:
                                    return P = _.sent(), [3, 7];
                                case 6:
                                    P = C.rects, _.label = 7;
                                case 7:
                                    f = P, _.label = 8;
                                case 8:
                                    p = (A = ig(f, m, d)).x, v = A.y, _.label = 9;
                                case 9:
                                    b = -1, _.label = 10;
                                case 10:
                                    return b++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: p,
                                        y: v,
                                        placement: m,
                                        strategy: a,
                                        middlewareData: g
                                    }]
                            }
                        })
                    })()
                },
                an = window.ReactDOM,
                ar = n.n(an),
                ao = "u" > typeof document ? tl.useLayoutEffect : function() {};

            function ai(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : (0, tS._)(e)) !== (void 0 === t ? "undefined" : (0, tS._)(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : (0, tS._)(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((n = e.length) !== t.length) return !1;
                        for (r = n; 0 != r--;)
                            if (!ai(e[r], t[r])) return !1;
                        return !0
                    }
                    if ((n = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (r = n; 0 != r--;)
                        if (!({}).hasOwnProperty.call(t, o[r])) return !1;
                    for (r = n; 0 != r--;) {
                        var n, r, o, i = o[r];
                        if (("_owner" !== i || !e.$$typeof) && !ai(e[i], t[i])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function aa(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function as(e, t) {
                var n = aa(e);
                return Math.round(t * n) / n
            }

            function al(e) {
                var t = tl.useRef(e);
                return ao(function() {
                    t.current = e
                }), t
            }

            function au(e) {
                void 0 === e && (e = {});
                var t = e.placement,
                    n = void 0 === t ? "bottom" : t,
                    r = e.strategy,
                    o = void 0 === r ? "absolute" : r,
                    i = e.middleware,
                    a = void 0 === i ? [] : i,
                    s = e.platform,
                    l = e.elements,
                    u = void 0 === l ? {} : l,
                    c = u.reference,
                    d = u.floating,
                    f = e.transform,
                    h = void 0 === f || f,
                    p = e.whileElementsMounted,
                    v = e.open,
                    m = ts(tl.useState({
                        x: 0,
                        y: 0,
                        strategy: o,
                        placement: n,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    g = m[0],
                    y = m[1],
                    b = ts(tl.useState(a), 2),
                    w = b[0],
                    x = b[1];
                ai(w, a) || x(a);
                var S = ts(tl.useState(null), 2),
                    E = S[0],
                    I = S[1],
                    T = ts(tl.useState(null), 2),
                    C = T[0],
                    P = T[1],
                    A = tl.useCallback(function(e) {
                        e !== O.current && (O.current = e, I(e))
                    }, []),
                    _ = tl.useCallback(function(e) {
                        e !== k.current && (k.current = e, P(e))
                    }, []),
                    N = c || E,
                    R = d || C,
                    O = tl.useRef(null),
                    k = tl.useRef(null),
                    M = tl.useRef(g),
                    L = null != p,
                    D = al(p),
                    B = al(s),
                    j = al(v),
                    F = tl.useCallback(function() {
                        if (O.current && k.current) {
                            var e = {
                                placement: n,
                                strategy: o,
                                middleware: w
                            };
                            B.current && (e.platform = B.current), at(O.current, k.current, e).then(function(e) {
                                var t = tb(td({}, e), {
                                    isPositioned: !1 !== j.current
                                });
                                H.current && !ai(M.current, t) && (M.current = t, an.flushSync(function() {
                                    y(t)
                                }))
                            })
                        }
                    }, [w, n, o, B, j]);
                ao(function() {
                    !1 === v && M.current.isPositioned && (M.current.isPositioned = !1, y(function(e) {
                        return tb(td({}, e), {
                            isPositioned: !1
                        })
                    }))
                }, [v]);
                var H = tl.useRef(!1);
                ao(function() {
                    return H.current = !0,
                        function() {
                            H.current = !1
                        }
                }, []), ao(function() {
                    if (N && (O.current = N), R && (k.current = R), N && R) {
                        if (D.current) return D.current(N, R, F);
                        F()
                    }
                }, [N, R, F, D, L]);
                var U = tl.useMemo(function() {
                        return {
                            reference: O,
                            floating: k,
                            setReference: A,
                            setFloating: _
                        }
                    }, [A, _]),
                    z = tl.useMemo(function() {
                        return {
                            reference: N,
                            floating: R
                        }
                    }, [N, R]),
                    G = tl.useMemo(function() {
                        var e = {
                            position: o,
                            left: 0,
                            top: 0
                        };
                        if (!z.floating) return e;
                        var t = as(z.floating, g.x),
                            n = as(z.floating, g.y);
                        return h ? td(tb(td({}, e), {
                            transform: "translate(" + t + "px, " + n + "px)"
                        }), aa(z.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: o,
                            left: t,
                            top: n
                        }
                    }, [o, h, z.floating, g.x, g.y]);
                return tl.useMemo(function() {
                    return tb(td({}, g), {
                        update: F,
                        refs: U,
                        elements: z,
                        floatingStyles: G
                    })
                }, [g, F, U, z, G])
            }
            var ac = function(e, t) {
                    var n;
                    return tb(td({}, (void 0 === (n = e) && (n = 0), {
                        name: "offset",
                        options: n,
                        fn: function(e) {
                            return nR(function() {
                                var t, r, o, i, a, s, l;
                                return nO(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var c;
                                            return o = e.x, i = e.y, a = e.placement, s = e.middlewareData, [4, (c = n, nR(function() {
                                                var t, n, r, o, i, a, s, l, u, d, f, h, p, v;
                                                return nO(this, function(m) {
                                                    switch (m.label) {
                                                        case 0:
                                                            return t = e.placement, n = e.platform, r = e.elements, [4, null == n.isRTL ? void 0 : n.isRTL(r.floating)];
                                                        case 1:
                                                            return o = m.sent(), i = it(t), a = ir(t), s = "y" === is(t), l = ix.has(i) ? -1 : 1, u = o && s ? -1 : 1, h = (f = "number" == typeof(d = ie(c, e)) ? {
                                                                mainAxis: d,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: d.mainAxis || 0,
                                                                crossAxis: d.crossAxis || 0,
                                                                alignmentAxis: d.alignmentAxis
                                                            }).mainAxis, p = f.crossAxis, v = f.alignmentAxis, a && "number" == typeof v && (p = "end" === a ? -1 * v : v), [2, s ? {
                                                                x: p * u,
                                                                y: h * l
                                                            } : {
                                                                x: h * l,
                                                                y: p * u
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (l = u.sent(), a === (null == (t = s.offset) ? void 0 : t.placement) && null != (r = s.arrow) && r.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + l.x,
                                                y: i + l.y,
                                                data: tb(td({}, l), {
                                                    placement: a
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ad = function(e, t) {
                    var n;
                    return tb(td({}, (void 0 === (n = e) && (n = {}), {
                        name: "shift",
                        options: n,
                        fn: function(e) {
                            return nR(function() {
                                var t, r, o, i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x, S, E, I, T, C, P, A, _;
                                return nO(this, function(N) {
                                    switch (N.label) {
                                        case 0:
                                            return t = e.x, r = e.y, o = e.placement, s = void 0 === (a = (i = ie(n, e)).mainAxis) || a, u = void 0 !== (l = i.crossAxis) && l, d = void 0 === (c = i.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : c, f = tz(i, ["mainAxis", "crossAxis", "limiter"]), h = {
                                                x: t,
                                                y: r
                                            }, [4, iy(e, f)];
                                        case 1:
                                            return p = N.sent(), g = h[m = io(v = is(it(o)))], y = h[v], s && (b = "y" === m ? "top" : "left", w = "y" === m ? "bottom" : "right", x = g + p[b], S = g - p[w], g = o3(x, o5(g, S))), u && (E = "y" === v ? "top" : "left", I = "y" === v ? "bottom" : "right", T = y + p[E], C = y - p[I], y = o3(T, o5(y, C))), A = d.fn(tb(td({}, e), (tc(P = {}, m, g), tc(P, v, y), P))), [2, tb(td({}, A), {
                                                data: {
                                                    x: A.x - t,
                                                    y: A.y - r,
                                                    enabled: (tc(_ = {}, m, s), tc(_, v, u), _)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                af = function(e, t) {
                    var n;
                    return tb(td({}, (void 0 === (n = e) && (n = {}), {
                        options: n,
                        fn: function(e) {
                            var t, r = e.x,
                                o = e.y,
                                i = e.placement,
                                a = e.rects,
                                s = e.middlewareData,
                                l = ie(n, e),
                                u = l.offset,
                                c = l.mainAxis,
                                d = l.crossAxis,
                                f = {
                                    x: r,
                                    y: o
                                },
                                h = is(i),
                                p = io(h),
                                v = f[p],
                                m = f[h],
                                g = ie(void 0 === u ? 0 : u, e),
                                y = "number" == typeof g ? {
                                    mainAxis: g,
                                    crossAxis: 0
                                } : td({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, g);
                            if (void 0 === c || c) {
                                var b = "y" === p ? "height" : "width",
                                    w = a.reference[p] - a.floating[b] + y.mainAxis,
                                    x = a.reference[p] + a.reference[b] - y.mainAxis;
                                v < w ? v = w : v > x && (v = x)
                            }
                            if (void 0 === d || d) {
                                var S, E, I = "y" === p ? "width" : "height",
                                    T = ix.has(it(i)),
                                    C = a.reference[h] - a.floating[I] + (T && (null == (S = s.offset) ? void 0 : S[h]) || 0) + (T ? 0 : y.crossAxis),
                                    P = a.reference[h] + a.reference[I] + (T ? 0 : (null == (E = s.offset) ? void 0 : E[h]) || 0) - (T ? y.crossAxis : 0);
                                m < C ? m = C : m > P && (m = P)
                            }
                            return tc(t = {}, p, v), tc(t, h, m), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ah = function(e, t) {
                    var n;
                    return tb(td({}, (void 0 === (n = e) && (n = {}), {
                        name: "flip",
                        options: n,
                        fn: function(e) {
                            return nR(function() {
                                var t, r, i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x, S, E, I, T, C, P, A, _, N, R, O, k, M, L, D, B, j, F, H, U, z;
                                return nO(this, function(G) {
                                    var V, W, K, q, X, Z, Y, $, Q, J, ee, et, en, er, eo;
                                    switch (G.label) {
                                        case 0:
                                            if (i = e.placement, a = e.middlewareData, s = e.rects, l = e.initialPlacement, u = e.platform, c = e.elements, h = void 0 === (f = (d = ie(n, e)).mainAxis) || f, v = void 0 === (p = d.crossAxis) || p, m = d.fallbackPlacements, y = void 0 === (g = d.fallbackStrategy) ? "bestFit" : g, w = void 0 === (b = d.fallbackAxisSideDirection) ? "none" : b, S = void 0 === (x = d.flipAlignment) || x, E = tz(d, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = a.arrow) && t.alignmentOffset) return [2, {}];
                                            return I = it(i), T = is(l), C = it(l) === l, [4, null == u.isRTL ? void 0 : u.isRTL(c.floating)];
                                        case 1:
                                            return P = G.sent(), A = m || (C || !S ? [ip(l)] : (W = ip(V = l), [il(V), W, il(W)])), _ = "none" !== w, !m && _ && (N = A).push.apply(N, o((K = l, q = S, X = w, Z = P, Y = ir(K), $ = function(e, t, n) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (n) return t ? ic : iu;
                                                        return t ? iu : ic;
                                                    case "left":
                                                    case "right":
                                                        return t ? id : ih;
                                                    default:
                                                        return []
                                                }
                                            }(it(K), "start" === X, Z), Y && ($ = $.map(function(e) {
                                                return e + "-" + Y
                                            }), q && ($ = $.concat($.map(il)))), $))), R = [l].concat(o(A)), [4, iy(e, E)];
                                        case 2:
                                            if (O = G.sent(), k = [], M = (null == (r = a.flip) ? void 0 : r.overflows) || [], h && k.push(O[I]), v && (Q = i, J = s, void 0 === (ee = P) && (ee = !1), et = ir(Q), er = ii(en = io(is(Q))), eo = "x" === en ? et === (ee ? "end" : "start") ? "right" : "left" : "start" === et ? "bottom" : "top", J.reference[er] > J.floating[er] && (eo = ip(eo)), L = [eo, ip(eo)], k.push(O[L[0]], O[L[1]])), M = o(M).concat([{
                                                    placement: i,
                                                    overflows: k
                                                }]), !k.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((F = R[j = ((null == (D = a.flip) ? void 0 : D.index) || 0) + 1]) && ("alignment" !== v || T === is(F) || M.every(function(e) {
                                                        return is(e.placement) !== T || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: j,
                                                        overflows: M
                                                    },
                                                    reset: {
                                                        placement: F
                                                    }
                                                }];
                                                if (!(H = null == (B = M.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : B.placement)) switch (y) {
                                                    case "bestFit":
                                                        (z = null == (U = M.filter(function(e) {
                                                            if (_) {
                                                                var t = is(e.placement);
                                                                return t === T || "y" === t
                                                            }
                                                            return !0
                                                        }).map(function(e) {
                                                            return [e.placement, e.overflows.filter(function(e) {
                                                                return e > 0
                                                            }).reduce(function(e, t) {
                                                                return e + t
                                                            }, 0)]
                                                        }).sort(function(e, t) {
                                                            return e[1] - t[1]
                                                        })[0]) ? void 0 : U[0]) && (H = z);
                                                        break;
                                                    case "initialPlacement":
                                                        H = l
                                                }
                                                if (i !== H) return [2, {
                                                    reset: {
                                                        placement: H
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ap = function(e, t) {
                    var n;
                    return tb(td({}, (void 0 === (n = e) && (n = {}), {
                        name: "size",
                        options: n,
                        fn: function(e) {
                            return nR(function() {
                                var t, r, o, i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x, S, E, I, T, C, P, A, _, N, R;
                                return nO(this, function(O) {
                                    switch (O.label) {
                                        case 0:
                                            return o = e.placement, i = e.rects, a = e.platform, s = e.elements, c = void 0 === (u = (l = ie(n, e)).apply) ? function() {} : u, [4, iy(e, tz(l, ["apply"]))];
                                        case 1:
                                            if (d = O.sent(), f = it(o), h = ir(o), p = "y" === is(o), m = (v = i.floating).width, g = v.height, "top" !== f && "bottom" !== f) return [3, 3];
                                            return y = f, [4, null == a.isRTL ? void 0 : a.isRTL(s.floating)];
                                        case 2:
                                            return b = h === (O.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            b = f, y = "end" === h ? "top" : "bottom", O.label = 4;
                                        case 4:
                                            return w = g - d.top - d.bottom, x = m - d.left - d.right, S = o5(g - d[y], w), E = o5(m - d[b], x), I = !e.middlewareData.shift, T = S, C = E, null != (t = e.middlewareData.shift) && t.enabled.x && (C = x), null != (r = e.middlewareData.shift) && r.enabled.y && (T = w), I && !h && (P = o3(d.left, 0), A = o3(d.right, 0), _ = o3(d.top, 0), N = o3(d.bottom, 0), p ? C = m - 2 * (0 !== P || 0 !== A ? P + A : o3(d.left, d.right)) : T = g - 2 * (0 !== _ || 0 !== N ? _ + N : o3(d.top, d.bottom))), [4, c(tb(td({}, e), {
                                                availableWidth: C,
                                                availableHeight: T
                                            }))];
                                        case 5:
                                            return O.sent(), [4, a.getDimensions(s.floating)];
                                        case 6:
                                            if (R = O.sent(), m !== R.width || g !== R.height) return [2, {
                                                reset: {
                                                    rects: !0
                                                }
                                            }];
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                av = function(e, t) {
                    var n;
                    return tb(td({}, (void 0 === (n = e) && (n = {}), {
                        name: "hide",
                        options: n,
                        fn: function(e) {
                            return nR(function() {
                                var t, r, o, i, a, s, l;
                                return nO(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, i = void 0 === (o = (r = ie(n, e)).strategy) ? "referenceHidden" : o, a = tz(r, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, iy(e, tb(td({}, a), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: s = ib(u.sent(), t.reference),
                                                    referenceHidden: iw(s)
                                                }
                                            }];
                                        case 3:
                                            return [4, iy(e, tb(td({}, a), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: l = ib(u.sent(), t.floating),
                                                    escaped: iw(l)
                                                }
                                            }];
                                        case 5:
                                            return [2, {}];
                                        case 6:
                                            return [2]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                am = function(e, t) {
                    return tb(td({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var n = "function" == typeof e ? e(t) : e,
                                r = n.element,
                                o = n.padding;
                            return r && ({}).hasOwnProperty.call(r, "current") ? null != r.current ? ae({
                                element: r.current,
                                padding: o
                            }).fn(t) : {} : r ? ae({
                                element: r,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                },
                ag = tl.forwardRef(function(e, t) {
                    var n = e.children,
                        r = tz(e, ["children"]),
                        o = tl.Children.toArray(n),
                        i = o.find(aw);
                    if (i) {
                        var a = i.props.children,
                            s = o.map(function(e) {
                                return e !== i ? e : tl.Children.count(a) > 1 ? tl.Children.only(null) : tl.isValidElement(a) ? a.props.children : null
                            });
                        return (0, e8.jsx)(ay, tb(td({}, r), {
                            ref: t,
                            children: tl.isValidElement(a) ? tl.cloneElement(a, void 0, s) : null
                        }))
                    }
                    return (0, e8.jsx)(ay, tb(td({}, r), {
                        ref: t,
                        children: n
                    }))
                });
            ag.displayName = "Slot";
            var ay = tl.forwardRef(function(e, t) {
                var n = e.children,
                    r = tz(e, ["children"]);
                if (tl.isValidElement(n)) {
                    var i, a, s, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref;
                    return tl.cloneElement(n, tb(td({}, function(e, t) {
                        var n = td({}, t);
                        for (var r in t) ! function(r) {
                            var i = e[r],
                                a = t[r];
                            /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                a.apply(void 0, o(t)), i.apply(void 0, o(t))
                            } : i && (n[r] = i) : "style" === r ? n[r] = td({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                        }(r);
                        return td({}, e, n)
                    }(r, n.props)), {
                        ref: t ? oX(t, c) : c
                    }))
                }
                return tl.Children.count(n) > 1 ? tl.Children.only(null) : null
            });
            ay.displayName = "SlotClone";
            var ab = function(e) {
                var t = e.children;
                return (0, e8.jsx)(e8.Fragment, {
                    children: t
                })
            };

            function aw(e) {
                return tl.isValidElement(e) && e.type === ab
            }
            var ax = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = tl.forwardRef(function(e, n) {
                        var r = e.asChild,
                            o = tz(e, ["asChild"]),
                            i = r ? ag : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, e8.jsx)(i, tb(td({}, o), {
                            ref: n
                        }))
                    });
                    return n.displayName = "Primitive.".concat(t), tb(td({}, e), tc({}, t, n))
                }, {}),
                aS = tl.forwardRef(function(e, t) {
                    var n = e.children,
                        r = e.width,
                        o = e.height,
                        i = tz(e, ["children", "width", "height"]);
                    return (0, e8.jsx)(ax.svg, tb(td({}, i), {
                        ref: t,
                        width: void 0 === r ? 10 : r,
                        height: void 0 === o ? 5 : o,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? n : (0, e8.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                });

            function aE(e) {
                var t = tl.useRef(e);
                return tl.useEffect(function() {
                    t.current = e
                }), tl.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(o(r)))
                    }
                }, [])
            }
            aS.displayName = "Arrow";
            var aI = "Popper",
                aT = ts(oY(aI), 2),
                aC = aT[0],
                aP = aT[1],
                aA = ts(aC(aI), 2),
                a_ = aA[0],
                aN = aA[1],
                aR = function(e) {
                    var t = e.__scopePopper,
                        n = e.children,
                        r = ts(tl.useState(null), 2),
                        o = r[0],
                        i = r[1];
                    return (0, e8.jsx)(a_, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: n
                    })
                };
            aR.displayName = aI;
            var aO = "PopperAnchor",
                ak = tl.forwardRef(function(e, t) {
                    var n = e.__scopePopper,
                        r = e.virtualRef,
                        o = tz(e, ["__scopePopper", "virtualRef"]),
                        i = aN(aO, n),
                        a = tl.useRef(null),
                        s = oZ(t, a);
                    return tl.useEffect(function() {
                        i.onAnchorChange((null == r ? void 0 : r.current) || a.current)
                    }), r ? null : (0, e8.jsx)(ax.div, tb(td({}, o), {
                        ref: s
                    }))
                });
            ak.displayName = aO;
            var aM = "PopperContent",
                aL = ts(aC(aM), 2),
                aD = aL[0],
                aB = aL[1],
                aj = tl.forwardRef(function(e, t) {
                    var n, r, i, a, s, l, u, c, d, f, h, p = e.__scopePopper,
                        v = e.side,
                        m = e.sideOffset,
                        g = e.align,
                        y = void 0 === g ? "center" : g,
                        b = e.alignOffset,
                        w = e.arrowPadding,
                        x = e.avoidCollisions,
                        S = void 0 === x || x,
                        E = e.collisionBoundary,
                        I = void 0 === E ? [] : E,
                        T = e.collisionPadding,
                        C = void 0 === T ? 0 : T,
                        P = e.sticky,
                        A = e.hideWhenDetached,
                        _ = e.updatePositionStrategy,
                        N = void 0 === _ ? "optimized" : _,
                        R = e.onPlaced,
                        O = tz(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        k = aN(aM, p),
                        M = ts(tl.useState(null), 2),
                        L = M[0],
                        D = M[1],
                        B = oZ(t, function(e) {
                            return D(e)
                        }),
                        j = ts(tl.useState(null), 2),
                        F = j[0],
                        H = j[1],
                        U = (r = (n = ts(tl.useState(void 0), 2))[0], i = n[1], oJ(function() {
                            if (F) {
                                i({
                                    width: F.offsetWidth,
                                    height: F.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, n, r = e[0];
                                        if ("borderBoxSize" in r) {
                                            var o = r.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, n = a.blockSize
                                        } else t = F.offsetWidth, n = F.offsetHeight;
                                        i({
                                            width: t,
                                            height: n
                                        })
                                    }
                                });
                                return e.observe(F, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(F)
                                    }
                            }
                            i(void 0)
                        }, [F]), r),
                        z = null != (a = null == U ? void 0 : U.width) ? a : 0,
                        G = null != (s = null == U ? void 0 : U.height) ? s : 0,
                        V = "number" == typeof C ? C : td({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, C),
                        W = Array.isArray(I) ? I : [I],
                        K = W.length > 0,
                        q = {
                            padding: V,
                            boundary: W.filter(az),
                            altBoundary: K
                        },
                        X = au({
                            strategy: "fixed",
                            placement: (void 0 === v ? "bottom" : v) + ("center" !== y ? "-" + y : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return i7.apply(void 0, o(t).concat([{
                                    animationFrame: "always" === N
                                }]))
                            },
                            elements: {
                                reference: k.anchor
                            },
                            middleware: [ac({
                                mainAxis: (void 0 === m ? 0 : m) + G,
                                alignmentAxis: void 0 === b ? 0 : b
                            }), S && ad(td({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === P ? "partial" : P) ? af() : void 0
                            }, q)), S && ah(td({}, q)), ap(tb(td({}, q), {
                                apply: function(e) {
                                    var t = e.elements,
                                        n = e.rects,
                                        r = e.availableWidth,
                                        o = e.availableHeight,
                                        i = n.reference,
                                        a = i.width,
                                        s = i.height,
                                        l = t.floating.style;
                                    l.setProperty("--radix-popper-available-width", "".concat(r, "px")), l.setProperty("--radix-popper-available-height", "".concat(o, "px")), l.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), l.setProperty("--radix-popper-anchor-height", "".concat(s, "px"))
                                }
                            })), F && am({
                                element: F,
                                padding: void 0 === w ? 0 : w
                            }), aG({
                                arrowWidth: z,
                                arrowHeight: G
                            }), void 0 !== A && A && av(td({
                                strategy: "referenceHidden"
                            }, q))]
                        }),
                        Z = X.refs,
                        Y = X.floatingStyles,
                        $ = X.placement,
                        Q = X.isPositioned,
                        J = X.middlewareData,
                        ee = ts(aV($), 2),
                        et = ee[0],
                        en = ee[1],
                        er = aE(R);
                    oJ(function() {
                        Q && (null == er || er())
                    }, [Q, er]);
                    var eo = null == (l = J.arrow) ? void 0 : l.x,
                        ei = null == (u = J.arrow) ? void 0 : u.y,
                        ea = (null == (c = J.arrow) ? void 0 : c.centerOffset) !== 0,
                        es = ts(tl.useState(), 2),
                        el = es[0],
                        eu = es[1];
                    return oJ(function() {
                        L && eu(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, e8.jsx)("div", {
                        ref: Z.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: td(tb(td({}, Y), tc({
                            transform: Q ? Y.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: el
                        }, "--radix-popper-transform-origin", [null == (d = J.transformOrigin) ? void 0 : d.x, null == (f = J.transformOrigin) ? void 0 : f.y].join(" "))), (null == (h = J.hide) ? void 0 : h.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, e8.jsx)(aD, {
                            scope: p,
                            placedSide: et,
                            onArrowChange: H,
                            arrowX: eo,
                            arrowY: ei,
                            shouldHideArrow: ea,
                            children: (0, e8.jsx)(ax.div, tb(td({
                                "data-side": et,
                                "data-align": en
                            }, O), {
                                ref: B,
                                style: tb(td({}, O.style), {
                                    animation: Q ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            aj.displayName = aM;
            var aF = "PopperArrow",
                aH = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                aU = tl.forwardRef(function(e, t) {
                    var n, r = e.__scopePopper,
                        o = tz(e, ["__scopePopper"]),
                        i = aB(aF, r),
                        a = aH[i.placedSide];
                    return (0, e8.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (tc(n = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), tc(n, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), tc(n, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), tc(n, "visibility", i.shouldHideArrow ? "hidden" : void 0), n),
                        children: (0, e8.jsx)(aS, tb(td({}, o), {
                            ref: t,
                            style: tb(td({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function az(e) {
                return null !== e
            }
            aU.displayName = aF;
            var aG = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var n, r, o, i, a, s = t.placement,
                            l = t.rects,
                            u = t.middlewareData,
                            c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0,
                            d = c ? 0 : e.arrowWidth,
                            f = c ? 0 : e.arrowHeight,
                            h = ts(aV(s), 2),
                            p = h[0],
                            v = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [h[1]],
                            m = (null != (n = null == (i = u.arrow) ? void 0 : i.x) ? n : 0) + d / 2,
                            g = (null != (r = null == (a = u.arrow) ? void 0 : a.y) ? r : 0) + f / 2,
                            y = "",
                            b = "";
                        return "bottom" === p ? (y = c ? v : "".concat(m, "px"), b = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(m, "px"), b = "".concat(l.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), b = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(l.floating.width + f, "px"), b = c ? v : "".concat(g, "px")), {
                            data: {
                                x: y,
                                y: b
                            }
                        }
                    }
                }
            };

            function aV(e) {
                var t = ts(e.split("-"), 2),
                    n = t[0],
                    r = t[1];
                return [n, void 0 === r ? "center" : r]
            }
            var aW = tl.forwardRef(function(e, t) {
                var n, r, o = e.container,
                    i = tz(e, ["container"]),
                    a = ts(tl.useState(!1), 2),
                    s = a[0],
                    l = a[1];
                oJ(function() {
                    return l(!0)
                }, []);
                var u = o || s && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
                return u ? ar().createPortal((0, e8.jsx)(ax.div, tb(td({}, i), {
                    ref: t
                })), u) : null
            });
            aW.displayName = "Portal";
            var aK = function(e) {
                var t, n, r, o, i, a, s, l, u, c, d, f, h, p, v, m, g, y = e.present,
                    b = e.children,
                    w = (t = y, i = (o = ts(tl.useState(), 2))[0], a = o[1], s = tl.useRef({}), l = tl.useRef(t), u = tl.useRef("none"), d = (c = ts((n = t ? "mounted" : "unmounted", r = {
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
                    }, tl.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], f = c[1], tl.useEffect(function() {
                        var e = aq(s.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), oJ(function() {
                        var e = s.current,
                            n = l.current;
                        if (n !== t) {
                            var r = u.current,
                                o = aq(e);
                            t ? f("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : n && r !== o ? f("ANIMATION_OUT") : f("UNMOUNT"), l.current = t
                        }
                    }, [t, f]), oJ(function() {
                        if (i) {
                            var e, t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                                r = function(e) {
                                    var r = aq(s.current).includes(e.animationName);
                                    if (e.target === i && r && (f("ANIMATION_END"), !l.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = aq(s.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                                }
                        }
                        f("ANIMATION_END")
                    }, [i, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: tl.useCallback(function(e) {
                            e && (s.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof b ? b({
                        present: w.isPresent
                    }) : tl.Children.only(b),
                    S = oZ(w.ref, (g = (m = null == (p = Object.getOwnPropertyDescriptor((h = x).props, "ref")) ? void 0 : p.get) && "isReactWarning" in m && m.isReactWarning) ? h.ref : (g = (m = null == (v = Object.getOwnPropertyDescriptor(h, "ref")) ? void 0 : v.get) && "isReactWarning" in m && m.isReactWarning) ? h.props.ref : h.props.ref || h.ref);
                return "function" == typeof b || w.isPresent ? tl.cloneElement(x, {
                    ref: S
                }) : null
            };

            function aq(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            aK.displayName = "Presence";
            var aX = tl.forwardRef(function(e, t) {
                return (0, e8.jsx)(ax.span, tb(td({}, e), {
                    ref: t,
                    style: td({
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
                    }, e.style)
                }))
            });
            aX.displayName = "VisuallyHidden";
            var aZ = ts(oY("Tooltip", [aP]), 2),
                aY = aZ[0];
            aZ[1];
            var a$ = aP(),
                aQ = "TooltipProvider",
                aJ = "tooltip.open",
                a0 = ts(aY(aQ), 2),
                a1 = a0[0],
                a2 = a0[1],
                a5 = function(e) {
                    var t = e.__scopeTooltip,
                        n = e.delayDuration,
                        r = e.skipDelayDuration,
                        o = void 0 === r ? 300 : r,
                        i = e.disableHoverableContent,
                        a = e.children,
                        s = ts(tl.useState(!0), 2),
                        l = s[0],
                        u = s[1],
                        c = tl.useRef(!1),
                        d = tl.useRef(0);
                    return tl.useEffect(function() {
                        var e = d.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, e8.jsx)(a1, {
                        scope: t,
                        isOpenDelayed: l,
                        delayDuration: void 0 === n ? 700 : n,
                        onOpen: tl.useCallback(function() {
                            window.clearTimeout(d.current), u(!1)
                        }, []),
                        onClose: tl.useCallback(function() {
                            window.clearTimeout(d.current), d.current = window.setTimeout(function() {
                                return u(!0)
                            }, o)
                        }, [o]),
                        isPointerInTransitRef: c,
                        onPointerInTransitChange: tl.useCallback(function(e) {
                            c.current = e
                        }, []),
                        disableHoverableContent: void 0 !== i && i,
                        children: a
                    })
                };
            a5.displayName = aQ;
            var a3 = "Tooltip",
                a4 = ts(aY(a3), 2),
                a6 = a4[0],
                a8 = a4[1],
                a9 = function(e) {
                    var t, n, r, o, i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x = e.__scopeTooltip,
                        S = e.children,
                        E = e.open,
                        I = e.defaultOpen,
                        T = e.onOpenChange,
                        C = e.disableHoverableContent,
                        P = e.delayDuration,
                        A = a2(a3, e.__scopeTooltip),
                        _ = a$(x),
                        N = ts(tl.useState(null), 2),
                        R = N[0],
                        O = N[1],
                        k = (u = (l = ts(tl.useState(o0()), 2))[0], c = l[1], oJ(function() {
                            c(function(e) {
                                return null != e ? e : String(o1++)
                            })
                        }, [void 0]), u ? "radix-".concat(u) : ""),
                        M = tl.useRef(0),
                        L = null != C ? C : A.disableHoverableContent,
                        D = null != P ? P : A.delayDuration,
                        B = tl.useRef(!1),
                        j = ts((f = (d = {
                            prop: E,
                            defaultProp: void 0 !== I && I,
                            onChange: function(e) {
                                e ? (A.onOpen(), document.dispatchEvent(new CustomEvent(aJ))) : A.onClose(), null == T || T(e)
                            }
                        }).prop, m = (v = ts((n = (t = {
                            defaultProp: d.defaultProp,
                            onChange: p = void 0 === (h = d.onChange) ? function() {} : h
                        }).defaultProp, r = t.onChange, i = ts(o = tl.useState(n), 1)[0], a = tl.useRef(i), s = aE(r), tl.useEffect(function() {
                            a.current !== i && (s(i), a.current = i)
                        }, [i, a, s]), o), 2))[0], g = v[1], b = (y = void 0 !== f) ? f : m, w = aE(p), [b, tl.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(f) : e;
                                t !== f && w(t)
                            } else g(e)
                        }, [y, f, g, w])]), 2),
                        F = j[0],
                        H = void 0 !== F && F,
                        U = j[1],
                        z = tl.useMemo(function() {
                            return H ? B.current ? "delayed-open" : "instant-open" : "closed"
                        }, [H]),
                        G = tl.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, B.current = !1, U(!0)
                        }, [U]),
                        V = tl.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, U(!1)
                        }, [U]),
                        W = tl.useCallback(function() {
                            window.clearTimeout(M.current), M.current = window.setTimeout(function() {
                                B.current = !0, U(!0), M.current = 0
                            }, D)
                        }, [D, U]);
                    return tl.useEffect(function() {
                        return function() {
                            M.current && (window.clearTimeout(M.current), M.current = 0)
                        }
                    }, []), (0, e8.jsx)(aR, tb(td({}, _), {
                        children: (0, e8.jsx)(a6, {
                            scope: x,
                            contentId: k,
                            open: H,
                            stateAttribute: z,
                            trigger: R,
                            onTriggerChange: O,
                            onTriggerEnter: tl.useCallback(function() {
                                A.isOpenDelayed ? W() : G()
                            }, [A.isOpenDelayed, W, G]),
                            onTriggerLeave: tl.useCallback(function() {
                                L ? V() : (window.clearTimeout(M.current), M.current = 0)
                            }, [V, L]),
                            onOpen: G,
                            onClose: V,
                            disableHoverableContent: L,
                            children: S
                        })
                    }))
                };
            a9.displayName = a3;
            var a7 = "TooltipTrigger",
                se = tl.forwardRef(function(e, t) {
                    var n = e.__scopeTooltip,
                        r = tz(e, ["__scopeTooltip"]),
                        o = a8(a7, n),
                        i = a2(a7, n),
                        a = a$(n),
                        s = oZ(t, tl.useRef(null), o.onTriggerChange),
                        l = tl.useRef(!1),
                        u = tl.useRef(!1),
                        c = tl.useCallback(function() {
                            return l.current = !1
                        }, []);
                    return tl.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", c)
                        }
                    }, [c]), (0, e8.jsx)(ak, tb(td({
                        asChild: !0
                    }, a), {
                        children: (0, e8.jsx)(ax.button, tb(td({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, r), {
                            ref: s,
                            onPointerMove: oK(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (u.current || i.isPointerInTransitRef.current || (o.onTriggerEnter(), u.current = !0))
                            }),
                            onPointerLeave: oK(e.onPointerLeave, function() {
                                o.onTriggerLeave(), u.current = !1
                            }),
                            onPointerDown: oK(e.onPointerDown, function() {
                                l.current = !0, document.addEventListener("pointerup", c, {
                                    once: !0
                                })
                            }),
                            onFocus: oK(e.onFocus, function() {
                                l.current || o.onOpen()
                            }),
                            onBlur: oK(e.onBlur, o.onClose),
                            onClick: oK(e.onClick, o.onClose)
                        }))
                    }))
                });
            se.displayName = a7;
            var st = "TooltipPortal",
                sn = ts(aY(st, {
                    forceMount: void 0
                }), 2),
                sr = sn[0],
                so = sn[1],
                si = function(e) {
                    var t = e.__scopeTooltip,
                        n = e.forceMount,
                        r = e.children,
                        o = e.container,
                        i = a8(st, t);
                    return (0, e8.jsx)(sr, {
                        scope: t,
                        forceMount: n,
                        children: (0, e8.jsx)(aK, {
                            present: n || i.open,
                            children: (0, e8.jsx)(aW, {
                                asChild: !0,
                                container: o,
                                children: r
                            })
                        })
                    })
                };
            si.displayName = st;
            var sa = "TooltipContent",
                ss = tl.forwardRef(function(e, t) {
                    var n = so(sa, e.__scopeTooltip),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        i = e.side,
                        a = void 0 === i ? "top" : i,
                        s = tz(e, ["forceMount", "side"]),
                        l = a8(sa, e.__scopeTooltip);
                    return (0, e8.jsx)(aK, {
                        present: o || l.open,
                        children: l.disableHoverableContent ? (0, e8.jsx)(sf, tb(td({
                            side: a
                        }, s), {
                            ref: t
                        })) : (0, e8.jsx)(sl, tb(td({
                            side: a
                        }, s), {
                            ref: t
                        }))
                    })
                }),
                sl = tl.forwardRef(function(e, t) {
                    var n = a8(sa, e.__scopeTooltip),
                        r = a2(sa, e.__scopeTooltip),
                        i = tl.useRef(null),
                        a = oZ(t, i),
                        s = ts(tl.useState(null), 2),
                        l = s[0],
                        u = s[1],
                        c = n.trigger,
                        d = n.onClose,
                        f = i.current,
                        h = r.onPointerInTransitChange,
                        p = tl.useCallback(function() {
                            u(null), h(!1)
                        }, [h]),
                        v = tl.useCallback(function(e, t) {
                            var n, r, i, a, s, l, c = e.currentTarget,
                                d = {
                                    x: e.clientX,
                                    y: e.clientY
                                },
                                f = function(e, t) {
                                    var n = Math.abs(t.top - e.y),
                                        r = Math.abs(t.bottom - e.y),
                                        o = Math.abs(t.right - e.x),
                                        i = Math.abs(t.left - e.x);
                                    switch (Math.min(n, r, o, i)) {
                                        case i:
                                            return "left";
                                        case o:
                                            return "right";
                                        case n:
                                            return "top";
                                        case r:
                                            return "bottom";
                                        default:
                                            throw Error("unreachable")
                                    }
                                }(d, c.getBoundingClientRect()),
                                p = function(e, t) {
                                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                        r = [];
                                    switch (t) {
                                        case "top":
                                            r.push({
                                                x: e.x - n,
                                                y: e.y + n
                                            }, {
                                                x: e.x + n,
                                                y: e.y + n
                                            });
                                            break;
                                        case "bottom":
                                            r.push({
                                                x: e.x - n,
                                                y: e.y - n
                                            }, {
                                                x: e.x + n,
                                                y: e.y - n
                                            });
                                            break;
                                        case "left":
                                            r.push({
                                                x: e.x + n,
                                                y: e.y - n
                                            }, {
                                                x: e.x + n,
                                                y: e.y + n
                                            });
                                            break;
                                        case "right":
                                            r.push({
                                                x: e.x - n,
                                                y: e.y - n
                                            }, {
                                                x: e.x - n,
                                                y: e.y + n
                                            })
                                    }
                                    return r
                                }(d, f),
                                v = (r = (n = t.getBoundingClientRect()).top, i = n.right, a = n.bottom, [{
                                    x: s = n.left,
                                    y: r
                                }, {
                                    x: i,
                                    y: r
                                }, {
                                    x: i,
                                    y: a
                                }, {
                                    x: s,
                                    y: a
                                }]);
                            u(((l = o(p).concat(o(v)).slice()).sort(function(e, t) {
                                return e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)
                            }), function(e) {
                                if (e.length <= 1) return e.slice();
                                for (var t = [], n = 0; n < e.length; n++) {
                                    for (var r = e[n]; t.length >= 2;) {
                                        var o = t[t.length - 1],
                                            i = t[t.length - 2];
                                        if ((o.x - i.x) * (r.y - i.y) >= (o.y - i.y) * (r.x - i.x)) t.pop();
                                        else break
                                    }
                                    t.push(r)
                                }
                                t.pop();
                                for (var a = [], s = e.length - 1; s >= 0; s--) {
                                    for (var l = e[s]; a.length >= 2;) {
                                        var u = a[a.length - 1],
                                            c = a[a.length - 2];
                                        if ((u.x - c.x) * (l.y - c.y) >= (u.y - c.y) * (l.x - c.x)) a.pop();
                                        else break
                                    }
                                    a.push(l)
                                }
                                return (a.pop(), 1 === t.length && 1 === a.length && t[0].x === a[0].x && t[0].y === a[0].y) ? t : t.concat(a)
                            }(l))), h(!0)
                        }, [h]);
                    return tl.useEffect(function() {
                        return function() {
                            return p()
                        }
                    }, [p]), tl.useEffect(function() {
                        if (c && f) {
                            var e = function(e) {
                                    return v(e, f)
                                },
                                t = function(e) {
                                    return v(e, c)
                                };
                            return c.addEventListener("pointerleave", e), f.addEventListener("pointerleave", t),
                                function() {
                                    c.removeEventListener("pointerleave", e), f.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [c, f, v, p]), tl.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                var t = e.target,
                                    n = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    r = (null == c ? void 0 : c.contains(t)) || (null == f ? void 0 : f.contains(t)),
                                    o = ! function(e, t) {
                                        for (var n = e.x, r = e.y, o = !1, i = 0, a = t.length - 1; i < t.length; a = i++) {
                                            var s = t[i].x,
                                                l = t[i].y,
                                                u = t[a].x,
                                                c = t[a].y;
                                            l > r != c > r && n < (u - s) * (r - l) / (c - l) + s && (o = !o)
                                        }
                                        return o
                                    }(n, l);
                                r ? p() : o && (p(), d())
                            };
                            return document.addEventListener("pointermove", e),
                                function() {
                                    return document.removeEventListener("pointermove", e)
                                }
                        }
                    }, [c, f, l, d, p]), (0, e8.jsx)(sf, tb(td({}, e), {
                        ref: a
                    }))
                }),
                su = ts(aY(a3, {
                    isInside: !1
                }), 2),
                sc = su[0],
                sd = su[1],
                sf = tl.forwardRef(function(e, t) {
                    var n = e.__scopeTooltip,
                        r = e.children,
                        o = e["aria-label"],
                        i = e.onEscapeKeyDown,
                        a = e.onPointerDownOutside,
                        s = tz(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        l = a8(sa, n),
                        u = a$(n),
                        c = l.onClose;
                    return tl.useEffect(function() {
                        return document.addEventListener(aJ, c),
                            function() {
                                return document.removeEventListener(aJ, c)
                            }
                    }, [c]), tl.useEffect(function() {
                        if (l.trigger) {
                            var e = function(e) {
                                var t = e.target;
                                (null == t ? void 0 : t.contains(l.trigger)) && c()
                            };
                            return window.addEventListener("scroll", e, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", e, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [l.trigger, c]), (0, e8.jsx)(oQ.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: i,
                        onPointerDownOutside: a,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: c,
                        children: (0, e8.jsxs)(aj, tb(td({
                            "data-state": l.stateAttribute
                        }, u, s), {
                            ref: t,
                            style: td({}, s.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, e8.jsx)(ab, {
                                children: r
                            }), (0, e8.jsx)(sc, {
                                scope: n,
                                isInside: !0,
                                children: (0, e8.jsx)(aX, {
                                    id: l.contentId,
                                    role: "tooltip",
                                    children: o || r
                                })
                            })]
                        }))
                    })
                });
            ss.displayName = sa;
            var sh = "TooltipArrow",
                sp = tl.forwardRef(function(e, t) {
                    var n = e.__scopeTooltip,
                        r = tz(e, ["__scopeTooltip"]),
                        o = a$(n);
                    return sd(sh, n).isInside ? null : (0, e8.jsx)(aU, tb(td({}, o, r), {
                        ref: t
                    }))
                });

            function sv(e) {
                var t = e.position,
                    n = e.hasBeak,
                    r = e.title,
                    o = e.description,
                    i = e.ariaLabel,
                    a = e.delayDurationMs,
                    s = e.children,
                    l = e.open,
                    u = e.onOpenChange,
                    c = e.contentClassName,
                    d = ts(t.split("-"), 2),
                    f = d[0],
                    h = d[1],
                    p = null != i ? i : "string" == typeof r && null == o ? r : void 0;
                return tl.createElement(a5, {
                    delayDuration: void 0 === a ? 500 : a
                }, tl.createElement(a9, {
                    open: l,
                    onOpenChange: u
                }, s, tl.createElement(si, null, tl.createElement(ss, {
                    side: f,
                    align: h,
                    "aria-label": p,
                    className: oV("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", c),
                    sideOffset: 5
                }, (void 0 === n || n) && tl.createElement(sp, {
                    asChild: !0
                }, tl.createElement(oW, {
                    className: "content-[var(--inverse-surface-0)]"
                })), tl.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, tl.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, r), o && tl.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, o))))))
            }

            function sm(e) {
                var t = e.children,
                    n = e.asChild,
                    r = e.className;
                return tl.createElement(se, {
                    asChild: n,
                    className: r
                }, t)
            }
            sp.displayName = sh;
            var sg = {
                    top: "top-center",
                    bottom: "bottom-center",
                    left: "left-center",
                    right: "right-center"
                },
                sy = function(e) {
                    var t = e.tooltipText,
                        n = e.placement,
                        r = e.sizeInPx,
                        o = void 0 === r ? 16 : r,
                        i = e.centerIcon;
                    return (0, e8.jsx)("span", {
                        className: oz()("info-tooltip-container", {
                            "icon-centered": i
                        }),
                        children: (0, e8.jsx)("span", {
                            className: oz()("games-info-tooltip", {
                                "icon-centered": i
                            }),
                            children: (0, e8.jsx)(sv, {
                                position: Object.hasOwn(sg, n) ? sg[n] : "top-center",
                                title: t,
                                contentClassName: "games-info-tooltip-content",
                                children: (0, e8.jsx)(sm, {
                                    asChild: !0,
                                    children: (0, e8.jsx)("span", {
                                        children: (0, e8.jsxs)("svg", {
                                            width: o,
                                            height: o,
                                            viewBox: "0 0 16 16",
                                            fill: "none",
                                            xmlns: "http://www.w3.org/2000/svg",
                                            children: [(0, e8.jsx)("path", {
                                                d: "M8.97 5.44H7V4H8.97V5.44Z",
                                                fill: "currentColor"
                                            }), (0, e8.jsx)("path", {
                                                d: "M8.94347 11.9999H7.05347V6.37988H8.94347V11.9999Z",
                                                fill: "currentColor"
                                            }), (0, e8.jsx)("path", {
                                                fillRule: "evenodd",
                                                clipRule: "evenodd",
                                                d: "M8 16C12.4183 16 16 12.4183 16 8C16 3.58172 12.4183 0 8 0C3.58172 0 0 3.58172 0 8C0 12.4183 3.58172 16 8 16ZM8 14.5C11.5899 14.5 14.5 11.5899 14.5 8C14.5 4.41015 11.5899 1.5 8 1.5C4.41015 1.5 1.5 4.41015 1.5 8C1.5 11.5899 4.41015 14.5 8 14.5Z",
                                                fill: "currentColor"
                                            })]
                                        })
                                    })
                                })
                            })
                        })
                    })
                };
            sy.defaultProps = {
                sizeInPx: 16
            };
            var sb = "Label.SponsoredAdsDisclosureStatic",
                sw = rV,
                sx = rW,
                sS = function(e) {
                    var t = e.defaultSubtitle,
                        n = e.endTimestamp,
                        r = e.countdownString,
                        o = e.formatSubtitleLink,
                        i = e.subtitleLink,
                        a = e.handleSeeAllLinkClick,
                        s = e.backgroundImageAssetId,
                        l = (0, tl.useMemo)(function() {
                            var e = n && parseInt(n, 10);
                            if (e || 0 === e) return e
                        }, [n]),
                        u = ts((0, tl.useState)(void 0 !== l ? l - Math.floor(Date.now() / 1e3) : void 0), 2),
                        c = u[0],
                        d = u[1];
                    (0, tl.useEffect)(function() {
                        if (void 0 !== l) {
                            d(l - Math.floor(Date.now() / 1e3));
                            var e = setInterval(function() {
                                d(l - Math.floor(Date.now() / 1e3))
                            }, 15e3);
                            return function() {
                                clearInterval(e)
                            }
                        }
                        d(void 0)
                    }, [l]);
                    var f = (0, tl.useMemo)(function() {
                            if (void 0 !== c && r) {
                                var e = 0,
                                    n = 0;
                                if (c > 0 && (e = Math.floor((n = Math.ceil(c / 60)) / 60), n -= 60 * e), e < 24) return r.replace("{hours}", e.toString()).replace("{minutes}", n.toString())
                            }
                            return t
                        }, [t, c, r]),
                        h = (0, tl.useMemo)(function() {
                            if (o && i && f) {
                                var e = f.indexOf(sw),
                                    t = f.indexOf(sx);
                                if (-1 !== e && -1 !== t && e < t) {
                                    var n = f.slice(0, e),
                                        r = f.slice(e + sw.length, t),
                                        l = f.slice(t + sx.length);
                                    return (0, e8.jsxs)("a", {
                                        href: i,
                                        onClick: a,
                                        children: [n, (0, e8.jsx)("span", {
                                            className: "link-text",
                                            children: r
                                        }), l, s ? (0, e8.jsx)("span", {
                                            className: "icon-chevron-right-dark"
                                        }) : (0, e8.jsx)("span", {
                                            className: "icon-chevron-right"
                                        })]
                                    })
                                }
                            }
                            return f
                        }, [f, i, s, a]);
                    return f ? (0, e8.jsx)("div", {
                        className: "sort-subtitle-container",
                        children: (0, e8.jsx)("span", {
                            className: "font-sort-subtitle text-default",
                            children: h
                        })
                    }) : null
                },
                sE = function(e) {
                    var t = e.sortTitle,
                        n = e.sortSubtitle,
                        r = e.seeAllLink,
                        i = e.subtitleLink,
                        a = e.shouldShowSeparateSubtitleLink,
                        s = e.isSortLinkOverrideEnabled,
                        l = e.buildNavigateToSortLinkEventProperties,
                        u = e.subtitleAction,
                        c = e.shouldShowSponsoredTooltip,
                        d = e.tooltipInfoText,
                        f = e.titleContainerClassName,
                        h = e.hideSeeAll,
                        p = e.endTimestamp,
                        v = e.countdownString,
                        m = e.backgroundImageAssetId,
                        g = e.isNewSortHeaderEnabled,
                        y = e.useRouterLink,
                        b = e.permitLinkClickPropagation,
                        w = e.trailingComponent,
                        x = e.translate,
                        S = e.NewSortHeader,
                        E = (0, tl.useMemo)(function() {
                            return d || (c ? x(sb) || "Sponsored experiences are paid for by Creators. They may be shown to you based on general information about your device type, location, and demographics." : void 0)
                        }, [c, d, x]),
                        I = (0, tl.useMemo)(function() {
                            return s ? x("Label.LearnMore") : x("Action.SeeAll")
                        }, [s, x]),
                        T = (0, tl.useCallback)(function() {
                            if (s && l) {
                                var e = l(),
                                    t = r3.navigateToSortLink(e);
                                rN.sendEvent.apply(void 0, o(t))
                            }
                        }, [s, l]),
                        C = (0, tl.useMemo)(function() {
                            return h || !r ? (0, e8.jsx)("span", {
                                children: t
                            }) : y ? (0, e8.jsx)(oG.Link, {
                                to: r,
                                children: t
                            }) : (0, e8.jsx)("a", {
                                href: r,
                                children: t
                            })
                        }, [h, r, y, t]),
                        P = (0, tl.useMemo)(function() {
                            return h || !r ? null : y ? (0, e8.jsx)(oG.Link, {
                                to: r,
                                onClick: T,
                                className: "btn-secondary-xs see-all-link-icon btn-more",
                                children: I
                            }) : (0, e8.jsx)("a", {
                                href: r,
                                onClick: T,
                                className: "btn-secondary-xs see-all-link-icon btn-more",
                                children: I
                            })
                        }, [h, r, y, I, T]),
                        A = function(e) {
                            if (!(!y || !e || URL.canParse(e))) return oG.Link
                        };
                    return g && S ? (0, e8.jsx)(S, {
                        titleText: t,
                        sendNavigateToSortLinkEvent: T,
                        subtitleAction: u,
                        titleLink: r,
                        isSortLinkOverrideEnabled: s,
                        subtitleText: n,
                        subtitleLink: i,
                        shouldShowSeparateSubtitleLink: a,
                        hasBackgroundMural: !!m,
                        tooltipText: E,
                        hideSeeAll: h,
                        titleLinkComponent: A(r),
                        subtitleLinkComponent: A(i),
                        permitLinkClickPropagation: b
                    }) : (0, e8.jsxs)("div", {
                        className: "game-sort-header-container",
                        children: [(0, e8.jsxs)("div", {
                            className: oz()(f, {
                                "flex items-center": w
                            }),
                            children: [(0, e8.jsxs)("h2", {
                                className: oz()("sort-header", {
                                    grow: w
                                }),
                                children: [C, E && (0, e8.jsx)(sy, {
                                    tooltipText: E,
                                    placement: "right"
                                })]
                            }), w ? (0, e8.jsxs)("div", {
                                className: "flex items-center",
                                children: [P, w]
                            }) : P]
                        }), (0, e8.jsx)(sS, {
                            defaultSubtitle: n,
                            endTimestamp: p,
                            countdownString: v,
                            formatSubtitleLink: s || a,
                            subtitleLink: i,
                            handleSeeAllLinkClick: T,
                            backgroundImageAssetId: m
                        })]
                    })
                };
            sE.defaultProps = {
                sortSubtitle: void 0,
                tooltipInfoText: void 0,
                hideSeeAll: void 0,
                endTimestamp: void 0,
                countdownString: void 0,
                buildNavigateToSortLinkEventProperties: void 0,
                backgroundImageAssetId: void 0,
                isNewSortHeaderEnabled: void 0,
                useRouterLink: !1,
                trailingComponent: void 0
            };
            var sI = rq.keyBoardEventCode,
                sT = function(e) {
                    var t = e.scrollClassNames,
                        n = e.scrollIconClassName,
                        r = e.scroll,
                        o = e.isDisabled,
                        i = e.isNewScrollArrowsEnabled;
                    return (0, e8.jsx)("div", {
                        "data-testid": "game-carousel-scroll-bar",
                        className: t,
                        onClick: r,
                        "aria-disabled": o,
                        onKeyDown: function(e) {
                            e.code === sI.enter && (e.stopPropagation(), e.preventDefault(), r())
                        },
                        role: "button",
                        tabIndex: 0,
                        children: i ? (0, e8.jsx)("span", {
                            className: n
                        }) : (0, e8.jsxs)(tu().Fragment, {
                            children: [(0, e8.jsx)("div", {
                                className: "arrow",
                                children: (0, e8.jsx)("span", {
                                    className: n
                                })
                            }), (0, e8.jsx)("div", {
                                className: "spacer"
                            })]
                        })
                    })
                },
                sC = function(e) {
                    var t = e.hideScrollBackWhenDisabled,
                        n = e.isScrollBackDisabled,
                        r = e.isScrollForwardDisabled,
                        o = e.onScrollBack,
                        i = e.onScrollForward;
                    return e.isNewScrollArrowsEnabled ? (0, e8.jsxs)(tu().Fragment, {
                        children: [!n && (0, e8.jsx)(sT, {
                            scrollClassNames: "scroller-new prev",
                            scrollIconClassName: "icon-chevron-heavy-left",
                            scroll: o,
                            isDisabled: n,
                            isNewScrollArrowsEnabled: !0
                        }), !r && (0, e8.jsx)(sT, {
                            scrollClassNames: "scroller-new next",
                            scrollIconClassName: "icon-chevron-heavy-right",
                            scroll: i,
                            isDisabled: r,
                            isNewScrollArrowsEnabled: !0
                        })]
                    }) : (0, e8.jsxs)(tu().Fragment, {
                        children: [void 0 !== t && t && n ? null : (0, e8.jsx)(sT, {
                            scrollClassNames: oz()("scroller", "prev", {
                                disabled: n
                            }),
                            scrollIconClassName: "icon-games-carousel-left",
                            isDisabled: n,
                            scroll: o,
                            isNewScrollArrowsEnabled: !1
                        }), (0, e8.jsx)(sT, {
                            scrollClassNames: oz()("scroller", "next", {
                                disabled: r
                            }),
                            scrollIconClassName: "icon-games-carousel-right",
                            isDisabled: r,
                            scroll: i,
                            isNewScrollArrowsEnabled: !1
                        })]
                    })
                };
            sC.defaultProps = {
                isNewScrollArrowsEnabled: void 0
            };
            var sP = function(e) {
                    var t, n = e.distance,
                        r = e.scrollAreaSize,
                        o = e.direction,
                        i = e.startingPosition,
                        a = e.currentPage,
                        s = e.pageSession,
                        l = e.gameSetTypeId,
                        u = e.gameSetTargetId,
                        c = e.sortId,
                        d = e.sortPosition,
                        f = (tc(t = {}, rQ.StartPos, i), tc(t, rQ.Distance, n), tc(t, rQ.Direction, o), tc(t, rQ.PageSession, s), tc(t, rQ.GameSetTypeId, l), tc(t, rQ.GameSetTargetId, u), tc(t, rQ.SortId, c), tc(t, rQ.SortPos, d), tc(t, rQ.ScrollDepth, n / r), tc(t, rQ.StartDepth, i / r), tc(t, rQ.ScreenSizeX, window.innerWidth), tc(t, rQ.ScreenSizeY, window.innerHeight), tc(t, rQ.ScrollAreaSize, r), t);
                    (0, rN.sendEventWithTarget)(rJ.FeedScroll, a, f, rN.targetTypes.WWW)
                },
                sA = (0, tl.createContext)({
                    sessionId: "",
                    rotateSessionId: function() {
                        return ""
                    }
                }),
                s_ = function() {
                    return (0, tl.useContext)(sA).sessionId
                },
                sN = function(e) {
                    var t = e.scrollPosition,
                        n = e.page,
                        r = e.gameSetTypeId,
                        o = e.gameSetTargetId,
                        i = e.sortId,
                        a = e.sortPosition,
                        s = e.wrapperRef,
                        l = (0, tl.useRef)(t),
                        u = s_(),
                        c = (0, tl.useMemo)(function() {
                            return ts(oF(function(e) {
                                if (e !== l.current) {
                                    var t, c = Math.round((null == (t = s.current) ? void 0 : t.getBoundingClientRect().width) || window.innerWidth);
                                    sP({
                                        distance: e - l.current,
                                        scrollAreaSize: c,
                                        startingPosition: l.current,
                                        currentPage: n,
                                        direction: r1.Horizontal,
                                        gameSetTypeId: r,
                                        gameSetTargetId: o,
                                        sortId: i,
                                        sortPosition: a,
                                        pageSession: u
                                    }), l.current = e
                                }
                            }, 250), 1)[0]
                        }, [n, r, o, i, a, u, s]);
                    (0, tl.useEffect)(function() {
                        c(t)
                    }, [c, t])
                },
                sR = function() {
                    var e = ts((0, tl.useState)(void 0), 2),
                        t = e[0],
                        n = e[1],
                        r = (0, tl.useCallback)(function(e) {
                            var t, r = null == e || null == (t = e.getBoundingClientRect()) ? void 0 : t.width;
                            void 0 !== r && n(r)
                        }, []),
                        o = (0, tl.useCallback)(function(e) {
                            e && e[0] && e[0].target && r(e[0].target)
                        }, [r]),
                        i = (0, tl.useRef)(new ResizeObserver(o)),
                        a = (0, tl.useCallback)(function(e) {
                            e && (null == i ? void 0 : i.current) && (r(e), i.current.disconnect(), i.current.observe(e))
                        }, [r]);
                    return (0, tl.useEffect)(function() {
                        return function() {
                            (null == i ? void 0 : i.current) && i.current.disconnect()
                        }
                    }, []), [a, t]
                },
                sO = rK.numGameCarouselLookAheadWindows,
                sk = rK.gameTileGutterWidth,
                sM = rK.wideGameTileGutterWidth,
                sL = rK.scrollerWidth,
                sD = rq.wideTileHoverGrowWidthPx,
                sB = function(e) {
                    var t = e.gameData,
                        n = e.sort,
                        r = e.positionId,
                        o = e.page,
                        i = e.gamesContainerRef,
                        a = e.buildEventProperties,
                        s = e.loadMoreGames,
                        l = e.isLoadingMoreGames,
                        u = e.componentType,
                        c = e.playerCountStyle,
                        d = e.playButtonStyle,
                        f = e.itemsPerRow,
                        h = e.friendData,
                        p = e.navigationRootPlaceId,
                        v = e.isSponsoredFooterAllowed,
                        m = e.hideTileMetadata,
                        g = e.hoverStyle,
                        y = e.topicId,
                        b = e.isDynamicLayoutSizingEnabled,
                        w = e.isCarouselHorizontalScrollEnabled,
                        x = e.isNewScrollArrowsEnabled,
                        S = e.hideScrollBackWhenDisabled,
                        E = e.sortId,
                        I = e.sortIdStr,
                        T = e.translate,
                        C = e.TileComponent,
                        P = (0, tl.useRef)(null),
                        A = ts((0, tl.useState)(0), 2),
                        _ = A[0],
                        N = A[1],
                        R = ts((0, tl.useState)(!1), 2),
                        O = R[0],
                        k = R[1],
                        M = ts((0, tl.useState)(!0), 2),
                        L = M[0],
                        D = M[1],
                        B = ts((0, tl.useState)(!0), 2),
                        j = B[0],
                        F = B[1],
                        H = ts((0, tl.useState)(0), 2),
                        U = H[0],
                        z = H[1],
                        G = (0, tl.useMemo)(function() {
                            return r8(u)
                        }, [u]),
                        V = (0, tl.useMemo)(function() {
                            return G ? sM : sk
                        }, [G]),
                        W = ts(sR(), 2),
                        K = W[0],
                        q = W[1],
                        X = ts(sR(), 2),
                        Z = X[0],
                        Y = X[1],
                        $ = (0, tl.useMemo)(function() {
                            if (G && f) return f;
                            var e, t, n = null == P || null == (t = P.current) || null == (e = t.getBoundingClientRect()) ? void 0 : e.width;
                            return void 0 !== Y && void 0 !== n ? Math.max(1, Math.floor((Y + V) / (n + V))) : 0
                        }, [Y, V, f, G]);
                    (0, tl.useEffect)(function() {
                        U >= 0 ? D(!0) : D(!1), l || void 0 !== Y && void 0 !== q && Math.abs(U) + Y + sD >= q ? F(!0) : F(!1)
                    }, [U, Y, q, null == t ? void 0 : t.length, l]);
                    var Q = (0, tl.useCallback)(function() {
                            _ + sO * $ >= (null == t ? void 0 : t.length) && s && !l && s()
                        }, [_, $, s, l, null == t ? void 0 : t.length]),
                        J = (0, tl.useCallback)(function() {
                            var e, t, n = null == P || null == (t = P.current) || null == (e = t.getBoundingClientRect()) ? void 0 : e.width;
                            return void 0 === n ? 0 : Math.floor($) * (n + V)
                        }, [$, V]),
                        ee = (0, tl.useCallback)(function() {
                            if (!L) {
                                var e = J();
                                z(function(t) {
                                    return Math.min(t + e, 0)
                                }), N(function(e) {
                                    return e - $
                                })
                            }
                        }, [J, L, $]),
                        et = (0, tl.useCallback)(function() {
                            if (!j) {
                                var e = J();
                                z(function(t) {
                                    return w && o === rU.HomePage ? void 0 !== q && void 0 !== Y ? Math.max(t - e, -1 * (q - Y)) : t - e : void 0 !== q ? Math.max(t - e, -1 * q) + (S && L ? sL : 0) : t - e
                                }), N(function(e) {
                                    return e + $
                                }), Q()
                            }
                        }, [j, J, Q, w, o, q, Y, S, L, $]),
                        en = (0, tl.useCallback)(function(e) {
                            return e >= _ && e < _ + $
                        }, [_, $]),
                        er = (0, tl.useCallback)(function(e) {
                            O || (k(!0), e(), setTimeout(function() {
                                k(!1)
                            }, 200))
                        }, [O]),
                        eo = (0, tl.useRef)(null);
                    sN({
                        scrollPosition: -U,
                        page: o,
                        gameSetTypeId: E,
                        gameSetTargetId: oO(n),
                        sortId: I,
                        wrapperRef: eo,
                        sortPosition: r
                    });
                    var ei = (0, tl.useMemo)(function() {
                        return oz()({
                            "hlist games game-cards game-tile-list": !G,
                            "game-carousel wide-game-tile-carousel scrollable-carousel": G,
                            "games-page-carousel": o === rU.GamesPage,
                            "home-page-carousel": o === rU.HomePage
                        })
                    }, [G, o]);
                    return (0, e8.jsx)("div", {
                        "data-testid": "game-carousel",
                        ref: eo,
                        className: oz()("horizontal-scroller games-list", {
                            "home-page-games-list": o === rU.HomePage,
                            "wide-game-tile-list": G,
                            "dynamic-layout-sizing": b,
                            "dynamic-layout-sizing-disabled": !b,
                            "new-scroll-arrows": x
                        }),
                        children: (0, e8.jsxs)("div", {
                            ref: Z,
                            className: "clearfix horizontal-scroll-window",
                            children: [(0, e8.jsx)("div", {
                                ref: K,
                                className: "horizontally-scrollable",
                                style: {
                                    left: "".concat(U, "px")
                                },
                                children: (0, e8.jsx)("ul", {
                                    ref: i,
                                    className: ei,
                                    children: t.map(function(e, t) {
                                        return G ? (0, e8.jsx)(C, {
                                            ref: P,
                                            id: t,
                                            isOnScreen: en(t),
                                            page: o,
                                            gameData: e,
                                            translate: T,
                                            buildEventProperties: a,
                                            componentType: u,
                                            playerCountStyle: c,
                                            playButtonStyle: d,
                                            hoverStyle: g,
                                            topicId: y,
                                            friendData: h,
                                            isSponsoredFooterAllowed: v,
                                            hideTileMetadata: m,
                                            navigationRootPlaceId: p
                                        }, e.universeId) : (0, e8.jsx)("li", {
                                            className: "list-item game-card game-tile",
                                            children: (0, e8.jsx)(C, {
                                                ref: P,
                                                id: t,
                                                isOnScreen: en(t),
                                                page: o,
                                                gameData: e,
                                                className: "game-card-container",
                                                translate: T,
                                                buildEventProperties: a,
                                                componentType: u,
                                                playerCountStyle: c,
                                                playButtonStyle: d,
                                                hoverStyle: g,
                                                topicId: y,
                                                friendData: h,
                                                isSponsoredFooterAllowed: v,
                                                hideTileMetadata: m,
                                                navigationRootPlaceId: p
                                            })
                                        }, e.universeId)
                                    })
                                })
                            }), (0, e8.jsx)(sC, {
                                hideScrollBackWhenDisabled: S,
                                isScrollBackDisabled: L,
                                isScrollForwardDisabled: j,
                                onScrollBack: function() {
                                    return er(ee)
                                },
                                onScrollForward: function() {
                                    return er(et)
                                },
                                isNewScrollArrowsEnabled: x
                            })]
                        })
                    })
                };
            sB.defaultProps = {
                loadMoreGames: void 0,
                componentType: void 0,
                itemsPerRow: void 0,
                playerCountStyle: void 0,
                playButtonStyle: void 0,
                friendData: void 0,
                navigationRootPlaceId: void 0,
                isSponsoredFooterAllowed: void 0,
                hideTileMetadata: void 0,
                hoverStyle: void 0,
                topicId: void 0,
                isDynamicLayoutSizingEnabled: void 0,
                isCarouselHorizontalScrollEnabled: void 0,
                isNewScrollArrowsEnabled: void 0,
                hideScrollBackWhenDisabled: !1
            };
            var sj = function() {
                    var e = ts((0, tl.useState)(!1), 2),
                        t = e[0],
                        n = e[1],
                        r = ts(oF(function() {
                            n(!0)
                        }, 100), 2),
                        o = r[0],
                        i = r[1],
                        a = ts(oF(function() {
                            n(!1)
                        }, 100), 2),
                        s = a[0],
                        l = a[1];
                    return [t, function() {
                        l(), o()
                    }, function() {
                        i(), s()
                    }]
                },
                sF = function(e, t, n) {
                    var r = s_(),
                        i = (0, tl.useCallback)(function(i, a, s) {
                            var l, u = os(n),
                                c = td((tc(l = {}, rQ.UniverseId, e.toString()), tc(l, rQ.SortId, t), tc(l, rQ.ActionType, i), tc(l, rQ.MenuItem, s), tc(l, rQ.AvailableMenuItems, a), l), u && tc({}, u, r)),
                                d = r3.gameTileOverflowMenuAction(c, n);
                            rN.sendEvent.apply(void 0, o(d))
                        }, [e, t, n, r]),
                        a = ts((0, tl.useState)(!1), 2),
                        s = a[0],
                        l = a[1],
                        u = (0, tl.useCallback)(function(e) {
                            l(!1), i(r2.GameTileOverflowMenuItemClosed, e)
                        }, [i]),
                        c = (0, tl.useCallback)(function(e) {
                            l(function(t) {
                                return i(t ? r2.GameTileOverflowMenuItemClosed : r2.GameTileOverflowMenuItemOpened, e), !t
                            })
                        }, [i]);
                    return {
                        overflowMenuOpen: s,
                        sendGameTileOverflowMenuAction: i,
                        closeOverflowMenu: u,
                        toggleOverflowMenu: c
                    }
                },
                sH = function(e) {
                    function t(e, n, r) {
                        var o;
                        return tI(this, t), tc(o = tE(this, t, [(0, to._)(e, Error) ? e.message : String(e)]), "confirmedIsFavorited", void 0), tc(o, "hasNewerPendingAction", void 0), o.name = "GameFavoriteStatusMutationError", o.confirmedIsFavorited = n, o.hasNewerPendingAction = r, o
                    }
                    return tP(t, e), t
                }(tA(Error)),
                sU = window.Roblox["core-scripts"].dataStore,
                sz = n.n(sU),
                sG = th().gamesApi,
                sV = {
                    getGameRecommendations: function(e) {
                        return {
                            url: "".concat(sG, "/v1/games/recommendations/game/").concat(e),
                            withCredentials: !0
                        }
                    },
                    getUniverseVoiceStatus: function(e) {
                        return {
                            withCredentials: !0,
                            url: "".concat(th().voiceApi, "/v1/settings/universe/").concat(e)
                        }
                    },
                    getVoiceOptInStatus: {
                        withCredentials: !0,
                        url: "".concat(th().voiceApi, "/v1/settings/user-opt-in")
                    },
                    getAssetDataFromAssetId: function(e) {
                        return {
                            url: "".concat(th().assetDeliveryApi, "/v2/assetId/").concat(e),
                            withCredentials: !0
                        }
                    }
                },
                sW = {
                    refreshCache: !1,
                    expirationWindowMS: 3e4,
                    useCache: !0
                },
                sK = {},
                sq = function() {
                    return sK
                },
                sX = sz().gamesDataStore,
                sZ = sz().userDataStoreV2,
                sY = sz().localeDataStore,
                s$ = sz().userDataStore.FriendsUserSortType,
                sQ = function() {
                    var e, t = sq().getFriendsPresence;
                    return t ? t() : sZ.getFriends({
                        userId: null == (e = (0, rB.authenticatedUser)()) ? void 0 : e.id,
                        userSort: s$.StatusFrequents,
                        isGuest: !1
                    }, sW)
                },
                sJ = function(e) {
                    var t, n = e.enableExplicitFeedback,
                        r = e.setIsHidden,
                        o = e.enableSponsoredFeedback,
                        i = e.isSponsored,
                        a = e.enableReportExperience,
                        s = e.reportExperienceAttributes,
                        l = e.enableReportAd,
                        u = e.encryptedAdTrackingData,
                        c = e.enableRemoveFromFavorites,
                        d = e.onRemoveFromFavorites,
                        f = [];
                    return n && (!i || o) && r && f.push("NotInterested"), a && s && !i && (null == (t = (0, rB.authenticatedUser)()) ? void 0 : t.isAuthenticated) && f.push("ReportExperience"), o && i && f.push("WhyThisAd"), l && i && u && f.push("ReportAd"), c && d && f.push("RemoveFromFavorites"), f
                },
                s0 = ((q = {}).RemovedFromFavorites = "RemovedFromFavorites", q.NotInterested = "NotInterested", q),
                s1 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                s2 = function(e) {
                    var t = e.className;
                    return tu().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: oV("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                s5 = "opacity-[0.5]",
                s3 = function(e) {
                    var t = e.width,
                        n = e.height;
                    return tu().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, tu().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                s4 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                s6 = tu().forwardRef(function(e, t) {
                    var n = tW([e, t]),
                        r = n[0],
                        o = n.slice(1),
                        i = r.name,
                        a = r.size,
                        s = r.className,
                        l = (r.children, tz(r, ["name", "size", "className", "children"])),
                        u = ts(o, 1)[0];
                    return tu().createElement("span", td({
                        ref: u,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: oV("grow-0 shrink-0 basis-auto icon", i, s4[void 0 === a ? "Medium" : a], s)
                    }, l))
                });

            function s8(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function s9() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = s8(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : s8(t[e], null)
                        }
                    }
                }
            }

            function s7() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return tl.useCallback(s9.apply(void 0, o(t)), t)
            }
            s6.displayName = "Icon";
            var le = Symbol.for("react.lazy"),
                lt = tl[" use ".trim().toString()];

            function ln(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : (0, tS._)(e)) === "object" && "$$typeof" in e && e.$$typeof === le && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : (0, tS._)(t)) === "object" && null !== t && "then" in t
            }
            var lr = ((i = tl.forwardRef(function(e, t) {
                    var n = e.children,
                        r = tz(e, ["children"]);
                    if (ln(n) && "function" == typeof lt && (n = lt(n._payload)), tl.isValidElement(n)) {
                        var i, a, s, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            d = function(e, t) {
                                var n = td({}, t);
                                for (var r in t) ! function(r) {
                                    var i = e[r],
                                        a = t[r];
                                    /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = a.apply(void 0, o(t));
                                        return i.apply(void 0, o(t)), r
                                    } : i && (n[r] = i) : "style" === r ? n[r] = td({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                }(r);
                                return td({}, e, n)
                            }(r, n.props);
                        return n.type !== tl.Fragment && (d.ref = t ? s9(t, c) : c), tl.cloneElement(n, d)
                    }
                    return tl.Children.count(n) > 1 ? tl.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), X = i, (Z = tl.forwardRef(function(e, t) {
                    var n = e.children,
                        r = tz(e, ["children"]);
                    ln(n) && "function" == typeof lt && (n = lt(n._payload));
                    var o = tl.Children.toArray(n),
                        i = o.find(li);
                    if (i) {
                        var a = i.props.children,
                            s = o.map(function(e) {
                                return e !== i ? e : tl.Children.count(a) > 1 ? tl.Children.only(null) : tl.isValidElement(a) ? a.props.children : null
                            });
                        return (0, e8.jsx)(X, tb(td({}, r), {
                            ref: t,
                            children: tl.isValidElement(a) ? tl.cloneElement(a, void 0, s) : null
                        }))
                    }
                    return (0, e8.jsx)(X, tb(td({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), Z),
                lo = Symbol("radix.slottable");

            function li(e) {
                return tl.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === lo
            }
            var la = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                ls = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                ll = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                lu = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                lc = (0, tl.forwardRef)(function(e, t) {
                    var n = tW([e, t]),
                        r = n[0],
                        o = n.slice(1),
                        i = r.children,
                        a = r.className,
                        s = r.style,
                        l = r.isDisabled,
                        u = void 0 !== l && l,
                        c = r.isLoading,
                        d = void 0 !== c && c,
                        f = r.icon,
                        h = r.size,
                        p = void 0 === h ? "Large" : h,
                        v = r.variant,
                        m = void 0 === v ? "Emphasis" : v,
                        g = r.asChild,
                        y = tz(r, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        b = ts(o, 1)[0],
                        w = oV("foundation-web-button", u ? s5 : [s1, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", ls[p], u ? lu[m] : ll[m], a),
                        x = td({
                            textDecoration: "none"
                        }, s),
                        S = function(e) {
                            return tu().createElement(tu().Fragment, null, tu().createElement(s2, null), d && tu().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, tu().createElement(s3, {
                                width: la[p],
                                height: la[p]
                            })), tu().createElement("span", {
                                className: oV("flex items-center min-width-0", "Large" === p || "Medium" === p ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, f && tu().createElement(s6, {
                                name: f,
                                size: p
                            }), tu().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (g) {
                        y.as;
                        var E = tz(y, ["as"]),
                            I = tu().Children.only(i);
                        return tu().createElement(lr, tb(td({
                            ref: b
                        }, E), {
                            className: w,
                            style: x,
                            "aria-disabled": u || void 0
                        }), tu().cloneElement(I, {}, S(I.props.children)))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var T = y.href,
                            C = tz(y, ["as", "href"]);
                        return tu().createElement("a", tb(td({
                            ref: b
                        }, C), {
                            "aria-disabled": u,
                            href: u ? void 0 : T,
                            className: w,
                            style: x
                        }), S(i))
                    }
                    y.as;
                    var P = tz(y, ["as"]);
                    return tu().createElement("button", tb(td({
                        ref: b,
                        type: "button"
                    }, P), {
                        disabled: u,
                        className: w,
                        style: x
                    }), S(i))
                }),
                ld = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
                lf = (0, tl.forwardRef)(function(e, t) {
                    var n = tW([e, t]),
                        r = n[0],
                        o = n.slice(1),
                        i = r.className,
                        a = r.style,
                        s = r.variant,
                        l = void 0 === s ? "Rectangle" : s,
                        u = r.isAnimated,
                        c = r.width,
                        d = r.height,
                        f = tz(r, ["className", "style", "variant", "isAnimated", "width", "height"]),
                        h = ts(o, 1)[0],
                        p = "Text" === l,
                        v = "Circle" === l,
                        m = {};
                    return p ? (m.height = null != d ? d : "1em", m.width = null != c ? c : "100%") : (void 0 !== c && (m.width = c), void 0 !== d && (m.height = d)), tu().createElement("div", tb(td({
                        ref: h,
                        "aria-hidden": "true",
                        "data-variant": l
                    }, f), {
                        className: oV("relative clip block bg-[var(--color-common-shimmer)]", p && "radius-xsmall", v && "radius-circle", !p && !v && "radius-small", (void 0 === u || u) && ld, i),
                        style: td({}, m, a)
                    }))
                });
            lf.displayName = "Skeleton";
            var lh = Error("thumbnail pending"),
                lp = function(e, t) {
                    return t === lh && e < 5
                };

            function lv(e, t, n) {
                function r(n, r) {
                    var o, i;
                    for (var s in Object.defineProperty(n, "_zod", {
                            value: null != (o = n._zod) ? o : {},
                            enumerable: !1
                        }), null != (i = n._zod).traits || (i.traits = new Set), n._zod.traits.add(e), t(n, r), a.prototype) s in n || Object.defineProperty(n, s, {
                        value: a.prototype[s].bind(n)
                    });
                    n._zod.constr = a, n._zod.def = r
                }
                var o, i = function(e) {
                    function t() {
                        return tI(this, t), tE(this, t, arguments)
                    }
                    return tP(t, e), t
                }(null != (o = null == n ? void 0 : n.Parent) ? o : Object);

                function a(e) {
                    var t = (null == n ? void 0 : n.Parent) ? new i : this;
                    r(t, e), null != (u = t._zod).deferred || (u.deferred = []);
                    var o = !0,
                        a = !1,
                        s = void 0;
                    try {
                        for (var l, u, c, d = t._zod.deferred[Symbol.iterator](); !(o = (c = d.next()).done); o = !0)(0, c.value)()
                    } catch (e) {
                        a = !0, s = e
                    } finally {
                        try {
                            o || null == d.return || d.return()
                        } finally {
                            if (a) throw s
                        }
                    }
                    return t
                }
                return Object.defineProperty(i, "name", {
                    value: e
                }), Object.defineProperty(a, "init", {
                    value: r
                }), Object.defineProperty(a, Symbol.hasInstance, {
                    value: function(t) {
                        var r, o;
                        return !!((null == n ? void 0 : n.Parent) && (0, to._)(t, n.Parent)) || (null == t || null == (o = t._zod) || null == (r = o.traits) ? void 0 : r.has(e))
                    }
                }), Object.defineProperty(a, "name", {
                    value: e
                }), a
            }
            Object.freeze({
                status: "aborted"
            }), Symbol("zod_brand");
            var lm = function(e) {
                function t() {
                    return tI(this, t), tE(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                }
                return tP(t, e), t
            }(tA(Error));
            tA(Error);
            var lg = {};

            function ly(e) {
                return e && Object.assign(lg, e), lg
            }

            function lb(e, t) {
                return (void 0 === t ? "undefined" : (0, tS._)(t)) === "bigint" ? t.toString() : t
            }

            function lw(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }

            function lx(e) {
                var t = +!!e.startsWith("^"),
                    n = e.endsWith("$") ? e.length - 1 : e.length;
                return e.slice(t, n)
            }
            var lS = Symbol("evaluating");

            function lE(e, t, n) {
                var r = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (r !== lS) return void 0 === r && (r = lS, r = n()), r
                    },
                    set: function(n) {
                        Object.defineProperty(e, t, {
                            value: n
                        })
                    },
                    configurable: !0
                })
            }
            var lI = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
            };

            function lT(e) {
                return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
            }

            function lC(e) {
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
                return (delete e.message, "string" == typeof e.error) ? tb(td({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function lP(e) {
                var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var r = n; r < e.issues.length; r++)
                    if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function lA(e, t) {
                return t.map(function(t) {
                    return null != t.path || (t.path = []), t.path.unshift(e), t
                })
            }

            function l_(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function lN(e, t, n) {
                var r, o, i, a, s, l, u, c, d, f, h, p = tb(td({}, e), {
                    path: null != (r = e.path) ? r : []
                });
                return e.message || (p.message = null != (o = null != (i = null != (a = null != (s = l_(null == (c = e.inst) || null == (u = c._zod.def) || null == (l = u.error) ? void 0 : l.call(u, e))) ? s : l_(null == t || null == (d = t.error) ? void 0 : d.call(t, e))) ? a : l_(null == (f = n.customError) ? void 0 : f.call(n, e))) ? i : l_(null == (h = n.localeError) ? void 0 : h.call(n, e))) ? o : "Invalid input"), delete p.inst, delete p.continue, (null == t ? void 0 : t.reportInput) || delete p.input, p
            }
            lw(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var lR = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, lb, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                lO = lv("$ZodError", lR),
                lk = lv("$ZodError", lR, {
                    Parent: Error
                }),
                lM = (a = lk, function(e, t, n, r) {
                    var o = n ? Object.assign(n, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        i = e._zod.run({
                            value: t,
                            issues: []
                        }, o);
                    if ((0, to._)(i, Promise)) throw new lm;
                    if (i.issues.length) {
                        var s, l = new(null != (s = null == r ? void 0 : r.Err) ? s : a)(i.issues.map(function(e) {
                            return lN(e, o, ly())
                        }));
                        throw lI(l, null == r ? void 0 : r.callee), l
                    }
                    return i.value
                }),
                lL = (s = lk, function(e, t, n, r) {
                    return nR(function() {
                        var o, i, a, l;
                        return nO(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    if (o = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, i = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, o), !(0, to._)(i, Promise)) return [3, 2];
                                    return [4, i];
                                case 1:
                                    i = u.sent(), u.label = 2;
                                case 2:
                                    if (i.issues.length) throw lI(l = new(null != (a = null == r ? void 0 : r.Err) ? a : s)(i.issues.map(function(e) {
                                        return lN(e, o, ly())
                                    })), null == r ? void 0 : r.callee), l;
                                    return [2, i.value]
                            }
                        })
                    })()
                }),
                lD = (l = lk, function(e, t, n) {
                    var r = n ? tb(td({}, n), {
                            async: !1
                        }) : {
                            async: !1
                        },
                        o = e._zod.run({
                            value: t,
                            issues: []
                        }, r);
                    if ((0, to._)(o, Promise)) throw new lm;
                    return o.issues.length ? {
                        success: !1,
                        error: new(null != l ? l : lO)(o.issues.map(function(e) {
                            return lN(e, r, ly())
                        }))
                    } : {
                        success: !0,
                        data: o.value
                    }
                }),
                lB = (u = lk, function(e, t, n) {
                    return nR(function() {
                        var r, o;
                        return nO(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (r = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, o = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, r), !(0, to._)(o, Promise)) return [3, 2];
                                    return [4, o];
                                case 1:
                                    o = i.sent(), i.label = 2;
                                case 2:
                                    return [2, o.issues.length ? {
                                        success: !1,
                                        error: new u(o.issues.map(function(e) {
                                            return lN(e, r, ly())
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
            var lj = function(e) {
                    var t, n, r = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (n = null == e ? void 0 : e.maximum) ? n : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(r, "$"))
                },
                lF = {
                    major: 4,
                    minor: 1,
                    patch: 11
                },
                lH = lv("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = lF;
                    var n, r = o(null != (l = e._zod.def.checks) ? l : []);
                    e._zod.traits.has("$ZodCheck") && r.unshift(e);
                    var i = !0,
                        a = !1,
                        s = void 0;
                    try {
                        for (var l, u, c, d = r[Symbol.iterator](); !(i = (c = d.next()).done); i = !0) {
                            var f = c.value,
                                h = !0,
                                p = !1,
                                v = void 0;
                            try {
                                for (var m, g = f._zod.onattach[Symbol.iterator](); !(h = (m = g.next()).done); h = !0)(0, m.value)(e)
                            } catch (e) {
                                p = !0, v = e
                            } finally {
                                try {
                                    h || null == g.return || g.return()
                                } finally {
                                    if (p) throw v
                                }
                            }
                        }
                    } catch (e) {
                        a = !0, s = e
                    } finally {
                        try {
                            i || null == d.return || d.return()
                        } finally {
                            if (a) throw s
                        }
                    }
                    if (0 === r.length) null != (u = e._zod).deferred || (u.deferred = []), null == (n = e._zod.deferred) || n.push(function() {
                        e._zod.run = e._zod.parse
                    });
                    else {
                        var y = function(e, t, n) {
                                var r = lP(e),
                                    o = !0,
                                    i = !1,
                                    a = void 0;
                                try {
                                    for (var s, l, u = t[Symbol.iterator](); !(o = (l = u.next()).done); o = !0) ! function() {
                                        var t = l.value;
                                        if (t._zod.def.when) {
                                            if (!t._zod.def.when(e)) return
                                        } else if (r) return;
                                        var o = e.issues.length,
                                            i = t._zod.check(e);
                                        if ((0, to._)(i, Promise) && (null == n ? void 0 : n.async) === !1) throw new lm;
                                        if (s || (0, to._)(i, Promise)) s = (null != s ? s : Promise.resolve()).then(function() {
                                            return nR(function() {
                                                return nO(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, i];
                                                        case 1:
                                                            if (t.sent(), e.issues.length === o) return [2];
                                                            return r || (r = lP(e, o)), [2]
                                                    }
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === o) return;
                                            r || (r = lP(e, o))
                                        }
                                    }()
                                } catch (e) {
                                    i = !0, a = e
                                } finally {
                                    try {
                                        o || null == u.return || u.return()
                                    } finally {
                                        if (i) throw a
                                    }
                                }
                                return s ? s.then(function() {
                                    return e
                                }) : e
                            },
                            b = function(t, n, o) {
                                if (lP(t)) return t.aborted = !0, t;
                                var i = y(n, r, o);
                                if ((0, to._)(i, Promise)) {
                                    if (!1 === o.async) throw new lm;
                                    return i.then(function(t) {
                                        return e._zod.parse(t, o)
                                    })
                                }
                                return e._zod.parse(i, o)
                            };
                        e._zod.run = function(t, n) {
                            if (n.skipChecks) return e._zod.parse(t, n);
                            if ("backward" === n.direction) {
                                var o = e._zod.parse({
                                    value: t.value,
                                    issues: []
                                }, tb(td({}, n), {
                                    skipChecks: !0
                                }));
                                return (0, to._)(o, Promise) ? o.then(function(e) {
                                    return b(e, t, n)
                                }) : b(o, t, n)
                            }
                            var i = e._zod.parse(t, n);
                            if ((0, to._)(i, Promise)) {
                                if (!1 === n.async) throw new lm;
                                return i.then(function(e) {
                                    return y(e, r, n)
                                })
                            }
                            return y(i, r, n)
                        }
                    }
                    e["~standard"] = {
                        validate: function(t) {
                            try {
                                var n, r = lD(e, t);
                                return r.success ? {
                                    value: r.data
                                } : {
                                    issues: null == (n = r.error) ? void 0 : n.issues
                                }
                            } catch (n) {
                                return lB(e, t).then(function(e) {
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
                lU = lv("$ZodString", function(e, t) {
                    var n, r, i;
                    lH.init(e, t), e._zod.pattern = null != (n = o(null != (r = null == e || null == (i = e._zod.bag) ? void 0 : i.patterns) ? r : []).pop()) ? n : lj(e._zod.bag), e._zod.parse = function(n, r) {
                        if (t.coerce) try {
                            n.value = String(n.value)
                        } catch (e) {}
                        return "string" == typeof n.value || n.issues.push({
                            expected: "string",
                            code: "invalid_type",
                            input: n.value,
                            inst: e
                        }), n
                    }
                });

            function lz(e, t, n) {
                if (e.issues.length) {
                    var r;
                    (r = t.issues).push.apply(r, o(lA(n, e.issues)))
                }
                t.value[n] = e.value
            }
            var lG = lv("$ZodArray", function(e, t) {
                lH.init(e, t), e._zod.parse = function(n, r) {
                    var o = function(e) {
                            var o = i[e],
                                s = t.element._zod.run({
                                    value: o,
                                    issues: []
                                }, r);
                            (0, to._)(s, Promise) ? a.push(s.then(function(t) {
                                return lz(t, n, e)
                            })): lz(s, n, e)
                        },
                        i = n.value;
                    if (!Array.isArray(i)) return n.issues.push({
                        expected: "array",
                        code: "invalid_type",
                        input: i,
                        inst: e
                    }), n;
                    n.value = Array(i.length);
                    for (var a = [], s = 0; s < i.length; s++) o(s);
                    return a.length ? Promise.all(a).then(function() {
                        return n
                    }) : n
                }
            });

            function lV(e, t, n, r) {
                if (e.issues.length) {
                    var i;
                    (i = t.issues).push.apply(i, o(lA(n, e.issues)))
                }
                void 0 === e.value ? n in r && (t.value[n] = void 0) : t.value[n] = e.value
            }
            var lW = lv("$ZodObject", function(e, t) {
                    lH.init(e, t);
                    var n, r = Object.getOwnPropertyDescriptor(t, "shape");
                    if (!(null == r ? void 0 : r.get)) {
                        var o = t.shape;
                        Object.defineProperty(t, "shape", {
                            get: function() {
                                var e = td({}, o);
                                return Object.defineProperty(t, "shape", {
                                    value: e
                                }), e
                            }
                        })
                    }
                    var i = lw(function() {
                        return function(e) {
                            var t, n = Object.keys(e.shape),
                                r = !0,
                                o = !1,
                                i = void 0;
                            try {
                                for (var a, s = n[Symbol.iterator](); !(r = (a = s.next()).done); r = !0) {
                                    var l, u, c, d, f = a.value;
                                    if (!(null == (d = e.shape) || null == (c = d[f]) || null == (u = c._zod) || null == (l = u.traits) ? void 0 : l.has("$ZodType"))) throw Error('Invalid element at key "'.concat(f, '": expected a Zod schema'))
                                }
                            } catch (e) {
                                o = !0, i = e
                            } finally {
                                try {
                                    r || null == s.return || s.return()
                                } finally {
                                    if (o) throw i
                                }
                            }
                            var h = Object.keys(t = e.shape).filter(function(e) {
                                return "optional" === t[e]._zod.optin && "optional" === t[e]._zod.optout
                            });
                            return tb(td({}, e), {
                                keys: n,
                                keySet: new Set(n),
                                numKeys: n.length,
                                optionalKeys: new Set(h)
                            })
                        }(t)
                    });
                    lE(e._zod, "propValues", function() {
                        var e = t.shape,
                            n = {};
                        for (var r in e) {
                            var o = e[r]._zod;
                            if (o.values) {
                                null != n[r] || (n[r] = new Set);
                                var i = !0,
                                    a = !1,
                                    s = void 0;
                                try {
                                    for (var l, u, c = o.values[Symbol.iterator](); !(i = (u = c.next()).done); i = !0) {
                                        var d = u.value;
                                        n[r].add(d)
                                    }
                                } catch (e) {
                                    a = !0, s = e
                                } finally {
                                    try {
                                        i || null == c.return || c.return()
                                    } finally {
                                        if (a) throw s
                                    }
                                }
                            }
                        }
                        return n
                    });
                    var a = t.catchall;
                    e._zod.parse = function(t, r) {
                        null != n || (n = i.value);
                        var o = t.value;
                        if (!((void 0 === (f = o) ? "undefined" : (0, tS._)(f)) === "object" && null !== f && !Array.isArray(f))) return t.issues.push({
                            expected: "object",
                            code: "invalid_type",
                            input: o,
                            inst: e
                        }), t;
                        t.value = {};
                        var s = [],
                            l = n.shape,
                            u = !0,
                            c = !1,
                            d = void 0;
                        try {
                            for (var f, h, p = n.keys[Symbol.iterator](); !(u = (h = p.next()).done); u = !0) ! function() {
                                var e = h.value,
                                    n = l[e]._zod.run({
                                        value: o[e],
                                        issues: []
                                    }, r);
                                (0, to._)(n, Promise) ? s.push(n.then(function(n) {
                                    return lV(n, t, e, o)
                                })): lV(n, t, e, o)
                            }()
                        } catch (e) {
                            c = !0, d = e
                        } finally {
                            try {
                                u || null == p.return || p.return()
                            } finally {
                                if (c) throw d
                            }
                        }
                        return a ? function(e, t, n, r, o, i) {
                            var a = [],
                                s = o.keySet,
                                l = o.catchall._zod,
                                u = l.def.type,
                                c = !0,
                                d = !1,
                                f = void 0;
                            try {
                                for (var h, p = Object.keys(t)[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) ! function() {
                                    var o = h.value;
                                    if (!s.has(o)) {
                                        if ("never" === u) return a.push(o);
                                        var i = l.run({
                                            value: t[o],
                                            issues: []
                                        }, r);
                                        (0, to._)(i, Promise) ? e.push(i.then(function(e) {
                                            return lV(e, n, o, t)
                                        })): lV(i, n, o, t)
                                    }
                                }()
                            } catch (e) {
                                d = !0, f = e
                            } finally {
                                try {
                                    c || null == p.return || p.return()
                                } finally {
                                    if (d) throw f
                                }
                            }
                            return (a.length && n.issues.push({
                                code: "unrecognized_keys",
                                keys: a,
                                input: t,
                                inst: i
                            }), e.length) ? Promise.all(e).then(function() {
                                return n
                            }) : n
                        }(s, o, t, r, i.value, e) : s.length ? Promise.all(s).then(function() {
                            return t
                        }) : t
                    }
                }),
                lK = lv("$ZodLiteral", function(e, t) {
                    if (lH.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
                    e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                        return "string" == typeof e ? lT(e) : e ? lT(e.toString()) : String(e)
                    }).join("|"), ")$")), e._zod.parse = function(n, r) {
                        var o = n.value;
                        return e._zod.values.has(o) || n.issues.push({
                            code: "invalid_value",
                            values: t.values,
                            input: o,
                            inst: e
                        }), n
                    }
                });

            function lq(e, t) {
                return e.issues.length && void 0 === t ? {
                    issues: [],
                    value: void 0
                } : e
            }
            var lX = lv("$ZodOptional", function(e, t) {
                    lH.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", lE(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(o(t.innerType._zod.values).concat([void 0])) : void 0
                    }), lE(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(lx(e.source), ")?$")) : void 0
                    }), e._zod.parse = function(e, n) {
                        if ("optional" === t.innerType._zod.optin) {
                            var r = t.innerType._zod.run(e, n);
                            return (0, to._)(r, Promise) ? r.then(function(t) {
                                return lq(t, e.value)
                            }) : lq(r, e.value)
                        }
                        return void 0 === e.value ? e : t.innerType._zod.run(e, n)
                    }
                }),
                lZ = lv("$ZodNullable", function(e, t) {
                    lH.init(e, t), lE(e._zod, "optin", function() {
                        return t.innerType._zod.optin
                    }), lE(e._zod, "optout", function() {
                        return t.innerType._zod.optout
                    }), lE(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(lx(e.source), "|null)$")) : void 0
                    }), lE(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(o(t.innerType._zod.values).concat([null])) : void 0
                    }), e._zod.parse = function(e, n) {
                        return null === e.value ? e : t.innerType._zod.run(e, n)
                    }
                });
            Symbol("ZodOutput"), Symbol("ZodInput");
            var lY = lv("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    lH.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, n) {
                        return lM(e, t, n, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, n) {
                        return lD(e, t, n)
                    }, e.parseAsync = function(t, n) {
                        return nR(function() {
                            return nO(this, function(r) {
                                return [2, lL(e, t, n, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, n) {
                        return nR(function() {
                            return nO(this, function(r) {
                                return [2, lB(e, t, n)]
                            })
                        })()
                    }, e.check = function() {
                        for (var n, r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                        return e.clone(tb(td({}, t), {
                            checks: o(null != (n = t.checks) ? n : []).concat(o(i.map(function(e) {
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
                        }))
                    }, e.clone = function(t, n) {
                        var r;
                        return r = new e._zod.constr(null != t ? t : e._zod.def), (!t || (null == n ? void 0 : n.parent)) && (r._zod.parent = e), r
                    }, e.brand = function() {
                        return e
                    }, e.register = function(t, n) {
                        return t.add(e, n), e
                    }
                }),
                l$ = lv("ZodMiniString", function(e, t) {
                    lU.init(e, t), lY.init(e, t)
                });

            function lQ(e) {
                return new l$(td({
                    type: "string"
                }, lC(e)))
            }
            var lJ = lv("ZodMiniArray", function(e, t) {
                    lG.init(e, t), lY.init(e, t)
                }),
                l0 = lv("ZodMiniObject", function(e, t) {
                    lW.init(e, t), lY.init(e, t), lE(e, "shape", function() {
                        return t.shape
                    })
                });

            function l1(e, t) {
                return new l0(td({
                    type: "object",
                    shape: null != e ? e : {}
                }, lC(t)))
            }
            var l2 = lv("ZodMiniLiteral", function(e, t) {
                    lK.init(e, t), lY.init(e, t)
                }),
                l5 = lv("ZodMiniOptional", function(e, t) {
                    lX.init(e, t), lY.init(e, t)
                }),
                l3 = lv("ZodMiniNullable", function(e, t) {
                    lZ.init(e, t), lY.init(e, t)
                }),
                l4 = function() {
                    var e, t;
                    return {
                        promise: new Promise(function(n, r) {
                            e = n, t = r
                        }),
                        resolve: e,
                        reject: t
                    }
                },
                l6 = "150x150",
                l8 = "webp",
                l9 = function(e) {
                    var t, n, r, o;
                    return "".concat(e.type, ":").concat(e.targetId, ":").concat(null != (t = e.size) ? t : l6, ":").concat(null != (n = e.format) ? n : l8, ":").concat(null != (r = e.version) ? r : "", ":").concat(null != (o = e.headShape) ? o : "", ":").concat(e.includeBackground ? "bg" : "", ":").concat(e.includeProfileFrame ? "frame" : "")
                },
                l7 = l1({
                    data: ($ = l1({
                        requestId: lQ(),
                        state: new l2(td({
                            type: "literal",
                            values: Array.isArray(Y = ["Completed", "Pending", "Blocked", "Error", "InReview"]) ? Y : [Y]
                        }, lC(void 0))),
                        imageUrl: new l5({
                            type: "optional",
                            innerType: new l3({
                                type: "nullable",
                                innerType: lQ()
                            })
                        })
                    }), new lJ(td({
                        type: "array",
                        element: $
                    }, lC(void 0))))
                }),
                ue = function(e, t) {
                    var n = new Map;
                    return e.data.forEach(function(e) {
                        var r = e.requestId,
                            o = e.state,
                            i = e.imageUrl;
                        "Completed" === o ? n.set(r, null != i ? {
                            state: o,
                            imageUrl: i,
                            transportRetries: t
                        } : {
                            state: "Error",
                            transportRetries: t
                        }) : n.set(r, null != i ? {
                            state: o,
                            imageUrl: i,
                            transportRetries: t
                        } : {
                            state: o,
                            transportRetries: t
                        })
                    }), n
                },
                ut = (Q = {
                    delay: 50,
                    maxSize: 100
                }, J = function(e) {
                    return nR(function() {
                        var t, n, r;
                        return nO(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = tv.Url.parse(th().thumbnailsApi).getOrThrow().withPath("/v1/batch"), n = e.map(function(e) {
                                        var t, n;
                                        return td({
                                            requestId: l9(e),
                                            type: e.type,
                                            targetId: e.targetId,
                                            size: null != (t = e.size) ? t : l6,
                                            format: null != (n = e.format) ? n : l8
                                        }, null != e.version ? {
                                            version: e.version
                                        } : {}, e.headShape ? {
                                            headShape: e.headShape
                                        } : {}, e.includeBackground ? {
                                            includeBackground: !0
                                        } : {}, e.includeProfileFrame && "AvatarHeadShot" === e.type ? {
                                            includeProfileFrame: !0
                                        } : {})
                                    }), r = 0, [4, tp.post(t, n, l7, {
                                        credentials: "include",
                                        headers: {
                                            Accept: "application/json"
                                        },
                                        retry: function(e, t) {
                                            var n = tp.defaultBrowserRetryDelay(e, t);
                                            return Number.isNaN(n) || (r += 1), n
                                        }
                                    })];
                                case 1:
                                    return [2, ue(o.sent().getOrThrow(), r)]
                            }
                        })
                    })()
                }, ee = function(e, t) {
                    var n;
                    return null != (n = e.get(l9(t))) ? n : {
                        state: "Error"
                    }
                }, c = Q, d = J, h = c.delay, p = c.maxSize, v = [], m = l4(), g = function() {
                    var e = m.resolve,
                        t = m.reject,
                        n = v;
                    v = [], m = l4(), d(n).then(e).catch(t)
                }, et = function(e) {
                    0 === v.length && (f = setTimeout(g, h)), v.push(e);
                    var t = m.promise;
                    return null != p && v.length >= p && (clearTimeout(f), g()), t
                }, function(e) {
                    return et(e).then(function(t) {
                        return ee(t, e)
                    })
                }),
                un = new Set(["GameIcon", "GameThumbnail"]),
                ur = function(e) {
                    var t = e.type,
                        n = e.format;
                    return nR(function() {
                        var e;
                        return nO(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    if ("webp" !== (e = un.has(t) ? "webp" : null != n ? n : l8)) return [2, e];
                                    return [4, (null != e5 || (e5 = new Promise(function(e) {
                                        if (void 0 === rw) return void e(!0);
                                        var t = new rw.Image;
                                        t.onload = function() {
                                            e(t.width > 0 && t.height > 0)
                                        }, t.onerror = function() {
                                            e(!1)
                                        }, t.src = "data:image/webp;base64,UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA=="
                                    })), e5)];
                                case 1:
                                    return [2, r.sent() ? "webp" : "png"]
                            }
                        })
                    })()
                },
                uo = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                        n = Number.parseInt(e, t);
                    return Number.isNaN(n) ? null : n
                };
            n(848);
            var ui = function() {
                    function e(t) {
                        tI(this, e), tc(this, "value", void 0), this.value = t
                    }
                    return tN(e, [{
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
                            return us.fromResult(this.cast())
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
                ua = function() {
                    function e(t) {
                        tI(this, e), tc(this, "error", void 0), this.error = t
                    }
                    return tN(e, [{
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
                            return us.fromResult(this.cast())
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
            (e3 || (e3 = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new ui(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var us = function() {
                function e(t) {
                    tI(this, e), tc(this, "promise", void 0), this.promise = t
                }
                return tN(e, [{
                    key: "map",
                    value: function(t) {
                        return new e(this.promise.then(function(e) {
                            return nR(function() {
                                var n, r;
                                return nO(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!e.isOk()) return [3, 2];
                                            return r = ui.bind, [4, t(e.value)];
                                        case 1:
                                            return n = new(r.apply(ui, [void 0, o.sent()])), [3, 3];
                                        case 2:
                                            n = e.cast(), o.label = 3;
                                        case 3:
                                            return [2, n]
                                    }
                                })
                            })()
                        }))
                    }
                }, {
                    key: "mapErr",
                    value: function(t) {
                        return new e(this.promise.then(function(e) {
                            return nR(function() {
                                var n, r;
                                return nO(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!e.isErr()) return [3, 2];
                                            return r = ua.bind, [4, t(e.error)];
                                        case 1:
                                            return n = new(r.apply(ua, [void 0, o.sent()])), [3, 3];
                                        case 2:
                                            n = e.cast(), o.label = 3;
                                        case 3:
                                            return [2, n]
                                    }
                                })
                            })()
                        }))
                    }
                }, {
                    key: "andThen",
                    value: function(t) {
                        return new e(this.promise.then(function(n) {
                            if (n.isErr()) return n.cast();
                            var r = t(n.value);
                            return (0, to._)(r, e) ? r.promise : r
                        }))
                    }
                }, {
                    key: "orElse",
                    value: function(t) {
                        return new e(this.promise.then(function(n) {
                            if (n.isOk()) return n.cast();
                            var r = t(n.error);
                            return (0, to._)(r, e) ? r.promise : r
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
                        return this.promise.then(function(n) {
                            return n.match(e, t)
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
                    value: function(t, n) {
                        return new e(t.then(function(e) {
                            return new ui(e)
                        }).catch(function(e) {
                            return new ua(n(e))
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
                        return (0, to._)(t, e) ? t : (0, to._)(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                    }
                }, {
                    key: "fn",
                    value: function(t) {
                        return function() {
                            for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                            return e.fromPromiseResult(t.apply(void 0, o(r)))
                        }
                    }
                }, {
                    key: "all",
                    value: function(t) {
                        return new e(Promise.all(t).then(e3.all))
                    }
                }]), e
            }();
            tA(Error);
            var ul = function(e) {
                    function t(e) {
                        var n;
                        return tI(this, t), tc(n = tE(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return tP(t, e), t
                }(tA(Error)),
                uu = function(e, t) {
                    try {
                        var n;
                        return n = JSON.stringify(e, void 0, t), new ui(n)
                    } catch (e) {
                        return new ua(new ul(e))
                    }
                },
                uc = function() {
                    if (void 0 === rx) return {
                        batchSize: 100,
                        waitMs: 1e3
                    };
                    var e, t, n, r, o, i = rx.getElementsByName("performance")[0],
                        a = uo(null != (e = null == i ? void 0 : i.getAttribute("data-ui-performance-metrics-batch-size")) ? e : ""),
                        s = ts((null != (t = null == i ? void 0 : i.getAttribute("data-ui-performance-metrics-batch-wait-time")) ? t : "").split(":"), 3),
                        l = s[0],
                        u = s[1],
                        c = s[2],
                        d = ((null != (n = uo(null != l ? l : "")) ? n : 0) * 3600 + (null != (r = uo(null != u ? u : "")) ? r : 0) * 60 + (null != (o = uo(null != c ? c : "")) ? o : 0)) * 1e3;
                    return {
                        batchSize: null != a ? a : 100,
                        waitMs: 0 === d ? 1e3 : d
                    }
                },
                ud = [],
                uf = !1,
                uh = function() {
                    if (uf = !1, 0 !== ud.length) {
                        var e = ud;
                        ud = [];
                        try {
                            tp.postUntyped(tv.Url.parse("".concat(th().beaconApi, "/v1/measurements")).getOrThrow(), e, {
                                credentials: "include",
                                keepalive: !0,
                                signal: AbortSignal.timeout(3e3)
                            })
                        } catch (e) {}
                    }
                },
                up = function() {
                    var e, t = null == rx ? void 0 : rx.getElementsByName("thumbnail-meta-data")[0],
                        n = void 0 === t ? 10 : uo(null != (e = t.dataset.thumbnailMetricsSampleSize) ? e : "");
                    return null !== n && Math.floor(100 * Math.random()) <= n
                },
                uv = function(e) {
                    return "".concat("AvatarHeadShot" === e ? "AvatarHeadshot" : e, "_2d")
                },
                um = function(e, t) {
                    var n = uu(t);
                    ud.push({
                        metricName: e,
                        jsonData: n.isOk() ? n.value : "{}"
                    });
                    var r = uc(),
                        o = r.batchSize,
                        i = r.waitMs;
                    ud.length >= o ? uh() : uf || (uf = !0, setTimeout(uh, i))
                },
                ug = function(e) {
                    var t, n = e.targetId,
                        r = e.type,
                        o = e.size,
                        i = e.format,
                        a = e.version,
                        s = e.headShape,
                        l = e.includeBackground,
                        u = e.includeProfileFrame,
                        c = e.altName,
                        d = e.imgClassName,
                        f = e.containerClassName,
                        h = e.onLoad,
                        p = (0, tl.useRef)(Date.now()),
                        v = (0, tl.useRef)(0),
                        m = (0, tl.useRef)(!1),
                        g = (0, tl.useRef)(!1),
                        y = null != l ? l : (null == r ? void 0 : r.toLowerCase()) === "avatarheadshot",
                        b = (0, tt.useQuery)({
                            queryKey: ["thumbnail-2d", r, n, o, i, a, s, y, u],
                            staleTime: 1 / 0,
                            retry: lp,
                            queryFn: function() {
                                return nR(function() {
                                    var e, t;
                                    return nO(this, function(l) {
                                        switch (l.label) {
                                            case 0:
                                                var c;
                                                return [4, (c = {
                                                    type: r,
                                                    targetId: n,
                                                    size: o,
                                                    format: i,
                                                    version: a,
                                                    headShape: s,
                                                    includeBackground: y,
                                                    includeProfileFrame: u
                                                }, nR(function() {
                                                    var e, t;
                                                    return nO(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return e = [td({}, c)], t = {}, [4, ur(c)];
                                                            case 1:
                                                                return [2, ut.apply(void 0, [tb.apply(void 0, e.concat([(t.format = n.sent(), t)]))])]
                                                        }
                                                    })
                                                })())];
                                            case 1:
                                                if (t = l.sent(), v.current += null != (e = t.transportRetries) ? e : 0, "Pending" === t.state) throw v.current += 1, lh;
                                                return up() && um("ThumbnailStatusCountWebapp", {
                                                    Status: t.state,
                                                    ThumbnailType: uv(r)
                                                }), [2, t]
                                        }
                                    })
                                })()
                            }
                        }),
                        w = b.data,
                        x = b.isError,
                        S = b.error,
                        E = b.isPending,
                        I = b.isLoading;
                    (0, tl.useEffect)(function() {
                        p.current = Date.now(), v.current = 0, m.current = !1, g.current = !1
                    }, [r, n, o, i, a, s, y, u]), (0, tl.useEffect)(function() {
                        !m.current && x && S === lh && (m.current = !0, up() && um("ThumbnailTimeoutWebapp", {
                            ThumbnailType: uv(r)
                        }))
                    }, [x, S, r]);
                    var T = null != (t = null == w ? void 0 : w.imageUrl) ? t : null,
                        C = (null == w ? void 0 : w.state) === "Blocked" ? "icon-blocked" : (null == w ? void 0 : w.state) === "InReview" ? "icon-in-review" : (null == w ? void 0 : w.state) === "Error" ? "icon-broken" : x ? S === lh ? "icon-pending" : "icon-broken" : "",
                        P = null != E ? E : I,
                        A = ["thumbnail-2d-container float-left overflow-hidden", void 0 === f ? "" : f, C, P && "thumbnail-2d-loading"].filter(Boolean).join(" ");
                    return (0, e8.jsxs)("span", {
                        className: A,
                        children: [P && (0, e8.jsx)(lf, {
                            className: "thumbnail-2d-skeleton",
                            variant: "Rectangle",
                            width: "100%",
                            height: "100%"
                        }), null != T && "" !== T && (0, e8.jsx)("img", {
                            className: ["size-full", void 0 === d ? "" : d].filter(Boolean).join(" "),
                            src: T,
                            alt: void 0 === c ? "" : c,
                            onLoad: function() {
                                if (!g.current && (null == w ? void 0 : w.state) === "Completed") {
                                    g.current = !0;
                                    var e = uv(r),
                                        t = v.current;
                                    um("ThumbnailLoadDurationWebapp", {
                                        Status: "Success",
                                        ThumbnailType: e,
                                        Value: String(Date.now() - p.current)
                                    }), um(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                                        ThumbnailType: e
                                    } : {
                                        ThumbnailType: e,
                                        Value: String(t)
                                    })
                                }
                                null == h || h()
                            }
                        })]
                    })
                },
                uy = function(e, t, n) {
                    var r = s_();
                    return (0, tl.useCallback)(function(i, a) {
                        var s, l = os(n),
                            u = td((tc(s = {}, rQ.UniverseId, e.toString()), tc(s, rQ.SortId, t), tc(s, rQ.ActionType, i), tc(s, rQ.HiddenReason, a), s), l && tc({}, l, r)),
                            c = r3.gameTileHiddenAction(u, n);
                        rN.sendEvent.apply(void 0, o(c))
                    }, [e, t, n, r])
                },
                ub = window.PropTypes,
                uw = n.n(ub),
                ux = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                uS = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                uE = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        o = e.className,
                        i = tz(e, ["variant", "size", "isCircular", "className"]);
                    return tu().createElement("button", td({
                        type: "button",
                        className: oV("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", s1, uS[t], ux[n], r && "radius-circle", o)
                    }, i), tu().createElement(s2, null), tu().createElement(s6, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };

            function uI(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    o = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === o || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function uT(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    n = [],
                    r = function() {
                        var t = n.map(function(e) {
                            return tl.createContext(e)
                        });
                        return function(n) {
                            var r = (null == n ? void 0 : n[e]) || t;
                            return tl.useMemo(function() {
                                return tc({}, "__scope".concat(e), tb(td({}, n), tc({}, e, r)))
                            }, [n, r])
                        }
                    };
                return r.scopeName = e, [function(t, r) {
                    var i = tl.createContext(r),
                        a = n.length;
                    n = o(n).concat([r]);
                    var s = function(t) {
                        var n, r = t.scope,
                            o = t.children,
                            s = tz(t, ["scope", "children"]),
                            l = (null == r || null == (n = r[e]) ? void 0 : n[a]) || i,
                            u = tl.useMemo(function() {
                                return s
                            }, Object.values(s));
                        return (0, e8.jsx)(l.Provider, {
                            value: u,
                            children: o
                        })
                    };
                    return s.displayName = t + "Provider", [s, function(n, o) {
                        var s, l = (null == o || null == (s = o[e]) ? void 0 : s[a]) || i,
                            u = tl.useContext(l);
                        if (u) return u;
                        if (void 0 !== r) return r;
                        throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                    }]
                }, uC.apply(void 0, [r].concat(o(t)))]
            }

            function uC() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                o = n.scopeName;
                            return td({}, e, r(t)["__scope".concat(o)])
                        }, {});
                        return tl.useMemo(function() {
                            return tc({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return o.scopeName = r.scopeName, o
            }
            var uP = (null == (e4 = globalThis) ? void 0 : e4.document) ? tl.useLayoutEffect : function() {},
                uA = tl[" useId ".trim().toString()] || function() {},
                u_ = 0;

            function uN(e) {
                var t = ts(tl.useState(uA()), 2),
                    n = t[0],
                    r = t[1];
                return uP(function() {
                    e || r(function(e) {
                        return null != e ? e : String(u_++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function uR(e) {
                var t = tl.useRef(e);
                return tl.useEffect(function() {
                    t.current = e
                }), tl.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(o(r)))
                    }
                }, [])
            }

            function uO(e) {
                var t, n, r, o, i, a, s, l = e.prop,
                    u = e.defaultProp,
                    c = e.onChange,
                    d = void 0 === c ? function() {} : c,
                    f = ts((n = (t = {
                        defaultProp: u,
                        onChange: d
                    }).defaultProp, r = t.onChange, i = ts(o = tl.useState(n), 1)[0], a = tl.useRef(i), s = uR(r), tl.useEffect(function() {
                        a.current !== i && (s(i), a.current = i)
                    }, [i, a, s]), o), 2),
                    h = f[0],
                    p = f[1],
                    v = void 0 !== l,
                    m = v ? l : h,
                    g = uR(d);
                return [m, tl.useCallback(function(e) {
                    if (v) {
                        var t = "function" == typeof e ? e(l) : e;
                        t !== l && g(t)
                    } else p(e)
                }, [v, l, p, g])]
            }
            var uk = window.RadixUI["react-focus-scope"];

            function uM(e) {
                var t, n, r = (t = e, (n = tl.forwardRef(function(e, t) {
                        var n = e.children,
                            r = tz(e, ["children"]);
                        if (tl.isValidElement(n)) {
                            var i, a, s, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                d = function(e, t) {
                                    var n = td({}, t);
                                    for (var r in t) ! function(r) {
                                        var i = e[r],
                                            a = t[r];
                                        /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            a.apply(void 0, o(t)), i.apply(void 0, o(t))
                                        } : i && (n[r] = i) : "style" === r ? n[r] = td({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                    }(r);
                                    return td({}, e, n)
                                }(r, n.props);
                            return n.type !== tl.Fragment && (d.ref = t ? s9(t, c) : c), tl.cloneElement(n, d)
                        }
                        return tl.Children.count(n) > 1 ? tl.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    i = tl.forwardRef(function(e, t) {
                        var n = e.children,
                            o = tz(e, ["children"]),
                            i = tl.Children.toArray(n),
                            a = i.find(uD);
                        if (a) {
                            var s = a.props.children,
                                l = i.map(function(e) {
                                    return e !== a ? e : tl.Children.count(s) > 1 ? tl.Children.only(null) : tl.isValidElement(s) ? s.props.children : null
                                });
                            return (0, e8.jsx)(r, tb(td({}, o), {
                                ref: t,
                                children: tl.isValidElement(s) ? tl.cloneElement(s, void 0, l) : null
                            }))
                        }
                        return (0, e8.jsx)(r, tb(td({}, o), {
                            ref: t,
                            children: n
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var uL = Symbol("radix.slottable");

            function uD(e) {
                return tl.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === uL
            }
            var uB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = uM("Primitive.".concat(t)),
                        r = tl.forwardRef(function(e, r) {
                            var o = e.asChild,
                                i = tz(e, ["asChild"]),
                                a = o ? n : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, e8.jsx)(a, tb(td({}, i), {
                                ref: r
                            }))
                        });
                    return r.displayName = "Primitive.".concat(t), tb(td({}, e), tc({}, t, r))
                }, {}),
                uj = tl.forwardRef(function(e, t) {
                    var n, r, o = e.container,
                        i = tz(e, ["container"]),
                        a = ts(tl.useState(!1), 2),
                        s = a[0],
                        l = a[1];
                    uP(function() {
                        return l(!0)
                    }, []);
                    var u = o || s && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
                    return u ? ar().createPortal((0, e8.jsx)(uB.div, tb(td({}, i), {
                        ref: t
                    })), u) : null
                });
            uj.displayName = "Portal";
            var uF = function(e) {
                var t, n, r, o, i, a, s, l, u, c, d, f, h, p, v, m, g, y = e.present,
                    b = e.children,
                    w = (t = y, i = (o = ts(tl.useState(), 2))[0], a = o[1], s = tl.useRef({}), l = tl.useRef(t), u = tl.useRef("none"), d = (c = ts((n = t ? "mounted" : "unmounted", r = {
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
                    }, tl.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], f = c[1], tl.useEffect(function() {
                        var e = uH(s.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), uP(function() {
                        var e = s.current,
                            n = l.current;
                        if (n !== t) {
                            var r = u.current,
                                o = uH(e);
                            t ? f("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : n && r !== o ? f("ANIMATION_OUT") : f("UNMOUNT"), l.current = t
                        }
                    }, [t, f]), uP(function() {
                        if (i) {
                            var e, t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                                r = function(e) {
                                    var r = uH(s.current).includes(e.animationName);
                                    if (e.target === i && r && (f("ANIMATION_END"), !l.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = uH(s.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                                }
                        }
                        f("ANIMATION_END")
                    }, [i, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: tl.useCallback(function(e) {
                            e && (s.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    x = "function" == typeof b ? b({
                        present: w.isPresent
                    }) : tl.Children.only(b),
                    S = s7(w.ref, (g = (m = null == (p = Object.getOwnPropertyDescriptor((h = x).props, "ref")) ? void 0 : p.get) && "isReactWarning" in m && m.isReactWarning) ? h.ref : (g = (m = null == (v = Object.getOwnPropertyDescriptor(h, "ref")) ? void 0 : v.get) && "isReactWarning" in m && m.isReactWarning) ? h.props.ref : h.props.ref || h.ref);
                return "function" == typeof b || w.isPresent ? tl.cloneElement(x, {
                    ref: S
                }) : null
            };

            function uH(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            uF.displayName = "Presence";
            var uU = window.RadixUI["react-focus-guards"],
                uz = function() {
                    return (uz = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function uG(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) 0 > t.indexOf(r[o]) && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]]);
                return n
            }
            var uV = "right-scroll-bar-position",
                uW = "width-before-scroll-bar";

            function uK(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var uq = "u" > typeof window ? tl.useLayoutEffect : tl.useEffect,
                uX = new WeakMap,
                uZ = (void 0 === en && (en = {}), (void 0 === er && (er = function(e) {
                    return e
                }), eo = [], ei = !1, ea = {
                    read: function() {
                        if (ei) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return eo.length ? eo[eo.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = er(e, ei);
                        return eo.push(t),
                            function() {
                                eo = eo.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (ei = !0; eo.length;) {
                            var t = eo;
                            eo = [], t.forEach(e)
                        }
                        eo = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return eo
                            }
                        }
                    },
                    assignMedium: function(e) {
                        ei = !0;
                        var t = [];
                        if (eo.length) {
                            var n = eo;
                            eo = [], n.forEach(e), t = eo
                        }
                        var r = function() {
                                var n = t;
                                t = [], n.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(r)
                            };
                        o(), eo = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), eo
                            }
                        }
                    }
                }).options = uz({
                    async: !0,
                    ssr: !1
                }, en), ea),
                uY = function() {},
                u$ = tl.forwardRef(function(e, t) {
                    var n, r, o, i, a = tl.useRef(null),
                        s = tl.useState({
                            onScrollCapture: uY,
                            onWheelCapture: uY,
                            onTouchMoveCapture: uY
                        }),
                        l = s[0],
                        u = s[1],
                        c = e.forwardProps,
                        d = e.children,
                        f = e.className,
                        h = e.removeScrollBar,
                        p = e.enabled,
                        v = e.shards,
                        m = e.sideCar,
                        g = e.noRelative,
                        y = e.noIsolation,
                        b = e.inert,
                        w = e.allowPinchZoom,
                        x = e.as,
                        S = e.gapMode,
                        E = uG(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        I = (n = [a, t], r = function(e) {
                            return n.forEach(function(t) {
                                return uK(t, e)
                            })
                        }, (o = (0, tl.useState)(function() {
                            return {
                                value: null,
                                callback: r,
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
                        })[0]).callback = r, i = o.facade, uq(function() {
                            var e = uX.get(i);
                            if (e) {
                                var t = new Set(e),
                                    r = new Set(n),
                                    o = i.current;
                                t.forEach(function(e) {
                                    r.has(e) || uK(e, null)
                                }), r.forEach(function(e) {
                                    t.has(e) || uK(e, o)
                                })
                            }
                            uX.set(i, n)
                        }, [n]), i),
                        T = uz(uz({}, E), l);
                    return tl.createElement(tl.Fragment, null, p && tl.createElement(m, {
                        sideCar: uZ,
                        removeScrollBar: h,
                        shards: v,
                        noRelative: g,
                        noIsolation: y,
                        inert: b,
                        setCallbacks: u,
                        allowPinchZoom: !!w,
                        lockRef: a,
                        gapMode: S
                    }), c ? tl.cloneElement(tl.Children.only(d), uz(uz({}, T), {
                        ref: I
                    })) : tl.createElement(void 0 === x ? "div" : x, uz({}, T, {
                        className: f,
                        ref: I
                    }), d))
                });
            u$.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, u$.classNames = {
                fullWidth: uW,
                zeroRight: uV
            };
            var uQ = function(e) {
                var t = e.sideCar,
                    n = uG(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var r = t.read();
                if (!r) throw Error("Sidecar medium not found");
                return tl.createElement(r, uz({}, n))
            };
            uQ.isSideCarExport = !0;
            var uJ = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = e6 || n.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, i;
                                (o = t).styleSheet ? o.styleSheet.cssText = r : o.appendChild(document.createTextNode(r)), i = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                u0 = function() {
                    var e = uJ();
                    return function(t, n) {
                        tl.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && n])
                    }
                },
                u1 = function() {
                    var e = u0();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                u2 = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                u5 = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                u3 = function(e) {
                    var t = window.getComputedStyle(document.body),
                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [u5(n), u5(r), u5(o)]
                },
                u4 = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return u2;
                    var t = u3(e),
                        n = document.documentElement.clientWidth,
                        r = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, r - n + t[2] - t[0])
                    }
                },
                u6 = u1(),
                u8 = "data-scroll-locked",
                u9 = function(e, t, n, r) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        s = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(s, "px ").concat(r, ";\n  }\n  body[").concat(u8, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(s, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(s, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(uV, " {\n    right: ").concat(s, "px ").concat(r, ";\n  }\n  \n  .").concat(uW, " {\n    margin-right: ").concat(s, "px ").concat(r, ";\n  }\n  \n  .").concat(uV, " .").concat(uV, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(uW, " .").concat(uW, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(u8, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(s, "px;\n  }\n")
                },
                u7 = function() {
                    var e = parseInt(document.body.getAttribute(u8) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                ce = function() {
                    tl.useEffect(function() {
                        return document.body.setAttribute(u8, (u7() + 1).toString()),
                            function() {
                                var e = u7() - 1;
                                e <= 0 ? document.body.removeAttribute(u8) : document.body.setAttribute(u8, e.toString())
                            }
                    }, [])
                },
                ct = function(e) {
                    var t = e.noRelative,
                        n = e.noImportant,
                        r = e.gapMode,
                        o = void 0 === r ? "margin" : r;
                    ce();
                    var i = tl.useMemo(function() {
                        return u4(o)
                    }, [o]);
                    return tl.createElement(u6, {
                        styles: u9(i, !t, o, n ? "" : "!important")
                    })
                },
                cn = !1;
            if ("u" > typeof window) try {
                var cr = Object.defineProperty({}, "passive", {
                    get: function() {
                        return cn = !0, !0
                    }
                });
                window.addEventListener("test", cr, cr), window.removeEventListener("test", cr, cr)
            } catch (e) {
                cn = !1
            }
            var co = !!cn && {
                    passive: !1
                },
                ci = function(e, t) {
                    if (!(0, to._)(e, Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
                },
                ca = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("u" > typeof ShadowRoot && (0, to._)(r, ShadowRoot) && (r = r.host), cs(e, r)) {
                            var o = cl(e, r);
                            if (o[1] > o[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                cs = function(e, t) {
                    return "v" === e ? ci(t, "overflowY") : ci(t, "overflowX")
                },
                cl = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                cu = function(e, t, n, r, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        s = a * r,
                        l = n.target,
                        u = t.contains(l),
                        c = !1,
                        d = s > 0,
                        f = 0,
                        h = 0;
                    do {
                        if (!l) break;
                        var p = cl(e, l),
                            v = p[0],
                            m = p[1] - p[2] - a * v;
                        (v || m) && cs(e, l) && (f += m, h += v);
                        var g = l.parentNode;
                        l = g && g.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? g.host : g
                    } while (!u && l !== document.body || u && (t.contains(l) || t === l));
                    return d && (o && 1 > Math.abs(f) || !o && s > f) ? c = !0 : !d && (o && 1 > Math.abs(h) || !o && -s > h) && (c = !0), c
                },
                cc = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                cd = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                cf = function(e) {
                    return e && "current" in e ? e.current : e
                },
                ch = 0,
                cp = [],
                cv = (es = function(e) {
                    var t = tl.useRef([]),
                        n = tl.useRef([0, 0]),
                        r = tl.useRef(),
                        o = tl.useState(ch++)[0],
                        i = tl.useState(u1)[0],
                        a = tl.useRef(e);
                    tl.useEffect(function() {
                        a.current = e
                    }, [e]), tl.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, n) {
                                if (n || 2 == arguments.length)
                                    for (var r, o = 0, i = t.length; o < i; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(cf), !0).filter(Boolean);
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
                    var s = tl.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var o, i = cc(e),
                                s = n.current,
                                l = "deltaX" in e ? e.deltaX : s[0] - i[0],
                                u = "deltaY" in e ? e.deltaY : s[1] - i[1],
                                c = e.target,
                                d = Math.abs(l) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === c.type) return !1;
                            var f = ca(d, c);
                            if (!f) return !0;
                            if (f ? o = d : (o = "v" === d ? "h" : "v", f = ca(d, c)), !f) return !1;
                            if (!r.current && "changedTouches" in e && (l || u) && (r.current = o), !o) return !0;
                            var h = r.current || o;
                            return cu(h, t, e, "h" === h ? l : u, !0)
                        }, []),
                        l = tl.useCallback(function(e) {
                            if (cp.length && cp[cp.length - 1] === i) {
                                var n = "deltaY" in e ? cd(e) : cc(e),
                                    r = t.current.filter(function(t) {
                                        var r;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                                    })[0];
                                if (r && r.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!r) {
                                    var o = (a.current.shards || []).map(cf).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? s(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = tl.useCallback(function(e, n, r, o) {
                            var i = {
                                name: e,
                                delta: n,
                                target: r,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t = null; null !== e;)(0, to._)(e, ShadowRoot) && (t = e.host, e = e.host), e = e.parentNode;
                                    return t
                                }(r)
                            };
                            t.current.push(i), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== i
                                })
                            }, 1)
                        }, []),
                        c = tl.useCallback(function(e) {
                            n.current = cc(e), r.current = void 0
                        }, []),
                        d = tl.useCallback(function(t) {
                            u(t.type, cd(t), t.target, s(t, e.lockRef.current))
                        }, []),
                        f = tl.useCallback(function(t) {
                            u(t.type, cc(t), t.target, s(t, e.lockRef.current))
                        }, []);
                    tl.useEffect(function() {
                        return cp.push(i), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", l, co), document.addEventListener("touchmove", l, co), document.addEventListener("touchstart", c, co),
                            function() {
                                cp = cp.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", l, co), document.removeEventListener("touchmove", l, co), document.removeEventListener("touchstart", c, co)
                            }
                    }, []);
                    var h = e.removeScrollBar,
                        p = e.inert;
                    return tl.createElement(tl.Fragment, null, p ? tl.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, h ? tl.createElement(ct, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, uZ.useMedium(es), uQ),
                cm = tl.forwardRef(function(e, t) {
                    return tl.createElement(u$, uz({}, e, {
                        ref: t,
                        sideCar: cv
                    }))
                });
            cm.classNames = u$.classNames;
            var cg = new WeakMap,
                cy = new WeakMap,
                cb = {},
                cw = 0,
                cx = function(e) {
                    return e && (e.host || cx(e.parentNode))
                },
                cS = function(e, t, n, r) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var n = cx(e);
                        return n && t.contains(n) ? n : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    cb[n] || (cb[n] = new WeakMap);
                    var i = cb[n],
                        a = [],
                        s = new Set,
                        l = new Set(o),
                        u = function(e) {
                            !e || s.has(e) || (s.add(e), u(e.parentNode))
                        };
                    o.forEach(u);
                    var c = function(e) {
                        !e || l.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (s.has(e)) c(e);
                            else try {
                                var t = e.getAttribute(r),
                                    o = null !== t && "false" !== t,
                                    l = (cg.get(e) || 0) + 1,
                                    u = (i.get(e) || 0) + 1;
                                cg.set(e, l), i.set(e, u), a.push(e), 1 === l && o && cy.set(e, !0), 1 === u && e.setAttribute(n, "true"), o || e.setAttribute(r, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return c(t), s.clear(), cw++,
                        function() {
                            a.forEach(function(e) {
                                var t = cg.get(e) - 1,
                                    o = i.get(e) - 1;
                                cg.set(e, t), i.set(e, o), t || (cy.has(e) || e.removeAttribute(r), cy.delete(e)), o || e.removeAttribute(n)
                            }), --cw || (cg = new WeakMap, cg = new WeakMap, cy = new WeakMap, cb = {})
                        }
                },
                cE = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live], script"))), cS(r, o, n, "aria-hidden")) : function() {
                        return null
                    }
                },
                cI = "Dialog",
                cT = ts(uT(cI), 2),
                cC = cT[0];
            cT[1];
            var cP = ts(cC(cI), 2),
                cA = cP[0],
                c_ = cP[1],
                cN = function(e) {
                    var t = e.__scopeDialog,
                        n = e.children,
                        r = e.open,
                        o = e.defaultOpen,
                        i = e.onOpenChange,
                        a = e.modal,
                        s = tl.useRef(null),
                        l = tl.useRef(null),
                        u = ts(uO({
                            prop: r,
                            defaultProp: o,
                            onChange: i
                        }), 2),
                        c = u[0],
                        d = u[1];
                    return (0, e8.jsx)(cA, {
                        scope: t,
                        triggerRef: s,
                        contentRef: l,
                        contentId: uN(),
                        titleId: uN(),
                        descriptionId: uN(),
                        open: void 0 !== c && c,
                        onOpenChange: d,
                        onOpenToggle: tl.useCallback(function() {
                            return d(function(e) {
                                return !e
                            })
                        }, [d]),
                        modal: void 0 === a || a,
                        children: n
                    })
                };
            cN.displayName = cI;
            var cR = "DialogTrigger";
            tl.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = tz(e, ["__scopeDialog"]),
                    o = c_(cR, n),
                    i = s7(t, o.triggerRef);
                return (0, e8.jsx)(uB.button, tb(td({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": c$(o.open)
                }, r), {
                    ref: i,
                    onClick: uI(e.onClick, o.onOpenToggle)
                }))
            }).displayName = cR;
            var cO = "DialogPortal",
                ck = ts(cC(cO, {
                    forceMount: void 0
                }), 2),
                cM = ck[0],
                cL = ck[1],
                cD = function(e) {
                    var t = e.__scopeDialog,
                        n = e.forceMount,
                        r = e.children,
                        o = e.container,
                        i = c_(cO, t);
                    return (0, e8.jsx)(cM, {
                        scope: t,
                        forceMount: n,
                        children: tl.Children.map(r, function(e) {
                            return (0, e8.jsx)(uF, {
                                present: n || i.open,
                                children: (0, e8.jsx)(uj, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            cD.displayName = cO;
            var cB = "DialogOverlay",
                cj = tl.forwardRef(function(e, t) {
                    var n = cL(cB, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        i = tz(e, ["forceMount"]),
                        a = c_(cB, e.__scopeDialog);
                    return a.modal ? (0, e8.jsx)(uF, {
                        present: o || a.open,
                        children: (0, e8.jsx)(cH, tb(td({}, i), {
                            ref: t
                        }))
                    }) : null
                });
            cj.displayName = cB;
            var cF = uM("DialogOverlay.RemoveScroll"),
                cH = tl.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = tz(e, ["__scopeDialog"]),
                        o = c_(cB, n);
                    return (0, e8.jsx)(cm, {
                        as: cF,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, e8.jsx)(uB.div, tb(td({
                            "data-state": c$(o.open)
                        }, r), {
                            ref: t,
                            style: td({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                }),
                cU = "DialogContent",
                cz = tl.forwardRef(function(e, t) {
                    var n = cL(cU, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        i = tz(e, ["forceMount"]),
                        a = c_(cU, e.__scopeDialog);
                    return (0, e8.jsx)(uF, {
                        present: o || a.open,
                        children: a.modal ? (0, e8.jsx)(cG, tb(td({}, i), {
                            ref: t
                        })) : (0, e8.jsx)(cV, tb(td({}, i), {
                            ref: t
                        }))
                    })
                });
            cz.displayName = cU;
            var cG = tl.forwardRef(function(e, t) {
                    var n = c_(cU, e.__scopeDialog),
                        r = tl.useRef(null),
                        o = s7(t, n.contentRef, r);
                    return tl.useEffect(function() {
                        var e = r.current;
                        if (e) return cE(e)
                    }, []), (0, e8.jsx)(cW, tb(td({}, e), {
                        ref: o,
                        trapFocus: n.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: uI(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = n.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: uI(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                n = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || n) && e.preventDefault()
                        }),
                        onFocusOutside: uI(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                cV = tl.forwardRef(function(e, t) {
                    var n = c_(cU, e.__scopeDialog),
                        r = tl.useRef(!1),
                        o = tl.useRef(!1);
                    return (0, e8.jsx)(cW, tb(td({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, a;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (r.current || null == (a = n.triggerRef.current) || a.focus(), t.preventDefault()), r.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var i, a, s = t.target;
                            (null == (a = n.triggerRef.current) ? void 0 : a.contains(s)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                cW = tl.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = tz(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        s = c_(cU, n),
                        l = tl.useRef(null),
                        u = s7(t, l);
                    return (0, uU.useFocusGuards)(), (0, e8.jsxs)(e8.Fragment, {
                        children: [(0, e8.jsx)(uk.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: r,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: i,
                            children: (0, e8.jsx)(oQ.DismissableLayer, tb(td({
                                role: "dialog",
                                id: s.contentId,
                                "aria-describedby": s.descriptionId,
                                "aria-labelledby": s.titleId,
                                "data-state": c$(s.open)
                            }, a), {
                                ref: u,
                                onDismiss: function() {
                                    return s.onOpenChange(!1)
                                }
                            }))
                        }), (0, e8.jsxs)(e8.Fragment, {
                            children: [(0, e8.jsx)(c1, {
                                titleId: s.titleId
                            }), (0, e8.jsx)(c2, {
                                contentRef: l,
                                descriptionId: s.descriptionId
                            })]
                        })]
                    })
                }),
                cK = "DialogTitle",
                cq = tl.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = tz(e, ["__scopeDialog"]),
                        o = c_(cK, n);
                    return (0, e8.jsx)(uB.h2, tb(td({
                        id: o.titleId
                    }, r), {
                        ref: t
                    }))
                });
            cq.displayName = cK;
            var cX = "DialogDescription";
            tl.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = tz(e, ["__scopeDialog"]),
                    o = c_(cX, n);
                return (0, e8.jsx)(uB.p, tb(td({
                    id: o.descriptionId
                }, r), {
                    ref: t
                }))
            }).displayName = cX;
            var cZ = "DialogClose",
                cY = tl.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = tz(e, ["__scopeDialog"]),
                        o = c_(cZ, n);
                    return (0, e8.jsx)(uB.button, tb(td({
                        type: "button"
                    }, r), {
                        ref: t,
                        onClick: uI(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function c$(e) {
                return e ? "open" : "closed"
            }
            cY.displayName = cZ;
            var cQ = "DialogTitleWarning",
                cJ = ts((el = {
                    contentName: cU,
                    titleName: cK,
                    docsSlug: "dialog"
                }, eu = tl.createContext(el), (ec = function(e) {
                    var t = e.children,
                        n = tz(e, ["children"]),
                        r = tl.useMemo(function() {
                            return n
                        }, Object.values(n));
                    return (0, e8.jsx)(eu.Provider, {
                        value: r,
                        children: t
                    })
                }).displayName = cQ + "Provider", [ec, function(e) {
                    var t = tl.useContext(eu);
                    if (t) return t;
                    if (void 0 !== el) return el;
                    throw Error("`".concat(e, "` must be used within `").concat(cQ, "`"))
                }]), 2),
                c0 = (cJ[0], cJ[1]),
                c1 = function(e) {
                    var t = e.titleId,
                        n = c0(cQ),
                        r = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
                    return tl.useEffect(function() {
                        t && (document.getElementById(t) || console.error(r))
                    }, [r, t]), null
                },
                c2 = function(e) {
                    var t = e.contentRef,
                        n = e.descriptionId,
                        r = c0("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
                    return tl.useEffect(function() {
                        var e, r = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        n && r && (document.getElementById(n) || console.warn(o))
                    }, [o, t, n]), null
                };

            function c5(e) {
                var t, n, r = (t = e, (n = tl.forwardRef(function(e, t) {
                        var n = e.children,
                            r = tz(e, ["children"]);
                        if (tl.isValidElement(n)) {
                            var i, a, s, l, u, c = (u = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                d = function(e, t) {
                                    var n = td({}, t);
                                    for (var r in t) ! function(r) {
                                        var i = e[r],
                                            a = t[r];
                                        /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            var r = a.apply(void 0, o(t));
                                            return i.apply(void 0, o(t)), r
                                        } : i && (n[r] = i) : "style" === r ? n[r] = td({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                    }(r);
                                    return td({}, e, n)
                                }(r, n.props);
                            return n.type !== tl.Fragment && (d.ref = t ? s9(t, c) : c), tl.cloneElement(n, d)
                        }
                        return tl.Children.count(n) > 1 ? tl.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    i = tl.forwardRef(function(e, t) {
                        var n = e.children,
                            o = tz(e, ["children"]),
                            i = tl.Children.toArray(n),
                            a = i.find(c4);
                        if (a) {
                            var s = a.props.children,
                                l = i.map(function(e) {
                                    return e !== a ? e : tl.Children.count(s) > 1 ? tl.Children.only(null) : tl.isValidElement(s) ? s.props.children : null
                                });
                            return (0, e8.jsx)(r, tb(td({}, o), {
                                ref: t,
                                children: tl.isValidElement(s) ? tl.cloneElement(s, void 0, l) : null
                            }))
                        }
                        return (0, e8.jsx)(r, tb(td({}, o), {
                            ref: t,
                            children: n
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var c3 = Symbol("radix.slottable");

            function c4(e) {
                return tl.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === c3
            }
            var c6 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = c5("Primitive.".concat(t)),
                        r = tl.forwardRef(function(e, r) {
                            var o = e.asChild,
                                i = tz(e, ["asChild"]),
                                a = o ? n : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, e8.jsx)(a, tb(td({}, i), {
                                ref: r
                            }))
                        });
                    return r.displayName = "Primitive.".concat(t), tb(td({}, e), tc({}, t, r))
                }, {}),
                c8 = Object.freeze({
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
                c9 = tl.forwardRef(function(e, t) {
                    return (0, e8.jsx)(c6.span, tb(td({}, e), {
                        ref: t,
                        style: td({}, c8, e.style)
                    }))
                });
            c9.displayName = "VisuallyHidden";
            var c7 = (0, tl.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                de = function() {
                    var e = (0, tl.useContext)(c7);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                dt = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                dn = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                dr = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                di = function(e) {
                    var t = e.open,
                        n = e.onOpenChange,
                        r = e.children,
                        o = e.size,
                        i = e.type,
                        a = void 0 === i ? "Default" : i,
                        s = e.isModal,
                        l = e.hasCloseAffordance,
                        u = e.closeLabel,
                        c = e.hasMarginTop,
                        d = void 0 === c || c,
                        f = e.hasMarginBottom,
                        h = void 0 === f || f,
                        p = e.hasDescription,
                        v = void 0 !== p && p,
                        m = e.experimentalDisablePointerEventsStylingOnBody,
                        g = void 0 !== m && m,
                        y = (0, tl.useMemo)(function() {
                            return {
                                size: o,
                                isModal: s,
                                type: a,
                                hasCloseAffordance: l,
                                closeLabel: u,
                                hasMarginTop: d,
                                hasMarginBottom: h,
                                hasDescription: v
                            }
                        }, [o, s, a, l, u, d, h, v]);
                    return (0, tl.useEffect)(function() {
                        g && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [g, t]), tu().createElement(c7.Provider, {
                        value: y
                    }, tu().createElement(cN, {
                        open: t,
                        onOpenChange: n
                    }, r))
                };
            di.displayName = "Dialog";
            var da = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.style,
                    o = e.overlayClassName,
                    i = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    s = tz(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    l = de(),
                    u = l.size,
                    c = l.isModal,
                    d = l.hasCloseAffordance,
                    f = l.closeLabel,
                    h = l.hasDescription,
                    p = oV("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", c && "bg-common-backdrop", o),
                    v = oV("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", n);
                return tu().createElement(cD, null, tu().createElement(cj, {
                    className: p,
                    style: i
                }, tu().createElement(cz, td({
                    className: v,
                    "data-size": u,
                    style: r,
                    onOpenAutoFocus: a
                }, !h && {
                    "aria-describedby": void 0
                }, s), d && tu().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, tu().createElement(cY, {
                    asChild: !0
                }, tu().createElement(uE, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            da.displayName = "DialogContent";
            var ds = function(e) {
                var t = e.children,
                    n = e.className,
                    r = tz(e, ["children", "className"]),
                    o = de(),
                    i = o.size,
                    a = o.hasMarginTop,
                    s = o.hasMarginBottom,
                    l = oV(dt[i], a && dn[i], s && dr[i], n);
                return tu().createElement("div", td({
                    className: l
                }, r), t)
            };
            ds.displayName = "DialogBody";
            var dl = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.hidden,
                    o = tz(e, ["children", "className", "hidden"]),
                    i = tu().createElement(cq, td({
                        className: n
                    }, o), t);
                return r ? tu().createElement(c9, null, i) : i
            };
            dl.displayName = "DialogTitle";
            var du = {
                goToProfileInPlacesList: {
                    name: "goToProfileInPlacesList",
                    ctx: "click"
                },
                openModalFromGameTile: {
                    name: "openModalFromGameTile",
                    ctx: "click"
                },
                goToChatInPlacesList: {
                    name: "goToChatInPlacesList",
                    ctx: "click"
                },
                joinGameInPlacesList: {
                    name: "joinGameInPlacesList",
                    ctx: "click"
                },
                goToGameDetailInPlacesList: {
                    name: "goToGameDetailInPlacesList",
                    ctx: "click"
                },
                gamePlayIntentInPlacesList: {
                    ctx: "placesListInHomePage"
                }
            };

            function dc(e) {
                var t = e.game,
                    n = e.translate,
                    r = t.universeId,
                    o = t.name,
                    i = t.referralUrl,
                    a = t.isPlayable,
                    s = (0, e8.jsx)(ug, {
                        type: "GameIcon",
                        size: "150x150",
                        targetId: r,
                        imgClassName: "game-card-thumb",
                        format: "jpeg"
                    });
                return (0, e8.jsxs)("div", {
                    className: "player-interaction-game flex items-start",
                    children: [(0, e8.jsx)("a", {
                        href: i,
                        className: "game-card-link player-interaction-game-icon shrink-0",
                        children: s
                    }), (0, e8.jsxs)("div", {
                        className: "flex flex-col items-start gap-small grow min-width-0",
                        children: [(0, e8.jsx)("a", {
                            href: i,
                            className: "player-interaction-game-name content-emphasis text-truncate-end",
                            children: o
                        }), !a && (0, e8.jsx)(lc, {
                            as: "a",
                            href: i,
                            variant: "Standard",
                            size: "Small",
                            children: n("Action.ViewDetails")
                        })]
                    })]
                })
            }

            function dd(e) {
                var t = e.playerId,
                    n = e.altName;
                return (0, e8.jsx)("div", {
                    className: "avatar-card-link",
                    children: (0, e8.jsx)(ug, {
                        type: "AvatarHeadShot",
                        size: "48x48",
                        targetId: t,
                        imgClassName: "avatar-card-image",
                        format: "webp",
                        altName: n
                    })
                })
            }
            dc.propTypes = {
                game: uw().shape({
                    universeId: uw().number,
                    placeId: uw().number,
                    name: uw().string,
                    playerCount: uw().number,
                    isShowSponsoredLabel: uw().bool,
                    nativeAdData: uw().string,
                    imageUrl: uw().string,
                    referralUrl: uw().string,
                    isPlayable: uw().bool
                }).isRequired,
                translate: uw().func.isRequired
            }, dd.defaultProps = {
                altName: ""
            }, dd.propTypes = {
                playerId: uw().number.isRequired,
                altName: uw().string
            };
            var df = window.Roblox["core-scripts"].game,
                dh = function(e, t, n) {
                    (0, df.launchGame)(e, t, n)
                };

            function dp(e) {
                var t = e.playerData,
                    n = e.dismissModal,
                    r = e.isPlayable,
                    o = e.translate,
                    i = t.presence,
                    a = i.rootPlaceId,
                    s = i.placeId,
                    l = i.gameId,
                    u = t.id,
                    c = t.nameForDisplay;
                return (0, e8.jsxs)("div", {
                    className: "player-interaction-info flex items-center justify-between grow min-width-0",
                    children: [(0, e8.jsx)("span", {
                        className: "player-interaction-name text-truncate-end",
                        children: c
                    }), (0, e8.jsx)(lc, {
                        className: "player-interaction-join",
                        variant: "Emphasis",
                        size: "Small",
                        onClick: function(e) {
                            var t = (0, df.buildPlayGameProperties)(a, s, l, u),
                                r = du.joinGameInPlacesList,
                                o = du.gamePlayIntentInPlacesList;
                            dh(t, {
                                eventName: r.name,
                                ctx: r.ctx,
                                properties: {
                                    rootPlaceId: a,
                                    placeId: s
                                },
                                gamePlayIntentEventCtx: o.ctx
                            }), n(e)
                        },
                        isDisabled: !r,
                        children: o("Action.JoinGame")
                    })]
                })
            }

            function dv(e) {
                var t = e.friendsData,
                    n = e.friendsInGame,
                    r = e.dismissModal,
                    o = e.isPlayable,
                    i = e.translate,
                    a = {};
                return t.forEach(function(e) {
                    a[e.id] = e
                }), (0, e8.jsx)("ul", {
                    className: "flex flex-col",
                    style: {
                        maxHeight: 450,
                        overflowY: "auto"
                    },
                    children: n.map(function(e, t) {
                        var n = a[e],
                            s = n.id,
                            l = n.nameForDisplay;
                        return (0, e8.jsx)("li", {
                            className: "player-interaction-row",
                            children: (0, e8.jsxs)("div", {
                                className: "player-interaction-row-content flex items-start",
                                children: [(0, e8.jsx)("span", {
                                    className: "player-interaction-avatar shrink-0 radius-circle",
                                    style: {
                                        overflow: "hidden"
                                    },
                                    children: (0, e8.jsx)(dd, {
                                        playerId: s,
                                        altName: l
                                    })
                                }), (0, e8.jsx)(dp, {
                                    playerData: n,
                                    dismissModal: r,
                                    isPlayable: o,
                                    translate: i
                                })]
                            })
                        }, e + t)
                    })
                })
            }

            function dm(e) {
                var t = e.show,
                    n = e.onHide,
                    r = e.friendsData,
                    o = e.friendsInGame,
                    i = e.game,
                    a = ra("Feature.PlacesList"),
                    s = ra("CommonUI.Controls");
                return (0, e8.jsx)("span", {
                    style: {
                        display: "contents"
                    },
                    onClick: function(e) {
                        return e.stopPropagation()
                    },
                    children: (0, e8.jsx)(di, {
                        open: t,
                        onOpenChange: function(e) {
                            e || n(new Event("close"))
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: s("Action.Close", void 0, "Close"),
                        children: (0, e8.jsx)(da, {
                            className: "player-interaction-dialog",
                            style: {
                                width: 400,
                                maxWidth: "calc(100vw - 24px)"
                            },
                            children: (0, e8.jsxs)(ds, {
                                className: "player-interaction-body",
                                "data-testid": "game-players-player-interaction-modal",
                                children: [(0, e8.jsx)(dl, {
                                    className: "player-interaction-title content-emphasis",
                                    children: a("Label.ContextMenuTitle")
                                }), (0, e8.jsx)(dc, {
                                    game: i,
                                    translate: a
                                }), (0, e8.jsx)(dv, {
                                    friendsData: r,
                                    friendsInGame: o,
                                    dismissModal: n,
                                    isPlayable: i.isPlayable,
                                    translate: a
                                })]
                            })
                        })
                    })
                })
            }
            dp.propTypes = {
                playerData: uw().shape({
                    presence: uw().shape({
                        rootPlaceId: uw().number,
                        placeId: uw().number,
                        gameId: uw().string
                    }),
                    id: uw().number,
                    nameForDisplay: uw().string
                }).isRequired,
                dismissModal: uw().func.isRequired,
                isPlayable: uw().bool.isRequired,
                translate: uw().func.isRequired
            }, dv.propTypes = {
                friendsData: uw().arrayOf(uw().shape({
                    presense: uw().shape({
                        rootPlaceId: uw().number,
                        placeId: uw().number,
                        gameId: uw().string
                    }),
                    id: uw().number,
                    nameForDisplay: uw().string
                })).isRequired,
                friendsInGame: uw().arrayOf(uw().number).isRequired,
                dismissModal: uw().func.isRequired,
                isPlayable: uw().bool.isRequired,
                translate: uw().func.isRequired
            }, dm.propTypes = {
                show: uw().bool.isRequired,
                onHide: uw().func.isRequired,
                friendsData: uw().arrayOf(uw().shape({
                    presense: uw().shape({
                        rootPlaceId: uw().number,
                        placeId: uw().number,
                        gameId: uw().string
                    }),
                    id: uw().number,
                    nameForDisplay: uw().string
                })).isRequired,
                friendsInGame: uw().arrayOf(uw().number).isRequired,
                game: uw().shape({
                    universeId: uw().number,
                    placeId: uw().number,
                    name: uw().string,
                    playerCount: uw().number,
                    isShowSponsoredLabel: uw().bool,
                    nativeAdData: uw().string,
                    imageUrl: uw().string,
                    referralUrl: uw().string,
                    isPlayable: uw().bool
                }).isRequired
            };
            var dg = function(e) {
                var t = e.animationClass,
                    n = e.isFocused,
                    r = e.icons,
                    o = e.text,
                    i = e.componentType;
                return (null == r ? void 0 : r.length) || o ? (0, e8.jsx)("div", {
                    className: oz()("game-card-pill-with-animation", ob[null != i ? i : og.Pill]),
                    children: (0, e8.jsxs)("div", {
                        className: oz()("game-card-pill-animation-container", tc({}, null != t ? t : "", t && n)),
                        children: [(null == r ? void 0 : r.length) && r.map(function(e, t) {
                            return "foundation" === e.type ? (0, e8.jsx)(s6, {
                                name: e.class,
                                size: "Small",
                                className: "game-card-pill-icon"
                            }, t) : (0, e8.jsx)("span", {
                                className: "game-card-pill-icon ".concat(e.class)
                            }, t)
                        }), o && (0, e8.jsx)("div", {
                            className: "game-card-pill-text",
                            children: o
                        })]
                    })
                }) : null
            };
            dg.defaultProps = {
                animation: void 0
            };
            var dy = function(e) {
                    var t = e.pills,
                        n = e.isFocused,
                        r = Object.keys(t),
                        o = function(e) {
                            var n;
                            return !!(null == (n = t[e]) ? void 0 : n.length)
                        };
                    return (0, e8.jsx)(tl.Fragment, {
                        children: r.map(function(e) {
                            var r;
                            return o(e) && (0, e8.jsx)("div", {
                                className: "game-card-pills-container ".concat(oE(e)),
                                children: null == (r = t[e]) ? void 0 : r.map(function(e) {
                                    return (0, e8.jsx)(dg, {
                                        id: e.id,
                                        animationClass: e.animationClass,
                                        icons: e.icons,
                                        text: e.text,
                                        componentType: e.componentType,
                                        isFocused: n
                                    }, e.id)
                                })
                            }, e)
                        })
                    })
                },
                db = function(e) {
                    var t = ou(e.playerCount);
                    return (0, e8.jsxs)("div", {
                        className: "game-card-info",
                        "data-testid": "game-tile-stats-player-count",
                        children: [(0, e8.jsx)("span", {
                            className: "info-label icon-playing-counts-gray"
                        }), (0, e8.jsx)("span", {
                            className: "info-label playing-counts-label",
                            children: t
                        })]
                    })
                },
                dw = function(e) {
                    var t = e.playerCount,
                        n = e.playerCountStyle,
                        r = oz()("game-card-image-pill", {
                            "hover-only": n === rp.Hover
                        });
                    return (0, e8.jsx)("div", {
                        className: r,
                        "data-testid": "game-tile-player-count-pill",
                        children: (0, e8.jsx)(db, {
                            playerCount: t
                        })
                    })
                };
            dw.defaultProps = {
                playerCountStyle: void 0
            };
            var dx = {
                    Voice: "pill-icon icon-default-voice-16x16-white",
                    Camera: "pill-icon icon-default-camera-white"
                },
                dS = function(e) {
                    var t = e.featureTypes;
                    return (0, e8.jsx)("div", {
                        className: "game-card-image-feature-pill",
                        "data-testid": "game-tile-social-feature-pill",
                        children: (0, e8.jsx)("div", {
                            className: "game-card-info",
                            "data-testid": "game-tile-social-feature-list",
                            children: t.map(function(e) {
                                return dx[e] && (0, e8.jsx)("span", {
                                    className: dx[e]
                                }, e)
                            })
                        })
                    })
                },
                dE = function(e) {
                    var t, n = e.gameLayoutData,
                        r = e.playerCountStyle,
                        o = e.playerCount,
                        i = e.isFocused,
                        a = oT(n);
                    return a ? (0, e8.jsx)(dy, {
                        pills: a,
                        isFocused: i
                    }) : (null == n || null == (t = n.pill) ? void 0 : t.types) && n.pill.types.length > 0 ? (0, e8.jsx)(dS, {
                        featureTypes: n.pill.types
                    }) : void 0 !== o && (r === rp.Always || r === rp.Hover) ? (0, e8.jsx)(dw, {
                        playerCount: o,
                        playerCountStyle: r
                    }) : null
                };
            dE.defaultProps = {
                gameLayoutData: void 0,
                playerCountStyle: void 0,
                playerCount: void 0
            };
            var dI = rq.keyBoardEventCode,
                dT = rq.numberOfInGameAvatarIcons,
                dC = rq.numberOfInGameNames,
                dP = function(e) {
                    var t = e.id,
                        n = e.children,
                        r = e.gameData,
                        o = e.isOnScreen,
                        i = e.page,
                        a = e.buildEventProperties,
                        s = e.isFocused,
                        l = r6(r, e.topicId);
                    return (0, e8.jsxs)("a", {
                        href: rG(r.placeId, r.name, a(r, t), r.canonicalUrlPath),
                        tabIndex: o ? 0 : -1,
                        "aria-hidden": !o,
                        className: "game-card-link",
                        id: r.universeId.toString(),
                        children: [(0, e8.jsx)(dE, {
                            gameLayoutData: l,
                            isFocused: !!s
                        }), (0, e8.jsx)("div", {
                            className: "game-card-thumb-container",
                            children: (0, e8.jsx)(ug, {
                                type: "GameIcon",
                                size: "256x256",
                                targetId: r.universeId,
                                containerClassName: i === rU.GamesPage ? "game-card-thumb" : "game-tile-thumb",
                                format: "jpeg",
                                altName: r.name
                            })
                        }), (0, e8.jsx)("div", {
                            className: "game-card-name game-name-title",
                            title: r.name,
                            children: r.name
                        }), n]
                    })
                };
            dP.defaultProps = {
                page: rU.HomePage,
                isOnScreen: !0,
                isFocused: !1
            };
            var dA = function(e) {
                    var t = e.totalDownVotes,
                        n = e.totalUpVotes,
                        r = e.playerCount,
                        o = ol(n, t),
                        i = ou(r);
                    return (0, e8.jsxs)("div", {
                        className: "game-card-info",
                        "data-testid": "game-tile-stats",
                        children: [(0, e8.jsx)("span", {
                            className: "info-label icon-votes-gray"
                        }), o ? (0, e8.jsx)("span", {
                            className: "info-label vote-percentage-label",
                            children: o
                        }) : (0, e8.jsx)("span", {
                            className: "info-label no-vote"
                        }), (0, e8.jsx)("span", {
                            className: "info-label icon-playing-counts-gray"
                        }), (0, e8.jsx)("span", {
                            className: "info-label playing-counts-label",
                            children: i
                        })]
                    })
                },
                d_ = function(e) {
                    var t = e.footerData;
                    return (0, e8.jsx)("div", {
                        className: "game-card-info",
                        "data-testid": "game-tile-stats-text-footer",
                        children: (0, e8.jsx)("span", {
                            className: "info-label",
                            children: t.text.textLiteral
                        })
                    })
                },
                dN = function(e) {
                    var t, n = e.footerData,
                        r = e.totalDownVotes,
                        o = r9(e.totalUpVotes, r),
                        i = null != (t = null == o ? void 0 : o.toString()) ? t : "--";
                    return (0, e8.jsxs)("div", {
                        className: "game-card-info",
                        "data-testid": "game-tile-stats-rating-with-genre",
                        children: [(0, e8.jsx)("span", {
                            className: "info-label icon-votes-gray"
                        }), (0, e8.jsx)("span", {
                            className: "info-label text-label-with-icon",
                            children: "".concat(i, "% • ").concat(n.genre.textLiteral)
                        })]
                    })
                },
                dR = function(e) {
                    var t = e.footerText;
                    return (0, e8.jsx)("div", {
                        className: "game-card-info",
                        "data-testid": "game-tile-stats-friend-activity",
                        children: (0, e8.jsx)("span", {
                            className: "info-label",
                            children: t
                        })
                    })
                },
                dO = function(e) {
                    var t = e.translate;
                    return (0, e8.jsx)("div", {
                        className: "game-card-native-ad",
                        "data-testid": "game-tile-sponsored-footer",
                        children: (0, e8.jsxs)("div", {
                            className: "native-ad-label",
                            children: [t("Label.SponsoredAd"), (0, e8.jsx)(sy, {
                                tooltipText: t(sb) || "Sponsored experiences are paid for by Creators. They may be shown to you based on general information about your device type, location, and demographics.",
                                placement: "right",
                                sizeInPx: 12
                            })]
                        })
                    })
                },
                dk = function(e) {
                    var t = e.message;
                    return (0, e8.jsx)("span", {
                        className: "text-body-medium",
                        children: t
                    })
                },
                dM = function(e) {
                    var t = e.translate,
                        n = e.onUndo,
                        r = e.className,
                        o = e.universeId,
                        i = e.topicId,
                        a = e.page,
                        s = e.hiddenReason,
                        l = uy(o, i, a),
                        u = (0, tl.useCallback)(function(e) {
                            e.stopPropagation(), l(r5.GameTileHiddenUndone, s), null == n || n()
                        }, [l, s, n]);
                    return (0, e8.jsx)(lc, {
                        className: r,
                        variant: "Standard",
                        size: "XSmall",
                        onClick: u,
                        children: t("Action.Undo", void 0, "Undo")
                    })
                },
                dL = function(e) {
                    var t = e.user;
                    return (0, e8.jsx)(ug, {
                        type: "AvatarHeadShot",
                        size: "48x48",
                        targetId: t.id,
                        containerClassName: "avatar avatar-headshot avatar-headshot-xs",
                        imgClassName: "avatar-card-image",
                        format: "webp",
                        altName: t.displayName
                    })
                },
                dD = function(e) {
                    var t = e.friendData,
                        n = e.gameData,
                        r = e.translate,
                        o = ts((0, tl.useState)(!1), 2),
                        i = o[0],
                        a = o[1];
                    if (0 === t.length) throw Error("friendData should not be empty");
                    return (0, e8.jsxs)("div", {
                        className: "game-card-friend-info game-card-info",
                        "data-testid": "game-tile-stats-friends",
                        children: [(0, e8.jsx)("div", {
                            className: "info-avatar",
                            style: {
                                width: "".concat((t.slice(0, dT).length - 1) * 22 + 32, "px")
                            },
                            children: t.slice(0, dT).map(function(e) {
                                return (0, e8.jsx)("div", {
                                    className: "avatar-card",
                                    role: "button",
                                    tabIndex: 0,
                                    onClick: function(e) {
                                        e.stopPropagation(), e.preventDefault(), a(!0)
                                    },
                                    onKeyDown: function(e) {
                                        e.code === dI.enter && (e.stopPropagation(), e.preventDefault(), a(!0))
                                    },
                                    children: (0, e8.jsx)(dL, {
                                        user: e
                                    })
                                }, e.displayName)
                            })
                        }), r && (0, e8.jsx)("span", {
                            className: "info-label text-overflow",
                            "data-testid": "game-tile-stats-info-label",
                            children: t.length > dC ? r("LabelPlayingOnePlusUsersWithComma", {
                                username: t[0].displayName,
                                count: t.length - dC
                            }) : r("LabelPlayingOneUser", {
                                user: t[0].displayName
                            })
                        }), (0, e8.jsx)(dB, {
                            friendsDataInGame: t,
                            game: n,
                            show: i,
                            onHide: function(e) {
                                e.stopPropagation(), e.preventDefault(), a(!1)
                            }
                        })]
                    })
                };
            dD.defaultProps = {
                translate: void 0
            };
            var dB = function(e) {
                    var t = e.show,
                        n = e.onHide,
                        r = e.friendsDataInGame,
                        o = e.game;
                    return (0, e8.jsx)(dm, {
                        show: t,
                        onHide: n,
                        friendsData: r.map(function(e) {
                            return tb(td({}, e), {
                                nameForDisplay: e.displayName
                            })
                        }),
                        friendsInGame: r.map(function(e) {
                            return e.id
                        }),
                        game: o
                    })
                },
                dj = function(e) {
                    var t = e.translate,
                        n = e.universeId,
                        r = e.topicId,
                        o = e.page,
                        i = e.onUndo;
                    return (0, e8.jsxs)("div", {
                        className: "game-tile-hidden-placeholder-contents",
                        children: [(0, e8.jsx)(dk, {
                            message: t("Message.RemovedFromFavorites", void 0, "Removed from Favorites")
                        }), (0, e8.jsx)(dM, {
                            translate: t,
                            onUndo: i,
                            universeId: n,
                            topicId: r,
                            page: o,
                            hiddenReason: s0.RemovedFromFavorites
                        })]
                    })
                },
                dF = function(e) {
                    var t = e.translate,
                        n = e.reason,
                        r = e.universeId,
                        o = e.topicId,
                        i = e.page,
                        a = e.onUndo;
                    return n === s0.RemovedFromFavorites ? (0, e8.jsx)("div", {
                        className: "game-tile-hidden-placeholder",
                        "data-testid": "game-tile-hidden-placeholder",
                        children: (0, e8.jsx)(dj, {
                            translate: t,
                            universeId: r,
                            topicId: o,
                            page: i,
                            onUndo: a
                        })
                    }) : (console.error('GameTileHidden: unsupported reason "'.concat(String(n), '"')), null)
                },
                dH = (0, tl.forwardRef)(function(e, t) {
                    var n, r, o, i, a = e.id,
                        s = e.buildEventProperties,
                        l = e.gameData,
                        u = e.page,
                        c = void 0 === u ? rU.HomePage : u,
                        d = e.className,
                        f = e.friendData,
                        h = void 0 === f ? [] : f,
                        p = e.isOnScreen,
                        v = e.hideTileMetadata,
                        m = void 0 !== v && v,
                        g = e.isSponsoredFooterAllowed,
                        y = void 0 !== g && g,
                        b = e.topicId,
                        w = e.enableRemoveFromFavorites,
                        x = void 0 !== w && w,
                        S = e.onRemoveFromFavorites,
                        E = e.hiddenReason,
                        I = e.onUndoRemoveFromFavorites,
                        T = e.onFavoriteStatusMutationError,
                        C = e.translate,
                        P = e.OverflowMenu,
                        A = ts((0, tl.useState)(), 2),
                        _ = A[0],
                        N = A[1],
                        R = ts(sj(), 3),
                        O = R[0],
                        k = R[1],
                        M = R[2],
                        L = (0, tl.useMemo)(function() {
                            var e, t;
                            return e = h, t = l.universeId, e.filter(function(e) {
                                var n, r;
                                return (null == (n = e.presence) ? void 0 : n.universeId) === t && (null == (r = e.presence) ? void 0 : r.userPresenceType) === rE().PresenceType.Game
                            })
                        }, [h, l.universeId]),
                        D = r6(l, b),
                        B = sF(l.universeId, b, c),
                        j = B.overflowMenuOpen,
                        F = B.sendGameTileOverflowMenuAction,
                        H = B.closeOverflowMenu,
                        U = B.toggleOverflowMenu,
                        z = (n = l.universeId, r = (0, tl.useRef)(Promise.resolve()), o = (0, tl.useRef)(void 0), i = (0, tl.useRef)(0), (0, tt.useMutation)({
                            mutationFn: function(e) {
                                var t = i.current + 1;
                                i.current = t;
                                var a = r.current.catch(function() {}).then(function() {
                                    return nR(function() {
                                        var r;
                                        return nO(this, function(a) {
                                            switch (a.label) {
                                                case 0:
                                                    return a.trys.push([0, 2, , 3]), [4, nR(function() {
                                                        var t;
                                                        return nO(this, function(r) {
                                                            switch (r.label) {
                                                                case 0:
                                                                    return t = {
                                                                        url: "".concat(th().gamesApi, "/v1/games/").concat(n, "/favorites"),
                                                                        withCredentials: !0,
                                                                        headers: {
                                                                            "Content-Type": "application/json"
                                                                        }
                                                                    }, [4, rs.post(t, {
                                                                        isFavorited: e
                                                                    })];
                                                                case 1:
                                                                    return r.sent(), [2]
                                                            }
                                                        })
                                                    })()];
                                                case 1:
                                                    return a.sent(), o.current = e, [3, 3];
                                                case 2:
                                                    throw new sH(a.sent(), null == (r = o.current) || r, i.current !== t);
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()
                                });
                                return r.current = a, a
                            }
                        })).mutateAsync,
                        G = (0, tl.useCallback)(function(e, t) {
                            if (!(0, to._)(e, sH) || !e.hasNewerPendingAction) {
                                var n = (0, to._)(e, sH) ? e.confirmedIsFavorited : !t;
                                null == T || T(n)
                            }
                        }, [T]),
                        V = (0, tl.useCallback)(function() {
                            null == S || S(), z(!1).catch(function(e) {
                                return G(e, !1)
                            })
                        }, [S, z, G]),
                        W = (0, tl.useCallback)(function() {
                            null == I || I(), z(!0).catch(function(e) {
                                return G(e, !0)
                            })
                        }, [I, z, G]),
                        K = (0, tl.useMemo)(function() {
                            return sJ({
                                enableRemoveFromFavorites: x,
                                onRemoveFromFavorites: V
                            })
                        }, [x, V]);
                    return (0, tl.useEffect)(function() {
                        void 0 === _ && L.length > 0 && nR(function() {
                            return nO(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        var t;
                                        return e.trys.push([0, 2, , 3]), [4, (t = l.placeId.toString(), nR(function() {
                                            var e, n;
                                            return nO(this, function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        if (e = sq().getPlaceDetails) return [2, e(t)];
                                                        return [4, sX.getPlaceDetails([t])];
                                                    case 1:
                                                        return [2, (void 0 === (n = r.sent().data) ? [] : n)[0]]
                                                }
                                            })
                                        })())];
                                    case 1:
                                        return N(e.sent()), [3, 3];
                                    case 2:
                                        return console.error(e.sent()), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, [L, _]), (0, e8.jsx)("div", {
                        ref: t,
                        className: void 0 === d ? "grid-item-container game-card-container" : d,
                        "data-testid": "game-tile",
                        onMouseOver: k,
                        onMouseLeave: M,
                        onFocus: k,
                        onBlur: M,
                        children: E ? (0, e8.jsx)(dF, {
                            translate: C,
                            reason: E,
                            universeId: l.universeId,
                            topicId: b,
                            page: c,
                            onUndo: W
                        }) : (0, e8.jsxs)(tu().Fragment, {
                            children: [(0, e8.jsx)(dP, {
                                id: a,
                                isOnScreen: void 0 === p || p,
                                buildEventProperties: s,
                                gameData: l,
                                page: c,
                                isFocused: O,
                                topicId: b,
                                children: function() {
                                    if (m) return (0, e8.jsx)(tu().Fragment, {});
                                    if ((null == l ? void 0 : l.isShowSponsoredLabel) || (null == l ? void 0 : l.isSponsored) && y) return (0, e8.jsx)(dO, {
                                        translate: C
                                    });
                                    var e = oP(D);
                                    if (e) return (0, e8.jsx)(dN, {
                                        footerData: e,
                                        totalUpVotes: l.totalUpVotes,
                                        totalDownVotes: l.totalDownVotes
                                    });
                                    var t = oC(D);
                                    return t ? (0, e8.jsx)(d_, {
                                        footerData: t
                                    }) : L.length > 0 && _ ? (0, e8.jsx)(dD, {
                                        friendData: L,
                                        gameData: _
                                    }) : (null == l ? void 0 : l.friendActivityTitle) ? (0, e8.jsx)(dR, {
                                        footerText: l.friendActivityTitle
                                    }) : (0, e8.jsx)(dA, {
                                        totalUpVotes: l.totalUpVotes,
                                        totalDownVotes: l.totalDownVotes,
                                        playerCount: l.playerCount
                                    })
                                }()
                            }), P && K.length > 0 && (O || j) && (0, e8.jsx)(P, {
                                open: j,
                                menuItemsToShow: K,
                                closeMenu: H,
                                toggleMenu: U,
                                sendActionEvent: F,
                                universeId: l.universeId,
                                topicId: b,
                                page: c,
                                onRemoveFromFavorites: V,
                                translate: C
                            })]
                        })
                    })
                });
            dH.displayName = "GameTileContent";
            var dU = tl.forwardRef(function(e, t) {
                var n = e.children,
                    r = e.width,
                    o = e.height,
                    i = tz(e, ["children", "width", "height"]);
                return (0, e8.jsx)(uB.svg, tb(td({}, i), {
                    ref: t,
                    width: void 0 === r ? 10 : r,
                    height: void 0 === o ? 5 : o,
                    viewBox: "0 0 30 10",
                    preserveAspectRatio: "none",
                    children: e.asChild ? n : (0, e8.jsx)("polygon", {
                        points: "0,0 30,0 15,10"
                    })
                }))
            });
            dU.displayName = "Arrow";
            var dz = "Popper",
                dG = ts(uT(dz), 2),
                dV = dG[0],
                dW = dG[1],
                dK = ts(dV(dz), 2),
                dq = dK[0],
                dX = dK[1],
                dZ = function(e) {
                    var t = e.__scopePopper,
                        n = e.children,
                        r = ts(tl.useState(null), 2),
                        o = r[0],
                        i = r[1];
                    return (0, e8.jsx)(dq, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: i,
                        children: n
                    })
                };
            dZ.displayName = dz;
            var dY = "PopperAnchor",
                d$ = tl.forwardRef(function(e, t) {
                    var n = e.__scopePopper,
                        r = e.virtualRef,
                        o = tz(e, ["__scopePopper", "virtualRef"]),
                        i = dX(dY, n),
                        a = tl.useRef(null),
                        s = s7(t, a);
                    return tl.useEffect(function() {
                        i.onAnchorChange((null == r ? void 0 : r.current) || a.current)
                    }), r ? null : (0, e8.jsx)(uB.div, tb(td({}, o), {
                        ref: s
                    }))
                });
            d$.displayName = dY;
            var dQ = "PopperContent",
                dJ = ts(dV(dQ), 2),
                d0 = dJ[0],
                d1 = dJ[1],
                d2 = tl.forwardRef(function(e, t) {
                    var n, r, i, a, s, l, u, c, d, f, h, p = e.__scopePopper,
                        v = e.side,
                        m = e.sideOffset,
                        g = e.align,
                        y = void 0 === g ? "center" : g,
                        b = e.alignOffset,
                        w = e.arrowPadding,
                        x = e.avoidCollisions,
                        S = void 0 === x || x,
                        E = e.collisionBoundary,
                        I = void 0 === E ? [] : E,
                        T = e.collisionPadding,
                        C = void 0 === T ? 0 : T,
                        P = e.sticky,
                        A = e.hideWhenDetached,
                        _ = e.updatePositionStrategy,
                        N = void 0 === _ ? "optimized" : _,
                        R = e.onPlaced,
                        O = tz(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        k = dX(dQ, p),
                        M = ts(tl.useState(null), 2),
                        L = M[0],
                        D = M[1],
                        B = s7(t, function(e) {
                            return D(e)
                        }),
                        j = ts(tl.useState(null), 2),
                        F = j[0],
                        H = j[1],
                        U = (r = (n = ts(tl.useState(void 0), 2))[0], i = n[1], uP(function() {
                            if (F) {
                                i({
                                    width: F.offsetWidth,
                                    height: F.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, n, r = e[0];
                                        if ("borderBoxSize" in r) {
                                            var o = r.borderBoxSize,
                                                a = Array.isArray(o) ? o[0] : o;
                                            t = a.inlineSize, n = a.blockSize
                                        } else t = F.offsetWidth, n = F.offsetHeight;
                                        i({
                                            width: t,
                                            height: n
                                        })
                                    }
                                });
                                return e.observe(F, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(F)
                                    }
                            }
                            i(void 0)
                        }, [F]), r),
                        z = null != (a = null == U ? void 0 : U.width) ? a : 0,
                        G = null != (s = null == U ? void 0 : U.height) ? s : 0,
                        V = "number" == typeof C ? C : td({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, C),
                        W = Array.isArray(I) ? I : [I],
                        K = W.length > 0,
                        q = {
                            padding: V,
                            boundary: W.filter(d6),
                            altBoundary: K
                        },
                        X = au({
                            strategy: "fixed",
                            placement: (void 0 === v ? "bottom" : v) + ("center" !== y ? "-" + y : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return i7.apply(void 0, o(t).concat([{
                                    animationFrame: "always" === N
                                }]))
                            },
                            elements: {
                                reference: k.anchor
                            },
                            middleware: [ac({
                                mainAxis: (void 0 === m ? 0 : m) + G,
                                alignmentAxis: void 0 === b ? 0 : b
                            }), S && ad(td({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === P ? "partial" : P) ? af() : void 0
                            }, q)), S && ah(td({}, q)), ap(tb(td({}, q), {
                                apply: function(e) {
                                    var t = e.elements,
                                        n = e.rects,
                                        r = e.availableWidth,
                                        o = e.availableHeight,
                                        i = n.reference,
                                        a = i.width,
                                        s = i.height,
                                        l = t.floating.style;
                                    l.setProperty("--radix-popper-available-width", "".concat(r, "px")), l.setProperty("--radix-popper-available-height", "".concat(o, "px")), l.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), l.setProperty("--radix-popper-anchor-height", "".concat(s, "px"))
                                }
                            })), F && am({
                                element: F,
                                padding: void 0 === w ? 0 : w
                            }), d8({
                                arrowWidth: z,
                                arrowHeight: G
                            }), void 0 !== A && A && av(td({
                                strategy: "referenceHidden"
                            }, q))]
                        }),
                        Z = X.refs,
                        Y = X.floatingStyles,
                        $ = X.placement,
                        Q = X.isPositioned,
                        J = X.middlewareData,
                        ee = ts(d9($), 2),
                        et = ee[0],
                        en = ee[1],
                        er = uR(R);
                    uP(function() {
                        Q && (null == er || er())
                    }, [Q, er]);
                    var eo = null == (l = J.arrow) ? void 0 : l.x,
                        ei = null == (u = J.arrow) ? void 0 : u.y,
                        ea = (null == (c = J.arrow) ? void 0 : c.centerOffset) !== 0,
                        es = ts(tl.useState(), 2),
                        el = es[0],
                        eu = es[1];
                    return uP(function() {
                        L && eu(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, e8.jsx)("div", {
                        ref: Z.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: td(tb(td({}, Y), tc({
                            transform: Q ? Y.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: el
                        }, "--radix-popper-transform-origin", [null == (d = J.transformOrigin) ? void 0 : d.x, null == (f = J.transformOrigin) ? void 0 : f.y].join(" "))), (null == (h = J.hide) ? void 0 : h.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, e8.jsx)(d0, {
                            scope: p,
                            placedSide: et,
                            onArrowChange: H,
                            arrowX: eo,
                            arrowY: ei,
                            shouldHideArrow: ea,
                            children: (0, e8.jsx)(uB.div, tb(td({
                                "data-side": et,
                                "data-align": en
                            }, O), {
                                ref: B,
                                style: tb(td({}, O.style), {
                                    animation: Q ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            d2.displayName = dQ;
            var d5 = "PopperArrow",
                d3 = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                d4 = tl.forwardRef(function(e, t) {
                    var n, r = e.__scopePopper,
                        o = tz(e, ["__scopePopper"]),
                        i = d1(d5, r),
                        a = d3[i.placedSide];
                    return (0, e8.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (tc(n = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, a, 0), tc(n, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), tc(n, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), tc(n, "visibility", i.shouldHideArrow ? "hidden" : void 0), n),
                        children: (0, e8.jsx)(dU, tb(td({}, o), {
                            ref: t,
                            style: tb(td({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function d6(e) {
                return null !== e
            }
            d4.displayName = d5;
            var d8 = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var n, r, o, i, a, s = t.placement,
                            l = t.rects,
                            u = t.middlewareData,
                            c = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0,
                            d = c ? 0 : e.arrowWidth,
                            f = c ? 0 : e.arrowHeight,
                            h = ts(d9(s), 2),
                            p = h[0],
                            v = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [h[1]],
                            m = (null != (n = null == (i = u.arrow) ? void 0 : i.x) ? n : 0) + d / 2,
                            g = (null != (r = null == (a = u.arrow) ? void 0 : a.y) ? r : 0) + f / 2,
                            y = "",
                            b = "";
                        return "bottom" === p ? (y = c ? v : "".concat(m, "px"), b = "".concat(-f, "px")) : "top" === p ? (y = c ? v : "".concat(m, "px"), b = "".concat(l.floating.height + f, "px")) : "right" === p ? (y = "".concat(-f, "px"), b = c ? v : "".concat(g, "px")) : "left" === p && (y = "".concat(l.floating.width + f, "px"), b = c ? v : "".concat(g, "px")), {
                            data: {
                                x: y,
                                y: b
                            }
                        }
                    }
                }
            };

            function d9(e) {
                var t = ts(e.split("-"), 2),
                    n = t[0],
                    r = t[1];
                return [n, void 0 === r ? "center" : r]
            }
            var d7 = "Popover",
                fe = ts(uT(d7, [dW]), 2),
                ft = fe[0];
            fe[1];
            var fn = dW(),
                fr = ts(ft(d7), 2),
                fo = fr[0],
                fi = fr[1],
                fa = function(e) {
                    var t = e.__scopePopover,
                        n = e.children,
                        r = e.open,
                        o = e.defaultOpen,
                        i = e.onOpenChange,
                        a = e.modal,
                        s = fn(t),
                        l = tl.useRef(null),
                        u = ts(tl.useState(!1), 2),
                        c = u[0],
                        d = u[1],
                        f = ts(uO({
                            prop: r,
                            defaultProp: o,
                            onChange: i
                        }), 2),
                        h = f[0],
                        p = f[1];
                    return (0, e8.jsx)(dZ, tb(td({}, s), {
                        children: (0, e8.jsx)(fo, {
                            scope: t,
                            contentId: uN(),
                            triggerRef: l,
                            open: void 0 !== h && h,
                            onOpenChange: p,
                            onOpenToggle: tl.useCallback(function() {
                                return p(function(e) {
                                    return !e
                                })
                            }, [p]),
                            hasCustomAnchor: c,
                            onCustomAnchorAdd: tl.useCallback(function() {
                                return d(!0)
                            }, []),
                            onCustomAnchorRemove: tl.useCallback(function() {
                                return d(!1)
                            }, []),
                            modal: void 0 !== a && a,
                            children: n
                        })
                    }))
                };
            fa.displayName = d7;
            var fs = "PopoverAnchor";
            tl.forwardRef(function(e, t) {
                var n = e.__scopePopover,
                    r = tz(e, ["__scopePopover"]),
                    o = fi(fs, n),
                    i = fn(n),
                    a = o.onCustomAnchorAdd,
                    s = o.onCustomAnchorRemove;
                return tl.useEffect(function() {
                    return a(),
                        function() {
                            return s()
                        }
                }, [a, s]), (0, e8.jsx)(d$, tb(td({}, i, r), {
                    ref: t
                }))
            }).displayName = fs;
            var fl = "PopoverTrigger",
                fu = tl.forwardRef(function(e, t) {
                    var n = e.__scopePopover,
                        r = tz(e, ["__scopePopover"]),
                        o = fi(fl, n),
                        i = fn(n),
                        a = s7(t, o.triggerRef),
                        s = (0, e8.jsx)(uB.button, tb(td({
                            type: "button",
                            "aria-haspopup": "dialog",
                            "aria-expanded": o.open,
                            "aria-controls": o.contentId,
                            "data-state": fS(o.open)
                        }, r), {
                            ref: a,
                            onClick: uI(e.onClick, o.onOpenToggle)
                        }));
                    return o.hasCustomAnchor ? s : (0, e8.jsx)(d$, tb(td({
                        asChild: !0
                    }, i), {
                        children: s
                    }))
                });
            fu.displayName = fl;
            var fc = "PopoverPortal",
                fd = ts(ft(fc, {
                    forceMount: void 0
                }), 2),
                ff = fd[0],
                fh = fd[1],
                fp = function(e) {
                    var t = e.__scopePopover,
                        n = e.forceMount,
                        r = e.children,
                        o = e.container,
                        i = fi(fc, t);
                    return (0, e8.jsx)(ff, {
                        scope: t,
                        forceMount: n,
                        children: (0, e8.jsx)(uF, {
                            present: n || i.open,
                            children: (0, e8.jsx)(uj, {
                                asChild: !0,
                                container: o,
                                children: r
                            })
                        })
                    })
                };
            fp.displayName = fc;
            var fv = "PopoverContent",
                fm = tl.forwardRef(function(e, t) {
                    var n = fh(fv, e.__scopePopover),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        i = tz(e, ["forceMount"]),
                        a = fi(fv, e.__scopePopover);
                    return (0, e8.jsx)(uF, {
                        present: o || a.open,
                        children: a.modal ? (0, e8.jsx)(fy, tb(td({}, i), {
                            ref: t
                        })) : (0, e8.jsx)(fb, tb(td({}, i), {
                            ref: t
                        }))
                    })
                });
            fm.displayName = fv;
            var fg = uM("PopoverContent.RemoveScroll"),
                fy = tl.forwardRef(function(e, t) {
                    var n = fi(fv, e.__scopePopover),
                        r = tl.useRef(null),
                        o = s7(t, r),
                        i = tl.useRef(!1);
                    return tl.useEffect(function() {
                        var e = r.current;
                        if (e) return cE(e)
                    }, []), (0, e8.jsx)(cm, {
                        as: fg,
                        allowPinchZoom: !0,
                        children: (0, e8.jsx)(fw, tb(td({}, e), {
                            ref: o,
                            trapFocus: n.open,
                            disableOutsidePointerEvents: !0,
                            onCloseAutoFocus: uI(e.onCloseAutoFocus, function(e) {
                                var t;
                                e.preventDefault(), i.current || null == (t = n.triggerRef.current) || t.focus()
                            }),
                            onPointerDownOutside: uI(e.onPointerDownOutside, function(e) {
                                var t = e.detail.originalEvent,
                                    n = 0 === t.button && !0 === t.ctrlKey;
                                i.current = 2 === t.button || n
                            }, {
                                checkForDefaultPrevented: !1
                            }),
                            onFocusOutside: uI(e.onFocusOutside, function(e) {
                                return e.preventDefault()
                            }, {
                                checkForDefaultPrevented: !1
                            })
                        }))
                    })
                }),
                fb = tl.forwardRef(function(e, t) {
                    var n = fi(fv, e.__scopePopover),
                        r = tl.useRef(!1),
                        o = tl.useRef(!1);
                    return (0, e8.jsx)(fw, tb(td({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, a;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (r.current || null == (a = n.triggerRef.current) || a.focus(), t.preventDefault()), r.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var i, a, s = t.target;
                            (null == (a = n.triggerRef.current) ? void 0 : a.contains(s)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                fw = tl.forwardRef(function(e, t) {
                    var n = e.__scopePopover,
                        r = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = e.disableOutsidePointerEvents,
                        s = e.onEscapeKeyDown,
                        l = e.onPointerDownOutside,
                        u = e.onFocusOutside,
                        c = e.onInteractOutside,
                        d = tz(e, ["__scopePopover", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus", "disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside"]),
                        f = fi(fv, n),
                        h = fn(n);
                    return (0, uU.useFocusGuards)(), (0, e8.jsx)(uk.FocusScope, {
                        asChild: !0,
                        loop: !0,
                        trapped: r,
                        onMountAutoFocus: o,
                        onUnmountAutoFocus: i,
                        children: (0, e8.jsx)(oQ.DismissableLayer, {
                            asChild: !0,
                            disableOutsidePointerEvents: a,
                            onInteractOutside: c,
                            onEscapeKeyDown: s,
                            onPointerDownOutside: l,
                            onFocusOutside: u,
                            onDismiss: function() {
                                return f.onOpenChange(!1)
                            },
                            children: (0, e8.jsx)(d2, tb(td({
                                "data-state": fS(f.open),
                                role: "dialog",
                                id: f.contentId
                            }, h, d), {
                                ref: t,
                                style: td({}, d.style, {
                                    "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                                    "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                                    "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                                    "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                                    "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                                })
                            }))
                        })
                    })
                }),
                fx = "PopoverClose";

            function fS(e) {
                return e ? "open" : "closed"
            }
            tl.forwardRef(function(e, t) {
                var n = e.__scopePopover,
                    r = tz(e, ["__scopePopover"]),
                    o = fi(fx, n);
                return (0, e8.jsx)(uB.button, tb(td({
                    type: "button"
                }, r), {
                    ref: t,
                    onClick: uI(e.onClick, function() {
                        return o.onOpenChange(!1)
                    })
                }))
            }).displayName = fx, tl.forwardRef(function(e, t) {
                var n = e.__scopePopover,
                    r = tz(e, ["__scopePopover"]),
                    o = fn(n);
                return (0, e8.jsx)(d4, tb(td({}, o, r), {
                    ref: t
                }))
            }).displayName = "PopoverArrow";
            var fE = function(e) {
                var t, n, r, o, i, a, s = null != (t = null == (r = (o = window).matchMedia) || null == (n = r.call(o, "(pointer: coarse)")) ? void 0 : n.matches) && t,
                    l = null == (i = document.activeElement) ? void 0 : i.matches(":focus-visible");
                if (s && !l) return void e.preventDefault();
                var u = null == (a = e.currentTarget) ? void 0 : a.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
                u && (e.preventDefault(), u.focus())
            };

            function fI(e) {
                var t = e.open,
                    n = e.defaultOpen,
                    r = e.onOpenChange,
                    o = e.children;
                return tl.createElement(fa, {
                    open: t,
                    defaultOpen: n,
                    onOpenChange: r
                }, o)
            }

            function fT(e) {
                var t = e.asChild,
                    n = e.disabled,
                    r = e.className,
                    o = e.children;
                return tl.createElement(fu, {
                    asChild: t,
                    disabled: n,
                    className: r
                }, o)
            }

            function fC(e) {
                var t = e.side,
                    n = e.align,
                    r = e.sideOffset,
                    o = e.className,
                    i = e.children,
                    a = e.ariaLabel,
                    s = e.onOpenAutoFocus,
                    l = tz(e, ["side", "align", "sideOffset", "className", "children", "ariaLabel", "onOpenAutoFocus"]);
                return tl.createElement(fp, null, tl.createElement(fm, tb(td({
                    side: void 0 === t ? "bottom" : t,
                    align: void 0 === n ? "center" : n,
                    sideOffset: void 0 === r ? 4 : r
                }, l), {
                    "aria-label": null != a ? a : l["aria-label"],
                    onOpenAutoFocus: null != s ? s : fE,
                    className: oV("foundation-web-portal-zindex", o)
                }), i))
            }
            var fP = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                fA = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                f_ = {
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
                fN = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                fR = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                fO = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                fk = {
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
                fM = {
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
                fL = (0, tl.forwardRef)(function(e, t) {
                    var n, r = tW([e, t]),
                        o = r[0],
                        i = r.slice(1),
                        a = o.className,
                        s = o.icon,
                        l = o.ariaLabel,
                        u = o.isDisabled,
                        c = void 0 !== u && u,
                        d = o.isCircular,
                        f = o.isSelected,
                        h = o.size,
                        p = void 0 === h ? "Large" : h,
                        v = o.variant,
                        m = void 0 === v ? "Emphasis" : v,
                        g = o.iconColor,
                        y = void 0 === g ? "Default" : g,
                        b = o.asChild,
                        w = o.children,
                        x = tz(o, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        S = ts(i, 1)[0];
                    n = c ? fR[m] : void 0 !== f && f ? fO[m] : fN[m];
                    var E = oV("foundation-web-icon-button", c ? s5 : [s1, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", fP[p], f_[p][void 0 !== d && d ? "circular" : "square"], n, a),
                        I = tu().createElement(tu().Fragment, null, tu().createElement(s2, null), tu().createElement("span", {
                            className: oV("icon", s, fA[p], c ? fM[y][m] : fk[y][m])
                        }));
                    if (b) {
                        x.as;
                        var T = tz(x, ["as"]),
                            C = tu().Children.only(w);
                        return tu().createElement(lr, tb(td({
                            ref: S
                        }, T), {
                            className: E,
                            "aria-label": l,
                            "aria-disabled": c || void 0
                        }), tu().cloneElement(C, {}, I))
                    }
                    if ("a" === x.as) {
                        x.as;
                        var P = x.href,
                            A = tz(x, ["as", "href"]);
                        return tu().createElement("a", tb(td({
                            ref: S
                        }, A), {
                            "aria-label": l,
                            "aria-disabled": c,
                            href: c ? void 0 : P,
                            className: E
                        }), I)
                    }
                    x.as;
                    var _ = tz(x, ["as"]);
                    return tu().createElement("button", tb(td({
                        ref: S,
                        type: "button"
                    }, _), {
                        "aria-label": l,
                        disabled: c,
                        className: E
                    }), I)
                }),
                fD = 0,
                fB = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, tl.useRef)();
                    return t.current || (fD += 1, t.current = "".concat(e).concat(fD)), t.current
                },
                fj = function(e) {
                    var t = e.title,
                        n = e.description,
                        r = e.position;
                    return tu().createElement(sv, {
                        position: void 0 === r ? "top-center" : r,
                        title: t,
                        description: n
                    }, tu().createElement(sm, {
                        asChild: !0
                    }, tu().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, tu().createElement(s6, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                fF = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                fH = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function fU(e, t) {
                var n = ts(t, 2),
                    r = n[0];
                return Math.min(n[1], Math.max(r, e))
            }
            var fz = tl.createContext(void 0);

            function fG(e) {
                var t = tl.useContext(fz);
                return e || t || "ltr"
            }
            var fV = tl.forwardRef(function(e, t) {
                return (0, e8.jsx)(uB.span, tb(td({}, e), {
                    ref: t,
                    style: td({
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
                    }, e.style)
                }))
            });
            fV.displayName = "VisuallyHidden";
            var fW = [" ", "Enter", "ArrowUp", "ArrowDown"],
                fK = [" ", "Enter"],
                fq = "Select",
                fX = ts((eh = (ef = ts(uT(ed = fq + "CollectionProvider"), 2))[0], ep = ef[1], em = (ev = ts(eh(ed, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], eg = ev[1], (ey = function(e) {
                    var t = e.scope,
                        n = e.children,
                        r = tu().useRef(null),
                        o = tu().useRef(new Map).current;
                    return (0, e8.jsx)(em, {
                        scope: t,
                        itemMap: o,
                        collectionRef: r,
                        children: n
                    })
                }).displayName = ed, ew = uM(eb = fq + "CollectionSlot"), (ex = tu().forwardRef(function(e, t) {
                    var n = e.scope,
                        r = e.children,
                        o = s7(t, eg(eb, n).collectionRef);
                    return (0, e8.jsx)(ew, {
                        ref: o,
                        children: r
                    })
                })).displayName = eb, eE = "data-radix-collection-item", eI = uM(eS = fq + "CollectionItemSlot"), (eT = tu().forwardRef(function(e, t) {
                    var n = e.scope,
                        r = e.children,
                        o = tz(e, ["scope", "children"]),
                        i = tu().useRef(null),
                        a = s7(t, i),
                        s = eg(eS, n);
                    return tu().useEffect(function() {
                        return s.itemMap.set(i, td({
                                ref: i
                            }, o)),
                            function() {
                                s.itemMap.delete(i)
                            }
                    }), (0, e8.jsx)(eI, tb(td({}, tc({}, eE, "")), {
                        ref: a,
                        children: r
                    }))
                })).displayName = eS, [{
                    Provider: ey,
                    Slot: ex,
                    ItemSlot: eT
                }, function(e) {
                    var t = eg(fq + "CollectionConsumer", e);
                    return tu().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var n = Array.from(e.querySelectorAll("[".concat(eE, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return n.indexOf(e.ref.current) - n.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, ep]), 3),
                fZ = fX[0],
                fY = fX[1],
                f$ = ts(uT(fq, [fX[2], dW]), 2),
                fQ = f$[0];
            f$[1];
            var fJ = dW(),
                f0 = ts(fQ(fq), 2),
                f1 = f0[0],
                f2 = f0[1],
                f5 = ts(fQ(fq), 2),
                f3 = f5[0],
                f4 = f5[1],
                f6 = function(e) {
                    var t = e.__scopeSelect,
                        n = e.children,
                        r = e.open,
                        o = e.defaultOpen,
                        i = e.onOpenChange,
                        a = e.value,
                        s = e.defaultValue,
                        l = e.onValueChange,
                        u = e.dir,
                        c = e.name,
                        d = e.autoComplete,
                        f = e.disabled,
                        h = e.required,
                        p = e.form,
                        v = fJ(t),
                        m = ts(tl.useState(null), 2),
                        g = m[0],
                        y = m[1],
                        b = ts(tl.useState(null), 2),
                        w = b[0],
                        x = b[1],
                        S = ts(tl.useState(!1), 2),
                        E = S[0],
                        I = S[1],
                        T = fG(u),
                        C = ts(uO({
                            prop: r,
                            defaultProp: o,
                            onChange: i
                        }), 2),
                        P = C[0],
                        A = C[1],
                        _ = ts(uO({
                            prop: a,
                            defaultProp: s,
                            onChange: l
                        }), 2),
                        N = _[0],
                        R = _[1],
                        O = tl.useRef(null),
                        k = !g || p || !!g.closest("form"),
                        M = ts(tl.useState(new Set), 2),
                        L = M[0],
                        D = M[1],
                        B = Array.from(L).map(function(e) {
                            return e.props.value
                        }).join(";");
                    return (0, e8.jsx)(dZ, tb(td({}, v), {
                        children: (0, e8.jsxs)(f1, {
                            required: h,
                            scope: t,
                            trigger: g,
                            onTriggerChange: y,
                            valueNode: w,
                            onValueNodeChange: x,
                            valueNodeHasChildren: E,
                            onValueNodeHasChildrenChange: I,
                            contentId: uN(),
                            value: N,
                            onValueChange: R,
                            open: void 0 !== P && P,
                            onOpenChange: A,
                            dir: T,
                            triggerPointerDownPosRef: O,
                            disabled: f,
                            children: [(0, e8.jsx)(fZ.Provider, {
                                scope: t,
                                children: (0, e8.jsx)(f3, {
                                    scope: e.__scopeSelect,
                                    onNativeOptionAdd: tl.useCallback(function(e) {
                                        D(function(t) {
                                            return new Set(t).add(e)
                                        })
                                    }, []),
                                    onNativeOptionRemove: tl.useCallback(function(e) {
                                        D(function(t) {
                                            var n = new Set(t);
                                            return n.delete(e), n
                                        })
                                    }, []),
                                    children: n
                                })
                            }), k ? (0, e8.jsxs)(hL, {
                                "aria-hidden": !0,
                                required: h,
                                tabIndex: -1,
                                name: c,
                                autoComplete: d,
                                value: N,
                                onChange: function(e) {
                                    return R(e.target.value)
                                },
                                disabled: f,
                                form: p,
                                children: [void 0 === N ? (0, e8.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(L)]
                            }, B) : null]
                        })
                    }))
                };
            f6.displayName = fq;
            var f8 = "SelectTrigger",
                f9 = tl.forwardRef(function(e, t) {
                    var n = e.__scopeSelect,
                        r = e.disabled,
                        o = tz(e, ["__scopeSelect", "disabled"]),
                        i = fJ(n),
                        a = f2(f8, n),
                        s = a.disabled || void 0 !== r && r,
                        l = s7(t, a.onTriggerChange),
                        u = fY(n),
                        c = tl.useRef("touch"),
                        d = ts(hD(function(e) {
                            var t = u().filter(function(e) {
                                    return !e.disabled
                                }),
                                n = t.find(function(e) {
                                    return e.value === a.value
                                }),
                                r = hB(t, e, n);
                            void 0 !== r && a.onValueChange(r.value)
                        }), 3),
                        f = d[0],
                        h = d[1],
                        p = d[2],
                        v = function(e) {
                            s || (a.onOpenChange(!0), p()), e && (a.triggerPointerDownPosRef.current = {
                                x: Math.round(e.pageX),
                                y: Math.round(e.pageY)
                            })
                        };
                    return (0, e8.jsx)(d$, tb(td({
                        asChild: !0
                    }, i), {
                        children: (0, e8.jsx)(uB.button, tb(td({
                            type: "button",
                            role: "combobox",
                            "aria-controls": a.contentId,
                            "aria-expanded": a.open,
                            "aria-required": a.required,
                            "aria-autocomplete": "none",
                            dir: a.dir,
                            "data-state": a.open ? "open" : "closed",
                            disabled: s,
                            "data-disabled": s ? "" : void 0,
                            "data-placeholder": hM(a.value) ? "" : void 0
                        }, o), {
                            ref: l,
                            onClick: uI(o.onClick, function(e) {
                                e.currentTarget.focus(), "mouse" !== c.current && v(e)
                            }),
                            onPointerDown: uI(o.onPointerDown, function(e) {
                                c.current = e.pointerType;
                                var t = e.target;
                                t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (v(e), e.preventDefault())
                            }),
                            onKeyDown: uI(o.onKeyDown, function(e) {
                                var t = "" !== f.current;
                                e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || h(e.key), (!t || " " !== e.key) && fW.includes(e.key) && (v(), e.preventDefault())
                            })
                        }))
                    }))
                });
            f9.displayName = f8;
            var f7 = "SelectValue",
                he = tl.forwardRef(function(e, t) {
                    var n = e.__scopeSelect,
                        r = (e.className, e.style, e.children),
                        o = e.placeholder,
                        i = tz(e, ["__scopeSelect", "className", "style", "children", "placeholder"]),
                        a = f2(f7, n),
                        s = a.onValueNodeHasChildrenChange,
                        l = void 0 !== r,
                        u = s7(t, a.onValueNodeChange);
                    return uP(function() {
                        s(l)
                    }, [s, l]), (0, e8.jsx)(uB.span, tb(td({}, i), {
                        ref: u,
                        style: {
                            pointerEvents: "none"
                        },
                        children: hM(a.value) ? (0, e8.jsx)(e8.Fragment, {
                            children: void 0 === o ? "" : o
                        }) : r
                    }))
                });
            he.displayName = f7;
            var ht = tl.forwardRef(function(e, t) {
                e.__scopeSelect;
                var n = e.children,
                    r = tz(e, ["__scopeSelect", "children"]);
                return (0, e8.jsx)(uB.span, tb(td({
                    "aria-hidden": !0
                }, r), {
                    ref: t,
                    children: n || "▼"
                }))
            });
            ht.displayName = "SelectIcon";
            var hn = function(e) {
                return (0, e8.jsx)(uj, td({
                    asChild: !0
                }, e))
            };
            hn.displayName = "SelectPortal";
            var hr = "SelectContent",
                ho = tl.forwardRef(function(e, t) {
                    var n = f2(hr, e.__scopeSelect),
                        r = ts(tl.useState(), 2),
                        o = r[0],
                        i = r[1];
                    return (uP(function() {
                        i(new DocumentFragment)
                    }, []), n.open) ? (0, e8.jsx)(hu, tb(td({}, e), {
                        ref: t
                    })) : o ? an.createPortal((0, e8.jsx)(ha, {
                        scope: e.__scopeSelect,
                        children: (0, e8.jsx)(fZ.Slot, {
                            scope: e.__scopeSelect,
                            children: (0, e8.jsx)("div", {
                                children: e.children
                            })
                        })
                    }), o) : null
                });
            ho.displayName = hr;
            var hi = ts(fQ(hr), 2),
                ha = hi[0],
                hs = hi[1],
                hl = uM("SelectContent.RemoveScroll"),
                hu = tl.forwardRef(function(e, t) {
                    var n = e.__scopeSelect,
                        r = e.position,
                        o = void 0 === r ? "item-aligned" : r,
                        i = e.onCloseAutoFocus,
                        a = e.onEscapeKeyDown,
                        s = e.onPointerDownOutside,
                        l = e.side,
                        u = e.sideOffset,
                        c = e.align,
                        d = e.alignOffset,
                        f = e.arrowPadding,
                        h = e.collisionBoundary,
                        p = e.collisionPadding,
                        v = e.sticky,
                        m = e.hideWhenDetached,
                        g = e.avoidCollisions,
                        y = tz(e, ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"]),
                        b = f2(hr, n),
                        w = ts(tl.useState(null), 2),
                        x = w[0],
                        S = w[1],
                        E = ts(tl.useState(null), 2),
                        I = E[0],
                        T = E[1],
                        C = s7(t, function(e) {
                            return S(e)
                        }),
                        P = ts(tl.useState(null), 2),
                        A = P[0],
                        _ = P[1],
                        N = ts(tl.useState(null), 2),
                        R = N[0],
                        O = N[1],
                        k = fY(n),
                        M = ts(tl.useState(!1), 2),
                        L = M[0],
                        D = M[1],
                        B = tl.useRef(!1);
                    tl.useEffect(function() {
                        if (x) return cE(x)
                    }, [x]), (0, uU.useFocusGuards)();
                    var j = tl.useCallback(function(e) {
                            var t = tW(k().map(function(e) {
                                    return e.ref.current
                                })),
                                n = t[0],
                                r = ts(t.slice(1).slice(-1), 1)[0],
                                o = document.activeElement,
                                i = !0,
                                a = !1,
                                s = void 0;
                            try {
                                for (var l, u = e[Symbol.iterator](); !(i = (l = u.next()).done); i = !0) {
                                    var c = l.value;
                                    if (c === o || (null == c || c.scrollIntoView({
                                            block: "nearest"
                                        }), c === n && I && (I.scrollTop = 0), c === r && I && (I.scrollTop = I.scrollHeight), null == c || c.focus(), document.activeElement !== o)) return
                                }
                            } catch (e) {
                                a = !0, s = e
                            } finally {
                                try {
                                    i || null == u.return || u.return()
                                } finally {
                                    if (a) throw s
                                }
                            }
                        }, [k, I]),
                        F = tl.useCallback(function() {
                            return j([A, x])
                        }, [j, A, x]);
                    tl.useEffect(function() {
                        L && F()
                    }, [L, F]);
                    var H = b.onOpenChange,
                        U = b.triggerPointerDownPosRef;
                    tl.useEffect(function() {
                        if (x) {
                            var e = {
                                    x: 0,
                                    y: 0
                                },
                                t = function(t) {
                                    var n, r, o, i;
                                    e = {
                                        x: Math.abs(Math.round(t.pageX) - (null != (n = null == (o = U.current) ? void 0 : o.x) ? n : 0)),
                                        y: Math.abs(Math.round(t.pageY) - (null != (r = null == (i = U.current) ? void 0 : i.y) ? r : 0))
                                    }
                                },
                                n = function(n) {
                                    e.x <= 10 && e.y <= 10 ? n.preventDefault() : x.contains(n.target) || H(!1), document.removeEventListener("pointermove", t), U.current = null
                                };
                            return null !== U.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", n, {
                                    capture: !0,
                                    once: !0
                                })),
                                function() {
                                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", n, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [x, H, U]), tl.useEffect(function() {
                        var e = function() {
                            return H(!1)
                        };
                        return window.addEventListener("blur", e), window.addEventListener("resize", e),
                            function() {
                                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
                            }
                    }, [H]);
                    var z = ts(hD(function(e) {
                            var t = k().filter(function(e) {
                                    return !e.disabled
                                }),
                                n = t.find(function(e) {
                                    return e.ref.current === document.activeElement
                                }),
                                r = hB(t, e, n);
                            r && setTimeout(function() {
                                return r.ref.current.focus()
                            })
                        }), 2),
                        G = z[0],
                        V = z[1],
                        W = tl.useCallback(function(e, t, n) {
                            var r = !B.current && !n;
                            (void 0 !== b.value && b.value === t || r) && (_(e), r && (B.current = !0))
                        }, [b.value]),
                        K = tl.useCallback(function() {
                            return null == x ? void 0 : x.focus()
                        }, [x]),
                        q = tl.useCallback(function(e, t, n) {
                            var r = !B.current && !n;
                            (void 0 !== b.value && b.value === t || r) && O(e)
                        }, [b.value]),
                        X = "popper" === o ? hd : hc,
                        Z = X === hd ? {
                            side: l,
                            sideOffset: u,
                            align: c,
                            alignOffset: d,
                            arrowPadding: f,
                            collisionBoundary: h,
                            collisionPadding: p,
                            sticky: v,
                            hideWhenDetached: m,
                            avoidCollisions: g
                        } : {};
                    return (0, e8.jsx)(ha, {
                        scope: n,
                        content: x,
                        viewport: I,
                        onViewportChange: T,
                        itemRefCallback: W,
                        selectedItem: A,
                        onItemLeave: K,
                        itemTextRefCallback: q,
                        focusSelectedItem: F,
                        selectedItemText: R,
                        position: o,
                        isPositioned: L,
                        searchRef: G,
                        children: (0, e8.jsx)(cm, {
                            as: hl,
                            allowPinchZoom: !0,
                            children: (0, e8.jsx)(uk.FocusScope, {
                                asChild: !0,
                                trapped: b.open,
                                onMountAutoFocus: function(e) {
                                    e.preventDefault()
                                },
                                onUnmountAutoFocus: uI(i, function(e) {
                                    var t;
                                    null == (t = b.trigger) || t.focus({
                                        preventScroll: !0
                                    }), e.preventDefault()
                                }),
                                children: (0, e8.jsx)(oQ.DismissableLayer, {
                                    asChild: !0,
                                    disableOutsidePointerEvents: !0,
                                    onEscapeKeyDown: a,
                                    onPointerDownOutside: s,
                                    onFocusOutside: function(e) {
                                        return e.preventDefault()
                                    },
                                    onDismiss: function() {
                                        return b.onOpenChange(!1)
                                    },
                                    children: (0, e8.jsx)(X, tb(td({
                                        role: "listbox",
                                        id: b.contentId,
                                        "data-state": b.open ? "open" : "closed",
                                        dir: b.dir,
                                        onContextMenu: function(e) {
                                            return e.preventDefault()
                                        }
                                    }, y, Z), {
                                        onPlaced: function() {
                                            return D(!0)
                                        },
                                        ref: C,
                                        style: td({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, y.style),
                                        onKeyDown: uI(y.onKeyDown, function(e) {
                                            var t = e.ctrlKey || e.altKey || e.metaKey;
                                            if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || V(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                                var n = k().filter(function(e) {
                                                    return !e.disabled
                                                }).map(function(e) {
                                                    return e.ref.current
                                                });
                                                if (["ArrowUp", "End"].includes(e.key) && (n = n.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                                    var r = e.target,
                                                        o = n.indexOf(r);
                                                    n = n.slice(o + 1)
                                                }
                                                setTimeout(function() {
                                                    return j(n)
                                                }), e.preventDefault()
                                            }
                                        })
                                    }))
                                })
                            })
                        })
                    })
                });
            hu.displayName = "SelectContentImpl";
            var hc = tl.forwardRef(function(e, t) {
                var n = e.__scopeSelect,
                    r = e.onPlaced,
                    o = tz(e, ["__scopeSelect", "onPlaced"]),
                    i = f2(hr, n),
                    a = hs(hr, n),
                    s = ts(tl.useState(null), 2),
                    l = s[0],
                    u = s[1],
                    c = ts(tl.useState(null), 2),
                    d = c[0],
                    f = c[1],
                    h = s7(t, function(e) {
                        return f(e)
                    }),
                    p = fY(n),
                    v = tl.useRef(!1),
                    m = tl.useRef(!0),
                    g = a.viewport,
                    y = a.selectedItem,
                    b = a.selectedItemText,
                    w = a.focusSelectedItem,
                    x = tl.useCallback(function() {
                        if (i.trigger && i.valueNode && l && d && g && y && b) {
                            var e = i.trigger.getBoundingClientRect(),
                                t = d.getBoundingClientRect(),
                                n = i.valueNode.getBoundingClientRect(),
                                o = b.getBoundingClientRect();
                            if ("rtl" !== i.dir) {
                                var a = o.left - t.left,
                                    s = n.left - a,
                                    u = e.left - s,
                                    c = e.width + u,
                                    f = Math.max(c, t.width),
                                    h = fU(s, [10, Math.max(10, window.innerWidth - 10 - f)]);
                                l.style.minWidth = c + "px", l.style.left = h + "px"
                            } else {
                                var m = t.right - o.right,
                                    w = window.innerWidth - n.right - m,
                                    x = window.innerWidth - e.right - w,
                                    S = e.width + x,
                                    E = Math.max(S, t.width),
                                    I = fU(w, [10, Math.max(10, window.innerWidth - 10 - E)]);
                                l.style.minWidth = S + "px", l.style.right = I + "px"
                            }
                            var T = p(),
                                C = window.innerHeight - 20,
                                P = g.scrollHeight,
                                A = window.getComputedStyle(d),
                                _ = parseInt(A.borderTopWidth, 10),
                                N = parseInt(A.paddingTop, 10),
                                R = parseInt(A.borderBottomWidth, 10),
                                O = _ + N + P + parseInt(A.paddingBottom, 10) + R,
                                k = Math.min(5 * y.offsetHeight, O),
                                M = window.getComputedStyle(g),
                                L = parseInt(M.paddingTop, 10),
                                D = parseInt(M.paddingBottom, 10),
                                B = e.top + e.height / 2 - 10,
                                j = y.offsetHeight / 2,
                                F = _ + N + (y.offsetTop + j);
                            if (F <= B) {
                                var H = T.length > 0 && y === T[T.length - 1].ref.current;
                                l.style.bottom = "0px";
                                var U = Math.max(C - B, j + (H ? D : 0) + (d.clientHeight - g.offsetTop - g.offsetHeight) + R);
                                l.style.height = F + U + "px"
                            } else {
                                var z = T.length > 0 && y === T[0].ref.current;
                                l.style.top = "0px";
                                var G = Math.max(B, _ + g.offsetTop + (z ? L : 0) + j);
                                l.style.height = G + (O - F) + "px", g.scrollTop = F - B + g.offsetTop
                            }
                            l.style.margin = "".concat(10, "px 0"), l.style.minHeight = k + "px", l.style.maxHeight = C + "px", null == r || r(), requestAnimationFrame(function() {
                                return v.current = !0
                            })
                        }
                    }, [p, i.trigger, i.valueNode, l, d, g, y, b, i.dir, r]);
                uP(function() {
                    return x()
                }, [x]);
                var S = ts(tl.useState(), 2),
                    E = S[0],
                    I = S[1];
                uP(function() {
                    d && I(window.getComputedStyle(d).zIndex)
                }, [d]);
                var T = tl.useCallback(function(e) {
                    e && !0 === m.current && (x(), null == w || w(), m.current = !1)
                }, [x, w]);
                return (0, e8.jsx)(hh, {
                    scope: n,
                    contentWrapper: l,
                    shouldExpandOnScrollRef: v,
                    onScrollButtonChange: T,
                    children: (0, e8.jsx)("div", {
                        ref: u,
                        style: {
                            display: "flex",
                            flexDirection: "column",
                            position: "fixed",
                            zIndex: E
                        },
                        children: (0, e8.jsx)(uB.div, tb(td({}, o), {
                            ref: h,
                            style: td({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, o.style)
                        }))
                    })
                })
            });
            hc.displayName = "SelectItemAlignedPosition";
            var hd = tl.forwardRef(function(e, t) {
                var n = e.__scopeSelect,
                    r = e.align,
                    o = e.collisionPadding,
                    i = tz(e, ["__scopeSelect", "align", "collisionPadding"]),
                    a = fJ(n);
                return (0, e8.jsx)(d2, tb(td({}, a, i), {
                    ref: t,
                    align: void 0 === r ? "start" : r,
                    collisionPadding: void 0 === o ? 10 : o,
                    style: td({
                        boxSizing: "border-box"
                    }, i.style, {
                        "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
                    })
                }))
            });
            hd.displayName = "SelectPopperPosition";
            var hf = ts(fQ(hr, {}), 2),
                hh = hf[0],
                hp = hf[1],
                hv = "SelectViewport",
                hm = tl.forwardRef(function(e, t) {
                    var n = e.__scopeSelect,
                        r = e.nonce,
                        o = tz(e, ["__scopeSelect", "nonce"]),
                        i = hs(hv, n),
                        a = hp(hv, n),
                        s = s7(t, i.onViewportChange),
                        l = tl.useRef(0);
                    return (0, e8.jsxs)(e8.Fragment, {
                        children: [(0, e8.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: r
                        }), (0, e8.jsx)(fZ.Slot, {
                            scope: n,
                            children: (0, e8.jsx)(uB.div, tb(td({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, o), {
                                ref: s,
                                style: td({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, o.style),
                                onScroll: uI(o.onScroll, function(e) {
                                    var t = e.currentTarget,
                                        n = a.contentWrapper,
                                        r = a.shouldExpandOnScrollRef;
                                    if ((null == r ? void 0 : r.current) && n) {
                                        var o = Math.abs(l.current - t.scrollTop);
                                        if (o > 0) {
                                            var i = window.innerHeight - 20,
                                                s = Math.max(parseFloat(n.style.minHeight), parseFloat(n.style.height));
                                            if (s < i) {
                                                var u = s + o,
                                                    c = Math.min(i, u),
                                                    d = u - c;
                                                n.style.height = c + "px", "0px" === n.style.bottom && (t.scrollTop = d > 0 ? d : 0, n.style.justifyContent = "flex-end")
                                            }
                                        }
                                    }
                                    l.current = t.scrollTop
                                })
                            }))
                        })]
                    })
                });
            hm.displayName = hv;
            var hg = "SelectGroup",
                hy = ts(fQ(hg), 2),
                hb = hy[0],
                hw = hy[1];
            tl.forwardRef(function(e, t) {
                var n = e.__scopeSelect,
                    r = tz(e, ["__scopeSelect"]),
                    o = uN();
                return (0, e8.jsx)(hb, {
                    scope: n,
                    id: o,
                    children: (0, e8.jsx)(uB.div, tb(td({
                        role: "group",
                        "aria-labelledby": o
                    }, r), {
                        ref: t
                    }))
                })
            }).displayName = hg;
            var hx = "SelectLabel";
            tl.forwardRef(function(e, t) {
                var n = e.__scopeSelect,
                    r = tz(e, ["__scopeSelect"]),
                    o = hw(hx, n);
                return (0, e8.jsx)(uB.div, tb(td({
                    id: o.id
                }, r), {
                    ref: t
                }))
            }).displayName = hx;
            var hS = "SelectItem",
                hE = ts(fQ(hS), 2),
                hI = hE[0],
                hT = hE[1],
                hC = tl.forwardRef(function(e, t) {
                    var n = e.__scopeSelect,
                        r = e.value,
                        o = e.disabled,
                        i = void 0 !== o && o,
                        a = e.textValue,
                        s = tz(e, ["__scopeSelect", "value", "disabled", "textValue"]),
                        l = f2(hS, n),
                        u = hs(hS, n),
                        c = l.value === r,
                        d = ts(tl.useState(null != a ? a : ""), 2),
                        f = d[0],
                        h = d[1],
                        p = ts(tl.useState(!1), 2),
                        v = p[0],
                        m = p[1],
                        g = s7(t, function(e) {
                            var t;
                            return null == (t = u.itemRefCallback) ? void 0 : t.call(u, e, r, i)
                        }),
                        y = uN(),
                        b = tl.useRef("touch"),
                        w = function() {
                            i || (l.onValueChange(r), l.onOpenChange(!1))
                        };
                    if ("" === r) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, e8.jsx)(hI, {
                        scope: n,
                        value: r,
                        disabled: i,
                        textId: y,
                        isSelected: c,
                        onItemTextChange: tl.useCallback(function(e) {
                            h(function(t) {
                                var n;
                                return t || (null != (n = null == e ? void 0 : e.textContent) ? n : "").trim()
                            })
                        }, []),
                        children: (0, e8.jsx)(fZ.ItemSlot, {
                            scope: n,
                            value: r,
                            disabled: i,
                            textValue: f,
                            children: (0, e8.jsx)(uB.div, tb(td({
                                role: "option",
                                "aria-labelledby": y,
                                "data-highlighted": v ? "" : void 0,
                                "aria-selected": c && v,
                                "data-state": c ? "checked" : "unchecked",
                                "aria-disabled": i || void 0,
                                "data-disabled": i ? "" : void 0,
                                tabIndex: i ? void 0 : -1
                            }, s), {
                                ref: g,
                                onFocus: uI(s.onFocus, function() {
                                    return m(!0)
                                }),
                                onBlur: uI(s.onBlur, function() {
                                    return m(!1)
                                }),
                                onClick: uI(s.onClick, function() {
                                    "mouse" !== b.current && w()
                                }),
                                onPointerUp: uI(s.onPointerUp, function() {
                                    "mouse" === b.current && w()
                                }),
                                onPointerDown: uI(s.onPointerDown, function(e) {
                                    b.current = e.pointerType
                                }),
                                onPointerMove: uI(s.onPointerMove, function(e) {
                                    if (b.current = e.pointerType, i) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    } else "mouse" === b.current && e.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                }),
                                onPointerLeave: uI(s.onPointerLeave, function(e) {
                                    if (e.currentTarget === document.activeElement) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    }
                                }),
                                onKeyDown: uI(s.onKeyDown, function(e) {
                                    var t;
                                    ((null == (t = u.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (fK.includes(e.key) && w(), " " === e.key && e.preventDefault())
                                })
                            }))
                        })
                    })
                });
            hC.displayName = hS;
            var hP = "SelectItemText",
                hA = tl.forwardRef(function(e, t) {
                    var n = e.__scopeSelect,
                        r = (e.className, e.style, tz(e, ["__scopeSelect", "className", "style"])),
                        o = f2(hP, n),
                        i = hs(hP, n),
                        a = hT(hP, n),
                        s = f4(hP, n),
                        l = ts(tl.useState(null), 2),
                        u = l[0],
                        c = l[1],
                        d = s7(t, function(e) {
                            return c(e)
                        }, a.onItemTextChange, function(e) {
                            var t;
                            return null == (t = i.itemTextRefCallback) ? void 0 : t.call(i, e, a.value, a.disabled)
                        }),
                        f = null == u ? void 0 : u.textContent,
                        h = tl.useMemo(function() {
                            return (0, e8.jsx)("option", {
                                value: a.value,
                                disabled: a.disabled,
                                children: f
                            }, a.value)
                        }, [a.disabled, a.value, f]),
                        p = s.onNativeOptionAdd,
                        v = s.onNativeOptionRemove;
                    return uP(function() {
                        return p(h),
                            function() {
                                return v(h)
                            }
                    }, [p, v, h]), (0, e8.jsxs)(e8.Fragment, {
                        children: [(0, e8.jsx)(uB.span, tb(td({
                            id: a.textId
                        }, r), {
                            ref: d
                        })), a.isSelected && o.valueNode && !o.valueNodeHasChildren ? an.createPortal(r.children, o.valueNode) : null]
                    })
                });
            hA.displayName = hP;
            var h_ = "SelectItemIndicator";
            tl.forwardRef(function(e, t) {
                var n = e.__scopeSelect,
                    r = tz(e, ["__scopeSelect"]);
                return hT(h_, n).isSelected ? (0, e8.jsx)(uB.span, tb(td({
                    "aria-hidden": !0
                }, r), {
                    ref: t
                })) : null
            }).displayName = h_;
            var hN = "SelectScrollUpButton";
            tl.forwardRef(function(e, t) {
                var n = hs(hN, e.__scopeSelect),
                    r = hp(hN, e.__scopeSelect),
                    o = ts(tl.useState(!1), 2),
                    i = o[0],
                    a = o[1],
                    s = s7(t, r.onScrollButtonChange);
                return uP(function() {
                    if (n.viewport && n.isPositioned) {
                        var e = function() {
                                a(t.scrollTop > 0)
                            },
                            t = n.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }, [n.viewport, n.isPositioned]), i ? (0, e8.jsx)(hO, tb(td({}, e), {
                    ref: s,
                    onAutoScroll: function() {
                        var e = n.viewport,
                            t = n.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
                    }
                })) : null
            }).displayName = hN;
            var hR = "SelectScrollDownButton";
            tl.forwardRef(function(e, t) {
                var n = hs(hR, e.__scopeSelect),
                    r = hp(hR, e.__scopeSelect),
                    o = ts(tl.useState(!1), 2),
                    i = o[0],
                    a = o[1],
                    s = s7(t, r.onScrollButtonChange);
                return uP(function() {
                    if (n.viewport && n.isPositioned) {
                        var e = function() {
                                var e = t.scrollHeight - t.clientHeight;
                                a(Math.ceil(t.scrollTop) < e)
                            },
                            t = n.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }, [n.viewport, n.isPositioned]), i ? (0, e8.jsx)(hO, tb(td({}, e), {
                    ref: s,
                    onAutoScroll: function() {
                        var e = n.viewport,
                            t = n.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
                    }
                })) : null
            }).displayName = hR;
            var hO = tl.forwardRef(function(e, t) {
                var n = e.__scopeSelect,
                    r = e.onAutoScroll,
                    o = tz(e, ["__scopeSelect", "onAutoScroll"]),
                    i = hs("SelectScrollButton", n),
                    a = tl.useRef(null),
                    s = fY(n),
                    l = tl.useCallback(function() {
                        null !== a.current && (window.clearInterval(a.current), a.current = null)
                    }, []);
                return tl.useEffect(function() {
                    return function() {
                        return l()
                    }
                }, [l]), uP(function() {
                    var e, t = s().find(function(e) {
                        return e.ref.current === document.activeElement
                    });
                    null == t || null == (e = t.ref.current) || e.scrollIntoView({
                        block: "nearest"
                    })
                }, [s]), (0, e8.jsx)(uB.div, tb(td({
                    "aria-hidden": !0
                }, o), {
                    ref: t,
                    style: td({
                        flexShrink: 0
                    }, o.style),
                    onPointerDown: uI(o.onPointerDown, function() {
                        null === a.current && (a.current = window.setInterval(r, 50))
                    }),
                    onPointerMove: uI(o.onPointerMove, function() {
                        var e;
                        null == (e = i.onItemLeave) || e.call(i), null === a.current && (a.current = window.setInterval(r, 50))
                    }),
                    onPointerLeave: uI(o.onPointerLeave, function() {
                        l()
                    })
                }))
            });
            tl.forwardRef(function(e, t) {
                e.__scopeSelect;
                var n = tz(e, ["__scopeSelect"]);
                return (0, e8.jsx)(uB.div, tb(td({
                    "aria-hidden": !0
                }, n), {
                    ref: t
                }))
            }).displayName = "SelectSeparator";
            var hk = "SelectArrow";

            function hM(e) {
                return "" === e || void 0 === e
            }
            tl.forwardRef(function(e, t) {
                var n = e.__scopeSelect,
                    r = tz(e, ["__scopeSelect"]),
                    o = fJ(n),
                    i = f2(hk, n),
                    a = hs(hk, n);
                return i.open && "popper" === a.position ? (0, e8.jsx)(d4, tb(td({}, o, r), {
                    ref: t
                })) : null
            }).displayName = hk;
            var hL = tl.forwardRef(function(e, t) {
                var n, r = e.value,
                    o = tz(e, ["value"]),
                    i = tl.useRef(null),
                    a = s7(t, i),
                    s = (n = tl.useRef({
                        value: r,
                        previous: r
                    }), tl.useMemo(function() {
                        return n.current.value !== r && (n.current.previous = n.current.value, n.current.value = r), n.current.previous
                    }, [r]));
                return tl.useEffect(function() {
                    var e = i.current,
                        t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
                    if (s !== r && t) {
                        var n = new Event("change", {
                            bubbles: !0
                        });
                        t.call(e, r), e.dispatchEvent(n)
                    }
                }, [s, r]), (0, e8.jsx)(fV, {
                    asChild: !0,
                    children: (0, e8.jsx)("select", tb(td({}, o), {
                        ref: a,
                        defaultValue: r
                    }))
                })
            });

            function hD(e) {
                var t = uR(e),
                    n = tl.useRef(""),
                    r = tl.useRef(0),
                    o = tl.useCallback(function(e) {
                        var o = n.current + e;
                        t(o),
                            function e(t) {
                                n.current = t, window.clearTimeout(r.current), "" !== t && (r.current = window.setTimeout(function() {
                                    return e("")
                                }, 1e3))
                            }(o)
                    }, [t]),
                    i = tl.useCallback(function() {
                        n.current = "", window.clearTimeout(r.current)
                    }, []);
                return tl.useEffect(function() {
                    return function() {
                        return window.clearTimeout(r.current)
                    }
                }, []), [n, o, i]
            }

            function hB(e, t, n) {
                var r, o, i = t.length > 1 && Array.from(t).every(function(e) {
                        return e === t[0]
                    }) ? t[0] : t,
                    a = n ? e.indexOf(n) : -1,
                    s = (r = e, o = Math.max(a, 0), r.map(function(e, t) {
                        return r[(o + t) % r.length]
                    }));
                1 === i.length && (s = s.filter(function(e) {
                    return e !== n
                }));
                var l = s.find(function(e) {
                    return e.textValue.toLowerCase().startsWith(i.toLowerCase())
                });
                return l !== n ? l : void 0
            }
            hL.displayName = "BubbleSelect";
            var hj = (0, tl.createContext)(null),
                hF = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                hH = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                hU = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                hz = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                hG = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                hV = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                hW = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                };

            function hK(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    o = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === o || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }(0, tl.forwardRef)(function(e, t) {
                var n = e.label,
                    r = e.labelTooltip,
                    o = e.ariaLabelledBy,
                    i = e.ariaLabel,
                    a = e.className,
                    s = e.size,
                    l = e.variant,
                    u = void 0 === l ? "Standard" : l,
                    c = e.value,
                    d = e.placeholder,
                    f = e.isDisabled,
                    h = e.hasError,
                    p = e.hint,
                    v = e.onValueChange,
                    m = e.onOpenChange,
                    g = e.children,
                    y = fB(),
                    b = (0, tl.useMemo)(function() {
                        return {
                            size: s
                        }
                    }, [s]),
                    w = n ? tu().createElement("span", {
                        id: y,
                        className: oV(hU[s], "content-emphasis")
                    }, n) : null;
                return tu().createElement(hj.Provider, {
                    value: b
                }, tu().createElement("div", {
                    className: oV("flex flex-col", f && ["opacity-[0.5]", "pointer-events-none"], hG[s], a)
                }, w && (r ? tu().createElement("div", {
                    className: "flex items-center gap-xsmall"
                }, w, tu().createElement(fj, r)) : w), tu().createElement(f6, {
                    value: c,
                    disabled: f,
                    onValueChange: v,
                    onOpenChange: m
                }, tu().createElement(f9, {
                    className: oV("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", fF[u], fH[u], hV[s], hW[s], hH[s], hz[s], h ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === c ? "content-muted" : "content-default"),
                    ref: t,
                    "aria-labelledby": n ? y : o,
                    "aria-label": i
                }, tu().createElement(s2, null), tu().createElement("div", {
                    className: "grow-1 text-truncate-split text-align-x-left"
                }, tu().createElement(he, {
                    placeholder: d
                })), tu().createElement(ht, {
                    className: oV(hF[s], "icon icon-regular-chevron-large-down content-default")
                })), tu().createElement(hn, null, tu().createElement(ho, {
                    position: "popper",
                    className: "padding-y-small foundation-web-portal-zindex",
                    style: {
                        maxHeight: "var(--radix-select-content-available-height)"
                    }
                }, g))), p && tu().createElement("span", {
                    className: oV("text-caption-small", {
                        "content-system-alert": h,
                        "content-default": !h
                    })
                }, p)))
            }).displayName = "Dropdown", "u" > typeof window && window.document && window.document.createElement;
            tA(Map);
            var hq = tl[" useInsertionEffect ".trim().toString()] || uP;
            Symbol("RADIX:SYNC_STATE");
            var hX = "rovingFocusGroup.onEntryFocus",
                hZ = {
                    bubbles: !1,
                    cancelable: !0
                },
                hY = "RovingFocusGroup",
                h$ = ts((eA = (eP = ts(uT(eC = hY + "CollectionProvider"), 2))[0], e_ = eP[1], eR = (eN = ts(eA(eC, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], eO = eN[1], (ek = function(e) {
                    var t = e.scope,
                        n = e.children,
                        r = tu().useRef(null),
                        o = tu().useRef(new Map).current;
                    return (0, e8.jsx)(eR, {
                        scope: t,
                        itemMap: o,
                        collectionRef: r,
                        children: n
                    })
                }).displayName = eC, eL = c5(eM = hY + "CollectionSlot"), (eD = tu().forwardRef(function(e, t) {
                    var n = e.scope,
                        r = e.children,
                        o = s7(t, eO(eM, n).collectionRef);
                    return (0, e8.jsx)(eL, {
                        ref: o,
                        children: r
                    })
                })).displayName = eM, ej = "data-radix-collection-item", eF = c5(eB = hY + "CollectionItemSlot"), (eH = tu().forwardRef(function(e, t) {
                    var n = e.scope,
                        r = e.children,
                        o = tz(e, ["scope", "children"]),
                        i = tu().useRef(null),
                        a = s7(t, i),
                        s = eO(eB, n);
                    return tu().useEffect(function() {
                        return s.itemMap.set(i, td({
                                ref: i
                            }, o)),
                            function() {
                                s.itemMap.delete(i)
                            }
                    }), (0, e8.jsx)(eF, tb(td({}, tc({}, ej, "")), {
                        ref: a,
                        children: r
                    }))
                })).displayName = eB, [{
                    Provider: ek,
                    Slot: eD,
                    ItemSlot: eH
                }, function(e) {
                    var t = eO(hY + "CollectionConsumer", e);
                    return tu().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var n = Array.from(e.querySelectorAll("[".concat(ej, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return n.indexOf(e.ref.current) - n.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, e_]), 3),
                hQ = h$[0],
                hJ = h$[1],
                h0 = ts(uT(hY, [h$[2]]), 2),
                h1 = h0[0];
            h0[1];
            var h2 = ts(h1(hY), 2),
                h5 = h2[0],
                h3 = h2[1],
                h4 = tl.forwardRef(function(e, t) {
                    return (0, e8.jsx)(hQ.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, e8.jsx)(hQ.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, e8.jsx)(h6, tb(td({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            h4.displayName = hY;
            var h6 = tl.forwardRef(function(e, t) {
                    var n, r, i, a, s, l, u, c, d, f, h, p, v, m, g, y, b, w, x, S, E = e.__scopeRovingFocusGroup,
                        I = e.orientation,
                        T = e.loop,
                        C = e.dir,
                        P = e.currentTabStopId,
                        A = e.defaultCurrentTabStopId,
                        _ = e.onCurrentTabStopIdChange,
                        N = e.onEntryFocus,
                        R = e.preventScrollOnEntryFocus,
                        O = void 0 !== R && R,
                        k = tz(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        M = tl.useRef(null),
                        L = s7(t, M),
                        D = fG(C),
                        B = ts((f = (d = {
                            prop: P,
                            defaultProp: null != A ? A : null,
                            onChange: _,
                            caller: hY
                        }).prop, h = d.defaultProp, p = d.onChange, v = d.caller, g = (m = ts((r = (n = {
                            defaultProp: h,
                            onChange: void 0 === p ? function() {} : p
                        }).defaultProp, i = n.onChange, s = (a = ts(tl.useState(r), 2))[0], l = a[1], u = tl.useRef(s), c = tl.useRef(i), hq(function() {
                            c.current = i
                        }, [i]), tl.useEffect(function() {
                            if (u.current !== s) {
                                var e;
                                null == (e = c.current) || e.call(c, s), u.current = s
                            }
                        }, [s, u]), [s, l, c]), 3))[0], y = m[1], b = m[2], x = (w = void 0 !== f) ? f : g, S = tl.useRef(void 0 !== f), tl.useEffect(function() {
                            var e = S.current;
                            if (e !== w) {
                                var t = w ? "controlled" : "uncontrolled";
                                console.warn("".concat(v, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            S.current = w
                        }, [w, v]), [x, tl.useCallback(function(e) {
                            if (w) {
                                var t, n = "function" == typeof e ? e(f) : e;
                                n !== f && (null == (t = b.current) || t.call(b, n))
                            } else y(e)
                        }, [w, f, y, b])]), 2),
                        j = B[0],
                        F = B[1],
                        H = ts(tl.useState(!1), 2),
                        U = H[0],
                        z = H[1],
                        G = uR(N),
                        V = hJ(E),
                        W = tl.useRef(!1),
                        K = ts(tl.useState(0), 2),
                        q = K[0],
                        X = K[1];
                    return tl.useEffect(function() {
                        var e = M.current;
                        if (e) return e.addEventListener(hX, G),
                            function() {
                                return e.removeEventListener(hX, G)
                            }
                    }, [G]), (0, e8.jsx)(h5, {
                        scope: E,
                        orientation: I,
                        dir: D,
                        loop: void 0 !== T && T,
                        currentTabStopId: j,
                        onItemFocus: tl.useCallback(function(e) {
                            return F(e)
                        }, [F]),
                        onItemShiftTab: tl.useCallback(function() {
                            return z(!0)
                        }, []),
                        onFocusableItemAdd: tl.useCallback(function() {
                            return X(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: tl.useCallback(function() {
                            return X(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, e8.jsx)(c6.div, tb(td({
                            tabIndex: U || 0 === q ? -1 : 0,
                            "data-orientation": I
                        }, k), {
                            ref: L,
                            style: td({
                                outline: "none"
                            }, e.style),
                            onMouseDown: hK(e.onMouseDown, function() {
                                W.current = !0
                            }),
                            onFocus: hK(e.onFocus, function(e) {
                                var t = !W.current;
                                if (e.target === e.currentTarget && t && !U) {
                                    var n = new CustomEvent(hX, hZ);
                                    if (e.currentTarget.dispatchEvent(n), !n.defaultPrevented) {
                                        var r = V().filter(function(e) {
                                            return e.focusable
                                        });
                                        pe([r.find(function(e) {
                                            return e.active
                                        }), r.find(function(e) {
                                            return e.id === j
                                        })].concat(o(r)).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), O)
                                    }
                                }
                                W.current = !1
                            }),
                            onBlur: hK(e.onBlur, function() {
                                return z(!1)
                            })
                        }))
                    })
                }),
                h8 = "RovingFocusGroupItem",
                h9 = tl.forwardRef(function(e, t) {
                    var n = e.__scopeRovingFocusGroup,
                        r = e.focusable,
                        o = void 0 === r || r,
                        i = e.active,
                        a = e.tabStopId,
                        s = e.children,
                        l = tz(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        u = uN(),
                        c = a || u,
                        d = h3(h8, n),
                        f = d.currentTabStopId === c,
                        h = hJ(n),
                        p = d.onFocusableItemAdd,
                        v = d.onFocusableItemRemove,
                        m = d.currentTabStopId;
                    return tl.useEffect(function() {
                        if (o) return p(),
                            function() {
                                return v()
                            }
                    }, [o, p, v]), (0, e8.jsx)(hQ.ItemSlot, {
                        scope: n,
                        id: c,
                        focusable: o,
                        active: void 0 !== i && i,
                        children: (0, e8.jsx)(c6.span, tb(td({
                            tabIndex: f ? 0 : -1,
                            "data-orientation": d.orientation
                        }, l), {
                            ref: t,
                            onMouseDown: hK(e.onMouseDown, function(e) {
                                o ? d.onItemFocus(c) : e.preventDefault()
                            }),
                            onFocus: hK(e.onFocus, function() {
                                return d.onItemFocus(c)
                            }),
                            onKeyDown: hK(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void d.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, n) {
                                        var r, o = (r = e.key, "rtl" !== n ? r : "ArrowLeft" === r ? "ArrowRight" : "ArrowRight" === r ? "ArrowLeft" : r);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return h7[o]
                                    }(e, d.orientation, d.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var n = h().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) n.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && n.reverse();
                                            var r, o, i = n.indexOf(e.currentTarget);
                                            n = d.loop ? (r = n, o = i + 1, r.map(function(e, t) {
                                                return r[(o + t) % r.length]
                                            })) : n.slice(i + 1)
                                        }
                                        setTimeout(function() {
                                            return pe(n)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof s ? s({
                                isCurrentTabStop: f,
                                hasTabStop: null != m
                            }) : s
                        }))
                    })
                });
            h9.displayName = h8;
            var h7 = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function pe(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = document.activeElement,
                    r = !0,
                    o = !1,
                    i = void 0;
                try {
                    for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done); r = !0) {
                        var l = a.value;
                        if (l === n || (l.focus({
                                preventScroll: t
                            }), document.activeElement !== n)) return
                    }
                } catch (e) {
                    o = !0, i = e
                } finally {
                    try {
                        r || null == s.return || s.return()
                    } finally {
                        if (o) throw i
                    }
                }
            }
            var pt = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                pn = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                pr = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                po = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                pi = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                pa = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                ps = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                pl = (0, tl.createContext)(null),
                pu = function() {
                    var e = (0, tl.useContext)(pl);
                    if (!e) throw Error("Menu components must be used within a Menu");
                    return e
                },
                pc = function(e) {
                    var t, n = e.children,
                        r = e.className,
                        o = e.size,
                        i = (0, tl.useContext)(hj),
                        a = i ? "dropdown" : "standalone",
                        s = null != (t = null != o ? o : null == i ? void 0 : i.size) ? t : "Medium",
                        l = (0, tl.useMemo)(function() {
                            return {
                                size: s,
                                mode: a
                            }
                        }, [s, a]),
                        u = oV("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", pt[s], r),
                        c = "standalone" === a ? tu().createElement(h4, {
                            asChild: !0,
                            orientation: "vertical",
                            loop: !0
                        }, tu().createElement("div", {
                            role: "menu",
                            tabIndex: -1,
                            className: u
                        }, n)) : tu().createElement("div", {
                            className: u
                        }, n);
                    return tu().createElement(pl.Provider, {
                        value: l
                    }, "dropdown" === a ? tu().createElement(hm, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, c) : c)
                },
                pd = function(e) {
                    var t, n = e.value,
                        r = e.leading,
                        o = e.title,
                        i = e.description,
                        a = e.trailing,
                        s = e.disabled,
                        l = e.className,
                        u = e.onSelect,
                        c = e.asChild,
                        d = e.children,
                        f = tz(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        h = pu(),
                        p = h.size,
                        v = h.mode,
                        m = oV(s1, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", pa[p], pn[p], pr[p], po[p], ps[p], s && "opacity-[0.5]", s && "pointer-events-none", l),
                        g = tu().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, o);
                    switch (v) {
                        case "dropdown":
                            g = tu().createElement(hA, {
                                asChild: !0
                            }, g);
                            break;
                        case "standalone":
                            break;
                        default:
                            console.error("Invalid menu mode:", v)
                    }
                    var y = tu().createElement(tu().Fragment, null, !s && tu().createElement(s2, null), r, tu().createElement("div", {
                        className: oV("grow-1 text-truncate-split flex flex-col", pi[p])
                    }, g, i && tu().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, i)), a);
                    if (c) {
                        f.as;
                        var b = tz(f, ["as"]),
                            w = tu().Children.only(d),
                            x = void 0 === o && w.props.children;
                        t = tu().createElement(lr, tb(td({}, b), {
                            role: "standalone" === v ? "menuitem" : void 0,
                            "aria-disabled": s || void 0,
                            className: m,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: s ? void 0 : u
                        }), x ? tu().cloneElement(w, {}, tu().createElement(tu().Fragment, null, !s && tu().createElement(s2, null), w.props.children)) : tu().cloneElement(w, {}, y))
                    } else if ("a" === f.as) {
                        f.as;
                        var S = f.href,
                            E = tz(f, ["as", "href"]);
                        t = tu().createElement("a", tb(td({}, E), {
                            role: "standalone" === v ? "menuitem" : void 0,
                            "aria-disabled": s,
                            href: s ? void 0 : S,
                            className: m,
                            style: {
                                outlineOffset: 0,
                                textDecoration: "none"
                            },
                            onClick: s ? void 0 : u
                        }), y)
                    } else {
                        f.as;
                        var I = tz(f, ["as"]);
                        t = tu().createElement("button", tb(td({
                            type: "button"
                        }, I), {
                            role: "standalone" === v ? "menuitem" : void 0,
                            "aria-disabled": s,
                            className: m,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: s ? void 0 : u
                        }), y)
                    }
                    return "dropdown" === v ? tu().createElement(hC, {
                        value: n,
                        disabled: s,
                        asChild: !0
                    }, t) : tu().createElement(h9, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: n
                    }, t)
                },
                pf = function(e) {
                    null == rw || rw.location.assign("/my/account#!/personalized-recommendations")
                },
                ph = function(e) {
                    var t = e.surfaceKey,
                        n = e.className,
                        r = e.keepFocusOnOpen,
                        o = ts((0, tl.useState)(!1), 2),
                        i = o[0],
                        a = o[1],
                        s = ra("Feature.AccountSettings")("Heading.Tab.PersonalizedRecommendations", void 0, "Personalized recommendations");
                    return (0, e8.jsxs)(fI, {
                        open: i,
                        onOpenChange: a,
                        children: [(0, e8.jsx)(fT, {
                            asChild: !0,
                            children: (0, e8.jsx)(fL, {
                                className: oz()("bg-none shrink-0", n),
                                icon: "icon-regular-three-dots-horizontal",
                                ariaLabel: s,
                                variant: "Utility",
                                size: "Small"
                            })
                        }), (0, e8.jsx)(fC, {
                            side: "bottom",
                            align: "end",
                            ariaLabel: s,
                            onOpenAutoFocus: void 0 !== r && r ? function(e) {
                                e.preventDefault()
                            } : void 0,
                            children: (0, e8.jsx)(pc, {
                                size: "Medium",
                                children: (0, e8.jsx)(pd, {
                                    value: "personalized-recommendations",
                                    title: s,
                                    leading: (0, e8.jsx)(s6, {
                                        name: "icon-regular-gear"
                                    }),
                                    onSelect: function() {
                                        a(!1), pf({
                                            surfaceKey: t
                                        })
                                    }
                                })
                            })
                        })]
                    })
                },
                pp = (0, tl.forwardRef)(function(e, t) {
                    var n = tW([e, t]),
                        r = n[0],
                        o = n.slice(1),
                        i = (r.componentType, tz(r, ["componentType"])),
                        a = ts(o, 1)[0];
                    return (0, e8.jsx)(dH, td({
                        ref: a
                    }, i))
                });
            pp.displayName = "SearchLandingTile";
            var pv = function(e) {
                var t, n, r = e.translate,
                    o = e.sort,
                    i = e.positionId,
                    a = e.itemsPerRow,
                    s = e.gameData,
                    l = e.friendsPresenceData,
                    u = (0, tl.useContext)(oM),
                    c = (0, tl.useRef)(null),
                    d = (0, tl.useCallback)(function(e, t) {
                        var n, r;
                        return tb(td((tc(n = {}, rQ.PlaceId, e.placeId), tc(n, rQ.UniverseId, e.universeId), tc(n, rQ.IsAd, e.isSponsored), tc(n, rQ.NativeAdData, e.nativeAdData), tc(n, rQ.Position, t), tc(n, rQ.SortPos, i), tc(n, rQ.NumberOfLoadedTiles, s.length), n), ok(o)), (tc(r = {}, rQ.SortId, o.sortId), tc(r, rQ.Page, rU.SearchLandingPage), tc(r, r0.SearchLandingPageSessionInfo, u), tc(r, rQ.PlayContext, rU.SearchLandingPage), r))
                    }, [i, s.length, o, u]),
                    f = (0, tl.useCallback)(function(e) {
                        var t, n, r, a, l, c = e.filter(function(e) {
                            return e < s.length
                        });
                        return tb(td((tc(a = {}, rQ.RootPlaceIds, c.map(function(e) {
                            var t;
                            return null == (t = s[e]) ? void 0 : t.placeId
                        })), tc(a, rQ.UniverseIds, c.map(function(e) {
                            var t;
                            return null == (t = s[e]) ? void 0 : t.universeId
                        })), a), oo(s, void 0, c), (t = s, n = void 0, r = c, tc({}, rQ.TileBadgeContexts, r.map(function(e) {
                            var r;
                            return null != (r = oa(t[e], null == n ? void 0 : n.toString())) ? r : "0"
                        }))), r7(s, c), ok(o)), (tc(l = {}, rQ.SortId, o.sortId), tc(l, rQ.AbsPositions, c), tc(l, rQ.SortPos, i), tc(l, rQ.NumberOfLoadedTiles, s.length), tc(l, rQ.Page, rU.SearchLandingPage), tc(l, r0.SearchLandingPageSessionInfo, u), l))
                    }, [s, o, i, u]);
                oH(c, s.length, f);
                var h = null == (t = o.topicLayoutData) ? void 0 : t.personalizedRecommendationsSurfaceKey;
                return (0, e8.jsxs)(tu().Fragment, {
                    children: [(0, e8.jsx)(sE, {
                        sortTitle: o.topic,
                        sortSubtitle: o.subtitle,
                        shouldShowSeparateSubtitleLink: !1,
                        isSortLinkOverrideEnabled: !1,
                        titleContainerClassName: "container-header",
                        hideSeeAll: !0,
                        translate: r,
                        seeAllLink: void 0,
                        subtitleLink: void 0,
                        shouldShowSponsoredTooltip: void 0,
                        trailingComponent: h ? (0, e8.jsx)(ph, {
                            surfaceKey: h,
                            keepFocusOnOpen: !0
                        }) : void 0
                    }), (0, e8.jsx)(sB, {
                        TileComponent: pp,
                        gameData: s,
                        sort: o,
                        positionId: i,
                        hideScrollBackWhenDisabled: !0,
                        sortIdStr: o.sortId,
                        page: rU.SearchLandingPage,
                        gamesContainerRef: c,
                        buildEventProperties: d,
                        isLoadingMoreGames: !1,
                        itemsPerRow: a,
                        friendData: l,
                        topicId: null == (n = o.topicId) ? void 0 : n.toString(),
                        isDynamicLayoutSizingEnabled: !1,
                        isCarouselHorizontalScrollEnabled: !0,
                        isNewScrollArrowsEnabled: !1,
                        translate: r
                    })]
                })
            };
            pv.defaultProps = {
                itemsPerRow: void 0
            }, (0, tl.createContext)(null), (0, tl.createContext)(null);
            var pm = (0, tl.createContext)(null),
                pg = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                py = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                pb = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                pw = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                px = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                pS = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                pE = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                pI = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                pT = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                pC = {
                    Small: "size-[var(--icon-size-xsmall)]",
                    Medium: "size-[var(--icon-size-small)]",
                    Large: "size-[var(--icon-size-medium)]"
                },
                pP = function(e) {
                    var t = e.iconName,
                        n = e.node,
                        r = e.size;
                    return null != t ? tu().createElement(s6, {
                        name: t,
                        size: pg[r]
                    }) : null != n ? tu().createElement("span", {
                        className: oV("inline-flex items-center justify-center shrink-0", pC[r])
                    }, n) : null
                },
                pA = (0, tl.forwardRef)(function(e, t) {
                    var n, r = tW([e, t]),
                        o = r[0],
                        i = r.slice(1),
                        a = o.className,
                        s = o.style,
                        l = o.text,
                        u = o.isDisabled,
                        c = o.size,
                        d = o.variant,
                        f = void 0 === d ? "Standard" : d,
                        h = o.leadingIconName,
                        p = o.leadingIconNode,
                        v = o.trailingIconName,
                        m = o.trailingIconNode,
                        g = tz(o, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        y = ts(i, 1)[0],
                        b = (0, tl.useContext)(pm),
                        w = null != (n = null == b ? void 0 : b.size) ? n : void 0 === c ? "Medium" : c,
                        x = void 0 !== u && u || (null == b ? void 0 : b.isDisabled) || !1,
                        S = null != h || null != p,
                        E = null != v || null != m,
                        I = oV(x ? s5 : [s1, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", S ? pw[w] : pb[w], E ? pS[w] : px[w], py[w], a),
                        T = tu().createElement(tu().Fragment, null, tu().createElement(s2, null), tu().createElement(pP, {
                            iconName: h,
                            node: p,
                            size: w
                        }), tu().createElement("span", {
                            className: oV("padding-y-xsmall text-no-wrap text-truncate-end", S && pE[w], E && pI[w])
                        }, l), tu().createElement(pP, {
                            iconName: v,
                            node: m,
                            size: w
                        })),
                        C = td({
                            textDecoration: "none"
                        }, s);
                    if ("a" === g.as) {
                        g.as;
                        var P = g.href,
                            A = tz(g, ["as", "href"]);
                        return tu().createElement("a", tb(td({
                            ref: y
                        }, A), {
                            "aria-disabled": x,
                            href: x ? void 0 : P,
                            className: oV(I, pT[f], "content-action-utility"),
                            style: C
                        }), T)
                    }
                    g.as;
                    var _ = g.isChecked,
                        N = g.onCheckedChange,
                        R = tz(g, ["as", "isChecked", "onCheckedChange"]);
                    return tu().createElement("button", tb(td({
                        ref: y,
                        type: "button"
                    }, R), {
                        className: oV(_ ? "bg-inverse-surface-0" : pT[f], _ ? "content-inverse-emphasis" : "content-action-utility", I),
                        style: C,
                        "aria-pressed": _,
                        disabled: x,
                        onClick: null == N ? void 0 : function() {
                            return N(!_)
                        }
                    }), T)
                }),
                p_ = function(e) {
                    var t = e.queryText,
                        n = e.index,
                        r = e.onClick,
                        o = (0, tl.useMemo)(function() {
                            return (0, rF.getAbsoluteUrl)("/discover/?Keyword=".concat(encodeURIComponent(t)))
                        }, [t]);
                    return (0, e8.jsx)("a", {
                        href: o,
                        onClick: function() {
                            r(t, n)
                        },
                        children: (0, e8.jsx)(pA, {
                            text: t,
                            isChecked: !1
                        })
                    })
                };

            function pN(e, t) {
                if ("function" == typeof e) return e(t);
                e && (e.current = t)
            }
            var pR = parseInt(tl.version.split(".")[0], 10) >= 19 ? function(e) {
                    return function(t) {
                        var n = [],
                            r = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done); r = !0) ! function() {
                                var e = a.value,
                                    r = pN(e, t),
                                    o = "function" == typeof r;
                                n.push(o ? r : function() {
                                    return pN(e, null)
                                })
                            }()
                        } catch (e) {
                            o = !0, i = e
                        } finally {
                            try {
                                r || null == s.return || s.return()
                            } finally {
                                if (o) throw i
                            }
                        }
                        return function() {
                            var e = !0,
                                t = !1,
                                r = void 0;
                            try {
                                for (var o, i = n[Symbol.iterator](); !(e = (o = i.next()).done); e = !0)(0, o.value)()
                            } catch (e) {
                                t = !0, r = e
                            } finally {
                                try {
                                    e || null == i.return || i.return()
                                } finally {
                                    if (t) throw r
                                }
                            }
                        }
                    }
                } : function(e) {
                    return function(t) {
                        var n = !0,
                            r = !1,
                            o = void 0;
                        try {
                            for (var i, a = e[Symbol.iterator](); !(n = (i = a.next()).done); n = !0) {
                                var s = i.value;
                                pN(s, t)
                            }
                        } catch (e) {
                            r = !0, o = e
                        } finally {
                            try {
                                n || null == a.return || a.return()
                            } finally {
                                if (r) throw o
                            }
                        }
                    }
                },
                pO = function(e) {
                    var t = e.headerComponent,
                        n = e.itemsContainerRef,
                        r = e.items,
                        o = e.renderItem,
                        i = e.getKey,
                        a = e.itemGapClassName,
                        s = e.isNewScrollArrowsEnabled,
                        l = e.scrollButtonsEnabled,
                        u = e.containerClassName,
                        c = e.scrollContainerStyle,
                        d = (0, tl.useRef)(null),
                        f = ts((0, tl.useState)(!0), 2),
                        h = f[0],
                        p = f[1],
                        v = ts((0, tl.useState)(!1), 2),
                        m = v[0],
                        g = v[1],
                        y = (0, tl.useCallback)(function() {
                            var e = d.current;
                            if (!e) {
                                p(!0), g(!0);
                                return
                            }
                            var t = e.scrollWidth - e.clientWidth,
                                n = e.scrollLeft;
                            p(n <= 0), g(n >= t)
                        }, []),
                        b = ts((0, tl.useMemo)(function() {
                            return oF(y, 100)
                        }, [y]), 2),
                        w = b[0],
                        x = b[1];
                    (0, tl.useEffect)(function() {
                        var e = d.current;
                        if (e) {
                            var t = new ResizeObserver(function() {
                                y()
                            });
                            return e.addEventListener("scroll", w), t.observe(e), y(),
                                function() {
                                    e && e.removeEventListener("scroll", w), t.disconnect(), x()
                                }
                        }
                    }, [y, w, x]);
                    var S = (0, tl.useMemo)(function() {
                        return function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                                r = n.signal,
                                o = n.edges,
                                i = null,
                                a = function(e, t) {
                                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                                        r = n.signal,
                                        o = n.edges,
                                        i = void 0,
                                        a = null,
                                        s = null != o && o.includes("leading"),
                                        l = null == o || o.includes("trailing"),
                                        u = function() {
                                            null !== a && (e.apply(i, a), i = void 0, a = null)
                                        },
                                        c = function() {
                                            l && u(), p()
                                        },
                                        d = null,
                                        f = function() {
                                            null != d && clearTimeout(d), d = setTimeout(function() {
                                                d = null, c()
                                            }, t)
                                        },
                                        h = function() {
                                            null !== d && (clearTimeout(d), d = null)
                                        },
                                        p = function() {
                                            h(), i = void 0, a = null
                                        },
                                        v = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            if (null == r || !r.aborted) {
                                                i = this, a = t;
                                                var o = null == d;
                                                f(), s && o && u()
                                            }
                                        };
                                    return v.schedule = f, v.cancel = p, v.flush = function() {
                                        u()
                                    }, null == r || r.addEventListener("abort", p, {
                                        once: !0
                                    }), v
                                }(function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    i = Date.now(), e.apply(this, n)
                                }, t, {
                                    signal: r,
                                    edges: void 0 === o ? ["leading", "trailing"] : o
                                }),
                                s = function() {
                                    for (var n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                                    if (null == i && (i = Date.now()), Date.now() - i >= t) {
                                        i = Date.now(), e.apply(this, r), a.cancel(), a.schedule();
                                        return
                                    }
                                    a.apply(this, r)
                                };
                            return s.cancel = a.cancel, s.flush = a.flush, s
                        }(function(e) {
                            var t = d.current;
                            t && t.scrollBy({
                                left: e * t.clientWidth,
                                behavior: "smooth"
                            })
                        }, 300, {
                            edges: ["leading"]
                        })
                    }, []);
                    (0, tl.useEffect)(function() {
                        return function() {
                            S.cancel()
                        }
                    }, [S]);
                    var E = (0, tl.useCallback)(function() {
                            S(-1)
                        }, [S]),
                        I = (0, tl.useCallback)(function() {
                            S(1)
                        }, [S]),
                        T = (0, tl.useMemo)(function() {
                            return r.map(function(e, t) {
                                return (0, e8.jsx)("div", {
                                    className: "shrink-0",
                                    style: {
                                        scrollSnapAlign: "start"
                                    },
                                    children: o(e, t)
                                }, i(e, t))
                            })
                        }, [r, o, i]),
                        C = (0, e8.jsxs)("div", {
                            className: oz()("relative", u),
                            children: [(0, e8.jsx)("div", {
                                ref: pR([d, n]),
                                "data-testid": "variable-item-width-scroll-container",
                                className: oz()(a, "flex scroll-x [scroll-snap-type:x_mandatory] [-webkit-overflow-scrolling:touch] [-ms-overflow-style:none] [&::-webkit-scrollbar]:hidden [@media(pointer:coarse)_and_(not_(any-pointer:fine))]:[scroll-snap-type:none] [scrollbar-width:none]"),
                                style: td({
                                    scrollPaddingLeft: s ? "0px" : "".concat(rK.scrollerWidth, "px")
                                }, null != c ? c : {}),
                                children: T
                            }), void 0 === l || l ? (0, e8.jsx)(sC, {
                                hideScrollBackWhenDisabled: !0,
                                isScrollBackDisabled: h,
                                isScrollForwardDisabled: m,
                                onScrollBack: E,
                                onScrollForward: I,
                                isNewScrollArrowsEnabled: s
                            }) : null]
                        });
                    return t ? (0, e8.jsxs)("div", {
                        className: "flex flex-col",
                        children: [t, C]
                    }) : C
                },
                pk = function(e, t, n, r, o, i, a) {
                    var s, l = (0, tl.useCallback)(function(e) {
                            if (t && t.length > 0) {
                                var s, l = e.filter(function(e) {
                                        return e < t.length
                                    }),
                                    u = os(a);
                                return td((tc(s = {}, rQ.Context, rX(a)), tc(s, rQ.ComponentType, o), tc(s, rQ.SortId, n), tc(s, rQ.SortPos, r + 1), tc(s, rQ.QueryTexts, l.map(function(e) {
                                    var n, r;
                                    return null != (n = null == (r = t[e]) ? void 0 : r.query) ? n : "0"
                                })), tc(s, rQ.AbsPositions, l.map(function(e) {
                                    return e + 1
                                })), s), u && i && tc({}, u, i))
                            }
                        }, [t, n, r, o, i, a]),
                        u = (0, tl.useCallback)(function(e) {
                            var t = l(e);
                            if (void 0 !== t) {
                                var n = ts(r3.queryImpressions(t), 2),
                                    r = n[0],
                                    o = n[1];
                                (0, rN.sendEvent)(r, o)
                            } else ty("SearchPillCarouselImpressionsUndefinedError")
                        }, [l]);
                    rA(e, null != (s = null == t ? void 0 : t.length) ? s : 0, u)
                },
                pM = function(e, t) {
                    return "".concat(e.query, "-").concat(t)
                },
                pL = function(e) {
                    var t, n, r = e.sort,
                        o = e.positionId,
                        i = e.isNewScrollArrowsEnabled,
                        a = e.isNewSortHeaderEnabled,
                        s = e.NewSortHeader,
                        l = e.translate,
                        u = (0, tl.useContext)(oM),
                        c = (0, tl.useRef)(null),
                        d = rU.SearchLandingPage;
                    pk(c, r.queries, r.sortId, o, null == (t = r.topicLayoutData) ? void 0 : t.componentType, u, d);
                    var f = (0, tl.useCallback)(function(e, t) {
                            var n, i, a = os(d),
                                s = null == (n = r.topicLayoutData) ? void 0 : n.componentType,
                                l = ts(r3.querySuggestionClicked(td((tc(i = {}, rQ.Pos, t + 1), tc(i, rQ.QueryText, e), tc(i, rQ.ComponentType, s), tc(i, rQ.SortPos, o + 1), tc(i, rQ.SortId, r.sortId), tc(i, rQ.Context, rX(d)), i), a && u && tc({}, a, u))), 2),
                                c = l[0],
                                f = l[1];
                            (0, rN.sendEvent)(c, f)
                        }, [o, u, null == (n = r.topicLayoutData) ? void 0 : n.componentType, r.sortId, d]),
                        h = (0, tl.useCallback)(function(e, t) {
                            return (0, e8.jsx)(p_, {
                                queryText: e.query,
                                index: t,
                                onClick: f
                            })
                        }, [f]),
                        p = (0, e8.jsx)(sE, {
                            sortTitle: r.topic,
                            isNewSortHeaderEnabled: a,
                            NewSortHeader: s,
                            hideSeeAll: !0,
                            titleContainerClassName: "padding-bottom-small",
                            seeAllLink: void 0,
                            subtitleLink: void 0,
                            shouldShowSeparateSubtitleLink: !1,
                            isSortLinkOverrideEnabled: !1,
                            shouldShowSponsoredTooltip: !1,
                            translate: l
                        });
                    return (0, e8.jsx)(pO, {
                        items: r.queries,
                        renderItem: h,
                        getKey: pM,
                        itemGapClassName: "gap-small",
                        containerClassName: "search-pill-carousel-container padding-bottom-large",
                        isNewScrollArrowsEnabled: i,
                        headerComponent: p,
                        itemsContainerRef: c
                    })
                },
                pD = function(e) {
                    var t = e.sort,
                        n = e.positionId,
                        r = e.friendsPresenceData,
                        o = e.translate,
                        i = oD().contentMetadata,
                        a = t.treatmentType === rf.Carousel && "games" in t,
                        s = (0, tl.useMemo)(function() {
                            return a ? o_(t, i) : []
                        }, [a, t, i]);
                    return a ? 0 === s.length ? null : (0, e8.jsx)(pv, {
                        sort: t,
                        gameData: s,
                        translate: o,
                        positionId: n,
                        itemsPerRow: 5,
                        friendsPresenceData: r
                    }, t.topic) : t.treatmentType === rf.SearchPillCarousel && t.queries.length > 0 ? (0, e8.jsx)(pL, {
                        sort: t,
                        positionId: n,
                        translate: o
                    }) : null
                },
                pB = window.Roblox["core-scripts"].meta.device,
                pj = function() {
                    return (0, e8.jsxs)("div", {
                        className: "grid-item-container game-card-container game-card-loading",
                        children: [(0, e8.jsx)("div", {
                            className: "game-card-thumb-container shimmer"
                        }), (0, e8.jsx)("div", {
                            className: "game-card-name game-name-title shimmer"
                        }), (0, e8.jsx)("div", {
                            className: "game-card-name game-name-title game-name-title-half shimmer"
                        })]
                    })
                },
                pF = function() {
                    var e, t, n, r, o, i = ra("Feature.Recommendations"),
                        a = (0, tl.useCallback)(function(e, t) {
                            return i.has(e) ? i.dynamic(e, t) : ""
                        }, [i]),
                        s = ts((0, tl.useState)(!1), 2),
                        l = s[0],
                        u = s[1],
                        c = ts((0, tl.useState)(), 2),
                        d = c[0],
                        f = c[1],
                        h = ts((0, tl.useState)(void 0), 2),
                        p = h[0],
                        v = h[1],
                        m = ts((0, tl.useState)(!1), 2),
                        g = m[0],
                        y = m[1],
                        b = ts((0, tl.useState)(!1), 2),
                        w = b[0],
                        x = b[1],
                        S = (0, tl.useRef)(!1),
                        E = (t = (e = ts((0, tl.useState)({}), 2))[0], n = e[1], r = (0, tl.useRef)(t), o = function(e) {
                            (e.detail || []).forEach(function(e) {
                                r.current[e.userId] && (r.current[e.userId] = tb(td({}, r.current[e.userId]), {
                                    presence: e
                                }))
                            }), n(td({}, r.current))
                        }, (0, tl.useEffect)(function() {
                            return nR(function() {
                                    var e, t, i, a, s;
                                    return nO(this, function(l) {
                                        switch (l.label) {
                                            case 0:
                                                if (!((null == (t = (0, pB.getDeviceMeta)()) ? void 0 : t.deviceType) === pB.DeviceTypes.computer && (null == (e = (0, rB.authenticatedUser)()) ? void 0 : e.isAuthenticated))) return [3, 5];
                                                l.label = 1;
                                            case 1:
                                                return l.trys.push([1, 4, , 5]), [4, sQ()];
                                            case 2:
                                                var u;
                                                if (0 === (a = (i = l.sent().userData) ? i.map(function(e) {
                                                        return e.id
                                                    }) : []).length) return [2];
                                                return [4, (u = a, nR(function() {
                                                    var e, t;
                                                    return nO(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return e = {
                                                                    url: "".concat(th().apiGatewayUrl, "/user-profile-api/v1/user/profiles/get-profiles"),
                                                                    retryable: !0,
                                                                    withCredentials: !0
                                                                }, t = {
                                                                    userIds: u,
                                                                    fields: ["names.combinedName", "names.username"]
                                                                }, [4, rs.post(e, t)];
                                                            case 1:
                                                                return [2, n.sent().data]
                                                        }
                                                    })
                                                })())];
                                            case 3:
                                                return s = l.sent().profileDetails, r.current = (i || []).reduce(function(e, t) {
                                                    var n = s.find(function(e) {
                                                        return e.userId === t.id
                                                    });
                                                    return n && (e[t.id] = tb(td({}, t), {
                                                        displayName: n.names.combinedName,
                                                        name: n.names.username
                                                    })), e
                                                }, {}), n(td({}, r.current)), document.addEventListener("Roblox.Presence.Update", o), [3, 5];
                                            case 4:
                                                return console.error("useFriendsPresence failed to initialized with the error", l.sent()), [3, 5];
                                            case 5:
                                                return [2]
                                        }
                                    })
                                })(),
                                function() {
                                    document.removeEventListener("Roblox.Presence.Update", o)
                                }
                        }, []), Object.values(t));
                    (0, tl.useEffect)(function() {
                        var e = function(e) {
                                (0, to._)(e, CustomEvent) && e.type === tn.UpdateSearchSessionInfo && f(e.detail.sessionInfo)
                            },
                            t = function(e) {
                                (0, to._)(e, CustomEvent) && e.type === tn.ShowSearchLanding && (f(e.detail.sessionInfo), u(!0))
                            };
                        return window.addEventListener(tn.UpdateSearchSessionInfo, e), window.addEventListener(tn.ShowSearchLanding, t),
                            function() {
                                window.removeEventListener(tn.UpdateSearchSessionInfo, e), window.removeEventListener(tn.ShowSearchLanding, t)
                            }
                    }, []);
                    var I = (0, tl.useCallback)(function() {
                        var e, t;
                        d ? (x(!0), (e = d, t = oh(), nR(function() {
                            var n;
                            return nO(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return n = td({
                                            sessionId: e
                                        }, t), [4, rs.get(rd.url.getSearchLandingPage, n)];
                                    case 1:
                                        return [2, r.sent().data]
                                }
                            })
                        })()).then(function(e) {
                            ty("SearchLandingPageFetchRecommendationsSuccess");
                            var t = oR(e);
                            t.sorts.forEach(function(e) {
                                e.treatmentType !== rf.Carousel && e.treatmentType !== rf.SearchPillCarousel && ty("SearchLandingPageUnexpectedTreatmentTypeError")
                            }), v(t), y(function(e) {
                                var n, r = null != (n = null == t ? void 0 : t.sorts.some(function(e) {
                                    return e.treatmentType === rf.Carousel && e.games.length > 0 || e.treatmentType === rf.SearchPillCarousel && e.queries.length > 0
                                })) && n;
                                return e !== r && r ? (S.current = !0, !0) : e
                            })
                        }).catch(function() {
                            ty("SearchLandingPageFetchRecommendationsError"), v(void 0)
                        }).finally(function() {
                            x(!1)
                        })) : ty("SearchLandingPageMissingSessionInfoError")
                    }, [d]);
                    return ((0, tl.useEffect)(function() {
                        l && I()
                    }, [I, l]), (0, tl.useEffect)(function() {
                        S.current && (tr.setSearchLandingHasContent(), S.current = !1)
                    }, [g]), l) ? w && !p ? (0, e8.jsxs)("div", {
                        "data-testid": "SearchLandingPageLoadingTestId",
                        className: "search-landing-container",
                        role: "presentation",
                        onMouseDown: function(e) {
                            e.preventDefault()
                        },
                        children: [(0, e8.jsx)("div", {
                            className: "search-landing-loading-title shimmer"
                        }), (0, e8.jsx)("div", {
                            className: "search-landing-loading-carousel",
                            children: Array.from({
                                length: 5
                            }, function(e, t) {
                                return (0, e8.jsx)(pj, {}, t)
                            })
                        })]
                    }) : g && p ? (0, e8.jsx)(oM.Provider, {
                        value: d,
                        children: (0, e8.jsx)("section", {
                            "data-testid": "SearchLandingPageOmniFeedTestId",
                            className: "search-landing-container",
                            role: "presentation",
                            onMouseDown: function(e) {
                                e.preventDefault()
                            },
                            children: p.sorts.map(function(e, t) {
                                return (0, e8.jsx)(pD, {
                                    translate: a,
                                    sort: e,
                                    positionId: t,
                                    friendsPresenceData: E
                                }, t)
                            })
                        })
                    }) : null : null
                };
            o(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(o(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var pH = o(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(o(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                pU = o(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(o(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            o(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(o(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var pz = new Map([
                    ["zh_cjv", "zh_cn"]
                ]),
                pG = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                pV = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = ts(e, 2),
                            n = t[0],
                            r = t[1];
                        return null == r ? [] : [
                            [n_(n), r]
                        ]
                    }))
                },
                pW = function(e) {
                    var t = pG(),
                        n = t.Lang,
                        r = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [n_(e), td({}, pV(null == o ? void 0 : o[e]), pV(null == n ? void 0 : n[e]), pV(null == r ? void 0 : r[e]))]
                    }))
                },
                pK = function(e) {
                    var t, n, r = e.namespaces,
                        o = e.locale,
                        i = e.children,
                        a = r.join(","),
                        s = (0, tl.useMemo)(function() {
                            return pW(r)
                        }, [a]);
                    return (0, e8.jsx)(nw, {
                        locale: null != o ? o : null != (t = null != (n = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, op.arrayIncludes)(pU, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? n : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if ((0, to._)(t, HTMLMetaElement)) {
                                var n = t.dataset.languageCode;
                                if (n) {
                                    var r = null != (e = pz.get(n)) ? e : n;
                                    if ((0, op.arrayIncludes)(pH, r)) return r.replace("_", "-")
                                }
                            }
                        }()) ? t : "en-us",
                        messages: s,
                        children: i
                    })
                },
                pq = JSON.parse('{"P":["Feature.Recommendations","Feature.RobloxSubscription","Feature.AccountSettings","Feature.ProfileBadges","Feature.PlacesList","CommonUI.Controls"]}'),
                pX = o(pq.P).concat(o(["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding", "Feature.Build", "Feature.Friends"]));
            window.Roblox.SearchLandingService = tr, e7()(function() {
                window.addEventListener(tr.ModalEvent.MountSearchLanding, function() {
                    ! function() {
                        var e, t = document.getElementById("search-landing-root");
                        if (null === t) {
                            null == (e = window.EventTracker) || e.fireEvent("SearchLandingPageMountError");
                            return
                        }(0, te.renderWithErrorBoundary)((0, e8.jsx)(pK, {
                            namespaces: pX,
                            children: (0, e8.jsx)(te.TranslationProvider, {
                                config: pq.P,
                                children: (0, e8.jsx)(tt.QueryClientProvider, {
                                    client: te.queryClient,
                                    children: (0, e8.jsx)(pF, {})
                                })
                            })
                        }), t)
                    }()
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "SearchLandingPage");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/searchLandingPage-0526e1de640bcb07.js.map