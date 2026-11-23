! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "79853c1c0f3bde80aa104481cf01f6c76848fb31"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "c4d57190-fdf5-42c0-b02f-ff61987e0c47", e._sentryDebugIdIdentifier = "sentry-dbid-c4d57190-fdf5-42c0-b02f-ff61987e0c47")
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
                    var t = c(e),
                        n = t[0],
                        r = t[1];
                    return (n + r) * 3 / 4 - r
                }, t.toByteArray = function(e) {
                    var t, n, o = c(e),
                        a = o[0],
                        u = o[1],
                        s = new i((a + u) * 3 / 4 - u),
                        l = 0,
                        f = u > 0 ? a - 4 : a;
                    for (n = 0; n < f; n += 4) t = r[e.charCodeAt(n)] << 18 | r[e.charCodeAt(n + 1)] << 12 | r[e.charCodeAt(n + 2)] << 6 | r[e.charCodeAt(n + 3)], s[l++] = t >> 16 & 255, s[l++] = t >> 8 & 255, s[l++] = 255 & t;
                    return 2 === u && (t = r[e.charCodeAt(n)] << 2 | r[e.charCodeAt(n + 1)] >> 4, s[l++] = 255 & t), 1 === u && (t = r[e.charCodeAt(n)] << 10 | r[e.charCodeAt(n + 1)] << 4 | r[e.charCodeAt(n + 2)] >> 2, s[l++] = t >> 8 & 255, s[l++] = 255 & t), s
                }, t.fromByteArray = function(e) {
                    for (var t, r = e.length, i = r % 3, o = [], a = 0, u = r - i; a < u; a += 16383) o.push(function(e, t, r) {
                        for (var i, o = [], a = t; a < r; a += 3) i = (e[a] << 16 & 0xff0000) + (e[a + 1] << 8 & 65280) + (255 & e[a + 2]), o.push(n[i >> 18 & 63] + n[i >> 12 & 63] + n[i >> 6 & 63] + n[63 & i]);
                        return o.join("")
                    }(e, a, a + 16383 > u ? u : a + 16383));
                    return 1 === i ? o.push(n[(t = e[r - 1]) >> 2] + n[t << 4 & 63] + "==") : 2 === i && o.push(n[(t = (e[r - 2] << 8) + e[r - 1]) >> 10] + n[t >> 4 & 63] + n[t << 2 & 63] + "="), o.join("")
                };
                for (var n = [], r = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, o = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", a = 0, u = o.length; a < u; ++a) n[a] = o[a], r[o.charCodeAt(a)] = a;

                function c(e) {
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
                    i = n(844),
                    o = n(742),
                    a = n(619),
                    u = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function c(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, s.prototype), t
                }

                function s(e, t, n) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return h(e)
                    }
                    return l(e, t, n)
                }

                function l(e, t, n) {
                    if ("string" == typeof e) {
                        var r = e,
                            o = t;
                        if (("string" != typeof o || "" === o) && (o = "utf8"), !s.isEncoding(o)) throw TypeError("Unknown encoding: " + o);
                        var a = 0 | g(r, o),
                            u = c(a),
                            l = u.write(r, o);
                        return l !== a && (u = u.slice(0, l)), u
                    }
                    if (ArrayBuffer.isView(e)) {
                        var f = e;
                        if (k(f, Uint8Array)) {
                            var h = new Uint8Array(f);
                            return p(h.buffer, h.byteOffset, h.byteLength)
                        }
                        return d(f)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : i._(e)));
                    if (k(e, ArrayBuffer) || e && k(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (k(e, SharedArrayBuffer) || e && k(e.buffer, SharedArrayBuffer))) return p(e, t, n);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var m = e.valueOf && e.valueOf();
                    if (null != m && m !== e) return s.from(m, t, n);
                    var y = function(e) {
                        if (s.isBuffer(e)) {
                            var t = 0 | v(e.length),
                                n = c(t);
                            return 0 === n.length || e.copy(n, 0, 0, t), n
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? c(0) : d(e) : "Buffer" === e.type && Array.isArray(e.data) ? d(e.data) : void 0
                    }(e);
                    if (y) return y;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return s.from(e[Symbol.toPrimitive]("string"), t, n);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : i._(e)))
                }

                function f(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function h(e) {
                    return f(e), c(e < 0 ? 0 : 0 | v(e))
                }

                function d(e) {
                    for (var t = e.length < 0 ? 0 : 0 | v(e.length), n = c(t), r = 0; r < t; r += 1) n[r] = 255 & e[r];
                    return n
                }

                function p(e, t, n) {
                    var r;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (n || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(r = void 0 === t && void 0 === n ? new Uint8Array(e) : void 0 === n ? new Uint8Array(e, t) : new Uint8Array(e, t, n), s.prototype), r
                }

                function v(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function g(e, t) {
                    if (s.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || k(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + (void 0 === e ? "undefined" : i._(e)));
                    var n = e.length,
                        r = arguments.length > 2 && !0 === arguments[2];
                    if (!r && 0 === n) return 0;
                    for (var o = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return n;
                        case "utf8":
                        case "utf-8":
                            return N(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * n;
                        case "hex":
                            return n >>> 1;
                        case "base64":
                            return O(e).length;
                        default:
                            if (o) return r ? -1 : N(e).length;
                            t = ("" + t).toLowerCase(), o = !0
                    }
                }

                function m(e, t, n) {
                    var r, i, a, u = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === n || n > this.length) && (n = this.length), n <= 0 || (n >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, n) {
                                var r = e.length;
                                (!t || t < 0) && (t = 0), (!n || n < 0 || n > r) && (n = r);
                                for (var i = "", o = t; o < n; ++o) i += C[e[o]];
                                return i
                            }(this, t, n);
                        case "utf8":
                        case "utf-8":
                            return w(this, t, n);
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
                            return r = this, i = t, a = n, 0 === i && a === r.length ? o.fromByteArray(r) : o.fromByteArray(r.slice(i, a));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, n) {
                                for (var r = e.slice(t, n), i = "", o = 0; o < r.length - 1; o += 2) i += String.fromCharCode(r[o] + 256 * r[o + 1]);
                                return i
                            }(this, t, n);
                        default:
                            if (u) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), u = !0
                    }
                }

                function y(e, t, n) {
                    var r = e[t];
                    e[t] = e[n], e[n] = r
                }

                function b(e, t, n, r, i) {
                    var o;
                    if (0 === e.length) return -1;
                    if ("string" == typeof n ? (r = n, n = 0) : n > 0x7fffffff ? n = 0x7fffffff : n < -0x80000000 && (n = -0x80000000), (o = n *= 1) != o && (n = i ? 0 : e.length - 1), n < 0 && (n = e.length + n), n >= e.length)
                        if (i) return -1;
                        else n = e.length - 1;
                    else if (n < 0)
                        if (!i) return -1;
                        else n = 0;
                    if ("string" == typeof t && (t = s.from(t, r)), s.isBuffer(t)) return 0 === t.length ? -1 : _(e, t, n, r, i);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (i) return Uint8Array.prototype.indexOf.call(e, t, n);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, n);
                        return _(e, [t], n, r, i)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function _(e, t, n, r, i) {
                    var o, a = 1,
                        u = e.length,
                        c = t.length;
                    if (void 0 !== r && ("ucs2" === (r = String(r).toLowerCase()) || "ucs-2" === r || "utf16le" === r || "utf-16le" === r)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        a = 2, u /= 2, c /= 2, n /= 2
                    }

                    function s(e, t) {
                        return 1 === a ? e[t] : e.readUInt16BE(t * a)
                    }
                    if (i) {
                        var l = -1;
                        for (o = n; o < u; o++)
                            if (s(e, o) === s(t, -1 === l ? 0 : o - l)) {
                                if (-1 === l && (l = o), o - l + 1 === c) return l * a
                            } else - 1 !== l && (o -= o - l), l = -1
                    } else
                        for (n + c > u && (n = u - c), o = n; o >= 0; o--) {
                            for (var f = !0, h = 0; h < c; h++)
                                if (s(e, o + h) !== s(t, h)) {
                                    f = !1;
                                    break
                                } if (f) return o
                        }
                    return -1
                }

                function w(e, t, n) {
                    n = Math.min(e.length, n);
                    for (var r = [], i = t; i < n;) {
                        var o, a, u, c, s = e[i],
                            l = null,
                            f = s > 239 ? 4 : s > 223 ? 3 : s > 191 ? 2 : 1;
                        if (i + f <= n) switch (f) {
                            case 1:
                                s < 128 && (l = s);
                                break;
                            case 2:
                                (192 & (o = e[i + 1])) == 128 && (c = (31 & s) << 6 | 63 & o) > 127 && (l = c);
                                break;
                            case 3:
                                o = e[i + 1], a = e[i + 2], (192 & o) == 128 && (192 & a) == 128 && (c = (15 & s) << 12 | (63 & o) << 6 | 63 & a) > 2047 && (c < 55296 || c > 57343) && (l = c);
                                break;
                            case 4:
                                o = e[i + 1], a = e[i + 2], u = e[i + 3], (192 & o) == 128 && (192 & a) == 128 && (192 & u) == 128 && (c = (15 & s) << 18 | (63 & o) << 12 | (63 & a) << 6 | 63 & u) > 65535 && c < 1114112 && (l = c)
                        }
                        null === l ? (l = 65533, f = 1) : l > 65535 && (l -= 65536, r.push(l >>> 10 & 1023 | 55296), l = 56320 | 1023 & l), r.push(l), i += f
                    }
                    var h = r,
                        d = h.length;
                    if (d <= 4096) return String.fromCharCode.apply(String, h);
                    for (var p = "", v = 0; v < d;) p += String.fromCharCode.apply(String, h.slice(v, v += 4096));
                    return p
                }

                function E(e, t, n) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > n) throw RangeError("Trying to access beyond buffer length")
                }

                function A(e, t, n, r, i, o) {
                    if (!s.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > i || t < o) throw RangeError('"value" argument is out of bounds');
                    if (n + r > e.length) throw RangeError("Index out of range")
                }

                function x(e, t, n, r, i, o) {
                    if (n + r > e.length || n < 0) throw RangeError("Index out of range")
                }

                function S(e, t, n, r, i) {
                    return t *= 1, n >>>= 0, i || x(e, t, n, 4, 34028234663852886e22, -34028234663852886e22), a.write(e, t, n, r, 23, 4), n + 4
                }

                function B(e, t, n, r, i) {
                    return t *= 1, n >>>= 0, i || x(e, t, n, 8, 17976931348623157e292, -17976931348623157e292), a.write(e, t, n, r, 52, 8), n + 8
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
                    return l(e, t, n)
                }, Object.setPrototypeOf(s.prototype, Uint8Array.prototype), Object.setPrototypeOf(s, Uint8Array), s.alloc = function(e, t, n) {
                    return (f(e), e <= 0) ? c(e) : void 0 !== t ? "string" == typeof n ? c(e).fill(t, n) : c(e).fill(t) : c(e)
                }, s.allocUnsafe = function(e) {
                    return h(e)
                }, s.allocUnsafeSlow = function(e) {
                    return h(e)
                }, s.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== s.prototype
                }, s.compare = function(e, t) {
                    if (k(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), k(t, Uint8Array) && (t = s.from(t, t.offset, t.byteLength)), !s.isBuffer(e) || !s.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var n = e.length, r = t.length, i = 0, o = Math.min(n, r); i < o; ++i)
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
                        var o = e[n];
                        if (k(o, Uint8Array)) i + o.length > r.length ? s.from(o).copy(r, i) : Uint8Array.prototype.set.call(r, o, i);
                        else if (s.isBuffer(o)) o.copy(r, i);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        i += o.length
                    }
                    return r
                }, s.byteLength = g, s.prototype._isBuffer = !0, s.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) y(this, t, t + 1);
                    return this
                }, s.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) y(this, t, t + 3), y(this, t + 1, t + 2);
                    return this
                }, s.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) y(this, t, t + 7), y(this, t + 1, t + 6), y(this, t + 2, t + 5), y(this, t + 3, t + 4);
                    return this
                }, s.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? w(this, 0, e) : m.apply(this, arguments)
                }, s.prototype.toLocaleString = s.prototype.toString, s.prototype.equals = function(e) {
                    if (!s.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === s.compare(this, e)
                }, s.prototype.inspect = function() {
                    var e = "",
                        n = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, n).replace(/(.{2})/g, "$1 ").trim(), this.length > n && (e += " ... "), "<Buffer " + e + ">"
                }, u && (s.prototype[u] = s.prototype.inspect), s.prototype.compare = function(e, t, n, r, o) {
                    if (k(e, Uint8Array) && (e = s.from(e, e.offset, e.byteLength)), !s.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : i._(e)));
                    if (void 0 === t && (t = 0), void 0 === n && (n = e ? e.length : 0), void 0 === r && (r = 0), void 0 === o && (o = this.length), t < 0 || n > e.length || r < 0 || o > this.length) throw RangeError("out of range index");
                    if (r >= o && t >= n) return 0;
                    if (r >= o) return -1;
                    if (t >= n) return 1;
                    if (t >>>= 0, n >>>= 0, r >>>= 0, o >>>= 0, this === e) return 0;
                    for (var a = o - r, u = n - t, c = Math.min(a, u), l = this.slice(r, o), f = e.slice(t, n), h = 0; h < c; ++h)
                        if (l[h] !== f[h]) {
                            a = l[h], u = f[h];
                            break
                        } return a < u ? -1 : +(u < a)
                }, s.prototype.includes = function(e, t, n) {
                    return -1 !== this.indexOf(e, t, n)
                }, s.prototype.indexOf = function(e, t, n) {
                    return b(this, e, t, n, !0)
                }, s.prototype.lastIndexOf = function(e, t, n) {
                    return b(this, e, t, n, !1)
                }, s.prototype.write = function(e, t, n, r) {
                    if (void 0 === t) r = "utf8", n = this.length, t = 0;
                    else if (void 0 === n && "string" == typeof t) r = t, n = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(n) ? (n >>>= 0, void 0 === r && (r = "utf8")) : (r = n, n = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var i, o, a, u, c, s, l, f, h = this.length - t;
                    if ((void 0 === n || n > h) && (n = h), e.length > 0 && (n < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    r || (r = "utf8");
                    for (var d = !1;;) switch (r) {
                        case "hex":
                            return function(e, t, n, r) {
                                n = Number(n) || 0;
                                var i = e.length - n;
                                r ? (r = Number(r)) > i && (r = i) : r = i;
                                var o = t.length;
                                r > o / 2 && (r = o / 2);
                                for (var a = 0; a < r; ++a) {
                                    var u, c = parseInt(t.substr(2 * a, 2), 16);
                                    if ((u = c) != u) break;
                                    e[n + a] = c
                                }
                                return a
                            }(this, e, t, n);
                        case "utf8":
                        case "utf-8":
                            return i = t, o = n, I(N(e, this.length - i), this, i, o);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return a = t, u = n, I(function(e) {
                                for (var t = [], n = 0; n < e.length; ++n) t.push(255 & e.charCodeAt(n));
                                return t
                            }(e), this, a, u);
                        case "base64":
                            return c = t, s = n, I(O(e), this, c, s);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return l = t, f = n, I(function(e, t) {
                                for (var n, r, i = [], o = 0; o < e.length && !((t -= 2) < 0); ++o) r = (n = e.charCodeAt(o)) >> 8, i.push(n % 256), i.push(r);
                                return i
                            }(e, this.length - l), this, l, f);
                        default:
                            if (d) throw TypeError("Unknown encoding: " + r);
                            r = ("" + r).toLowerCase(), d = !0
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
                }, s.prototype.readUintLE = s.prototype.readUIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || E(e, t, this.length);
                    for (var r = this[e], i = 1, o = 0; ++o < t && (i *= 256);) r += this[e + o] * i;
                    return r
                }, s.prototype.readUintBE = s.prototype.readUIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || E(e, t, this.length);
                    for (var r = this[e + --t], i = 1; t > 0 && (i *= 256);) r += this[e + --t] * i;
                    return r
                }, s.prototype.readUint8 = s.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || E(e, 1, this.length), this[e]
                }, s.prototype.readUint16LE = s.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || E(e, 2, this.length), this[e] | this[e + 1] << 8
                }, s.prototype.readUint16BE = s.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || E(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, s.prototype.readUint32LE = s.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, s.prototype.readUint32BE = s.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, s.prototype.readIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || E(e, t, this.length);
                    for (var r = this[e], i = 1, o = 0; ++o < t && (i *= 256);) r += this[e + o] * i;
                    return r >= (i *= 128) && (r -= Math.pow(2, 8 * t)), r
                }, s.prototype.readIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || E(e, t, this.length);
                    for (var r = t, i = 1, o = this[e + --r]; r > 0 && (i *= 256);) o += this[e + --r] * i;
                    return o >= (i *= 128) && (o -= Math.pow(2, 8 * t)), o
                }, s.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || E(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, s.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || E(e, 2, this.length);
                    var n = this[e] | this[e + 1] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, s.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || E(e, 2, this.length);
                    var n = this[e + 1] | this[e] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, s.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, s.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, s.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), a.read(this, e, !0, 23, 4)
                }, s.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || E(e, 4, this.length), a.read(this, e, !1, 23, 4)
                }, s.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || E(e, 8, this.length), a.read(this, e, !0, 52, 8)
                }, s.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || E(e, 8, this.length), a.read(this, e, !1, 52, 8)
                }, s.prototype.writeUintLE = s.prototype.writeUIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n) - 1;
                        A(this, e, t, n, i, 0)
                    }
                    var o = 1,
                        a = 0;
                    for (this[t] = 255 & e; ++a < n && (o *= 256);) this[t + a] = e / o & 255;
                    return t + n
                }, s.prototype.writeUintBE = s.prototype.writeUIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n) - 1;
                        A(this, e, t, n, i, 0)
                    }
                    var o = n - 1,
                        a = 1;
                    for (this[t + o] = 255 & e; --o >= 0 && (a *= 256);) this[t + o] = e / a & 255;
                    return t + n
                }, s.prototype.writeUint8 = s.prototype.writeUInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, s.prototype.writeUint16LE = s.prototype.writeUInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeUint16BE = s.prototype.writeUInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeUint32LE = s.prototype.writeUInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, s.prototype.writeUint32BE = s.prototype.writeUInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n - 1);
                        A(this, e, t, n, i - 1, -i)
                    }
                    var o = 0,
                        a = 1,
                        u = 0;
                    for (this[t] = 255 & e; ++o < n && (a *= 256);) e < 0 && 0 === u && 0 !== this[t + o - 1] && (u = 1), this[t + o] = (e / a | 0) - u & 255;
                    return t + n
                }, s.prototype.writeIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n - 1);
                        A(this, e, t, n, i - 1, -i)
                    }
                    var o = n - 1,
                        a = 1,
                        u = 0;
                    for (this[t + o] = 255 & e; --o >= 0 && (a *= 256);) e < 0 && 0 === u && 0 !== this[t + o + 1] && (u = 1), this[t + o] = (e / a | 0) - u & 255;
                    return t + n
                }, s.prototype.writeInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, s.prototype.writeInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, s.prototype.writeInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, s.prototype.writeInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, s.prototype.writeInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || A(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, s.prototype.writeFloatLE = function(e, t, n) {
                    return S(this, e, t, !0, n)
                }, s.prototype.writeFloatBE = function(e, t, n) {
                    return S(this, e, t, !1, n)
                }, s.prototype.writeDoubleLE = function(e, t, n) {
                    return B(this, e, t, !0, n)
                }, s.prototype.writeDoubleBE = function(e, t, n) {
                    return B(this, e, t, !1, n)
                }, s.prototype.copy = function(e, t, n, r) {
                    if (!s.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (n || (n = 0), r || 0 === r || (r = this.length), t >= e.length && (t = e.length), t || (t = 0), r > 0 && r < n && (r = n), r === n || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (n < 0 || n >= this.length) throw RangeError("Index out of range");
                    if (r < 0) throw RangeError("sourceEnd out of bounds");
                    r > this.length && (r = this.length), e.length - t < r - n && (r = e.length - t + n);
                    var i = r - n;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, n, r) : Uint8Array.prototype.set.call(e, this.subarray(n, r), t), i
                }, s.prototype.fill = function(e, t, n, r) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (r = t, t = 0, n = this.length) : "string" == typeof n && (r = n, n = this.length), void 0 !== r && "string" != typeof r) throw TypeError("encoding must be a string");
                        if ("string" == typeof r && !s.isEncoding(r)) throw TypeError("Unknown encoding: " + r);
                        if (1 === e.length) {
                            var i, o = e.charCodeAt(0);
                            ("utf8" === r && o < 128 || "latin1" === r) && (e = o)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < n) throw RangeError("Out of range index");
                    if (n <= t) return this;
                    if (t >>>= 0, n = void 0 === n ? this.length : n >>> 0, e || (e = 0), "number" == typeof e)
                        for (i = t; i < n; ++i) this[i] = e;
                    else {
                        var a = s.isBuffer(e) ? e : s.from(e, r),
                            u = a.length;
                        if (0 === u) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (i = 0; i < n - t; ++i) this[i + t] = a[i % u]
                    }
                    return this
                };
                var T = /[^+/0-9A-Za-z-_]/g;

                function N(e, t) {
                    t = t || 1 / 0;
                    for (var n, r = e.length, i = null, o = [], a = 0; a < r; ++a) {
                        if ((n = e.charCodeAt(a)) > 55295 && n < 57344) {
                            if (!i) {
                                if (n > 56319 || a + 1 === r) {
                                    (t -= 3) > -1 && o.push(239, 191, 189);
                                    continue
                                }
                                i = n;
                                continue
                            }
                            if (n < 56320) {
                                (t -= 3) > -1 && o.push(239, 191, 189), i = n;
                                continue
                            }
                            n = (i - 55296 << 10 | n - 56320) + 65536
                        } else i && (t -= 3) > -1 && o.push(239, 191, 189);
                        if (i = null, n < 128) {
                            if ((t -= 1) < 0) break;
                            o.push(n)
                        } else if (n < 2048) {
                            if ((t -= 2) < 0) break;
                            o.push(n >> 6 | 192, 63 & n | 128)
                        } else if (n < 65536) {
                            if ((t -= 3) < 0) break;
                            o.push(n >> 12 | 224, n >> 6 & 63 | 128, 63 & n | 128)
                        } else if (n < 1114112) {
                            if ((t -= 4) < 0) break;
                            o.push(n >> 18 | 240, n >> 12 & 63 | 128, n >> 6 & 63 | 128, 63 & n | 128)
                        } else throw Error("Invalid code point")
                    }
                    return o
                }

                function O(e) {
                    return o.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(T, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function I(e, t, n, r) {
                    for (var i = 0; i < r && !(i + n >= t.length) && !(i >= e.length); ++i) t[i + n] = e[i];
                    return i
                }

                function k(e, t) {
                    return r._(e, t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var C = function() {
                    for (var e = "0123456789abcdef", t = Array(256), n = 0; n < 16; ++n)
                        for (var r = 16 * n, i = 0; i < 16; ++i) t[r + i] = e[n] + e[i];
                    return t
                }()
            },
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, n, r, i) {
                    var o, a, u = 8 * i - r - 1,
                        c = (1 << u) - 1,
                        s = c >> 1,
                        l = -7,
                        f = n ? i - 1 : 0,
                        h = n ? -1 : 1,
                        d = e[t + f];
                    for (f += h, o = d & (1 << -l) - 1, d >>= -l, l += u; l > 0; o = 256 * o + e[t + f], f += h, l -= 8);
                    for (a = o & (1 << -l) - 1, o >>= -l, l += r; l > 0; a = 256 * a + e[t + f], f += h, l -= 8);
                    if (0 === o) o = 1 - s;
                    else {
                        if (o === c) return a ? NaN : 1 / 0 * (d ? -1 : 1);
                        a += Math.pow(2, r), o -= s
                    }
                    return (d ? -1 : 1) * a * Math.pow(2, o - r)
                }, t.write = function(e, t, n, r, i, o) {
                    var a, u, c, s = 8 * o - i - 1,
                        l = (1 << s) - 1,
                        f = l >> 1,
                        h = 5960464477539062e-23 * (23 === i),
                        d = r ? 0 : o - 1,
                        p = r ? 1 : -1,
                        v = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (u = +!!isNaN(t), a = l) : (a = Math.floor(Math.log(t) / Math.LN2), t * (c = Math.pow(2, -a)) < 1 && (a--, c *= 2), a + f >= 1 ? t += h / c : t += h * Math.pow(2, 1 - f), t * c >= 2 && (a++, c /= 2), a + f >= l ? (u = 0, a = l) : a + f >= 1 ? (u = (t * c - 1) * Math.pow(2, i), a += f) : (u = t * Math.pow(2, f - 1) * Math.pow(2, i), a = 0)); i >= 8; e[n + d] = 255 & u, d += p, u /= 256, i -= 8);
                    for (a = a << i | u, s += i; s > 0; e[n + d] = 255 & a, d += p, a /= 256, s -= 8);
                    e[n + d - p] |= 128 * v
                }
            },
            689: function(e, t, n) {
                e = n.nmd(e);
                var r = n(784),
                    i = n(844);
                (function() {
                    var o, a = "Expected a function",
                        u = "__lodash_hash_undefined__",
                        c = "__lodash_placeholder__",
                        s = 1 / 0,
                        l = 0 / 0,
                        f = [
                            ["ary", 128],
                            ["bind", 1],
                            ["bindKey", 2],
                            ["curry", 8],
                            ["curryRight", 16],
                            ["flip", 512],
                            ["partial", 32],
                            ["partialRight", 64],
                            ["rearg", 256]
                        ],
                        h = "[object Arguments]",
                        d = "[object Array]",
                        p = "[object Boolean]",
                        v = "[object Date]",
                        g = "[object Error]",
                        m = "[object Function]",
                        y = "[object GeneratorFunction]",
                        b = "[object Map]",
                        _ = "[object Number]",
                        w = "[object Object]",
                        E = "[object Promise]",
                        A = "[object RegExp]",
                        x = "[object Set]",
                        S = "[object String]",
                        B = "[object Symbol]",
                        T = "[object WeakMap]",
                        N = "[object ArrayBuffer]",
                        O = "[object DataView]",
                        I = "[object Float32Array]",
                        k = "[object Float64Array]",
                        C = "[object Int8Array]",
                        R = "[object Int16Array]",
                        L = "[object Int32Array]",
                        M = "[object Uint8Array]",
                        j = "[object Uint8ClampedArray]",
                        P = "[object Uint16Array]",
                        H = "[object Uint32Array]",
                        D = /\b__p \+= '';/g,
                        U = /\b(__p \+=) '' \+/g,
                        F = /(__e\(.*?\)|\b__t\)) \+\n'';/g,
                        z = /&(?:amp|lt|gt|quot|#39);/g,
                        G = /[&<>"']/g,
                        V = RegExp(z.source),
                        W = RegExp(G.source),
                        K = /<%-([\s\S]+?)%>/g,
                        Z = /<%([\s\S]+?)%>/g,
                        X = /<%=([\s\S]+?)%>/g,
                        q = /\.|\[(?:[^[\]]*|(["'])(?:(?!\1)[^\\]|\\.)*?\1)\]/,
                        Y = /^\w*$/,
                        $ = /[^.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|$))/g,
                        J = /[\\^$.*+?()[\]{}|]/g,
                        Q = RegExp(J.source),
                        ee = /^\s+/,
                        et = /\s/,
                        en = /\{(?:\n\/\* \[wrapped with .+\] \*\/)?\n?/,
                        er = /\{\n\/\* \[wrapped with (.+)\] \*/,
                        ei = /,? & /,
                        eo = /[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+/g,
                        ea = /[()=,{}\[\]\/\s]/,
                        eu = /\\(\\)?/g,
                        ec = /\$\{([^\\}]*(?:\\.[^\\}]*)*)\}/g,
                        es = /\w*$/,
                        el = /^[-+]0x[0-9a-f]+$/i,
                        ef = /^0b[01]+$/i,
                        eh = /^\[object .+?Constructor\]$/,
                        ed = /^0o[0-7]+$/i,
                        ep = /^(?:0|[1-9]\d*)$/,
                        ev = /[\xc0-\xd6\xd8-\xf6\xf8-\xff\u0100-\u017f]/g,
                        eg = /($^)/,
                        em = /['\n\r\u2028\u2029\\]/g,
                        ey = "\\ud800-\\udfff",
                        eb = "\\u0300-\\u036f\\ufe20-\\ufe2f\\u20d0-\\u20ff",
                        e_ = "\\u2700-\\u27bf",
                        ew = "a-z\\xdf-\\xf6\\xf8-\\xff",
                        eE = "A-Z\\xc0-\\xd6\\xd8-\\xde",
                        eA = "\\ufe0e\\ufe0f",
                        ex = "\\xac\\xb1\\xd7\\xf7\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf\\u2000-\\u206f \\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000",
                        eS = "['’]",
                        eB = "[" + ex + "]",
                        eT = "[" + eb + "]",
                        eN = "[" + ew + "]",
                        eO = "[^" + ey + ex + "\\d+" + e_ + ew + eE + "]",
                        eI = "\\ud83c[\\udffb-\\udfff]",
                        ek = "[^" + ey + "]",
                        eC = "(?:\\ud83c[\\udde6-\\uddff]){2}",
                        eR = "[\\ud800-\\udbff][\\udc00-\\udfff]",
                        eL = "[" + eE + "]",
                        eM = "\\u200d",
                        ej = "(?:" + eN + "|" + eO + ")",
                        eP = "(?:" + eL + "|" + eO + ")",
                        eH = "(?:" + eS + "(?:d|ll|m|re|s|t|ve))?",
                        eD = "(?:" + eS + "(?:D|LL|M|RE|S|T|VE))?",
                        eU = "(?:" + eT + "|" + eI + ")?",
                        eF = "[" + eA + "]?",
                        ez = "(?:" + eM + "(?:" + [ek, eC, eR].join("|") + ")" + eF + eU + ")*",
                        eG = eF + eU + ez,
                        eV = "(?:" + ["[" + e_ + "]", eC, eR].join("|") + ")" + eG,
                        eW = "(?:" + [ek + eT + "?", eT, eC, eR, "[" + ey + "]"].join("|") + ")",
                        eK = RegExp(eS, "g"),
                        eZ = RegExp(eT, "g"),
                        eX = RegExp(eI + "(?=" + eI + ")|" + eW + eG, "g"),
                        eq = RegExp([eL + "?" + eN + "+" + eH + "(?=" + [eB, eL, "$"].join("|") + ")", eP + "+" + eD + "(?=" + [eB, eL + ej, "$"].join("|") + ")", eL + "?" + ej + "+" + eH, eL + "+" + eD, "\\d*(?:1ST|2ND|3RD|(?![123])\\dTH)(?=\\b|[a-z_])|\\d*(?:1st|2nd|3rd|(?![123])\\dth)(?=\\b|[A-Z_])|\\d+", eV].join("|"), "g"),
                        eY = RegExp("[" + eM + ey + eb + eA + "]"),
                        e$ = /[a-z][A-Z]|[A-Z]{2}[a-z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]/,
                        eJ = ["Array", "Buffer", "DataView", "Date", "Error", "Float32Array", "Float64Array", "Function", "Int8Array", "Int16Array", "Int32Array", "Map", "Math", "Object", "Promise", "RegExp", "Set", "String", "Symbol", "TypeError", "Uint8Array", "Uint8ClampedArray", "Uint16Array", "Uint32Array", "WeakMap", "_", "clearTimeout", "isFinite", "parseInt", "setTimeout"],
                        eQ = -1,
                        e0 = {};
                    e0[I] = e0[k] = e0[C] = e0[R] = e0[L] = e0[M] = e0[j] = e0[P] = e0[H] = !0, e0[h] = e0[d] = e0[N] = e0[p] = e0[O] = e0[v] = e0[g] = e0[m] = e0[b] = e0[_] = e0[w] = e0[A] = e0[x] = e0[S] = e0[T] = !1;
                    var e1 = {};
                    e1[h] = e1[d] = e1[N] = e1[O] = e1[p] = e1[v] = e1[I] = e1[k] = e1[C] = e1[R] = e1[L] = e1[b] = e1[_] = e1[w] = e1[A] = e1[x] = e1[S] = e1[B] = e1[M] = e1[j] = e1[P] = e1[H] = !0, e1[g] = e1[m] = e1[T] = !1;
                    var e2 = {
                            "\\": "\\",
                            "'": "'",
                            "\n": "n",
                            "\r": "r",
                            "\u2028": "u2028",
                            "\u2029": "u2029"
                        },
                        e3 = parseFloat,
                        e5 = parseInt,
                        e8 = (void 0 === n.g ? "undefined" : i._(n.g)) == "object" && n.g && n.g.Object === Object && n.g,
                        e6 = ("u" < typeof self ? "undefined" : i._(self)) == "object" && self && self.Object === Object && self,
                        e4 = e8 || e6 || Function("return this")(),
                        e7 = "object" == i._(t) && t && !t.nodeType && t,
                        e9 = e7 && "object" == i._(e) && e && !e.nodeType && e,
                        te = e9 && e9.exports === e7,
                        tt = te && e8.process,
                        tn = function() {
                            try {
                                var e = e9 && e9.require && e9.require("util").types;
                                if (e) return e;
                                return tt && tt.binding && tt.binding("util")
                            } catch (e) {}
                        }(),
                        tr = tn && tn.isArrayBuffer,
                        ti = tn && tn.isDate,
                        to = tn && tn.isMap,
                        ta = tn && tn.isRegExp,
                        tu = tn && tn.isSet,
                        tc = tn && tn.isTypedArray;

                    function ts(e, t, n) {
                        switch (n.length) {
                            case 0:
                                return e.call(t);
                            case 1:
                                return e.call(t, n[0]);
                            case 2:
                                return e.call(t, n[0], n[1]);
                            case 3:
                                return e.call(t, n[0], n[1], n[2])
                        }
                        return e.apply(t, n)
                    }

                    function tl(e, t, n, r) {
                        for (var i = -1, o = null == e ? 0 : e.length; ++i < o;) {
                            var a = e[i];
                            t(r, a, n(a), e)
                        }
                        return r
                    }

                    function tf(e, t) {
                        for (var n = -1, r = null == e ? 0 : e.length; ++n < r && !1 !== t(e[n], n, e););
                        return e
                    }

                    function th(e, t) {
                        for (var n = -1, r = null == e ? 0 : e.length; ++n < r;)
                            if (!t(e[n], n, e)) return !1;
                        return !0
                    }

                    function td(e, t) {
                        for (var n = -1, r = null == e ? 0 : e.length, i = 0, o = []; ++n < r;) {
                            var a = e[n];
                            t(a, n, e) && (o[i++] = a)
                        }
                        return o
                    }

                    function tp(e, t) {
                        return !!(null == e ? 0 : e.length) && tx(e, t, 0) > -1
                    }

                    function tv(e, t, n) {
                        for (var r = -1, i = null == e ? 0 : e.length; ++r < i;)
                            if (n(t, e[r])) return !0;
                        return !1
                    }

                    function tg(e, t) {
                        for (var n = -1, r = null == e ? 0 : e.length, i = Array(r); ++n < r;) i[n] = t(e[n], n, e);
                        return i
                    }

                    function tm(e, t) {
                        for (var n = -1, r = t.length, i = e.length; ++n < r;) e[i + n] = t[n];
                        return e
                    }

                    function ty(e, t, n, r) {
                        var i = -1,
                            o = null == e ? 0 : e.length;
                        for (r && o && (n = e[++i]); ++i < o;) n = t(n, e[i], i, e);
                        return n
                    }

                    function tb(e, t, n, r) {
                        var i = null == e ? 0 : e.length;
                        for (r && i && (n = e[--i]); i--;) n = t(n, e[i], i, e);
                        return n
                    }

                    function t_(e, t) {
                        for (var n = -1, r = null == e ? 0 : e.length; ++n < r;)
                            if (t(e[n], n, e)) return !0;
                        return !1
                    }
                    var tw = tN("length");

                    function tE(e, t, n) {
                        var r;
                        return n(e, function(e, n, i) {
                            if (t(e, n, i)) return r = n, !1
                        }), r
                    }

                    function tA(e, t, n, r) {
                        for (var i = e.length, o = n + (r ? 1 : -1); r ? o-- : ++o < i;)
                            if (t(e[o], o, e)) return o;
                        return -1
                    }

                    function tx(e, t, n) {
                        return t == t ? function(e, t, n) {
                            for (var r = n - 1, i = e.length; ++r < i;)
                                if (e[r] === t) return r;
                            return -1
                        }(e, t, n) : tA(e, tB, n)
                    }

                    function tS(e, t, n, r) {
                        for (var i = n - 1, o = e.length; ++i < o;)
                            if (r(e[i], t)) return i;
                        return -1
                    }

                    function tB(e) {
                        return e != e
                    }

                    function tT(e, t) {
                        var n = null == e ? 0 : e.length;
                        return n ? tk(e, t) / n : l
                    }

                    function tN(e) {
                        return function(t) {
                            return null == t ? o : t[e]
                        }
                    }

                    function tO(e) {
                        return function(t) {
                            return null == e ? o : e[t]
                        }
                    }

                    function tI(e, t, n, r, i) {
                        return i(e, function(e, i, o) {
                            n = r ? (r = !1, e) : t(n, e, i, o)
                        }), n
                    }

                    function tk(e, t) {
                        for (var n, r = -1, i = e.length; ++r < i;) {
                            var a = t(e[r]);
                            o !== a && (n = o === n ? a : n + a)
                        }
                        return n
                    }

                    function tC(e, t) {
                        for (var n = -1, r = Array(e); ++n < e;) r[n] = t(n);
                        return r
                    }

                    function tR(e) {
                        return e ? e.slice(0, tq(e) + 1).replace(ee, "") : e
                    }

                    function tL(e) {
                        return function(t) {
                            return e(t)
                        }
                    }

                    function tM(e, t) {
                        return tg(t, function(t) {
                            return e[t]
                        })
                    }

                    function tj(e, t) {
                        return e.has(t)
                    }

                    function tP(e, t) {
                        for (var n = -1, r = e.length; ++n < r && tx(t, e[n], 0) > -1;);
                        return n
                    }

                    function tH(e, t) {
                        for (var n = e.length; n-- && tx(t, e[n], 0) > -1;);
                        return n
                    }
                    var tD = tO({
                            À: "A",
                            Á: "A",
                            Â: "A",
                            Ã: "A",
                            Ä: "A",
                            Å: "A",
                            à: "a",
                            á: "a",
                            â: "a",
                            ã: "a",
                            ä: "a",
                            å: "a",
                            Ç: "C",
                            ç: "c",
                            Ð: "D",
                            ð: "d",
                            È: "E",
                            É: "E",
                            Ê: "E",
                            Ë: "E",
                            è: "e",
                            é: "e",
                            ê: "e",
                            ë: "e",
                            Ì: "I",
                            Í: "I",
                            Î: "I",
                            Ï: "I",
                            ì: "i",
                            í: "i",
                            î: "i",
                            ï: "i",
                            Ñ: "N",
                            ñ: "n",
                            Ò: "O",
                            Ó: "O",
                            Ô: "O",
                            Õ: "O",
                            Ö: "O",
                            Ø: "O",
                            ò: "o",
                            ó: "o",
                            ô: "o",
                            õ: "o",
                            ö: "o",
                            ø: "o",
                            Ù: "U",
                            Ú: "U",
                            Û: "U",
                            Ü: "U",
                            ù: "u",
                            ú: "u",
                            û: "u",
                            ü: "u",
                            Ý: "Y",
                            ý: "y",
                            ÿ: "y",
                            Æ: "Ae",
                            æ: "ae",
                            Þ: "Th",
                            þ: "th",
                            ß: "ss",
                            Ā: "A",
                            Ă: "A",
                            Ą: "A",
                            ā: "a",
                            ă: "a",
                            ą: "a",
                            Ć: "C",
                            Ĉ: "C",
                            Ċ: "C",
                            Č: "C",
                            ć: "c",
                            ĉ: "c",
                            ċ: "c",
                            č: "c",
                            Ď: "D",
                            Đ: "D",
                            ď: "d",
                            đ: "d",
                            Ē: "E",
                            Ĕ: "E",
                            Ė: "E",
                            Ę: "E",
                            Ě: "E",
                            ē: "e",
                            ĕ: "e",
                            ė: "e",
                            ę: "e",
                            ě: "e",
                            Ĝ: "G",
                            Ğ: "G",
                            Ġ: "G",
                            Ģ: "G",
                            ĝ: "g",
                            ğ: "g",
                            ġ: "g",
                            ģ: "g",
                            Ĥ: "H",
                            Ħ: "H",
                            ĥ: "h",
                            ħ: "h",
                            Ĩ: "I",
                            Ī: "I",
                            Ĭ: "I",
                            Į: "I",
                            İ: "I",
                            ĩ: "i",
                            ī: "i",
                            ĭ: "i",
                            į: "i",
                            ı: "i",
                            Ĵ: "J",
                            ĵ: "j",
                            Ķ: "K",
                            ķ: "k",
                            ĸ: "k",
                            Ĺ: "L",
                            Ļ: "L",
                            Ľ: "L",
                            Ŀ: "L",
                            Ł: "L",
                            ĺ: "l",
                            ļ: "l",
                            ľ: "l",
                            ŀ: "l",
                            ł: "l",
                            Ń: "N",
                            Ņ: "N",
                            Ň: "N",
                            Ŋ: "N",
                            ń: "n",
                            ņ: "n",
                            ň: "n",
                            ŋ: "n",
                            Ō: "O",
                            Ŏ: "O",
                            Ő: "O",
                            ō: "o",
                            ŏ: "o",
                            ő: "o",
                            Ŕ: "R",
                            Ŗ: "R",
                            Ř: "R",
                            ŕ: "r",
                            ŗ: "r",
                            ř: "r",
                            Ś: "S",
                            Ŝ: "S",
                            Ş: "S",
                            Š: "S",
                            ś: "s",
                            ŝ: "s",
                            ş: "s",
                            š: "s",
                            Ţ: "T",
                            Ť: "T",
                            Ŧ: "T",
                            ţ: "t",
                            ť: "t",
                            ŧ: "t",
                            Ũ: "U",
                            Ū: "U",
                            Ŭ: "U",
                            Ů: "U",
                            Ű: "U",
                            Ų: "U",
                            ũ: "u",
                            ū: "u",
                            ŭ: "u",
                            ů: "u",
                            ű: "u",
                            ų: "u",
                            Ŵ: "W",
                            ŵ: "w",
                            Ŷ: "Y",
                            ŷ: "y",
                            Ÿ: "Y",
                            Ź: "Z",
                            Ż: "Z",
                            Ž: "Z",
                            ź: "z",
                            ż: "z",
                            ž: "z",
                            Ĳ: "IJ",
                            ĳ: "ij",
                            Œ: "Oe",
                            œ: "oe",
                            ŉ: "'n",
                            ſ: "s"
                        }),
                        tU = tO({
                            "&": "&amp;",
                            "<": "&lt;",
                            ">": "&gt;",
                            '"': "&quot;",
                            "'": "&#39;"
                        });

                    function tF(e) {
                        return "\\" + e2[e]
                    }

                    function tz(e) {
                        return eY.test(e)
                    }

                    function tG(e) {
                        var t = -1,
                            n = Array(e.size);
                        return e.forEach(function(e, r) {
                            n[++t] = [r, e]
                        }), n
                    }

                    function tV(e, t) {
                        return function(n) {
                            return e(t(n))
                        }
                    }

                    function tW(e, t) {
                        for (var n = -1, r = e.length, i = 0, o = []; ++n < r;) {
                            var a = e[n];
                            (a === t || a === c) && (e[n] = c, o[i++] = n)
                        }
                        return o
                    }

                    function tK(e) {
                        var t = -1,
                            n = Array(e.size);
                        return e.forEach(function(e) {
                            n[++t] = e
                        }), n
                    }

                    function tZ(e) {
                        return tz(e) ? function(e) {
                            for (var t = eX.lastIndex = 0; eX.test(e);) ++t;
                            return t
                        }(e) : tw(e)
                    }

                    function tX(e) {
                        return tz(e) ? e.match(eX) || [] : e.split("")
                    }

                    function tq(e) {
                        for (var t = e.length; t-- && et.test(e.charAt(t)););
                        return t
                    }
                    var tY = tO({
                            "&amp;": "&",
                            "&lt;": "<",
                            "&gt;": ">",
                            "&quot;": '"',
                            "&#39;": "'"
                        }),
                        t$ = function e(t) {
                            var n, et, ey, eb, e_ = (t = null == t ? e4 : t$.defaults(e4.Object(), t, t$.pick(e4, eJ))).Array,
                                ew = t.Date,
                                eE = t.Error,
                                eA = t.Function,
                                ex = t.Math,
                                eS = t.Object,
                                eB = t.RegExp,
                                eT = t.String,
                                eN = t.TypeError,
                                eO = e_.prototype,
                                eI = eA.prototype,
                                ek = eS.prototype,
                                eC = t["__core-js_shared__"],
                                eR = eI.toString,
                                eL = ek.hasOwnProperty,
                                eM = 0,
                                ej = (n = /[^.]+$/.exec(eC && eC.keys && eC.keys.IE_PROTO || "")) ? "Symbol(src)_1." + n : "",
                                eP = ek.toString,
                                eH = eR.call(eS),
                                eD = e4._,
                                eU = eB("^" + eR.call(eL).replace(J, "\\$&").replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g, "$1.*?") + "$"),
                                eF = te ? t.Buffer : o,
                                ez = t.Symbol,
                                eG = t.Uint8Array,
                                eV = eF ? eF.allocUnsafe : o,
                                eW = tV(eS.getPrototypeOf, eS),
                                eX = eS.create,
                                eY = ek.propertyIsEnumerable,
                                e2 = eO.splice,
                                e8 = ez ? ez.isConcatSpreadable : o,
                                e6 = ez ? ez.iterator : o,
                                e7 = ez ? ez.toStringTag : o,
                                e9 = function() {
                                    try {
                                        var e = ig(eS, "defineProperty");
                                        return e({}, "", {}), e
                                    } catch (e) {}
                                }(),
                                tt = t.clearTimeout !== e4.clearTimeout && t.clearTimeout,
                                tn = ew && ew.now !== e4.Date.now && ew.now,
                                tw = t.setTimeout !== e4.setTimeout && t.setTimeout,
                                tO = ex.ceil,
                                tJ = ex.floor,
                                tQ = eS.getOwnPropertySymbols,
                                t0 = eF ? eF.isBuffer : o,
                                t1 = t.isFinite,
                                t2 = eO.join,
                                t3 = tV(eS.keys, eS),
                                t5 = ex.max,
                                t8 = ex.min,
                                t6 = ew.now,
                                t4 = t.parseInt,
                                t7 = ex.random,
                                t9 = eO.reverse,
                                ne = ig(t, "DataView"),
                                nt = ig(t, "Map"),
                                nn = ig(t, "Promise"),
                                nr = ig(t, "Set"),
                                ni = ig(t, "WeakMap"),
                                no = ig(eS, "create"),
                                na = ni && new ni,
                                nu = {},
                                nc = iF(ne),
                                ns = iF(nt),
                                nl = iF(nn),
                                nf = iF(nr),
                                nh = iF(ni),
                                nd = ez ? ez.prototype : o,
                                np = nd ? nd.valueOf : o,
                                nv = nd ? nd.toString : o;

                            function ng(e) {
                                if (oY(e) && !oD(e) && !r._(e, n_)) {
                                    if (r._(e, nb)) return e;
                                    if (eL.call(e, "__wrapped__")) return iz(e)
                                }
                                return new nb(e)
                            }
                            var nm = function() {
                                function e() {}
                                return function(t) {
                                    if (!oq(t)) return {};
                                    if (eX) return eX(t);
                                    e.prototype = t;
                                    var n = new e;
                                    return e.prototype = o, n
                                }
                            }();

                            function ny() {}

                            function nb(e, t) {
                                this.__wrapped__ = e, this.__actions__ = [], this.__chain__ = !!t, this.__index__ = 0, this.__values__ = o
                            }

                            function n_(e) {
                                this.__wrapped__ = e, this.__actions__ = [], this.__dir__ = 1, this.__filtered__ = !1, this.__iteratees__ = [], this.__takeCount__ = 0xffffffff, this.__views__ = []
                            }

                            function nw(e) {
                                var t = -1,
                                    n = null == e ? 0 : e.length;
                                for (this.clear(); ++t < n;) {
                                    var r = e[t];
                                    this.set(r[0], r[1])
                                }
                            }

                            function nE(e) {
                                var t = -1,
                                    n = null == e ? 0 : e.length;
                                for (this.clear(); ++t < n;) {
                                    var r = e[t];
                                    this.set(r[0], r[1])
                                }
                            }

                            function nA(e) {
                                var t = -1,
                                    n = null == e ? 0 : e.length;
                                for (this.clear(); ++t < n;) {
                                    var r = e[t];
                                    this.set(r[0], r[1])
                                }
                            }

                            function nx(e) {
                                var t = -1,
                                    n = null == e ? 0 : e.length;
                                for (this.__data__ = new nA; ++t < n;) this.add(e[t])
                            }

                            function nS(e) {
                                var t = this.__data__ = new nE(e);
                                this.size = t.size
                            }

                            function nB(e, t) {
                                var n = oD(e),
                                    r = !n && oH(e),
                                    i = !n && !r && oG(e),
                                    o = !n && !r && !i && o5(e),
                                    a = n || r || i || o,
                                    u = a ? tC(e.length, eT) : [],
                                    c = u.length;
                                for (var s in e)(t || eL.call(e, s)) && !(a && ("length" == s || i && ("offset" == s || "parent" == s) || o && ("buffer" == s || "byteLength" == s || "byteOffset" == s) || iA(s, c))) && u.push(s);
                                return u
                            }

                            function nT(e) {
                                var t = e.length;
                                return t ? e[rf(0, t - 1)] : o
                            }
                            ng.templateSettings = {
                                escape: K,
                                evaluate: Z,
                                interpolate: X,
                                variable: "",
                                imports: {
                                    _: ng
                                }
                            }, ng.prototype = ny.prototype, ng.prototype.constructor = ng, nb.prototype = nm(ny.prototype), nb.prototype.constructor = nb, n_.prototype = nm(ny.prototype), n_.prototype.constructor = n_, nw.prototype.clear = function() {
                                this.__data__ = no ? no(null) : {}, this.size = 0
                            }, nw.prototype.delete = function(e) {
                                var t = this.has(e) && delete this.__data__[e];
                                return this.size -= !!t, t
                            }, nw.prototype.get = function(e) {
                                var t = this.__data__;
                                if (no) {
                                    var n = t[e];
                                    return n === u ? o : n
                                }
                                return eL.call(t, e) ? t[e] : o
                            }, nw.prototype.has = function(e) {
                                var t = this.__data__;
                                return no ? t[e] !== o : eL.call(t, e)
                            }, nw.prototype.set = function(e, t) {
                                var n = this.__data__;
                                return this.size += +!this.has(e), n[e] = no && o === t ? u : t, this
                            }, nE.prototype.clear = function() {
                                this.__data__ = [], this.size = 0
                            }, nE.prototype.delete = function(e) {
                                var t = this.__data__,
                                    n = nI(t, e);
                                return !(n < 0) && (n == t.length - 1 ? t.pop() : e2.call(t, n, 1), --this.size, !0)
                            }, nE.prototype.get = function(e) {
                                var t = this.__data__,
                                    n = nI(t, e);
                                return n < 0 ? o : t[n][1]
                            }, nE.prototype.has = function(e) {
                                return nI(this.__data__, e) > -1
                            }, nE.prototype.set = function(e, t) {
                                var n = this.__data__,
                                    r = nI(n, e);
                                return r < 0 ? (++this.size, n.push([e, t])) : n[r][1] = t, this
                            }, nA.prototype.clear = function() {
                                this.size = 0, this.__data__ = {
                                    hash: new nw,
                                    map: new(nt || nE),
                                    string: new nw
                                }
                            }, nA.prototype.delete = function(e) {
                                var t = ip(this, e).delete(e);
                                return this.size -= !!t, t
                            }, nA.prototype.get = function(e) {
                                return ip(this, e).get(e)
                            }, nA.prototype.has = function(e) {
                                return ip(this, e).has(e)
                            }, nA.prototype.set = function(e, t) {
                                var n = ip(this, e),
                                    r = n.size;
                                return n.set(e, t), this.size += +(n.size != r), this
                            }, nx.prototype.add = nx.prototype.push = function(e) {
                                return this.__data__.set(e, u), this
                            }, nx.prototype.has = function(e) {
                                return this.__data__.has(e)
                            };

                            function nN(e, t, n) {
                                (o === n || oM(e[t], n)) && (o !== n || t in e) || nR(e, t, n)
                            }

                            function nO(e, t, n) {
                                var r = e[t];
                                eL.call(e, t) && oM(r, n) && (o !== n || t in e) || nR(e, t, n)
                            }

                            function nI(e, t) {
                                for (var n = e.length; n--;)
                                    if (oM(e[n][0], t)) return n;
                                return -1
                            }

                            function nk(e, t, n, r) {
                                return nU(e, function(e, i, o) {
                                    t(r, e, n(e), o)
                                }), r
                            }

                            function nC(e, t) {
                                return e && rG(t, ag(t), e)
                            }

                            function nR(e, t, n) {
                                "__proto__" == t && e9 ? e9(e, t, {
                                    configurable: !0,
                                    enumerable: !0,
                                    value: n,
                                    writable: !0
                                }) : e[t] = n
                            }

                            function nL(e, t) {
                                for (var n = -1, r = t.length, i = e_(r), a = null == e; ++n < r;) i[n] = a ? o : af(e, t[n]);
                                return i
                            }

                            function nM(e, t, n) {
                                return e == e && (o !== n && (e = e <= n ? e : n), o !== t && (e = e >= t ? e : t)), e
                            }

                            function nj(e, t, n, r, i, a) {
                                var u, c = 1 & t,
                                    s = 2 & t,
                                    l = 4 & t;
                                if (n && (u = i ? n(e, r, i, a) : n(e)), o !== u) return u;
                                if (!oq(e)) return e;
                                var f = oD(e);
                                if (f) {
                                    if (g = (d = e).length, E = new d.constructor(g), g && "string" == typeof d[0] && eL.call(d, "index") && (E.index = d.index, E.input = d.input), u = E, !c) return rz(e, u)
                                } else {
                                    var d, g, E, T, D, U, F, z, G = ib(e),
                                        V = G == m || G == y;
                                    if (oG(e)) return rj(e, c);
                                    if (G == w || G == h || V && !i) {
                                        if (u = s || V ? {} : iw(e), !c) {
                                            return s ? (T = e, D = (z = u) && rG(e, am(e), z), rG(T, iy(T), D)) : (U = e, F = nC(u, e), rG(U, im(U), F))
                                        }
                                    } else {
                                        if (!e1[G]) return i ? e : {};
                                        u = function(e, t, n) {
                                            var r, i, o = e.constructor;
                                            switch (t) {
                                                case N:
                                                    return rP(e);
                                                case p:
                                                case v:
                                                    return new o(+e);
                                                case O:
                                                    return r = n ? rP(e.buffer) : e.buffer, new e.constructor(r, e.byteOffset, e.byteLength);
                                                case I:
                                                case k:
                                                case C:
                                                case R:
                                                case L:
                                                case M:
                                                case j:
                                                case P:
                                                case H:
                                                    return rH(e, n);
                                                case b:
                                                    return new o;
                                                case _:
                                                case S:
                                                    return new o(e);
                                                case A:
                                                    return (i = new e.constructor(e.source, es.exec(e))).lastIndex = e.lastIndex, i;
                                                case x:
                                                    return new o;
                                                case B:
                                                    return np ? eS(np.call(e)) : {}
                                            }
                                        }(e, G, c)
                                    }
                                }
                                a || (a = new nS);
                                var W = a.get(e);
                                if (W) return W;
                                a.set(e, u), o1(e) ? e.forEach(function(r) {
                                    u.add(nj(r, t, n, r, e, a))
                                }) : o$(e) && e.forEach(function(r, i) {
                                    u.set(i, nj(r, t, n, i, e, a))
                                });
                                var K = l ? s ? ic : iu : s ? am : ag,
                                    Z = f ? o : K(e);
                                return tf(Z || e, function(r, i) {
                                    Z && (r = e[i = r]), nO(u, i, nj(r, t, n, i, e, a))
                                }), u
                            }

                            function nP(e, t, n) {
                                var r = n.length;
                                if (null == e) return !r;
                                for (e = eS(e); r--;) {
                                    var i = n[r],
                                        a = t[i],
                                        u = e[i];
                                    if (o === u && !(i in e) || !a(u)) return !1
                                }
                                return !0
                            }

                            function nH(e, t, n) {
                                if ("function" != typeof e) throw new eN(a);
                                return iL(function() {
                                    e.apply(o, n)
                                }, t)
                            }

                            function nD(e, t, n, r) {
                                var i = -1,
                                    o = tp,
                                    a = !0,
                                    u = e.length,
                                    c = [],
                                    s = t.length;
                                if (!u) return c;
                                n && (t = tg(t, tL(n))), r ? (o = tv, a = !1) : t.length >= 200 && (o = tj, a = !1, t = new nx(t));
                                e: for (; ++i < u;) {
                                    var l = e[i],
                                        f = null == n ? l : n(l);
                                    if (l = r || 0 !== l ? l : 0, a && f == f) {
                                        for (var h = s; h--;)
                                            if (t[h] === f) continue e;
                                        c.push(l)
                                    } else o(t, f, r) || c.push(l)
                                }
                                return c
                            }
                            nS.prototype.clear = function() {
                                this.__data__ = new nE, this.size = 0
                            }, nS.prototype.delete = function(e) {
                                var t = this.__data__,
                                    n = t.delete(e);
                                return this.size = t.size, n
                            }, nS.prototype.get = function(e) {
                                return this.__data__.get(e)
                            }, nS.prototype.has = function(e) {
                                return this.__data__.has(e)
                            }, nS.prototype.set = function(e, t) {
                                var n = this.__data__;
                                if (r._(n, nE)) {
                                    var i = n.__data__;
                                    if (!nt || i.length < 199) return i.push([e, t]), this.size = ++n.size, this;
                                    n = this.__data__ = new nA(i)
                                }
                                return n.set(e, t), this.size = n.size, this
                            };
                            var nU = rK(nX),
                                nF = rK(nq, !0);

                            function nz(e, t) {
                                var n = !0;
                                return nU(e, function(e, r, i) {
                                    return n = !!t(e, r, i)
                                }), n
                            }

                            function nG(e, t, n) {
                                for (var r = -1, i = e.length; ++r < i;) {
                                    var a = e[r],
                                        u = t(a);
                                    if (null != u && (o === c ? u == u && !o3(u) : n(u, c))) var c = u,
                                        s = a
                                }
                                return s
                            }

                            function nV(e, t) {
                                var n = [];
                                return nU(e, function(e, r, i) {
                                    t(e, r, i) && n.push(e)
                                }), n
                            }

                            function nW(e, t, n, r, i) {
                                var o = -1,
                                    a = e.length;
                                for (n || (n = iE), i || (i = []); ++o < a;) {
                                    var u = e[o];
                                    t > 0 && n(u) ? t > 1 ? nW(u, t - 1, n, r, i) : tm(i, u) : r || (i[i.length] = u)
                                }
                                return i
                            }
                            var nK = rZ(),
                                nZ = rZ(!0);

                            function nX(e, t) {
                                return e && nK(e, t, ag)
                            }

                            function nq(e, t) {
                                return e && nZ(e, t, ag)
                            }

                            function nY(e, t) {
                                return td(t, function(t) {
                                    return oK(e[t])
                                })
                            }

                            function n$(e, t) {
                                t = rR(t, e);
                                for (var n = 0, r = t.length; null != e && n < r;) e = e[iU(t[n++])];
                                return n && n == r ? e : o
                            }

                            function nJ(e, t, n) {
                                var r = t(e);
                                return oD(e) ? r : tm(r, n(e))
                            }

                            function nQ(e) {
                                var t;
                                return null == e ? o === e ? "[object Undefined]" : "[object Null]" : e7 && e7 in eS(e) ? function(e) {
                                    var t = eL.call(e, e7),
                                        n = e[e7];
                                    try {
                                        e[e7] = o;
                                        var r = !0
                                    } catch (e) {}
                                    var i = eP.call(e);
                                    return r && (t ? e[e7] = n : delete e[e7]), i
                                }(e) : (t = e, eP.call(t))
                            }

                            function n0(e, t) {
                                return e > t
                            }

                            function n1(e, t) {
                                return null != e && eL.call(e, t)
                            }

                            function n2(e, t) {
                                return null != e && t in eS(e)
                            }

                            function n3(e, t, n) {
                                for (var r = n ? tv : tp, i = e[0].length, a = e.length, u = a, c = e_(a), s = 1 / 0, l = []; u--;) {
                                    var f = e[u];
                                    u && t && (f = tg(f, tL(t))), s = t8(f.length, s), c[u] = !n && (t || i >= 120 && f.length >= 120) ? new nx(u && f) : o
                                }
                                f = e[0];
                                var h = -1,
                                    d = c[0];
                                e: for (; ++h < i && l.length < s;) {
                                    var p = f[h],
                                        v = t ? t(p) : p;
                                    if (p = n || 0 !== p ? p : 0, !(d ? tj(d, v) : r(l, v, n))) {
                                        for (u = a; --u;) {
                                            var g = c[u];
                                            if (!(g ? tj(g, v) : r(e[u], v, n))) continue e
                                        }
                                        d && d.push(v), l.push(p)
                                    }
                                }
                                return l
                            }

                            function n5(e, t, n) {
                                t = rR(t, e);
                                var r = null == (e = ik(e, t)) ? e : e[iU(iQ(t))];
                                return null == r ? o : ts(r, e, n)
                            }

                            function n8(e) {
                                return oY(e) && nQ(e) == h
                            }

                            function n6(e, t, n, i, a) {
                                return e === t || (null != e && null != t && (oY(e) || oY(t)) ? function(e, t, n, i, a, u) {
                                    var c = oD(e),
                                        s = oD(t),
                                        l = c ? d : ib(e),
                                        f = s ? d : ib(t);
                                    l = l == h ? w : l, f = f == h ? w : f;
                                    var m = l == w,
                                        y = f == w,
                                        E = l == f;
                                    if (E && oG(e)) {
                                        if (!oG(t)) return !1;
                                        c = !0, m = !1
                                    }
                                    if (E && !m) return u || (u = new nS), c || o5(e) ? io(e, t, n, i, a, u) : function(e, t, n, r, i, o, a) {
                                        switch (n) {
                                            case O:
                                                if (e.byteLength != t.byteLength || e.byteOffset != t.byteOffset) break;
                                                e = e.buffer, t = t.buffer;
                                            case N:
                                                if (e.byteLength != t.byteLength || !o(new eG(e), new eG(t))) break;
                                                return !0;
                                            case p:
                                            case v:
                                            case _:
                                                return oM(+e, +t);
                                            case g:
                                                return e.name == t.name && e.message == t.message;
                                            case A:
                                            case S:
                                                return e == t + "";
                                            case b:
                                                var u = tG;
                                            case x:
                                                var c = 1 & r;
                                                if (u || (u = tK), e.size != t.size && !c) break;
                                                var s = a.get(e);
                                                if (s) return s == t;
                                                r |= 2, a.set(e, t);
                                                var l = io(u(e), u(t), r, i, o, a);
                                                return a.delete(e), l;
                                            case B:
                                                if (np) return np.call(e) == np.call(t)
                                        }
                                        return !1
                                    }(e, t, l, n, i, a, u);
                                    if (!(1 & n)) {
                                        var T = m && eL.call(e, "__wrapped__"),
                                            I = y && eL.call(t, "__wrapped__");
                                        if (T || I) {
                                            var k = T ? e.value() : e,
                                                C = I ? t.value() : t;
                                            return u || (u = new nS), a(k, C, n, i, u)
                                        }
                                    }
                                    return !!E && (u || (u = new nS), function(e, t, n, i, a, u) {
                                        var c = 1 & n,
                                            s = iu(e),
                                            l = s.length;
                                        if (l != iu(t).length && !c) return !1;
                                        for (var f = l; f--;) {
                                            var h = s[f];
                                            if (!(c ? h in t : eL.call(t, h))) return !1
                                        }
                                        var d = u.get(e),
                                            p = u.get(t);
                                        if (d && p) return d == t && p == e;
                                        var v = !0;
                                        u.set(e, t), u.set(t, e);
                                        for (var g = c; ++f < l;) {
                                            var m = e[h = s[f]],
                                                y = t[h];
                                            if (i) var b = c ? i(y, m, h, t, e, u) : i(m, y, h, e, t, u);
                                            if (!(o === b ? m === y || a(m, y, n, i, u) : b)) {
                                                v = !1;
                                                break
                                            }
                                            g || (g = "constructor" == h)
                                        }
                                        if (v && !g) {
                                            var _ = e.constructor,
                                                w = t.constructor;
                                            _ != w && "constructor" in e && "constructor" in t && !("function" == typeof _ && r._(_, _) && "function" == typeof w && r._(w, w)) && (v = !1)
                                        }
                                        return u.delete(e), u.delete(t), v
                                    }(e, t, n, i, a, u))
                                }(e, t, n, i, n6, a) : e != e && t != t)
                            }

                            function n4(e, t, n, r) {
                                var i = n.length,
                                    a = i,
                                    u = !r;
                                if (null == e) return !a;
                                for (e = eS(e); i--;) {
                                    var c = n[i];
                                    if (u && c[2] ? c[1] !== e[c[0]] : !(c[0] in e)) return !1
                                }
                                for (; ++i < a;) {
                                    var s = (c = n[i])[0],
                                        l = e[s],
                                        f = c[1];
                                    if (u && c[2]) {
                                        if (o === l && !(s in e)) return !1
                                    } else {
                                        var h = new nS;
                                        if (r) var d = r(l, f, s, e, t, h);
                                        if (!(o === d ? n6(f, l, 3, r, h) : d)) return !1
                                    }
                                }
                                return !0
                            }

                            function n7(e) {
                                var t;
                                return !(!oq(e) || (t = e, ej && ej in t)) && (oK(e) ? eU : eh).test(iF(e))
                            }

                            function n9(e) {
                                return "function" == typeof e ? e : null == e ? az : (void 0 === e ? "undefined" : i._(e)) == "object" ? oD(e) ? ri(e[0], e[1]) : rr(e) : a$(e)
                            }

                            function re(e) {
                                if (!iN(e)) return t3(e);
                                var t = [];
                                for (var n in eS(e)) eL.call(e, n) && "constructor" != n && t.push(n);
                                return t
                            }

                            function rt(e, t) {
                                return e < t
                            }

                            function rn(e, t) {
                                var n = -1,
                                    r = oF(e) ? e_(e.length) : [];
                                return nU(e, function(e, i, o) {
                                    r[++n] = t(e, i, o)
                                }), r
                            }

                            function rr(e) {
                                var t = iv(e);
                                return 1 == t.length && t[0][2] ? iO(t[0][0], t[0][1]) : function(n) {
                                    return n === e || n4(n, e, t)
                                }
                            }

                            function ri(e, t) {
                                var n;
                                return iS(e) && (n = t) == n && !oq(n) ? iO(iU(e), t) : function(n) {
                                    var r = af(n, e);
                                    return o === r && r === t ? ah(n, e) : n6(t, r, 3)
                                }
                            }

                            function ro(e, t, n, r, i) {
                                e !== t && nK(t, function(a, u) {
                                    if (i || (i = new nS), oq(a)) ! function(e, t, n, r, i, a, u) {
                                        var c = iC(e, n),
                                            s = iC(t, n),
                                            l = u.get(s);
                                        if (l) return nN(e, n, l);
                                        var f = a ? a(c, s, n + "", e, t, u) : o,
                                            h = o === f;
                                        if (h) {
                                            var d = oD(s),
                                                p = !d && oG(s),
                                                v = !d && !p && o5(s);
                                            f = s, d || p || v ? oD(c) ? f = c : oz(c) ? f = rz(c) : p ? (h = !1, f = rj(s, !0)) : v ? (h = !1, f = rH(s, !0)) : f = [] : oQ(s) || oH(s) ? (f = c, oH(c) ? f = an(c) : (!oq(c) || oK(c)) && (f = iw(s))) : h = !1
                                        }
                                        h && (u.set(s, f), i(f, s, r, a, u), u.delete(s)), nN(e, n, f)
                                    }(e, t, u, n, ro, r, i);
                                    else {
                                        var c = r ? r(iC(e, u), a, u + "", e, t, i) : o;
                                        o === c && (c = a), nN(e, u, c)
                                    }
                                }, am)
                            }

                            function ra(e, t) {
                                var n = e.length;
                                if (n) return iA(t += t < 0 ? n : 0, n) ? e[t] : o
                            }

                            function ru(e, t, n) {
                                t = t.length ? tg(t, function(e) {
                                    return oD(e) ? function(t) {
                                        return n$(t, 1 === e.length ? e[0] : e)
                                    } : e
                                }) : [az];
                                var r = -1;
                                t = tg(t, tL(id()));
                                var i = rn(e, function(e, n, i) {
                                        return {
                                            criteria: tg(t, function(t) {
                                                return t(e)
                                            }),
                                            index: ++r,
                                            value: e
                                        }
                                    }),
                                    o = i.length;
                                for (i.sort(function(e, t) {
                                        return function(e, t, n) {
                                            for (var r = -1, i = e.criteria, o = t.criteria, a = i.length, u = n.length; ++r < a;) {
                                                var c = rD(i[r], o[r]);
                                                if (c) {
                                                    if (r >= u) return c;
                                                    return c * ("desc" == n[r] ? -1 : 1)
                                                }
                                            }
                                            return e.index - t.index
                                        }(e, t, n)
                                    }); o--;) i[o] = i[o].value;
                                return i
                            }

                            function rc(e, t, n) {
                                for (var r = -1, i = t.length, o = {}; ++r < i;) {
                                    var a = t[r],
                                        u = n$(e, a);
                                    n(u, a) && rp(o, rR(a, e), u)
                                }
                                return o
                            }

                            function rs(e, t, n, r) {
                                var i = r ? tS : tx,
                                    o = -1,
                                    a = t.length,
                                    u = e;
                                for (e === t && (t = rz(t)), n && (u = tg(e, tL(n))); ++o < a;)
                                    for (var c = 0, s = t[o], l = n ? n(s) : s;
                                        (c = i(u, l, c, r)) > -1;) u !== e && e2.call(u, c, 1), e2.call(e, c, 1);
                                return e
                            }

                            function rl(e, t) {
                                for (var n = e ? t.length : 0, r = n - 1; n--;) {
                                    var i = t[n];
                                    if (n == r || i !== o) {
                                        var o = i;
                                        iA(i) ? e2.call(e, i, 1) : rS(e, i)
                                    }
                                }
                                return e
                            }

                            function rf(e, t) {
                                return e + tJ(t7() * (t - e + 1))
                            }

                            function rh(e, t) {
                                var n = "";
                                if (!e || t < 1 || t > 0x1fffffffffffff) return n;
                                do t % 2 && (n += e), (t = tJ(t / 2)) && (e += e); while (t);
                                return n
                            }

                            function rd(e, t) {
                                return iM(iI(e, t, az), e + "")
                            }

                            function rp(e, t, n, r) {
                                if (!oq(e)) return e;
                                t = rR(t, e);
                                for (var i = -1, a = t.length, u = a - 1, c = e; null != c && ++i < a;) {
                                    var s = iU(t[i]),
                                        l = n;
                                    if ("__proto__" === s || "constructor" === s || "prototype" === s) break;
                                    if (i != u) {
                                        var f = c[s];
                                        l = r ? r(f, s, c) : o, o === l && (l = oq(f) ? f : iA(t[i + 1]) ? [] : {})
                                    }
                                    nO(c, s, l), c = c[s]
                                }
                                return e
                            }
                            var rv = na ? function(e, t) {
                                    return na.set(e, t), e
                                } : az,
                                rg = e9 ? function(e, t) {
                                    return e9(e, "toString", {
                                        configurable: !0,
                                        enumerable: !1,
                                        value: aD(t),
                                        writable: !0
                                    })
                                } : az;

                            function rm(e, t, n) {
                                var r = -1,
                                    i = e.length;
                                t < 0 && (t = -t > i ? 0 : i + t), (n = n > i ? i : n) < 0 && (n += i), i = t > n ? 0 : n - t >>> 0, t >>>= 0;
                                for (var o = e_(i); ++r < i;) o[r] = e[r + t];
                                return o
                            }

                            function ry(e, t) {
                                var n;
                                return nU(e, function(e, r, i) {
                                    return !(n = t(e, r, i))
                                }), !!n
                            }

                            function rb(e, t, n) {
                                var r = 0,
                                    i = null == e ? r : e.length;
                                if ("number" == typeof t && t == t && i <= 0x7fffffff) {
                                    for (; r < i;) {
                                        var o = r + i >>> 1,
                                            a = e[o];
                                        null !== a && !o3(a) && (n ? a <= t : a < t) ? r = o + 1 : i = o
                                    }
                                    return i
                                }
                                return r_(e, t, az, n)
                            }

                            function r_(e, t, n, r) {
                                var i = 0,
                                    a = null == e ? 0 : e.length;
                                if (0 === a) return 0;
                                for (var u = (t = n(t)) != t, c = null === t, s = o3(t), l = o === t; i < a;) {
                                    var f = tJ((i + a) / 2),
                                        h = n(e[f]),
                                        d = o !== h,
                                        p = null === h,
                                        v = h == h,
                                        g = o3(h);
                                    if (u) var m = r || v;
                                    else m = l ? v && (r || d) : c ? v && d && (r || !p) : s ? v && d && !p && (r || !g) : !p && !g && (r ? h <= t : h < t);
                                    m ? i = f + 1 : a = f
                                }
                                return t8(a, 0xfffffffe)
                            }

                            function rw(e, t) {
                                for (var n = -1, r = e.length, i = 0, o = []; ++n < r;) {
                                    var a = e[n],
                                        u = t ? t(a) : a;
                                    if (!n || !oM(u, c)) {
                                        var c = u;
                                        o[i++] = 0 === a ? 0 : a
                                    }
                                }
                                return o
                            }

                            function rE(e) {
                                return "number" == typeof e ? e : o3(e) ? l : +e
                            }

                            function rA(e) {
                                if ("string" == typeof e) return e;
                                if (oD(e)) return tg(e, rA) + "";
                                if (o3(e)) return nv ? nv.call(e) : "";
                                var t = e + "";
                                return "0" == t && 1 / e == -s ? "-0" : t
                            }

                            function rx(e, t, n) {
                                var r = -1,
                                    i = tp,
                                    o = e.length,
                                    a = !0,
                                    u = [],
                                    c = u;
                                if (n) a = !1, i = tv;
                                else if (o >= 200) {
                                    var s = t ? null : r7(e);
                                    if (s) return tK(s);
                                    a = !1, i = tj, c = new nx
                                } else c = t ? [] : u;
                                e: for (; ++r < o;) {
                                    var l = e[r],
                                        f = t ? t(l) : l;
                                    if (l = n || 0 !== l ? l : 0, a && f == f) {
                                        for (var h = c.length; h--;)
                                            if (c[h] === f) continue e;
                                        t && c.push(f), u.push(l)
                                    } else i(c, f, n) || (c !== u && c.push(f), u.push(l))
                                }
                                return u
                            }

                            function rS(e, t) {
                                t = rR(t, e);
                                var n = -1,
                                    r = t.length;
                                if (!r) return !0;
                                for (var o = null == e || (void 0 === e ? "undefined" : i._(e)) !== "object" && "function" != typeof e; ++n < r;) {
                                    var a = t[n];
                                    if ("string" == typeof a) {
                                        if ("__proto__" === a && !eL.call(e, "__proto__")) return !1;
                                        if ("constructor" === a && n + 1 < r && "string" == typeof t[n + 1] && "prototype" === t[n + 1]) {
                                            if (o && 0 === n) continue;
                                            return !1
                                        }
                                    }
                                }
                                var u = ik(e, t);
                                return null == u || delete u[iU(iQ(t))]
                            }

                            function rB(e, t, n, r) {
                                return rp(e, t, n(n$(e, t)), r)
                            }

                            function rT(e, t, n, r) {
                                for (var i = e.length, o = r ? i : -1;
                                    (r ? o-- : ++o < i) && t(e[o], o, e););
                                return n ? rm(e, r ? 0 : o, r ? o + 1 : i) : rm(e, r ? o + 1 : 0, r ? i : o)
                            }

                            function rN(e, t) {
                                var n = e;
                                return r._(n, n_) && (n = n.value()), ty(t, function(e, t) {
                                    return t.func.apply(t.thisArg, tm([e], t.args))
                                }, n)
                            }

                            function rO(e, t, n) {
                                var r = e.length;
                                if (r < 2) return r ? rx(e[0]) : [];
                                for (var i = -1, o = e_(r); ++i < r;)
                                    for (var a = e[i], u = -1; ++u < r;) u != i && (o[i] = nD(o[i] || a, e[u], t, n));
                                return rx(nW(o, 1), t, n)
                            }

                            function rI(e, t, n) {
                                for (var r = -1, i = e.length, a = t.length, u = {}; ++r < i;) {
                                    var c = r < a ? t[r] : o;
                                    n(u, e[r], c)
                                }
                                return u
                            }

                            function rk(e) {
                                return oz(e) ? e : []
                            }

                            function rC(e) {
                                return "function" == typeof e ? e : az
                            }

                            function rR(e, t) {
                                return oD(e) ? e : iS(e, t) ? [e] : iD(ar(e))
                            }

                            function rL(e, t, n) {
                                var r = e.length;
                                return n = o === n ? r : n, !t && n >= r ? e : rm(e, t, n)
                            }
                            var rM = tt || function(e) {
                                return e4.clearTimeout(e)
                            };

                            function rj(e, t) {
                                if (t) return e.slice();
                                var n = e.length,
                                    r = eV ? eV(n) : new e.constructor(n);
                                return e.copy(r), r
                            }

                            function rP(e) {
                                var t = new e.constructor(e.byteLength);
                                return new eG(t).set(new eG(e)), t
                            }

                            function rH(e, t) {
                                var n = t ? rP(e.buffer) : e.buffer;
                                return new e.constructor(n, e.byteOffset, e.length)
                            }

                            function rD(e, t) {
                                if (e !== t) {
                                    var n = o !== e,
                                        r = null === e,
                                        i = e == e,
                                        a = o3(e),
                                        u = o !== t,
                                        c = null === t,
                                        s = t == t,
                                        l = o3(t);
                                    if (!c && !l && !a && e > t || a && u && s && !c && !l || r && u && s || !n && s || !i) return 1;
                                    if (!r && !a && !l && e < t || l && n && i && !r && !a || c && n && i || !u && i || !s) return -1
                                }
                                return 0
                            }

                            function rU(e, t, n, r) {
                                for (var i = -1, o = e.length, a = n.length, u = -1, c = t.length, s = t5(o - a, 0), l = e_(c + s), f = !r; ++u < c;) l[u] = t[u];
                                for (; ++i < a;)(f || i < o) && (l[n[i]] = e[i]);
                                for (; s--;) l[u++] = e[i++];
                                return l
                            }

                            function rF(e, t, n, r) {
                                for (var i = -1, o = e.length, a = -1, u = n.length, c = -1, s = t.length, l = t5(o - u, 0), f = e_(l + s), h = !r; ++i < l;) f[i] = e[i];
                                for (var d = i; ++c < s;) f[d + c] = t[c];
                                for (; ++a < u;)(h || i < o) && (f[d + n[a]] = e[i++]);
                                return f
                            }

                            function rz(e, t) {
                                var n = -1,
                                    r = e.length;
                                for (t || (t = e_(r)); ++n < r;) t[n] = e[n];
                                return t
                            }

                            function rG(e, t, n, r) {
                                var i = !n;
                                n || (n = {});
                                for (var a = -1, u = t.length; ++a < u;) {
                                    var c = t[a],
                                        s = r ? r(n[c], e[c], c, n, e) : o;
                                    o === s && (s = e[c]), i ? nR(n, c, s) : nO(n, c, s)
                                }
                                return n
                            }

                            function rV(e, t) {
                                return function(n, r) {
                                    var i = oD(n) ? tl : nk,
                                        o = t ? t() : {};
                                    return i(n, e, id(r, 2), o)
                                }
                            }

                            function rW(e) {
                                return rd(function(t, n) {
                                    var r = -1,
                                        i = n.length,
                                        a = i > 1 ? n[i - 1] : o,
                                        u = i > 2 ? n[2] : o;
                                    for (a = e.length > 3 && "function" == typeof a ? (i--, a) : o, u && ix(n[0], n[1], u) && (a = i < 3 ? o : a, i = 1), t = eS(t); ++r < i;) {
                                        var c = n[r];
                                        c && e(t, c, r, a)
                                    }
                                    return t
                                })
                            }

                            function rK(e, t) {
                                return function(n, r) {
                                    if (null == n) return n;
                                    if (!oF(n)) return e(n, r);
                                    for (var i = n.length, o = t ? i : -1, a = eS(n);
                                        (t ? o-- : ++o < i) && !1 !== r(a[o], o, a););
                                    return n
                                }
                            }

                            function rZ(e) {
                                return function(t, n, r) {
                                    for (var i = -1, o = eS(t), a = r(t), u = a.length; u--;) {
                                        var c = a[e ? u : ++i];
                                        if (!1 === n(o[c], c, o)) break
                                    }
                                    return t
                                }
                            }

                            function rX(e) {
                                return function(t) {
                                    var n = tz(t = ar(t)) ? tX(t) : o,
                                        r = n ? n[0] : t.charAt(0),
                                        i = n ? rL(n, 1).join("") : t.slice(1);
                                    return r[e]() + i
                                }
                            }

                            function rq(e) {
                                return function(t) {
                                    return ty(aj(aN(t).replace(eK, "")), e, "")
                                }
                            }

                            function rY(e) {
                                return function() {
                                    var t = arguments;
                                    switch (t.length) {
                                        case 0:
                                            return new e;
                                        case 1:
                                            return new e(t[0]);
                                        case 2:
                                            return new e(t[0], t[1]);
                                        case 3:
                                            return new e(t[0], t[1], t[2]);
                                        case 4:
                                            return new e(t[0], t[1], t[2], t[3]);
                                        case 5:
                                            return new e(t[0], t[1], t[2], t[3], t[4]);
                                        case 6:
                                            return new e(t[0], t[1], t[2], t[3], t[4], t[5]);
                                        case 7:
                                            return new e(t[0], t[1], t[2], t[3], t[4], t[5], t[6])
                                    }
                                    var n = nm(e.prototype),
                                        r = e.apply(n, t);
                                    return oq(r) ? r : n
                                }
                            }

                            function r$(e) {
                                return function(t, n, r) {
                                    var i = eS(t);
                                    if (!oF(t)) {
                                        var a = id(n, 3);
                                        t = ag(t), n = function(e) {
                                            return a(i[e], e, i)
                                        }
                                    }
                                    var u = e(t, n, r);
                                    return u > -1 ? i[a ? t[u] : u] : o
                                }
                            }

                            function rJ(e) {
                                return ia(function(t) {
                                    var n = t.length,
                                        r = n,
                                        i = nb.prototype.thru;
                                    for (e && t.reverse(); r--;) {
                                        var u = t[r];
                                        if ("function" != typeof u) throw new eN(a);
                                        if (i && !c && "wrapper" == il(u)) var c = new nb([], !0)
                                    }
                                    for (r = c ? r : n; ++r < n;) {
                                        var s = il(u = t[r]),
                                            l = "wrapper" == s ? is(u) : o;
                                        c = l && iB(l[0]) && 424 == l[1] && !l[4].length && 1 == l[9] ? c[il(l[0])].apply(c, l[3]) : 1 == u.length && iB(u) ? c[s]() : c.thru(u)
                                    }
                                    return function() {
                                        var e = arguments,
                                            r = e[0];
                                        if (c && 1 == e.length && oD(r)) return c.plant(r).value();
                                        for (var i = 0, o = n ? t[i].apply(this, e) : r; ++i < n;) o = t[i].call(this, o);
                                        return o
                                    }
                                })
                            }

                            function rQ(e, t, n, i, a, u, c, s, l, f) {
                                var h = 128 & t,
                                    d = 1 & t,
                                    p = 2 & t,
                                    v = 24 & t,
                                    g = 512 & t,
                                    m = p ? o : rY(e);

                                function y() {
                                    for (var b = arguments.length, _ = e_(b), w = b; w--;) _[w] = arguments[w];
                                    if (v) var E = ih(y),
                                        A = function(e, t) {
                                            for (var n = e.length, r = 0; n--;) e[n] === t && ++r;
                                            return r
                                        }(_, E);
                                    if (i && (_ = rU(_, i, a, v)), u && (_ = rF(_, u, c, v)), b -= A, v && b < f) {
                                        var x = tW(_, E);
                                        return r6(e, t, rQ, y.placeholder, n, _, x, s, l, f - b)
                                    }
                                    var S = d ? n : this,
                                        B = p ? S[e] : e;
                                    return b = _.length, s ? _ = function(e, t) {
                                        for (var n = e.length, r = t8(t.length, n), i = rz(e); r--;) {
                                            var a = t[r];
                                            e[r] = iA(a, n) ? i[a] : o
                                        }
                                        return e
                                    }(_, s) : g && b > 1 && _.reverse(), h && l < b && (_.length = l), this && this !== e4 && r._(this, y) && (B = m || rY(B)), B.apply(S, _)
                                }
                                return y
                            }

                            function r0(e, t) {
                                return function(n, r) {
                                    var i, o;
                                    return i = t(r), o = {}, nX(n, function(t, n, r) {
                                        e(o, i(t), n, r)
                                    }), o
                                }
                            }

                            function r1(e, t) {
                                return function(n, r) {
                                    var i;
                                    if (o === n && o === r) return t;
                                    if (o !== n && (i = n), o !== r) {
                                        if (o === i) return r;
                                        "string" == typeof n || "string" == typeof r ? (n = rA(n), r = rA(r)) : (n = rE(n), r = rE(r)), i = e(n, r)
                                    }
                                    return i
                                }
                            }

                            function r2(e) {
                                return ia(function(t) {
                                    return t = tg(t, tL(id())), rd(function(n) {
                                        var r = this;
                                        return e(t, function(e) {
                                            return ts(e, r, n)
                                        })
                                    })
                                })
                            }

                            function r3(e, t) {
                                var n = (t = o === t ? " " : rA(t)).length;
                                if (n < 2) return n ? rh(t, e) : t;
                                var r = rh(t, tO(e / tZ(t)));
                                return tz(t) ? rL(tX(r), 0, e).join("") : r.slice(0, e)
                            }

                            function r5(e) {
                                return function(t, n, r) {
                                    r && "number" != typeof r && ix(t, n, r) && (n = r = o), t = o7(t), o === n ? (n = t, t = 0) : n = o7(n), r = o === r ? t < n ? 1 : -1 : o7(r);
                                    for (var i = t, a = n, u = r, c = -1, s = t5(tO((a - i) / (u || 1)), 0), l = e_(s); s--;) l[e ? s : ++c] = i, i += u;
                                    return l
                                }
                            }

                            function r8(e) {
                                return function(t, n) {
                                    return ("string" != typeof t || "string" != typeof n) && (t = at(t), n = at(n)), e(t, n)
                                }
                            }

                            function r6(e, t, n, r, i, a, u, c, s, l) {
                                var f = 8 & t,
                                    h = f ? u : o,
                                    d = f ? o : u,
                                    p = f ? a : o,
                                    v = f ? o : a;
                                t |= f ? 32 : 64, 4 & (t &= ~(f ? 64 : 32)) || (t &= -4);
                                var g = [e, t, i, p, h, v, d, c, s, l],
                                    m = n.apply(o, g);
                                return iB(e) && iR(m, g), m.placeholder = r, ij(m, e, t)
                            }

                            function r4(e) {
                                var t = ex[e];
                                return function(e, n) {
                                    if (e = at(e), (n = null == n ? 0 : t8(o9(n), 292)) && t1(e)) {
                                        var r = (ar(e) + "e").split("e");
                                        return +((r = (ar(t(r[0] + "e" + (+r[1] + n))) + "e").split("e"))[0] + "e" + (r[1] - n))
                                    }
                                    return t(e)
                                }
                            }
                            var r7 = nr && 1 / tK(new nr([, -0]))[1] == s ? function(e) {
                                return new nr(e)
                            } : aZ;

                            function r9(e) {
                                return function(t) {
                                    var n, r, i = ib(t);
                                    return i == b ? tG(t) : i == x ? (n = -1, r = Array(t.size), t.forEach(function(e) {
                                        r[++n] = [e, e]
                                    }), r) : tg(e(t), function(e) {
                                        return [e, t[e]]
                                    })
                                }
                            }

                            function ie(e, t, n, i, u, s, l, f) {
                                var h = 2 & t;
                                if (!h && "function" != typeof e) throw new eN(a);
                                var d = i ? i.length : 0;
                                if (d || (t &= -97, i = u = o), l = o === l ? l : t5(o9(l), 0), f = o === f ? f : o9(f), d -= u ? u.length : 0, 64 & t) {
                                    var p = i,
                                        v = u;
                                    i = u = o
                                }
                                var g = h ? o : is(e),
                                    m = [e, t, n, i, u, p, v, s, l, f];
                                if (g && function(e, t) {
                                        var n = e[1],
                                            r = t[1],
                                            i = n | r,
                                            o = i < 131,
                                            a = 128 == r && 8 == n || 128 == r && 256 == n && e[7].length <= t[8] || 384 == r && t[7].length <= t[8] && 8 == n;
                                        if (o || a) {
                                            1 & r && (e[2] = t[2], i |= 1 & n ? 0 : 4);
                                            var u = t[3];
                                            if (u) {
                                                var s = e[3];
                                                e[3] = s ? rU(s, u, t[4]) : u, e[4] = s ? tW(e[3], c) : t[4]
                                            }(u = t[5]) && (s = e[5], e[5] = s ? rF(s, u, t[6]) : u, e[6] = s ? tW(e[5], c) : t[6]), (u = t[7]) && (e[7] = u), 128 & r && (e[8] = null == e[8] ? t[8] : t8(e[8], t[8])), null == e[9] && (e[9] = t[9]), e[0] = t[0], e[1] = i
                                        }
                                    }(m, g), e = m[0], t = m[1], n = m[2], i = m[3], u = m[4], (f = m[9] = m[9] === o ? h ? 0 : e.length : t5(m[9] - d, 0)) || !(24 & t) || (t &= -25), t && 1 != t) 8 == t || 16 == t ? O = function(e, t, n) {
                                    var i = rY(e);

                                    function a() {
                                        for (var u = arguments.length, c = e_(u), s = u, l = ih(a); s--;) c[s] = arguments[s];
                                        var f = u < 3 && c[0] !== l && c[u - 1] !== l ? [] : tW(c, l);
                                        return (u -= f.length) < n ? r6(e, t, rQ, a.placeholder, o, c, f, o, o, n - u) : ts(this && this !== e4 && r._(this, a) ? i : e, this, c)
                                    }
                                    return a
                                }(e, t, f) : 32 != t && 33 != t || u.length ? O = rQ.apply(o, m) : (y = e, b = t, _ = n, w = i, E = 1 & b, A = rY(y), O = function e() {
                                    for (var t = -1, n = arguments.length, i = -1, o = w.length, a = e_(o + n), u = this && this !== e4 && r._(this, e) ? A : y; ++i < o;) a[i] = w[i];
                                    for (; n--;) a[i++] = arguments[++t];
                                    return ts(u, E ? _ : this, a)
                                });
                                else var y, b, _, w, E, A, x, S, B, T, N, O = (x = e, S = t, B = n, T = 1 & S, N = rY(x), function e() {
                                    return (this && this !== e4 && r._(this, e) ? N : x).apply(T ? B : this, arguments)
                                });
                                return ij((g ? rv : iR)(O, m), e, t)
                            }

                            function it(e, t, n, r) {
                                return o === e || oM(e, ek[n]) && !eL.call(r, n) ? t : e
                            }

                            function ir(e, t, n, r, i, a) {
                                return oq(e) && oq(t) && (a.set(t, e), ro(e, t, o, ir, a), a.delete(t)), e
                            }

                            function ii(e) {
                                return oQ(e) ? o : e
                            }

                            function io(e, t, n, r, i, a) {
                                var u = 1 & n,
                                    c = e.length,
                                    s = t.length;
                                if (c != s && !(u && s > c)) return !1;
                                var l = a.get(e),
                                    f = a.get(t);
                                if (l && f) return l == t && f == e;
                                var h = -1,
                                    d = !0,
                                    p = 2 & n ? new nx : o;
                                for (a.set(e, t), a.set(t, e); ++h < c;) {
                                    var v = e[h],
                                        g = t[h];
                                    if (r) var m = u ? r(g, v, h, t, e, a) : r(v, g, h, e, t, a);
                                    if (o !== m) {
                                        if (m) continue;
                                        d = !1;
                                        break
                                    }
                                    if (p) {
                                        if (!t_(t, function(e, t) {
                                                if (!tj(p, t) && (v === e || i(v, e, n, r, a))) return p.push(t)
                                            })) {
                                            d = !1;
                                            break
                                        }
                                    } else if (!(v === g || i(v, g, n, r, a))) {
                                        d = !1;
                                        break
                                    }
                                }
                                return a.delete(e), a.delete(t), d
                            }

                            function ia(e) {
                                return iM(iI(e, o, iX), e + "")
                            }

                            function iu(e) {
                                return nJ(e, ag, im)
                            }

                            function ic(e) {
                                return nJ(e, am, iy)
                            }
                            var is = na ? function(e) {
                                return na.get(e)
                            } : aZ;

                            function il(e) {
                                for (var t = e.name + "", n = nu[t], r = eL.call(nu, t) ? n.length : 0; r--;) {
                                    var i = n[r],
                                        o = i.func;
                                    if (null == o || o == e) return i.name
                                }
                                return t
                            }

                            function ih(e) {
                                return (eL.call(ng, "placeholder") ? ng : e).placeholder
                            }

                            function id() {
                                var e = ng.iteratee || aG;
                                return e = e === aG ? n9 : e, arguments.length ? e(arguments[0], arguments[1]) : e
                            }

                            function ip(e, t) {
                                var n, r, o = e.__data__;
                                return ("string" == (r = void 0 === (n = t) ? "undefined" : i._(n)) || "number" == r || "symbol" == r || "boolean" == r ? "__proto__" !== n : null === n) ? o["string" == typeof t ? "string" : "hash"] : o.map
                            }

                            function iv(e) {
                                for (var t = ag(e), n = t.length; n--;) {
                                    var r, i = t[n],
                                        o = e[i];
                                    t[n] = [i, o, (r = o) == r && !oq(r)]
                                }
                                return t
                            }

                            function ig(e, t) {
                                var n = null == e ? o : e[t];
                                return n7(n) ? n : o
                            }
                            var im = tQ ? function(e) {
                                    return null == e ? [] : td(tQ(e = eS(e)), function(t) {
                                        return eY.call(e, t)
                                    })
                                } : a0,
                                iy = tQ ? function(e) {
                                    for (var t = []; e;) tm(t, im(e)), e = eW(e);
                                    return t
                                } : a0,
                                ib = nQ;

                            function i_(e, t, n) {
                                t = rR(t, e);
                                for (var r = -1, i = t.length, o = !1; ++r < i;) {
                                    var a = iU(t[r]);
                                    if (!(o = null != e && n(e, a))) break;
                                    e = e[a]
                                }
                                return o || ++r != i ? o : !!(i = null == e ? 0 : e.length) && oX(i) && iA(a, i) && (oD(e) || oH(e))
                            }

                            function iw(e) {
                                return "function" != typeof e.constructor || iN(e) ? {} : nm(eW(e))
                            }

                            function iE(e) {
                                return oD(e) || oH(e) || !!(e8 && e && e[e8])
                            }

                            function iA(e, t) {
                                var n = void 0 === e ? "undefined" : i._(e);
                                return !!(t = null == t ? 0x1fffffffffffff : t) && ("number" == n || "symbol" != n && ep.test(e)) && e > -1 && e % 1 == 0 && e < t
                            }

                            function ix(e, t, n) {
                                if (!oq(n)) return !1;
                                var r = void 0 === t ? "undefined" : i._(t);
                                return ("number" == r ? !!(oF(n) && iA(t, n.length)) : "string" == r && t in n) && oM(n[t], e)
                            }

                            function iS(e, t) {
                                if (oD(e)) return !1;
                                var n = void 0 === e ? "undefined" : i._(e);
                                return !!("number" == n || "symbol" == n || "boolean" == n || null == e || o3(e)) || Y.test(e) || !q.test(e) || null != t && e in eS(t)
                            }

                            function iB(e) {
                                var t = il(e),
                                    n = ng[t];
                                if ("function" != typeof n || !(t in n_.prototype)) return !1;
                                if (e === n) return !0;
                                var r = is(n);
                                return !!r && e === r[0]
                            }(ne && ib(new ne(new ArrayBuffer(1))) != O || nt && ib(new nt) != b || nn && ib(nn.resolve()) != E || nr && ib(new nr) != x || ni && ib(new ni) != T) && (ib = function(e) {
                                var t = nQ(e),
                                    n = t == w ? e.constructor : o,
                                    r = n ? iF(n) : "";
                                if (r) switch (r) {
                                    case nc:
                                        return O;
                                    case ns:
                                        return b;
                                    case nl:
                                        return E;
                                    case nf:
                                        return x;
                                    case nh:
                                        return T
                                }
                                return t
                            });
                            var iT = eC ? oK : a1;

                            function iN(e) {
                                var t = e && e.constructor;
                                return e === ("function" == typeof t && t.prototype || ek)
                            }

                            function iO(e, t) {
                                return function(n) {
                                    return null != n && n[e] === t && (o !== t || e in eS(n))
                                }
                            }

                            function iI(e, t, n) {
                                return t = t5(o === t ? e.length - 1 : t, 0),
                                    function() {
                                        for (var r = arguments, i = -1, o = t5(r.length - t, 0), a = e_(o); ++i < o;) a[i] = r[t + i];
                                        i = -1;
                                        for (var u = e_(t + 1); ++i < t;) u[i] = r[i];
                                        return u[t] = n(a), ts(e, this, u)
                                    }
                            }

                            function ik(e, t) {
                                return t.length < 2 ? e : n$(e, rm(t, 0, -1))
                            }

                            function iC(e, t) {
                                if (("constructor" !== t || "function" != typeof e[t]) && "__proto__" != t) return e[t]
                            }
                            var iR = iP(rv),
                                iL = tw || function(e, t) {
                                    return e4.setTimeout(e, t)
                                },
                                iM = iP(rg);

                            function ij(e, t, n) {
                                var r, i, o, a = t + "";
                                return iM(e, function(e, t) {
                                    var n = t.length;
                                    if (!n) return e;
                                    var r = n - 1;
                                    return t[r] = (n > 1 ? "& " : "") + t[r], t = t.join(n > 2 ? ", " : " "), e.replace(en, "{\n/* [wrapped with " + t + "] */\n")
                                }(a, (r = (o = a.match(er)) ? o[1].split(ei) : [], i = n, tf(f, function(e) {
                                    var t = "_." + e[0];
                                    i & e[1] && !tp(r, t) && r.push(t)
                                }), r.sort())))
                            }

                            function iP(e) {
                                var t = 0,
                                    n = 0;
                                return function() {
                                    var r = t6(),
                                        i = 16 - (r - n);
                                    if (n = r, i > 0) {
                                        if (++t >= 800) return arguments[0]
                                    } else t = 0;
                                    return e.apply(o, arguments)
                                }
                            }

                            function iH(e, t) {
                                var n = -1,
                                    r = e.length,
                                    i = r - 1;
                                for (t = o === t ? r : t; ++n < t;) {
                                    var a = rf(n, i),
                                        u = e[a];
                                    e[a] = e[n], e[n] = u
                                }
                                return e.length = t, e
                            }
                            var iD = (ey = (et = oO(function(e) {
                                var t = [];
                                return 46 === e.charCodeAt(0) && t.push(""), e.replace($, function(e, n, r, i) {
                                    t.push(r ? i.replace(eu, "$1") : n || e)
                                }), t
                            }, function(e) {
                                return 500 === ey.size && ey.clear(), e
                            })).cache, et);

                            function iU(e) {
                                if ("string" == typeof e || o3(e)) return e;
                                var t = e + "";
                                return "0" == t && 1 / e == -s ? "-0" : t
                            }

                            function iF(e) {
                                if (null != e) {
                                    try {
                                        return eR.call(e)
                                    } catch (e) {}
                                    try {
                                        return e + ""
                                    } catch (e) {}
                                }
                                return ""
                            }

                            function iz(e) {
                                if (r._(e, n_)) return e.clone();
                                var t = new nb(e.__wrapped__, e.__chain__);
                                return t.__actions__ = rz(e.__actions__), t.__index__ = e.__index__, t.__values__ = e.__values__, t
                            }
                            var iG = rd(function(e, t) {
                                    return oz(e) ? nD(e, nW(t, 1, oz, !0)) : []
                                }),
                                iV = rd(function(e, t) {
                                    var n = iQ(t);
                                    return oz(n) && (n = o), oz(e) ? nD(e, nW(t, 1, oz, !0), id(n, 2)) : []
                                }),
                                iW = rd(function(e, t) {
                                    var n = iQ(t);
                                    return oz(n) && (n = o), oz(e) ? nD(e, nW(t, 1, oz, !0), o, n) : []
                                });

                            function iK(e, t, n) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var i = null == n ? 0 : o9(n);
                                return i < 0 && (i = t5(r + i, 0)), tA(e, id(t, 3), i)
                            }

                            function iZ(e, t, n) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var i = r - 1;
                                return o !== n && (i = o9(n), i = n < 0 ? t5(r + i, 0) : t8(i, r - 1)), tA(e, id(t, 3), i, !0)
                            }

                            function iX(e) {
                                return (null == e ? 0 : e.length) ? nW(e, 1) : []
                            }

                            function iq(e) {
                                return e && e.length ? e[0] : o
                            }
                            var iY = rd(function(e) {
                                    var t = tg(e, rk);
                                    return t.length && t[0] === e[0] ? n3(t) : []
                                }),
                                i$ = rd(function(e) {
                                    var t = iQ(e),
                                        n = tg(e, rk);
                                    return t === iQ(n) ? t = o : n.pop(), n.length && n[0] === e[0] ? n3(n, id(t, 2)) : []
                                }),
                                iJ = rd(function(e) {
                                    var t = iQ(e),
                                        n = tg(e, rk);
                                    return (t = "function" == typeof t ? t : o) && n.pop(), n.length && n[0] === e[0] ? n3(n, o, t) : []
                                });

                            function iQ(e) {
                                var t = null == e ? 0 : e.length;
                                return t ? e[t - 1] : o
                            }
                            var i0 = rd(i1);

                            function i1(e, t) {
                                return e && e.length && t && t.length ? rs(e, t) : e
                            }
                            var i2 = ia(function(e, t) {
                                var n = null == e ? 0 : e.length,
                                    r = nL(e, t);
                                return rl(e, tg(t, function(e) {
                                    return iA(e, n) ? +e : e
                                }).sort(rD)), r
                            });

                            function i3(e) {
                                return null == e ? e : t9.call(e)
                            }
                            var i5 = rd(function(e) {
                                    return rx(nW(e, 1, oz, !0))
                                }),
                                i8 = rd(function(e) {
                                    var t = iQ(e);
                                    return oz(t) && (t = o), rx(nW(e, 1, oz, !0), id(t, 2))
                                }),
                                i6 = rd(function(e) {
                                    var t = iQ(e);
                                    return t = "function" == typeof t ? t : o, rx(nW(e, 1, oz, !0), o, t)
                                });

                            function i4(e) {
                                if (!(e && e.length)) return [];
                                var t = 0;
                                return e = td(e, function(e) {
                                    if (oz(e)) return t = t5(e.length, t), !0
                                }), tC(t, function(t) {
                                    return tg(e, tN(t))
                                })
                            }

                            function i7(e, t) {
                                if (!(e && e.length)) return [];
                                var n = i4(e);
                                return null == t ? n : tg(n, function(e) {
                                    return ts(t, o, e)
                                })
                            }
                            var i9 = rd(function(e, t) {
                                    return oz(e) ? nD(e, t) : []
                                }),
                                oe = rd(function(e) {
                                    return rO(td(e, oz))
                                }),
                                ot = rd(function(e) {
                                    var t = iQ(e);
                                    return oz(t) && (t = o), rO(td(e, oz), id(t, 2))
                                }),
                                on = rd(function(e) {
                                    var t = iQ(e);
                                    return t = "function" == typeof t ? t : o, rO(td(e, oz), o, t)
                                }),
                                or = rd(i4),
                                oi = rd(function(e) {
                                    var t = e.length,
                                        n = t > 1 ? e[t - 1] : o;
                                    return n = "function" == typeof n ? (e.pop(), n) : o, i7(e, n)
                                });

                            function oo(e) {
                                var t = ng(e);
                                return t.__chain__ = !0, t
                            }

                            function oa(e, t) {
                                return t(e)
                            }
                            var ou = ia(function(e) {
                                    var t = e.length,
                                        n = t ? e[0] : 0,
                                        i = this.__wrapped__,
                                        a = function(t) {
                                            return nL(t, e)
                                        };
                                    return t > 1 || this.__actions__.length || !r._(i, n_) || !iA(n) ? this.thru(a) : ((i = i.slice(n, +n + +!!t)).__actions__.push({
                                        func: oa,
                                        args: [a],
                                        thisArg: o
                                    }), new nb(i, this.__chain__).thru(function(e) {
                                        return t && !e.length && e.push(o), e
                                    }))
                                }),
                                oc = rV(function(e, t, n) {
                                    eL.call(e, n) ? ++e[n] : nR(e, n, 1)
                                }),
                                os = r$(iK),
                                ol = r$(iZ);

                            function of(e, t) {
                                return (oD(e) ? tf : nU)(e, id(t, 3))
                            }

                            function oh(e, t) {
                                return (oD(e) ? function(e, t) {
                                    for (var n = null == e ? 0 : e.length; n-- && !1 !== t(e[n], n, e););
                                    return e
                                } : nF)(e, id(t, 3))
                            }
                            var od = rV(function(e, t, n) {
                                    eL.call(e, n) ? e[n].push(t) : nR(e, n, [t])
                                }),
                                op = rd(function(e, t, n) {
                                    var r = -1,
                                        i = "function" == typeof t,
                                        o = oF(e) ? e_(e.length) : [];
                                    return nU(e, function(e) {
                                        o[++r] = i ? ts(t, e, n) : n5(e, t, n)
                                    }), o
                                }),
                                ov = rV(function(e, t, n) {
                                    nR(e, n, t)
                                });

                            function og(e, t) {
                                return (oD(e) ? tg : rn)(e, id(t, 3))
                            }
                            var om = rV(function(e, t, n) {
                                    e[+!n].push(t)
                                }, function() {
                                    return [
                                        [],
                                        []
                                    ]
                                }),
                                oy = rd(function(e, t) {
                                    if (null == e) return [];
                                    var n = t.length;
                                    return n > 1 && ix(e, t[0], t[1]) ? t = [] : n > 2 && ix(t[0], t[1], t[2]) && (t = [t[0]]), ru(e, nW(t, 1), [])
                                }),
                                ob = tn || function() {
                                    return e4.Date.now()
                                };

                            function o_(e, t, n) {
                                return t = n ? o : t, t = e && null == t ? e.length : t, ie(e, 128, o, o, o, o, t)
                            }

                            function ow(e, t) {
                                var n;
                                if ("function" != typeof t) throw new eN(a);
                                return e = o9(e),
                                    function() {
                                        return --e > 0 && (n = t.apply(this, arguments)), e <= 1 && (t = o), n
                                    }
                            }
                            var oE = rd(function(e, t, n) {
                                    var r = 1;
                                    if (n.length) {
                                        var i = tW(n, ih(oE));
                                        r |= 32
                                    }
                                    return ie(e, r, t, n, i)
                                }),
                                oA = rd(function(e, t, n) {
                                    var r = 3;
                                    if (n.length) {
                                        var i = tW(n, ih(oA));
                                        r |= 32
                                    }
                                    return ie(t, r, e, n, i)
                                });

                            function ox(e, t, n) {
                                t = n ? o : t;
                                var r = ie(e, 8, o, o, o, o, o, t);
                                return r.placeholder = ox.placeholder, r
                            }

                            function oS(e, t, n) {
                                t = n ? o : t;
                                var r = ie(e, 16, o, o, o, o, o, t);
                                return r.placeholder = oS.placeholder, r
                            }

                            function oB(e, t, n) {
                                var r, i, u, c, s, l, f = 0,
                                    h = !1,
                                    d = !1,
                                    p = !0;
                                if ("function" != typeof e) throw new eN(a);

                                function v(t) {
                                    var n = r,
                                        a = i;
                                    return r = i = o, f = t, c = e.apply(a, n)
                                }

                                function g(e) {
                                    var n = e - l,
                                        r = e - f;
                                    return o === l || n >= t || n < 0 || d && r >= u
                                }

                                function m() {
                                    var e, n, r, i = ob();
                                    if (g(i)) return y(i);
                                    s = iL(m, (e = i - l, n = i - f, r = t - e, d ? t8(r, u - n) : r))
                                }

                                function y(e) {
                                    return (s = o, p && r) ? v(e) : (r = i = o, c)
                                }

                                function b() {
                                    var e, n = ob(),
                                        a = g(n);
                                    if (r = arguments, i = this, l = n, a) {
                                        if (o === s) return f = e = l, s = iL(m, t), h ? v(e) : c;
                                        if (d) return rM(s), s = iL(m, t), v(l)
                                    }
                                    return o === s && (s = iL(m, t)), c
                                }
                                return t = at(t) || 0, oq(n) && (h = !!n.leading, u = (d = "maxWait" in n) ? t5(at(n.maxWait) || 0, t) : u, p = "trailing" in n ? !!n.trailing : p), b.cancel = function() {
                                    o !== s && rM(s), f = 0, r = l = i = s = o
                                }, b.flush = function() {
                                    return o === s ? c : y(ob())
                                }, b
                            }
                            var oT = rd(function(e, t) {
                                    return nH(e, 1, t)
                                }),
                                oN = rd(function(e, t, n) {
                                    return nH(e, at(t) || 0, n)
                                });

                            function oO(e, t) {
                                if ("function" != typeof e || null != t && "function" != typeof t) throw new eN(a);
                                var n = function() {
                                    var r = arguments,
                                        i = t ? t.apply(this, r) : r[0],
                                        o = n.cache;
                                    if (o.has(i)) return o.get(i);
                                    var a = e.apply(this, r);
                                    return n.cache = o.set(i, a) || o, a
                                };
                                return n.cache = new(oO.Cache || nA), n
                            }

                            function oI(e) {
                                if ("function" != typeof e) throw new eN(a);
                                return function() {
                                    var t = arguments;
                                    switch (t.length) {
                                        case 0:
                                            return !e.call(this);
                                        case 1:
                                            return !e.call(this, t[0]);
                                        case 2:
                                            return !e.call(this, t[0], t[1]);
                                        case 3:
                                            return !e.call(this, t[0], t[1], t[2])
                                    }
                                    return !e.apply(this, t)
                                }
                            }
                            oO.Cache = nA;
                            var ok = rd(function(e, t) {
                                    var n = (t = 1 == t.length && oD(t[0]) ? tg(t[0], tL(id())) : tg(nW(t, 1), tL(id()))).length;
                                    return rd(function(r) {
                                        for (var i = -1, o = t8(r.length, n); ++i < o;) r[i] = t[i].call(this, r[i]);
                                        return ts(e, this, r)
                                    })
                                }),
                                oC = rd(function(e, t) {
                                    var n = tW(t, ih(oC));
                                    return ie(e, 32, o, t, n)
                                }),
                                oR = rd(function(e, t) {
                                    var n = tW(t, ih(oR));
                                    return ie(e, 64, o, t, n)
                                }),
                                oL = ia(function(e, t) {
                                    return ie(e, 256, o, o, o, t)
                                });

                            function oM(e, t) {
                                return e === t || e != e && t != t
                            }
                            var oj = r8(n0),
                                oP = r8(function(e, t) {
                                    return e >= t
                                }),
                                oH = n8(function() {
                                    return arguments
                                }()) ? n8 : function(e) {
                                    return oY(e) && eL.call(e, "callee") && !eY.call(e, "callee")
                                },
                                oD = e_.isArray,
                                oU = tr ? tL(tr) : function(e) {
                                    return oY(e) && nQ(e) == N
                                };

                            function oF(e) {
                                return null != e && oX(e.length) && !oK(e)
                            }

                            function oz(e) {
                                return oY(e) && oF(e)
                            }
                            var oG = t0 || a1,
                                oV = ti ? tL(ti) : function(e) {
                                    return oY(e) && nQ(e) == v
                                };

                            function oW(e) {
                                if (!oY(e)) return !1;
                                var t = nQ(e);
                                return t == g || "[object DOMException]" == t || "string" == typeof e.message && "string" == typeof e.name && !oQ(e)
                            }

                            function oK(e) {
                                if (!oq(e)) return !1;
                                var t = nQ(e);
                                return t == m || t == y || "[object AsyncFunction]" == t || "[object Proxy]" == t
                            }

                            function oZ(e) {
                                return "number" == typeof e && e == o9(e)
                            }

                            function oX(e) {
                                return "number" == typeof e && e > -1 && e % 1 == 0 && e <= 0x1fffffffffffff
                            }

                            function oq(e) {
                                var t = void 0 === e ? "undefined" : i._(e);
                                return null != e && ("object" == t || "function" == t)
                            }

                            function oY(e) {
                                return null != e && (void 0 === e ? "undefined" : i._(e)) == "object"
                            }
                            var o$ = to ? tL(to) : function(e) {
                                return oY(e) && ib(e) == b
                            };

                            function oJ(e) {
                                return "number" == typeof e || oY(e) && nQ(e) == _
                            }

                            function oQ(e) {
                                if (!oY(e) || nQ(e) != w) return !1;
                                var t = eW(e);
                                if (null === t) return !0;
                                var n = eL.call(t, "constructor") && t.constructor;
                                return "function" == typeof n && r._(n, n) && eR.call(n) == eH
                            }
                            var o0 = ta ? tL(ta) : function(e) {
                                    return oY(e) && nQ(e) == A
                                },
                                o1 = tu ? tL(tu) : function(e) {
                                    return oY(e) && ib(e) == x
                                };

                            function o2(e) {
                                return "string" == typeof e || !oD(e) && oY(e) && nQ(e) == S
                            }

                            function o3(e) {
                                return (void 0 === e ? "undefined" : i._(e)) == "symbol" || oY(e) && nQ(e) == B
                            }
                            var o5 = tc ? tL(tc) : function(e) {
                                    return oY(e) && oX(e.length) && !!e0[nQ(e)]
                                },
                                o8 = r8(rt),
                                o6 = r8(function(e, t) {
                                    return e <= t
                                });

                            function o4(e) {
                                if (!e) return [];
                                if (oF(e)) return o2(e) ? tX(e) : rz(e);
                                if (e6 && e[e6]) {
                                    for (var t, n = e[e6](), r = []; !(t = n.next()).done;) r.push(t.value);
                                    return r
                                }
                                var i = ib(e);
                                return (i == b ? tG : i == x ? tK : aS)(e)
                            }

                            function o7(e) {
                                return e ? (e = at(e)) === s || e === -s ? (e < 0 ? -1 : 1) * 17976931348623157e292 : e == e ? e : 0 : 0 === e ? e : 0
                            }

                            function o9(e) {
                                var t = o7(e),
                                    n = t % 1;
                                return t == t ? n ? t - n : t : 0
                            }

                            function ae(e) {
                                return e ? nM(o9(e), 0, 0xffffffff) : 0
                            }

                            function at(e) {
                                if ("number" == typeof e) return e;
                                if (o3(e)) return l;
                                if (oq(e)) {
                                    var t = "function" == typeof e.valueOf ? e.valueOf() : e;
                                    e = oq(t) ? t + "" : t
                                }
                                if ("string" != typeof e) return 0 === e ? e : +e;
                                e = tR(e);
                                var n = ef.test(e);
                                return n || ed.test(e) ? e5(e.slice(2), n ? 2 : 8) : el.test(e) ? l : +e
                            }

                            function an(e) {
                                return rG(e, am(e))
                            }

                            function ar(e) {
                                return null == e ? "" : rA(e)
                            }
                            var ai = rW(function(e, t) {
                                    if (iN(t) || oF(t)) return void rG(t, ag(t), e);
                                    for (var n in t) eL.call(t, n) && nO(e, n, t[n])
                                }),
                                ao = rW(function(e, t) {
                                    rG(t, am(t), e)
                                }),
                                aa = rW(function(e, t, n, r) {
                                    rG(t, am(t), e, r)
                                }),
                                au = rW(function(e, t, n, r) {
                                    rG(t, ag(t), e, r)
                                }),
                                ac = ia(nL),
                                as = rd(function(e, t) {
                                    e = eS(e);
                                    var n = -1,
                                        r = t.length,
                                        i = r > 2 ? t[2] : o;
                                    for (i && ix(t[0], t[1], i) && (r = 1); ++n < r;)
                                        for (var a = t[n], u = am(a), c = -1, s = u.length; ++c < s;) {
                                            var l = u[c],
                                                f = e[l];
                                            (o === f || oM(f, ek[l]) && !eL.call(e, l)) && (e[l] = a[l])
                                        }
                                    return e
                                }),
                                al = rd(function(e) {
                                    return e.push(o, ir), ts(ab, o, e)
                                });

                            function af(e, t, n) {
                                var r = null == e ? o : n$(e, t);
                                return o === r ? n : r
                            }

                            function ah(e, t) {
                                return null != e && i_(e, t, n2)
                            }
                            var ad = r0(function(e, t, n) {
                                    null != t && "function" != typeof t.toString && (t = eP.call(t)), e[t] = n
                                }, aD(az)),
                                ap = r0(function(e, t, n) {
                                    null != t && "function" != typeof t.toString && (t = eP.call(t)), eL.call(e, t) ? e[t].push(n) : e[t] = [n]
                                }, id),
                                av = rd(n5);

                            function ag(e) {
                                return oF(e) ? nB(e) : re(e)
                            }

                            function am(e) {
                                return oF(e) ? nB(e, !0) : function(e) {
                                    if (!oq(e)) {
                                        var t = e,
                                            n = [];
                                        if (null != t)
                                            for (var r in eS(t)) n.push(r);
                                        return n
                                    }
                                    var i = iN(e),
                                        o = [];
                                    for (var a in e) "constructor" == a && (i || !eL.call(e, a)) || o.push(a);
                                    return o
                                }(e)
                            }
                            var ay = rW(function(e, t, n) {
                                    ro(e, t, n)
                                }),
                                ab = rW(function(e, t, n, r) {
                                    ro(e, t, n, r)
                                }),
                                a_ = ia(function(e, t) {
                                    var n = {};
                                    if (null == e) return n;
                                    var r = !1;
                                    t = tg(t, function(t) {
                                        return t = rR(t, e), r || (r = t.length > 1), t
                                    }), rG(e, ic(e), n), r && (n = nj(n, 7, ii));
                                    for (var i = t.length; i--;) rS(n, t[i]);
                                    return n
                                }),
                                aw = ia(function(e, t) {
                                    return null == e ? {} : rc(e, t, function(t, n) {
                                        return ah(e, n)
                                    })
                                });

                            function aE(e, t) {
                                if (null == e) return {};
                                var n = tg(ic(e), function(e) {
                                    return [e]
                                });
                                return t = id(t), rc(e, n, function(e, n) {
                                    return t(e, n[0])
                                })
                            }
                            var aA = r9(ag),
                                ax = r9(am);

                            function aS(e) {
                                return null == e ? [] : tM(e, ag(e))
                            }
                            var aB = rq(function(e, t, n) {
                                return t = t.toLowerCase(), e + (n ? aT(t) : t)
                            });

                            function aT(e) {
                                return aM(ar(e).toLowerCase())
                            }

                            function aN(e) {
                                return (e = ar(e)) && e.replace(ev, tD).replace(eZ, "")
                            }
                            var aO = rq(function(e, t, n) {
                                    return e + (n ? "-" : "") + t.toLowerCase()
                                }),
                                aI = rq(function(e, t, n) {
                                    return e + (n ? " " : "") + t.toLowerCase()
                                }),
                                ak = rX("toLowerCase"),
                                aC = rq(function(e, t, n) {
                                    return e + (n ? "_" : "") + t.toLowerCase()
                                }),
                                aR = rq(function(e, t, n) {
                                    return e + (n ? " " : "") + aM(t)
                                }),
                                aL = rq(function(e, t, n) {
                                    return e + (n ? " " : "") + t.toUpperCase()
                                }),
                                aM = rX("toUpperCase");

                            function aj(e, t, n) {
                                if (e = ar(e), t = n ? o : t, o === t) {
                                    var r;
                                    return (r = e, e$.test(r)) ? e.match(eq) || [] : e.match(eo) || []
                                }
                                return e.match(t) || []
                            }
                            var aP = rd(function(e, t) {
                                    try {
                                        return ts(e, o, t)
                                    } catch (e) {
                                        return oW(e) ? e : new eE(e)
                                    }
                                }),
                                aH = ia(function(e, t) {
                                    return tf(t, function(t) {
                                        nR(e, t = iU(t), oE(e[t], e))
                                    }), e
                                });

                            function aD(e) {
                                return function() {
                                    return e
                                }
                            }
                            var aU = rJ(),
                                aF = rJ(!0);

                            function az(e) {
                                return e
                            }

                            function aG(e) {
                                return n9("function" == typeof e ? e : nj(e, 1))
                            }
                            var aV = rd(function(e, t) {
                                    return function(n) {
                                        return n5(n, e, t)
                                    }
                                }),
                                aW = rd(function(e, t) {
                                    return function(n) {
                                        return n5(e, n, t)
                                    }
                                });

                            function aK(e, t, n) {
                                var r = ag(t),
                                    i = nY(t, r);
                                null != n || oq(t) && (i.length || !r.length) || (n = t, t = e, e = this, i = nY(t, ag(t)));
                                var o = !(oq(n) && "chain" in n) || !!n.chain,
                                    a = oK(e);
                                return tf(i, function(n) {
                                    var r = t[n];
                                    e[n] = r, a && (e.prototype[n] = function() {
                                        var t = this.__chain__;
                                        if (o || t) {
                                            var n = e(this.__wrapped__);
                                            return (n.__actions__ = rz(this.__actions__)).push({
                                                func: r,
                                                args: arguments,
                                                thisArg: e
                                            }), n.__chain__ = t, n
                                        }
                                        return r.apply(e, tm([this.value()], arguments))
                                    })
                                }), e
                            }

                            function aZ() {}
                            var aX = r2(tg),
                                aq = r2(th),
                                aY = r2(t_);

                            function a$(e) {
                                return iS(e) ? tN(iU(e)) : function(t) {
                                    return n$(t, e)
                                }
                            }
                            var aJ = r5(),
                                aQ = r5(!0);

                            function a0() {
                                return []
                            }

                            function a1() {
                                return !1
                            }
                            var a2 = r1(function(e, t) {
                                    return e + t
                                }, 0),
                                a3 = r4("ceil"),
                                a5 = r1(function(e, t) {
                                    return e / t
                                }, 1),
                                a8 = r4("floor"),
                                a6 = r1(function(e, t) {
                                    return e * t
                                }, 1),
                                a4 = r4("round"),
                                a7 = r1(function(e, t) {
                                    return e - t
                                }, 0);
                            return ng.after = function(e, t) {
                                if ("function" != typeof t) throw new eN(a);
                                return e = o9(e),
                                    function() {
                                        if (--e < 1) return t.apply(this, arguments)
                                    }
                            }, ng.ary = o_, ng.assign = ai, ng.assignIn = ao, ng.assignInWith = aa, ng.assignWith = au, ng.at = ac, ng.before = ow, ng.bind = oE, ng.bindAll = aH, ng.bindKey = oA, ng.castArray = function() {
                                if (!arguments.length) return [];
                                var e = arguments[0];
                                return oD(e) ? e : [e]
                            }, ng.chain = oo, ng.chunk = function(e, t, n) {
                                t = (n ? ix(e, t, n) : o === t) ? 1 : t5(o9(t), 0);
                                var r = null == e ? 0 : e.length;
                                if (!r || t < 1) return [];
                                for (var i = 0, a = 0, u = e_(tO(r / t)); i < r;) u[a++] = rm(e, i, i += t);
                                return u
                            }, ng.compact = function(e) {
                                for (var t = -1, n = null == e ? 0 : e.length, r = 0, i = []; ++t < n;) {
                                    var o = e[t];
                                    o && (i[r++] = o)
                                }
                                return i
                            }, ng.concat = function() {
                                var e = arguments.length;
                                if (!e) return [];
                                for (var t = e_(e - 1), n = arguments[0], r = e; r--;) t[r - 1] = arguments[r];
                                return tm(oD(n) ? rz(n) : [n], nW(t, 1))
                            }, ng.cond = function(e) {
                                var t = null == e ? 0 : e.length,
                                    n = id();
                                return e = t ? tg(e, function(e) {
                                    if ("function" != typeof e[1]) throw new eN(a);
                                    return [n(e[0]), e[1]]
                                }) : [], rd(function(n) {
                                    for (var r = -1; ++r < t;) {
                                        var i = e[r];
                                        if (ts(i[0], this, n)) return ts(i[1], this, n)
                                    }
                                })
                            }, ng.conforms = function(e) {
                                var t, n;
                                return n = ag(t = nj(e, 1)),
                                    function(e) {
                                        return nP(e, t, n)
                                    }
                            }, ng.constant = aD, ng.countBy = oc, ng.create = function(e, t) {
                                var n = nm(e);
                                return null == t ? n : nC(n, t)
                            }, ng.curry = ox, ng.curryRight = oS, ng.debounce = oB, ng.defaults = as, ng.defaultsDeep = al, ng.defer = oT, ng.delay = oN, ng.difference = iG, ng.differenceBy = iV, ng.differenceWith = iW, ng.drop = function(e, t, n) {
                                var r = null == e ? 0 : e.length;
                                return r ? rm(e, (t = n || o === t ? 1 : o9(t)) < 0 ? 0 : t, r) : []
                            }, ng.dropRight = function(e, t, n) {
                                var r = null == e ? 0 : e.length;
                                return r ? rm(e, 0, (t = r - (t = n || o === t ? 1 : o9(t))) < 0 ? 0 : t) : []
                            }, ng.dropRightWhile = function(e, t) {
                                return e && e.length ? rT(e, id(t, 3), !0, !0) : []
                            }, ng.dropWhile = function(e, t) {
                                return e && e.length ? rT(e, id(t, 3), !0) : []
                            }, ng.fill = function(e, t, n, r) {
                                var i = null == e ? 0 : e.length;
                                if (!i) return [];
                                n && "number" != typeof n && ix(e, t, n) && (n = 0, r = i);
                                var a = n,
                                    u = r,
                                    c = e.length;
                                for ((a = o9(a)) < 0 && (a = -a > c ? 0 : c + a), (u = o === u || u > c ? c : o9(u)) < 0 && (u += c), u = a > u ? 0 : ae(u); a < u;) e[a++] = t;
                                return e
                            }, ng.filter = function(e, t) {
                                return (oD(e) ? td : nV)(e, id(t, 3))
                            }, ng.flatMap = function(e, t) {
                                return nW(og(e, t), 1)
                            }, ng.flatMapDeep = function(e, t) {
                                return nW(og(e, t), s)
                            }, ng.flatMapDepth = function(e, t, n) {
                                return n = o === n ? 1 : o9(n), nW(og(e, t), n)
                            }, ng.flatten = iX, ng.flattenDeep = function(e) {
                                return (null == e ? 0 : e.length) ? nW(e, s) : []
                            }, ng.flattenDepth = function(e, t) {
                                return (null == e ? 0 : e.length) ? nW(e, t = o === t ? 1 : o9(t)) : []
                            }, ng.flip = function(e) {
                                return ie(e, 512)
                            }, ng.flow = aU, ng.flowRight = aF, ng.fromPairs = function(e) {
                                for (var t = -1, n = null == e ? 0 : e.length, r = {}; ++t < n;) {
                                    var i = e[t];
                                    r[i[0]] = i[1]
                                }
                                return r
                            }, ng.functions = function(e) {
                                return null == e ? [] : nY(e, ag(e))
                            }, ng.functionsIn = function(e) {
                                return null == e ? [] : nY(e, am(e))
                            }, ng.groupBy = od, ng.initial = function(e) {
                                return (null == e ? 0 : e.length) ? rm(e, 0, -1) : []
                            }, ng.intersection = iY, ng.intersectionBy = i$, ng.intersectionWith = iJ, ng.invert = ad, ng.invertBy = ap, ng.invokeMap = op, ng.iteratee = aG, ng.keyBy = ov, ng.keys = ag, ng.keysIn = am, ng.map = og, ng.mapKeys = function(e, t) {
                                var n = {};
                                return t = id(t, 3), nX(e, function(e, r, i) {
                                    nR(n, t(e, r, i), e)
                                }), n
                            }, ng.mapValues = function(e, t) {
                                var n = {};
                                return t = id(t, 3), nX(e, function(e, r, i) {
                                    nR(n, r, t(e, r, i))
                                }), n
                            }, ng.matches = function(e) {
                                return rr(nj(e, 1))
                            }, ng.matchesProperty = function(e, t) {
                                return ri(e, nj(t, 1))
                            }, ng.memoize = oO, ng.merge = ay, ng.mergeWith = ab, ng.method = aV, ng.methodOf = aW, ng.mixin = aK, ng.negate = oI, ng.nthArg = function(e) {
                                return e = o9(e), rd(function(t) {
                                    return ra(t, e)
                                })
                            }, ng.omit = a_, ng.omitBy = function(e, t) {
                                return aE(e, oI(id(t)))
                            }, ng.once = function(e) {
                                return ow(2, e)
                            }, ng.orderBy = function(e, t, n, r) {
                                return null == e ? [] : (oD(t) || (t = null == t ? [] : [t]), oD(n = r ? o : n) || (n = null == n ? [] : [n]), ru(e, t, n))
                            }, ng.over = aX, ng.overArgs = ok, ng.overEvery = aq, ng.overSome = aY, ng.partial = oC, ng.partialRight = oR, ng.partition = om, ng.pick = aw, ng.pickBy = aE, ng.property = a$, ng.propertyOf = function(e) {
                                return function(t) {
                                    return null == e ? o : n$(e, t)
                                }
                            }, ng.pull = i0, ng.pullAll = i1, ng.pullAllBy = function(e, t, n) {
                                return e && e.length && t && t.length ? rs(e, t, id(n, 2)) : e
                            }, ng.pullAllWith = function(e, t, n) {
                                return e && e.length && t && t.length ? rs(e, t, o, n) : e
                            }, ng.pullAt = i2, ng.range = aJ, ng.rangeRight = aQ, ng.rearg = oL, ng.reject = function(e, t) {
                                return (oD(e) ? td : nV)(e, oI(id(t, 3)))
                            }, ng.remove = function(e, t) {
                                var n = [];
                                if (!(e && e.length)) return n;
                                var r = -1,
                                    i = [],
                                    o = e.length;
                                for (t = id(t, 3); ++r < o;) {
                                    var a = e[r];
                                    t(a, r, e) && (n.push(a), i.push(r))
                                }
                                return rl(e, i), n
                            }, ng.rest = function(e, t) {
                                if ("function" != typeof e) throw new eN(a);
                                return rd(e, t = o === t ? t : o9(t))
                            }, ng.reverse = i3, ng.sampleSize = function(e, t, n) {
                                return t = (n ? ix(e, t, n) : o === t) ? 1 : o9(t), (oD(e) ? function(e, t) {
                                    return iH(rz(e), nM(t, 0, e.length))
                                } : function(e, t) {
                                    var n = aS(e);
                                    return iH(n, nM(t, 0, n.length))
                                })(e, t)
                            }, ng.set = function(e, t, n) {
                                return null == e ? e : rp(e, t, n)
                            }, ng.setWith = function(e, t, n, r) {
                                return r = "function" == typeof r ? r : o, null == e ? e : rp(e, t, n, r)
                            }, ng.shuffle = function(e) {
                                return (oD(e) ? function(e) {
                                    return iH(rz(e))
                                } : function(e) {
                                    return iH(aS(e))
                                })(e)
                            }, ng.slice = function(e, t, n) {
                                var r = null == e ? 0 : e.length;
                                return r ? (n && "number" != typeof n && ix(e, t, n) ? (t = 0, n = r) : (t = null == t ? 0 : o9(t), n = o === n ? r : o9(n)), rm(e, t, n)) : []
                            }, ng.sortBy = oy, ng.sortedUniq = function(e) {
                                return e && e.length ? rw(e) : []
                            }, ng.sortedUniqBy = function(e, t) {
                                return e && e.length ? rw(e, id(t, 2)) : []
                            }, ng.split = function(e, t, n) {
                                return (n && "number" != typeof n && ix(e, t, n) && (t = n = o), n = o === n ? 0xffffffff : n >>> 0) ? (e = ar(e)) && ("string" == typeof t || null != t && !o0(t)) && !(t = rA(t)) && tz(e) ? rL(tX(e), 0, n) : e.split(t, n) : []
                            }, ng.spread = function(e, t) {
                                if ("function" != typeof e) throw new eN(a);
                                return t = null == t ? 0 : t5(o9(t), 0), rd(function(n) {
                                    var r = n[t],
                                        i = rL(n, 0, t);
                                    return r && tm(i, r), ts(e, this, i)
                                })
                            }, ng.tail = function(e) {
                                var t = null == e ? 0 : e.length;
                                return t ? rm(e, 1, t) : []
                            }, ng.take = function(e, t, n) {
                                return e && e.length ? rm(e, 0, (t = n || o === t ? 1 : o9(t)) < 0 ? 0 : t) : []
                            }, ng.takeRight = function(e, t, n) {
                                var r = null == e ? 0 : e.length;
                                return r ? rm(e, (t = r - (t = n || o === t ? 1 : o9(t))) < 0 ? 0 : t, r) : []
                            }, ng.takeRightWhile = function(e, t) {
                                return e && e.length ? rT(e, id(t, 3), !1, !0) : []
                            }, ng.takeWhile = function(e, t) {
                                return e && e.length ? rT(e, id(t, 3)) : []
                            }, ng.tap = function(e, t) {
                                return t(e), e
                            }, ng.throttle = function(e, t, n) {
                                var r = !0,
                                    i = !0;
                                if ("function" != typeof e) throw new eN(a);
                                return oq(n) && (r = "leading" in n ? !!n.leading : r, i = "trailing" in n ? !!n.trailing : i), oB(e, t, {
                                    leading: r,
                                    maxWait: t,
                                    trailing: i
                                })
                            }, ng.thru = oa, ng.toArray = o4, ng.toPairs = aA, ng.toPairsIn = ax, ng.toPath = function(e) {
                                return oD(e) ? tg(e, iU) : o3(e) ? [e] : rz(iD(ar(e)))
                            }, ng.toPlainObject = an, ng.transform = function(e, t, n) {
                                var r = oD(e),
                                    i = r || oG(e) || o5(e);
                                if (t = id(t, 4), null == n) {
                                    var o = e && e.constructor;
                                    n = i ? r ? new o : [] : oq(e) && oK(o) ? nm(eW(e)) : {}
                                }
                                return (i ? tf : nX)(e, function(e, r, i) {
                                    return t(n, e, r, i)
                                }), n
                            }, ng.unary = function(e) {
                                return o_(e, 1)
                            }, ng.union = i5, ng.unionBy = i8, ng.unionWith = i6, ng.uniq = function(e) {
                                return e && e.length ? rx(e) : []
                            }, ng.uniqBy = function(e, t) {
                                return e && e.length ? rx(e, id(t, 2)) : []
                            }, ng.uniqWith = function(e, t) {
                                return t = "function" == typeof t ? t : o, e && e.length ? rx(e, o, t) : []
                            }, ng.unset = function(e, t) {
                                return null == e || rS(e, t)
                            }, ng.unzip = i4, ng.unzipWith = i7, ng.update = function(e, t, n) {
                                return null == e ? e : rB(e, t, rC(n))
                            }, ng.updateWith = function(e, t, n, r) {
                                return r = "function" == typeof r ? r : o, null == e ? e : rB(e, t, rC(n), r)
                            }, ng.values = aS, ng.valuesIn = function(e) {
                                return null == e ? [] : tM(e, am(e))
                            }, ng.without = i9, ng.words = aj, ng.wrap = function(e, t) {
                                return oC(rC(t), e)
                            }, ng.xor = oe, ng.xorBy = ot, ng.xorWith = on, ng.zip = or, ng.zipObject = function(e, t) {
                                return rI(e || [], t || [], nO)
                            }, ng.zipObjectDeep = function(e, t) {
                                return rI(e || [], t || [], rp)
                            }, ng.zipWith = oi, ng.entries = aA, ng.entriesIn = ax, ng.extend = ao, ng.extendWith = aa, aK(ng, ng), ng.add = a2, ng.attempt = aP, ng.camelCase = aB, ng.capitalize = aT, ng.ceil = a3, ng.clamp = function(e, t, n) {
                                return o === n && (n = t, t = o), o !== n && (n = (n = at(n)) == n ? n : 0), o !== t && (t = (t = at(t)) == t ? t : 0), nM(at(e), t, n)
                            }, ng.clone = function(e) {
                                return nj(e, 4)
                            }, ng.cloneDeep = function(e) {
                                return nj(e, 5)
                            }, ng.cloneDeepWith = function(e, t) {
                                return nj(e, 5, t = "function" == typeof t ? t : o)
                            }, ng.cloneWith = function(e, t) {
                                return nj(e, 4, t = "function" == typeof t ? t : o)
                            }, ng.conformsTo = function(e, t) {
                                return null == t || nP(e, t, ag(t))
                            }, ng.deburr = aN, ng.defaultTo = function(e, t) {
                                return null == e || e != e ? t : e
                            }, ng.divide = a5, ng.endsWith = function(e, t, n) {
                                e = ar(e), t = rA(t);
                                var r = e.length,
                                    i = n = o === n ? r : nM(o9(n), 0, r);
                                return (n -= t.length) >= 0 && e.slice(n, i) == t
                            }, ng.eq = oM, ng.escape = function(e) {
                                return (e = ar(e)) && W.test(e) ? e.replace(G, tU) : e
                            }, ng.escapeRegExp = function(e) {
                                return (e = ar(e)) && Q.test(e) ? e.replace(J, "\\$&") : e
                            }, ng.every = function(e, t, n) {
                                var r = oD(e) ? th : nz;
                                return n && ix(e, t, n) && (t = o), r(e, id(t, 3))
                            }, ng.find = os, ng.findIndex = iK, ng.findKey = function(e, t) {
                                return tE(e, id(t, 3), nX)
                            }, ng.findLast = ol, ng.findLastIndex = iZ, ng.findLastKey = function(e, t) {
                                return tE(e, id(t, 3), nq)
                            }, ng.floor = a8, ng.forEach = of, ng.forEachRight = oh, ng.forIn = function(e, t) {
                                return null == e ? e : nK(e, id(t, 3), am)
                            }, ng.forInRight = function(e, t) {
                                return null == e ? e : nZ(e, id(t, 3), am)
                            }, ng.forOwn = function(e, t) {
                                return e && nX(e, id(t, 3))
                            }, ng.forOwnRight = function(e, t) {
                                return e && nq(e, id(t, 3))
                            }, ng.get = af, ng.gt = oj, ng.gte = oP, ng.has = function(e, t) {
                                return null != e && i_(e, t, n1)
                            }, ng.hasIn = ah, ng.head = iq, ng.identity = az, ng.includes = function(e, t, n, r) {
                                e = oF(e) ? e : aS(e), n = n && !r ? o9(n) : 0;
                                var i = e.length;
                                return n < 0 && (n = t5(i + n, 0)), o2(e) ? n <= i && e.indexOf(t, n) > -1 : !!i && tx(e, t, n) > -1
                            }, ng.indexOf = function(e, t, n) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var i = null == n ? 0 : o9(n);
                                return i < 0 && (i = t5(r + i, 0)), tx(e, t, i)
                            }, ng.inRange = function(e, t, n) {
                                var r, i, a;
                                return t = o7(t), o === n ? (n = t, t = 0) : n = o7(n), (r = e = at(e)) >= t8(i = t, a = n) && r < t5(i, a)
                            }, ng.invoke = av, ng.isArguments = oH, ng.isArray = oD, ng.isArrayBuffer = oU, ng.isArrayLike = oF, ng.isArrayLikeObject = oz, ng.isBoolean = function(e) {
                                return !0 === e || !1 === e || oY(e) && nQ(e) == p
                            }, ng.isBuffer = oG, ng.isDate = oV, ng.isElement = function(e) {
                                return oY(e) && 1 === e.nodeType && !oQ(e)
                            }, ng.isEmpty = function(e) {
                                if (null == e) return !0;
                                if (oF(e) && (oD(e) || "string" == typeof e || "function" == typeof e.splice || oG(e) || o5(e) || oH(e))) return !e.length;
                                var t = ib(e);
                                if (t == b || t == x) return !e.size;
                                if (iN(e)) return !re(e).length;
                                for (var n in e)
                                    if (eL.call(e, n)) return !1;
                                return !0
                            }, ng.isEqual = function(e, t) {
                                return n6(e, t)
                            }, ng.isEqualWith = function(e, t, n) {
                                var r = (n = "function" == typeof n ? n : o) ? n(e, t) : o;
                                return o === r ? n6(e, t, o, n) : !!r
                            }, ng.isError = oW, ng.isFinite = function(e) {
                                return "number" == typeof e && t1(e)
                            }, ng.isFunction = oK, ng.isInteger = oZ, ng.isLength = oX, ng.isMap = o$, ng.isMatch = function(e, t) {
                                return e === t || n4(e, t, iv(t))
                            }, ng.isMatchWith = function(e, t, n) {
                                return n = "function" == typeof n ? n : o, n4(e, t, iv(t), n)
                            }, ng.isNaN = function(e) {
                                return oJ(e) && e != +e
                            }, ng.isNative = function(e) {
                                if (iT(e)) throw new eE("Unsupported core-js use. Try https://npms.io/search?q=ponyfill.");
                                return n7(e)
                            }, ng.isNil = function(e) {
                                return null == e
                            }, ng.isNull = function(e) {
                                return null === e
                            }, ng.isNumber = oJ, ng.isObject = oq, ng.isObjectLike = oY, ng.isPlainObject = oQ, ng.isRegExp = o0, ng.isSafeInteger = function(e) {
                                return oZ(e) && e >= -0x1fffffffffffff && e <= 0x1fffffffffffff
                            }, ng.isSet = o1, ng.isString = o2, ng.isSymbol = o3, ng.isTypedArray = o5, ng.isUndefined = function(e) {
                                return o === e
                            }, ng.isWeakMap = function(e) {
                                return oY(e) && ib(e) == T
                            }, ng.isWeakSet = function(e) {
                                return oY(e) && "[object WeakSet]" == nQ(e)
                            }, ng.join = function(e, t) {
                                return null == e ? "" : t2.call(e, t)
                            }, ng.kebabCase = aO, ng.last = iQ, ng.lastIndexOf = function(e, t, n) {
                                var r = null == e ? 0 : e.length;
                                if (!r) return -1;
                                var i = r;
                                return o !== n && (i = (i = o9(n)) < 0 ? t5(r + i, 0) : t8(i, r - 1)), t == t ? function(e, t, n) {
                                    for (var r = n + 1; r-- && e[r] !== t;);
                                    return r
                                }(e, t, i) : tA(e, tB, i, !0)
                            }, ng.lowerCase = aI, ng.lowerFirst = ak, ng.lt = o8, ng.lte = o6, ng.max = function(e) {
                                return e && e.length ? nG(e, az, n0) : o
                            }, ng.maxBy = function(e, t) {
                                return e && e.length ? nG(e, id(t, 2), n0) : o
                            }, ng.mean = function(e) {
                                return tT(e, az)
                            }, ng.meanBy = function(e, t) {
                                return tT(e, id(t, 2))
                            }, ng.min = function(e) {
                                return e && e.length ? nG(e, az, rt) : o
                            }, ng.minBy = function(e, t) {
                                return e && e.length ? nG(e, id(t, 2), rt) : o
                            }, ng.stubArray = a0, ng.stubFalse = a1, ng.stubObject = function() {
                                return {}
                            }, ng.stubString = function() {
                                return ""
                            }, ng.stubTrue = function() {
                                return !0
                            }, ng.multiply = a6, ng.nth = function(e, t) {
                                return e && e.length ? ra(e, o9(t)) : o
                            }, ng.noConflict = function() {
                                return e4._ === this && (e4._ = eD), this
                            }, ng.noop = aZ, ng.now = ob, ng.pad = function(e, t, n) {
                                e = ar(e);
                                var r = (t = o9(t)) ? tZ(e) : 0;
                                if (!t || r >= t) return e;
                                var i = (t - r) / 2;
                                return r3(tJ(i), n) + e + r3(tO(i), n)
                            }, ng.padEnd = function(e, t, n) {
                                e = ar(e);
                                var r = (t = o9(t)) ? tZ(e) : 0;
                                return t && r < t ? e + r3(t - r, n) : e
                            }, ng.padStart = function(e, t, n) {
                                e = ar(e);
                                var r = (t = o9(t)) ? tZ(e) : 0;
                                return t && r < t ? r3(t - r, n) + e : e
                            }, ng.parseInt = function(e, t, n) {
                                return n || null == t ? t = 0 : t && (t *= 1), t4(ar(e).replace(ee, ""), t || 0)
                            }, ng.random = function(e, t, n) {
                                if (n && "boolean" != typeof n && ix(e, t, n) && (t = n = o), o === n && ("boolean" == typeof t ? (n = t, t = o) : "boolean" == typeof e && (n = e, e = o)), o === e && o === t ? (e = 0, t = 1) : (e = o7(e), o === t ? (t = e, e = 0) : t = o7(t)), e > t) {
                                    var r = e;
                                    e = t, t = r
                                }
                                if (n || e % 1 || t % 1) {
                                    var i = t7();
                                    return t8(e + i * (t - e + e3("1e-" + ((i + "").length - 1))), t)
                                }
                                return rf(e, t)
                            }, ng.reduce = function(e, t, n) {
                                var r = oD(e) ? ty : tI,
                                    i = arguments.length < 3;
                                return r(e, id(t, 4), n, i, nU)
                            }, ng.reduceRight = function(e, t, n) {
                                var r = oD(e) ? tb : tI,
                                    i = arguments.length < 3;
                                return r(e, id(t, 4), n, i, nF)
                            }, ng.repeat = function(e, t, n) {
                                return t = (n ? ix(e, t, n) : o === t) ? 1 : o9(t), rh(ar(e), t)
                            }, ng.replace = function() {
                                var e = arguments,
                                    t = ar(e[0]);
                                return e.length < 3 ? t : t.replace(e[1], e[2])
                            }, ng.result = function(e, t, n) {
                                t = rR(t, e);
                                var r = -1,
                                    i = t.length;
                                for (i || (i = 1, e = o); ++r < i;) {
                                    var a = null == e ? o : e[iU(t[r])];
                                    o === a && (r = i, a = n), e = oK(a) ? a.call(e) : a
                                }
                                return e
                            }, ng.round = a4, ng.runInContext = e, ng.sample = function(e) {
                                return (oD(e) ? nT : function(e) {
                                    return nT(aS(e))
                                })(e)
                            }, ng.size = function(e) {
                                if (null == e) return 0;
                                if (oF(e)) return o2(e) ? tZ(e) : e.length;
                                var t = ib(e);
                                return t == b || t == x ? e.size : re(e).length
                            }, ng.snakeCase = aC, ng.some = function(e, t, n) {
                                var r = oD(e) ? t_ : ry;
                                return n && ix(e, t, n) && (t = o), r(e, id(t, 3))
                            }, ng.sortedIndex = function(e, t) {
                                return rb(e, t)
                            }, ng.sortedIndexBy = function(e, t, n) {
                                return r_(e, t, id(n, 2))
                            }, ng.sortedIndexOf = function(e, t) {
                                var n = null == e ? 0 : e.length;
                                if (n) {
                                    var r = rb(e, t);
                                    if (r < n && oM(e[r], t)) return r
                                }
                                return -1
                            }, ng.sortedLastIndex = function(e, t) {
                                return rb(e, t, !0)
                            }, ng.sortedLastIndexBy = function(e, t, n) {
                                return r_(e, t, id(n, 2), !0)
                            }, ng.sortedLastIndexOf = function(e, t) {
                                if (null == e ? 0 : e.length) {
                                    var n = rb(e, t, !0) - 1;
                                    if (oM(e[n], t)) return n
                                }
                                return -1
                            }, ng.startCase = aR, ng.startsWith = function(e, t, n) {
                                return e = ar(e), n = null == n ? 0 : nM(o9(n), 0, e.length), t = rA(t), e.slice(n, n + t.length) == t
                            }, ng.subtract = a7, ng.sum = function(e) {
                                return e && e.length ? tk(e, az) : 0
                            }, ng.sumBy = function(e, t) {
                                return e && e.length ? tk(e, id(t, 2)) : 0
                            }, ng.template = function(e, t, n) {
                                var r = ng.templateSettings;
                                n && ix(e, t, n) && (t = o), e = ar(e), t = aa({}, t, r, it);
                                var i, a, u = aa({}, t.imports, r.imports, it),
                                    c = ag(u),
                                    s = tM(u, c),
                                    l = 0,
                                    f = t.interpolate || eg,
                                    h = "__p += '",
                                    d = eB((t.escape || eg).source + "|" + f.source + "|" + (f === X ? ec : eg).source + "|" + (t.evaluate || eg).source + "|$", "g"),
                                    p = "//# sourceURL=" + (eL.call(t, "sourceURL") ? (t.sourceURL + "").replace(/\s/g, " ") : "lodash.templateSources[" + ++eQ + "]") + "\n";
                                e.replace(d, function(t, n, r, o, u, c) {
                                    return r || (r = o), h += e.slice(l, c).replace(em, tF), n && (i = !0, h += "' +\n__e(" + n + ") +\n'"), u && (a = !0, h += "';\n" + u + ";\n__p += '"), r && (h += "' +\n((__t = (" + r + ")) == null ? '' : __t) +\n'"), l = c + t.length, t
                                }), h += "';\n";
                                var v = eL.call(t, "variable") && t.variable;
                                if (v) {
                                    if (ea.test(v)) throw new eE("Invalid `variable` option passed into `_.template`")
                                } else h = "with (obj) {\n" + h + "\n}\n";
                                h = (a ? h.replace(D, "") : h).replace(U, "$1").replace(F, "$1;"), h = "function(" + (v || "obj") + ") {\n" + (v ? "" : "obj || (obj = {});\n") + "var __t, __p = ''" + (i ? ", __e = _.escape" : "") + (a ? ", __j = Array.prototype.join;\nfunction print() { __p += __j.call(arguments, '') }\n" : ";\n") + h + "return __p\n}";
                                var g = aP(function() {
                                    return eA(c, p + "return " + h).apply(o, s)
                                });
                                if (g.source = h, oW(g)) throw g;
                                return g
                            }, ng.times = function(e, t) {
                                if ((e = o9(e)) < 1 || e > 0x1fffffffffffff) return [];
                                var n = 0xffffffff,
                                    r = t8(e, 0xffffffff);
                                t = id(t), e -= 0xffffffff;
                                for (var i = tC(r, t); ++n < e;) t(n);
                                return i
                            }, ng.toFinite = o7, ng.toInteger = o9, ng.toLength = ae, ng.toLower = function(e) {
                                return ar(e).toLowerCase()
                            }, ng.toNumber = at, ng.toSafeInteger = function(e) {
                                return e ? nM(o9(e), -0x1fffffffffffff, 0x1fffffffffffff) : 0 === e ? e : 0
                            }, ng.toString = ar, ng.toUpper = function(e) {
                                return ar(e).toUpperCase()
                            }, ng.trim = function(e, t, n) {
                                if ((e = ar(e)) && (n || o === t)) return tR(e);
                                if (!e || !(t = rA(t))) return e;
                                var r = tX(e),
                                    i = tX(t),
                                    a = tP(r, i),
                                    u = tH(r, i) + 1;
                                return rL(r, a, u).join("")
                            }, ng.trimEnd = function(e, t, n) {
                                if ((e = ar(e)) && (n || o === t)) return e.slice(0, tq(e) + 1);
                                if (!e || !(t = rA(t))) return e;
                                var r = tX(e),
                                    i = tH(r, tX(t)) + 1;
                                return rL(r, 0, i).join("")
                            }, ng.trimStart = function(e, t, n) {
                                if ((e = ar(e)) && (n || o === t)) return e.replace(ee, "");
                                if (!e || !(t = rA(t))) return e;
                                var r = tX(e),
                                    i = tP(r, tX(t));
                                return rL(r, i).join("")
                            }, ng.truncate = function(e, t) {
                                var n = 30,
                                    r = "...";
                                if (oq(t)) {
                                    var i = "separator" in t ? t.separator : i;
                                    n = "length" in t ? o9(t.length) : n, r = "omission" in t ? rA(t.omission) : r
                                }
                                var a = (e = ar(e)).length;
                                if (tz(e)) {
                                    var u = tX(e);
                                    a = u.length
                                }
                                if (n >= a) return e;
                                var c = n - tZ(r);
                                if (c < 1) return r;
                                var s = u ? rL(u, 0, c).join("") : e.slice(0, c);
                                if (o === i) return s + r;
                                if (u && (c += s.length - c), o0(i)) {
                                    if (e.slice(c).search(i)) {
                                        var l, f = s;
                                        for (i.global || (i = eB(i.source, ar(es.exec(i)) + "g")), i.lastIndex = 0; l = i.exec(f);) var h = l.index;
                                        s = s.slice(0, o === h ? c : h)
                                    }
                                } else if (e.indexOf(rA(i), c) != c) {
                                    var d = s.lastIndexOf(i);
                                    d > -1 && (s = s.slice(0, d))
                                }
                                return s + r
                            }, ng.unescape = function(e) {
                                return (e = ar(e)) && V.test(e) ? e.replace(z, tY) : e
                            }, ng.uniqueId = function(e) {
                                var t = ++eM;
                                return ar(e) + t
                            }, ng.upperCase = aL, ng.upperFirst = aM, ng.each = of, ng.eachRight = oh, ng.first = iq, aK(ng, (eb = {}, nX(ng, function(e, t) {
                                eL.call(ng.prototype, t) || (eb[t] = e)
                            }), eb), {
                                chain: !1
                            }), ng.VERSION = "4.17.23", tf(["bind", "bindKey", "curry", "curryRight", "partial", "partialRight"], function(e) {
                                ng[e].placeholder = ng
                            }), tf(["drop", "take"], function(e, t) {
                                n_.prototype[e] = function(n) {
                                    n = o === n ? 1 : t5(o9(n), 0);
                                    var r = this.__filtered__ && !t ? new n_(this) : this.clone();
                                    return r.__filtered__ ? r.__takeCount__ = t8(n, r.__takeCount__) : r.__views__.push({
                                        size: t8(n, 0xffffffff),
                                        type: e + (r.__dir__ < 0 ? "Right" : "")
                                    }), r
                                }, n_.prototype[e + "Right"] = function(t) {
                                    return this.reverse()[e](t).reverse()
                                }
                            }), tf(["filter", "map", "takeWhile"], function(e, t) {
                                var n = t + 1,
                                    r = 1 == n || 3 == n;
                                n_.prototype[e] = function(e) {
                                    var t = this.clone();
                                    return t.__iteratees__.push({
                                        iteratee: id(e, 3),
                                        type: n
                                    }), t.__filtered__ = t.__filtered__ || r, t
                                }
                            }), tf(["head", "last"], function(e, t) {
                                var n = "take" + (t ? "Right" : "");
                                n_.prototype[e] = function() {
                                    return this[n](1).value()[0]
                                }
                            }), tf(["initial", "tail"], function(e, t) {
                                var n = "drop" + (t ? "" : "Right");
                                n_.prototype[e] = function() {
                                    return this.__filtered__ ? new n_(this) : this[n](1)
                                }
                            }), n_.prototype.compact = function() {
                                return this.filter(az)
                            }, n_.prototype.find = function(e) {
                                return this.filter(e).head()
                            }, n_.prototype.findLast = function(e) {
                                return this.reverse().find(e)
                            }, n_.prototype.invokeMap = rd(function(e, t) {
                                return "function" == typeof e ? new n_(this) : this.map(function(n) {
                                    return n5(n, e, t)
                                })
                            }), n_.prototype.reject = function(e) {
                                return this.filter(oI(id(e)))
                            }, n_.prototype.slice = function(e, t) {
                                e = o9(e);
                                var n = this;
                                return n.__filtered__ && (e > 0 || t < 0) ? new n_(n) : (e < 0 ? n = n.takeRight(-e) : e && (n = n.drop(e)), o !== t && (n = (t = o9(t)) < 0 ? n.dropRight(-t) : n.take(t - e)), n)
                            }, n_.prototype.takeRightWhile = function(e) {
                                return this.reverse().takeWhile(e).reverse()
                            }, n_.prototype.toArray = function() {
                                return this.take(0xffffffff)
                            }, nX(n_.prototype, function(e, t) {
                                var n = /^(?:filter|find|map|reject)|While$/.test(t),
                                    i = /^(?:head|last)$/.test(t),
                                    a = ng[i ? "take" + ("last" == t ? "Right" : "") : t],
                                    u = i || /^find/.test(t);
                                a && (ng.prototype[t] = function() {
                                    var t = this.__wrapped__,
                                        c = i ? [1] : arguments,
                                        s = r._(t, n_),
                                        l = c[0],
                                        f = s || oD(t),
                                        h = function(e) {
                                            var t = a.apply(ng, tm([e], c));
                                            return i && d ? t[0] : t
                                        };
                                    f && n && "function" == typeof l && 1 != l.length && (s = f = !1);
                                    var d = this.__chain__,
                                        p = !!this.__actions__.length,
                                        v = u && !d,
                                        g = s && !p;
                                    if (!u && f) {
                                        t = g ? t : new n_(this);
                                        var m = e.apply(t, c);
                                        return m.__actions__.push({
                                            func: oa,
                                            args: [h],
                                            thisArg: o
                                        }), new nb(m, d)
                                    }
                                    return v && g ? e.apply(this, c) : (m = this.thru(h), v ? i ? m.value()[0] : m.value() : m)
                                })
                            }), tf(["pop", "push", "shift", "sort", "splice", "unshift"], function(e) {
                                var t = eO[e],
                                    n = /^(?:push|sort|unshift)$/.test(e) ? "tap" : "thru",
                                    r = /^(?:pop|shift)$/.test(e);
                                ng.prototype[e] = function() {
                                    var e = arguments;
                                    if (r && !this.__chain__) {
                                        var i = this.value();
                                        return t.apply(oD(i) ? i : [], e)
                                    }
                                    return this[n](function(n) {
                                        return t.apply(oD(n) ? n : [], e)
                                    })
                                }
                            }), nX(n_.prototype, function(e, t) {
                                var n = ng[t];
                                if (n) {
                                    var r = n.name + "";
                                    eL.call(nu, r) || (nu[r] = []), nu[r].push({
                                        name: t,
                                        func: n
                                    })
                                }
                            }), nu[rQ(o, 2).name] = [{
                                name: "wrapper",
                                func: o
                            }], n_.prototype.clone = function() {
                                var e = new n_(this.__wrapped__);
                                return e.__actions__ = rz(this.__actions__), e.__dir__ = this.__dir__, e.__filtered__ = this.__filtered__, e.__iteratees__ = rz(this.__iteratees__), e.__takeCount__ = this.__takeCount__, e.__views__ = rz(this.__views__), e
                            }, n_.prototype.reverse = function() {
                                if (this.__filtered__) {
                                    var e = new n_(this);
                                    e.__dir__ = -1, e.__filtered__ = !0
                                } else e = this.clone(), e.__dir__ *= -1;
                                return e
                            }, n_.prototype.value = function() {
                                var e = this.__wrapped__.value(),
                                    t = this.__dir__,
                                    n = oD(e),
                                    r = t < 0,
                                    i = n ? e.length : 0,
                                    o = function(e, t, n) {
                                        for (var r = -1, i = n.length; ++r < i;) {
                                            var o = n[r],
                                                a = o.size;
                                            switch (o.type) {
                                                case "drop":
                                                    e += a;
                                                    break;
                                                case "dropRight":
                                                    t -= a;
                                                    break;
                                                case "take":
                                                    t = t8(t, e + a);
                                                    break;
                                                case "takeRight":
                                                    e = t5(e, t - a)
                                            }
                                        }
                                        return {
                                            start: e,
                                            end: t
                                        }
                                    }(0, i, this.__views__),
                                    a = o.start,
                                    u = o.end,
                                    c = u - a,
                                    s = r ? u : a - 1,
                                    l = this.__iteratees__,
                                    f = l.length,
                                    h = 0,
                                    d = t8(c, this.__takeCount__);
                                if (!n || !r && i == c && d == c) return rN(e, this.__actions__);
                                var p = [];
                                e: for (; c-- && h < d;) {
                                    for (var v = -1, g = e[s += t]; ++v < f;) {
                                        var m = l[v],
                                            y = m.iteratee,
                                            b = m.type,
                                            _ = y(g);
                                        if (2 == b) g = _;
                                        else if (!_)
                                            if (1 == b) continue e;
                                            else break e
                                    }
                                    p[h++] = g
                                }
                                return p
                            }, ng.prototype.at = ou, ng.prototype.chain = function() {
                                return oo(this)
                            }, ng.prototype.commit = function() {
                                return new nb(this.value(), this.__chain__)
                            }, ng.prototype.next = function() {
                                this.__values__ === o && (this.__values__ = o4(this.value()));
                                var e = this.__index__ >= this.__values__.length,
                                    t = e ? o : this.__values__[this.__index__++];
                                return {
                                    done: e,
                                    value: t
                                }
                            }, ng.prototype.plant = function(e) {
                                for (var t, n = this; r._(n, ny);) {
                                    var i = iz(n);
                                    i.__index__ = 0, i.__values__ = o, t ? a.__wrapped__ = i : t = i;
                                    var a = i;
                                    n = n.__wrapped__
                                }
                                return a.__wrapped__ = e, t
                            }, ng.prototype.reverse = function() {
                                var e = this.__wrapped__;
                                if (r._(e, n_)) {
                                    var t = e;
                                    return this.__actions__.length && (t = new n_(this)), (t = t.reverse()).__actions__.push({
                                        func: oa,
                                        args: [i3],
                                        thisArg: o
                                    }), new nb(t, this.__chain__)
                                }
                                return this.thru(i3)
                            }, ng.prototype.toJSON = ng.prototype.valueOf = ng.prototype.value = function() {
                                return rN(this.__wrapped__, this.__actions__)
                            }, ng.prototype.first = ng.prototype.head, e6 && (ng.prototype[e6] = function() {
                                return this
                            }), ng
                        }();
                    "function" == typeof define && "object" == i._(define.amd) && define.amd ? (e4._ = t$, define(function() {
                        return t$
                    })) : e9 ? ((e9.exports = t$)._ = t$, e7._ = t$) : e4._ = t$
                }).call(this)
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var n, r, i, o = {
                        exports: {}
                    },
                    a = o.exports = {};

                function u() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    n = "function" == typeof setTimeout ? setTimeout : u
                } catch (e) {
                    n = u
                }
                try {
                    r = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (e) {
                    r = c
                }

                function s(e) {
                    if (n === setTimeout) return setTimeout(e, 0);
                    if ((n === u || !n) && setTimeout) return n = setTimeout, setTimeout(e, 0);
                    try {
                        return n(e, 0)
                    } catch (t) {
                        try {
                            return n.call(null, e, 0)
                        } catch (t) {
                            return n.call(this, e, 0)
                        }
                    }
                }
                var l = [],
                    f = !1,
                    h = -1;

                function d() {
                    f && i && (f = !1, i.length ? l = i.concat(l) : h = -1, l.length && p())
                }

                function p() {
                    if (!f) {
                        var e = s(d);
                        f = !0;
                        for (var t = l.length; t;) {
                            for (i = l, l = []; ++h < t;) i && i[h].run();
                            h = -1, t = l.length
                        }
                        i = null, f = !1,
                            function(e) {
                                if (r === clearTimeout) return clearTimeout(e);
                                if ((r === c || !r) && clearTimeout) return r = clearTimeout, clearTimeout(e);
                                try {
                                    r(e)
                                } catch (t) {
                                    try {
                                        return r.call(null, e)
                                    } catch (t) {
                                        return r.call(this, e)
                                    }
                                }
                            }(e)
                    }
                }

                function v(e, t) {
                    this.fun = e, this.array = t
                }

                function g() {}

                function m() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var n = 1; n < arguments.length; n++) t[n - 1] = arguments[n];
                    l.push(new v(e, t)), 1 !== l.length || f || s(p)
                }, v.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = g, a.addListener = g, a.once = g, a.off = g, a.removeListener = g, a.removeAllListeners = g, a.emit = g, a.prependListener = g, a.prependOnceListener = g, a.listeners = function(e) {
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
                var y = o.exports.browser,
                    b = o.exports.binding,
                    _ = {},
                    w = "browser",
                    E = "browser",
                    A = "browser",
                    x = [],
                    S = {
                        nextTick: o.exports.nextTick,
                        title: o.exports.title,
                        browser: y,
                        env: o.exports.env,
                        argv: o.exports.argv,
                        version: o.exports.version,
                        versions: o.exports.versions,
                        on: o.exports.on,
                        addListener: o.exports.addListener,
                        once: o.exports.once,
                        off: o.exports.off,
                        removeListener: o.exports.removeListener,
                        removeAllListeners: o.exports.removeAllListeners,
                        emit: o.exports.emit,
                        emitWarning: m,
                        prependListener: o.exports.prependListener,
                        prependOnceListener: o.exports.prependOnceListener,
                        listeners: o.exports.listeners,
                        binding: b,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: m,
                        pid: 1,
                        features: _,
                        kill: m,
                        dlopen: m,
                        uptime: m,
                        memoryUsage: m,
                        uvCounters: m,
                        platform: w,
                        arch: E,
                        execPath: A,
                        execArgv: x
                    };
                t.addListener = o.exports.addListener, t.arch = E, t.argv = o.exports.argv, t.binding = b, t.browser = y, t.chdir = o.exports.chdir, t.cwd = o.exports.cwd, t.default = S, t.dlopen = m, t.emit = o.exports.emit, t.emitWarning = m, t.env = o.exports.env, t.execArgv = x, t.execPath = A, t.exit = m, t.features = _, t.kill = m, t.listeners = o.exports.listeners, t.memoryUsage = m, t.nextTick = o.exports.nextTick, t.off = o.exports.off, t.on = o.exports.on, t.once = o.exports.once, t.pid = 1, t.platform = w, t.prependListener = o.exports.prependListener, t.prependOnceListener = o.exports.prependOnceListener, t.removeAllListeners = o.exports.removeAllListeners, t.removeListener = o.exports.removeListener, t.title = o.exports.title, t.umask = o.exports.umask, t.uptime = m, t.uvCounters = m, t.version = o.exports.version, t.versions = o.exports.versions, e.exports = S
            },
            848: function(e, t, n) {
                "use strict";
                var r = n(564).Buffer,
                    i = n(844),
                    o = void 0 !== r,
                    a = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    u = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function c(e, t, n) {
                    null == n && null !== t && (void 0 === t ? "undefined" : i._(t)) === "object" && (n = t, t = void 0), o && r.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var c = JSON.parse(e, t);
                    if (null === c || (void 0 === c ? "undefined" : i._(c)) !== "object") return c;
                    var l = n && n.protoAction || "error",
                        f = n && n.constructorAction || "error";
                    if ("ignore" === l && "ignore" === f) return c;
                    if ("ignore" !== l && "ignore" !== f) {
                        if (!1 === a.test(e) && !1 === u.test(e)) return c
                    } else if ("ignore" !== l && "ignore" === f) {
                        if (!1 === a.test(e)) return c
                    } else if (!1 === u.test(e)) return c;
                    return s(c, {
                        protoAction: l,
                        constructorAction: f,
                        safe: n && n.safe
                    })
                }

                function s(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = t.protoAction, r = void 0 === n ? "error" : n, o = t.constructorAction, a = void 0 === o ? "error" : o, u = t.safe, c = [e]; c.length;) {
                        var s = c;
                        c = [];
                        var l = !0,
                            f = !1,
                            h = void 0;
                        try {
                            for (var d, p = s[Symbol.iterator](); !(l = (d = p.next()).done); l = !0) {
                                var v = d.value;
                                if ("ignore" !== r && Object.prototype.hasOwnProperty.call(v, "__proto__")) {
                                    if (!0 === u) return null;
                                    if ("error" === r) throw SyntaxError("Object contains forbidden prototype property");
                                    delete v.__proto__
                                }
                                if ("ignore" !== a && Object.prototype.hasOwnProperty.call(v, "constructor") && null !== v.constructor && "object" === i._(v.constructor) && Object.prototype.hasOwnProperty.call(v.constructor, "prototype")) {
                                    if (!0 === u) return null;
                                    if ("error" === a) throw SyntaxError("Object contains forbidden prototype property");
                                    delete v.constructor
                                }
                                for (var g in v) {
                                    var m = v[g];
                                    m && (void 0 === m ? "undefined" : i._(m)) === "object" && c.push(m)
                                }
                            }
                        } catch (e) {
                            f = !0, h = e
                        } finally {
                            try {
                                l || null == p.return || p.return()
                            } finally {
                                if (f) throw h
                            }
                        }
                    }
                    return e
                }

                function l(e, t, n) {
                    var r = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return c(e, t, n)
                    } finally {
                        Error.stackTraceLimit = r
                    }
                }
                e.exports = l, e.exports.default = l, e.exports.parse = l, e.exports.safeParse = function(e, t) {
                    var n = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return c(e, t, {
                            safe: !0
                        })
                    } catch (e) {
                        return
                    } finally {
                        Error.stackTraceLimit = n
                    }
                }, e.exports.scan = s
            }
        },
        t = {};

    function n(r) {
        var i = t[r];
        if (void 0 !== i) return i.exports;
        var o = t[r] = {
            id: r,
            loaded: !1,
            exports: {}
        };
        return e[r].call(o.exports, o, o.exports, n), o.loaded = !0, o.exports
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
        }, n.nmd = function(e) {
            return e.paths = [], e.children || (e.children = []), e
        }, n.nc = void 0, n.rv = function() {
            return "1.7.12"
        }, n.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";

            function e(e, t, n, r, i, o, a) {
                try {
                    var u = e[o](a),
                        c = u.value
                } catch (e) {
                    n(e);
                    return
                }
                u.done ? t(c) : Promise.resolve(c).then(r, i)
            }

            function t(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(i, o) {
                        var a = t.apply(n, r);

                        function u(t) {
                            e(a, i, o, u, c, "next", t)
                        }

                        function c(t) {
                            e(a, i, o, u, c, "throw", t)
                        }
                        u(void 0)
                    })
                }
            }

            function r(e, t) {
                var n, r, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(a, "next", {
                    value: c(0)
                }), u(a, "throw", {
                    value: c(1)
                }), u(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(u) {
                    return function(c) {
                        var s = [u, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (n = 1, r && (i = 2 & s[0] ? r.return : s[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, s[1])).done) return i;
                            switch (r = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, r = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var i, o, a, u, c, s, l, f, h, d, p, v, g, m, y, b, _, w, E, A, x = window.ReactJSX,
                S = window.Roblox,
                B = n.n(S),
                T = window.React,
                N = n.n(T),
                O = window.ReactDOM,
                I = n.n(O),
                k = window.Roblox["core-scripts"].react;

            function C(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function R(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        C(e, t, n[t])
                    })
                }
                return e
            }

            function L(e) {
                if (Array.isArray(e)) return e
            }

            function M() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function j(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function P(e, t) {
                if (e) {
                    if ("string" == typeof e) return j(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return j(e, t)
                }
            }

            function H(e, t) {
                return L(e) || function(e, t) {
                    var n, r, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            u = !1;
                        try {
                            for (i = i.call(e); !(a = (n = i.next()).done) && (o.push(n.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            u = !0, r = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (u) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || P(e, t) || M()
            }

            function D(e, t) {
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

            function U(e) {
                return (U = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function F() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (F = function() {
                    return !!e
                })()
            }
            var z = n(844);

            function G(e, t, n) {
                t = U(t);
                var r = F() ? Reflect.construct(t, n || [], U(e).constructor) : t.apply(e, n);
                if (r && ("object" === (0, z._)(r) || "function" == typeof r)) return r;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }
            var V = n(784);

            function W(e, t) {
                if (!(0, V._)(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function K(e, t) {
                return (K = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function Z(e, t, n) {
                return (Z = F() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var i = new(Function.bind.apply(e, r));
                    return n && K(i, n.prototype), i
                }).apply(null, arguments)
            }

            function X(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && K(e, t)
            }

            function q(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function Y(e) {
                return function(e) {
                    if (Array.isArray(e)) return j(e)
                }(e) || q(e) || P(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function $(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return ($ = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return Z(e, arguments, U(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), K(n, e)
                })(e)
            }

            function J(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function Q(e, t, n) {
                return t && J(e.prototype, t), n && J(e, n), e
            }

            function ee(e, t) {
                var n = t && t.cache ? t.cache : eo,
                    r = t && t.serializer ? t.serializer : er;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var n, r, i = 1 === e.length ? et : en;
                    return n = t.cache.create(), r = t.serializer, i.bind(this, e, n, r)
                })(e, {
                    cache: n,
                    serializer: r
                })
            }

            function et(e, t, n, r) {
                var i = null == r || "number" == typeof r || "boolean" == typeof r ? r : n(r),
                    o = t.get(i);
                return void 0 === o && (o = e.call(this, r), t.set(i, o)), o
            }

            function en(e, t, n) {
                var r = Array.prototype.slice.call(arguments, 3),
                    i = n(r),
                    o = t.get(i);
                return void 0 === o && (o = e.apply(this, r), t.set(i, o)), o
            }
            var er = function() {
                    return JSON.stringify(arguments)
                },
                ei = function() {
                    function e() {
                        W(this, e), this.cache = Object.create(null)
                    }
                    return Q(e, [{
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
                eo = {
                    create: function() {
                        return new ei
                    }
                },
                ea = {
                    variadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, en.bind(this, e, n, r)
                    },
                    monadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, et.bind(this, e, n, r)
                    }
                },
                eu = function(e) {
                    function t(e, n) {
                        W(this, t);
                        var r, i = e;
                        return n && (i += ": " + n), (r = G(this, t, [i])).code = e, n && (r.originalMessage = n), r
                    }
                    return X(t, e), t
                }($(Error)),
                ec = ((o = ec || {}).MISSING_MESSAGE = "MISSING_MESSAGE", o.MISSING_FORMAT = "MISSING_FORMAT", o.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", o.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", o.INVALID_MESSAGE = "INVALID_MESSAGE", o.INVALID_KEY = "INVALID_KEY", o.FORMATTING_ERROR = "FORMATTING_ERROR", o);

            function es(e, t) {
                return ee(e, {
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
                    strategy: ea.variadic
                })
            }

            function el(e, t) {
                return es(function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return Z(e, Y(n))
                }, t)
            }

            function ef(e, t) {
                if (null == e) return {};
                var n, r, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, n = Reflect.ownKeys(Object(e)); i < n.length; i++) r = n[i], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var n, r, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) r = n[i], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                return o
            }

            function eh() {
                return (eh = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }).apply(this, arguments)
            }

            function ed(e) {
                return L(e) || q(e) || P(e) || M()
            }
            var ep = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                ev = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                eg = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                em = /^(@+)?(\+|#+)?[rs]?$/g,
                ey = /(\*)(0+)|(#+)(0+)|(0+)/g,
                eb = /^(0+)$/;

            function e_(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(em, function(e, n, r) {
                    return "string" != typeof r ? (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length) : "+" === r ? t.minimumSignificantDigits = n.length : "#" === n[0] ? t.maximumSignificantDigits = n.length : (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length + ("string" == typeof r ? r.length : 0)), ""
                }), t
            }

            function ew(e) {
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

            function eE(e) {
                var t = ew(e);
                return t || {}
            }
            var eA = ((a = {})[a.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", a[a.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", a[a.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", a[a.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", a[a.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", a[a.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", a[a.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", a[a.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", a[a.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", a[a.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", a[a.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", a[a.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", a[a.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", a[a.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", a[a.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", a[a.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", a[a.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", a[a.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", a[a.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", a[a.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", a[a.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", a[a.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", a[a.INVALID_TAG = 23] = "INVALID_TAG", a[a.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", a[a.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", a[a.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", a);

            function ex(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, z._)(e)) === "object" && 0 === e.type)
            }

            function eS(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, z._)(e)) === "object" && 1 === e.type)
            }
            var eB = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                eT = {
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
                eN = new RegExp("^".concat(eB.source, "*")),
                eO = new RegExp("".concat(eB.source, "*$"));

            function eI(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var ek = !!Object.fromEntries,
                eC = !!String.prototype.trimStart,
                eR = !!String.prototype.trimEnd,
                eL = ek ? Object.fromEntries : function(e) {
                    var t = {},
                        n = !0,
                        r = !1,
                        i = void 0;
                    try {
                        for (var o, a = e[Symbol.iterator](); !(n = (o = a.next()).done); n = !0) {
                            var u = H(o.value, 2),
                                c = u[0],
                                s = u[1];
                            t[c] = s
                        }
                    } catch (e) {
                        r = !0, i = e
                    } finally {
                        try {
                            n || null == a.return || a.return()
                        } finally {
                            if (r) throw i
                        }
                    }
                    return t
                },
                eM = eC ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(eN, "")
                },
                ej = eR ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(eO, "")
                },
                eP = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                eH = function() {
                    function e(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        W(this, e), this.message = t, this.position = {
                            offset: 0,
                            line: 1,
                            column: 1
                        }, this.ignoreTag = !!n.ignoreTag, this.locale = n.locale, this.requiresOtherClause = !!n.requiresOtherClause, this.shouldParseSkeletons = !!n.shouldParseSkeletons
                    }
                    return Q(e, [{
                        key: "parse",
                        value: function() {
                            if (0 !== this.offset()) throw Error("parser can only be used once");
                            if (this.message.length > 0) {
                                var e = this.message.charCodeAt(0);
                                if (35 !== e && 39 !== e && 60 !== e && 123 !== e && 125 !== e) {
                                    var t = function(e) {
                                        if (0 === e.length) return null;
                                        for (var t = 1, n = 1, r = 0; r < e.length;) {
                                            var i = e.charCodeAt(r);
                                            switch (i) {
                                                case 35:
                                                case 39:
                                                case 60:
                                                case 123:
                                                case 125:
                                                    return null
                                            }
                                            if (10 === i) t++, n = 1, r++;
                                            else if (n++, i >= 55296 && i <= 56319 && r + 1 < e.length) {
                                                var o = e.charCodeAt(r + 1);
                                                r += o >= 56320 && o <= 57343 ? 2 : 1
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
                                                location: eI(n, this.clonePosition())
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
                                var i = this.char();
                                if (123 === i) {
                                    var o = this.parseArgument(e, n);
                                    if (o.err) return o;
                                    r.push(o.val)
                                } else if (125 === i && e > 0) break;
                                else if (35 === i && ("plural" === t || "selectordinal" === t)) {
                                    var a = this.clonePosition();
                                    this.bump(), r.push({
                                        type: 7,
                                        location: eI(a, this.clonePosition())
                                    })
                                } else if (60 !== i || this.ignoreTag || 47 !== this.peek())
                                    if (60 === i && !this.ignoreTag && eD(this.peek() || 0)) {
                                        var u = this.parseTag(e, t);
                                        if (u.err) return u;
                                        r.push(u.val)
                                    } else {
                                        var c = this.parseLiteral(e, t);
                                        if (c.err) return c;
                                        r.push(c.val)
                                    }
                                else if (!n) return this.error(26, eI(this.clonePosition(), this.clonePosition()));
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
                                    location: eI(n, this.clonePosition())
                                },
                                err: null
                            };
                            if (!this.bumpIf(">")) return this.error(23, eI(n, this.clonePosition()));
                            var i = this.parseMessage(e + 1, t, !0);
                            if (i.err) return i;
                            var o = i.val,
                                a = this.clonePosition();
                            if (!this.bumpIf("</")) return this.error(27, eI(n, this.clonePosition()));
                            if (this.isEOF() || !eD(this.char())) return this.error(23, eI(a, this.clonePosition()));
                            var u = this.clonePosition();
                            return r !== this.parseTagName() ? this.error(26, eI(u, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                val: {
                                    type: 8,
                                    value: r,
                                    children: o,
                                    location: eI(n, this.clonePosition())
                                },
                                err: null
                            } : this.error(23, eI(a, this.clonePosition()))
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
                                var i = this.tryParseQuote(t);
                                if (i) {
                                    r += i;
                                    continue
                                }
                                var o = this.tryParseUnquoted(e, t);
                                if (o) {
                                    r += o;
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
                                    location: eI(n, this.clonePosition())
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseLeftAngleBracket",
                        value: function() {
                            var e;
                            return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (eD(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                            return (t = String).fromCodePoint.apply(t, Y(n))
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
                            if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, eI(n, this.clonePosition()));
                            if (125 === this.char()) return this.bump(), this.error(2, eI(n, this.clonePosition()));
                            var r = this.parseIdentifierIfPossible().value;
                            if (!r) return this.error(3, eI(n, this.clonePosition()));
                            if (this.bumpSpace(), this.isEOF()) return this.error(1, eI(n, this.clonePosition()));
                            switch (this.char()) {
                                case 125:
                                    return this.bump(), {
                                        val: {
                                            type: 1,
                                            value: r,
                                            location: eI(n, this.clonePosition())
                                        },
                                        err: null
                                    };
                                case 44:
                                    if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, eI(n, this.clonePosition()));
                                    return this.parseArgumentOptions(e, t, r, n);
                                default:
                                    return this.error(3, eI(n, this.clonePosition()))
                            }
                        }
                    }, {
                        key: "parseIdentifierIfPossible",
                        value: function() {
                            var e, t, n = this.clonePosition(),
                                r = this.offset(),
                                i = (e = this.message, eP.lastIndex = r, null != (t = eP.exec(e)[1]) ? t : ""),
                                o = r + i.length;
                            return this.bumpTo(o), {
                                value: i,
                                location: eI(n, this.clonePosition())
                            }
                        }
                    }, {
                        key: "parseArgumentOptions",
                        value: function(e, t, n, r) {
                            var i = this.clonePosition(),
                                o = this.parseIdentifierIfPossible().value,
                                a = this.clonePosition();
                            switch (o) {
                                case "":
                                    return this.error(4, eI(i, a));
                                case "number":
                                case "date":
                                case "time":
                                    this.bumpSpace();
                                    var u, c = null;
                                    if (this.bumpIf(",")) {
                                        this.bumpSpace();
                                        var s = this.clonePosition(),
                                            l = this.parseSimpleArgStyleIfPossible();
                                        if (l.err) return l;
                                        var f = ej(l.val);
                                        if (0 === f.length) return this.error(6, eI(this.clonePosition(), this.clonePosition()));
                                        c = {
                                            style: f,
                                            styleLocation: eI(s, this.clonePosition())
                                        }
                                    }
                                    var h = this.tryParseArgumentClose(r);
                                    if (h.err) return h;
                                    var d = eI(r, this.clonePosition());
                                    if (c && c.style.startsWith("::")) {
                                        var p = eM(c.style.slice(2));
                                        if ("number" === o) {
                                            var v = this.parseNumberSkeletonFromString(p, c.styleLocation);
                                            if (v.err) return v;
                                            return {
                                                val: {
                                                    type: 2,
                                                    value: n,
                                                    location: d,
                                                    style: v.val
                                                },
                                                err: null
                                            }
                                        }
                                        if (0 === p.length) return this.error(10, d);
                                        var g, m = p;
                                        return this.locale && (m = function(e, t) {
                                            for (var n = "", r = 0; r < e.length; r++) {
                                                var i = e.charAt(r);
                                                if ("j" === i) {
                                                    for (var o = 0; r + 1 < e.length && e.charAt(r + 1) === i;) o++, r++;
                                                    var a = 1 + (1 & o),
                                                        u = o < 2 ? 1 : 3 + (o >> 1),
                                                        c = function(e) {
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
                                                            return "root" !== r && (t = e.maximize().region), (eT[t || ""] || eT[r || ""] || eT["".concat(r, "-001")] || eT["001"])[0]
                                                        }(t);
                                                    for (("H" == c || "k" == c) && (u = 0); u-- > 0;) n += "a";
                                                    for (; a-- > 0;) n = c + n
                                                } else "J" === i ? n += "H" : n += i
                                            }
                                            return n
                                        }(p, this.locale)), {
                                            val: {
                                                type: "date" === o ? 3 : 4,
                                                value: n,
                                                location: d,
                                                style: {
                                                    type: 1,
                                                    pattern: m,
                                                    location: c.styleLocation,
                                                    parsedOptions: this.shouldParseSkeletons ? (g = {}, m.replace(ep, function(e) {
                                                        var t = e.length;
                                                        switch (e[0]) {
                                                            case "G":
                                                                g.era = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                break;
                                                            case "y":
                                                                g.year = 2 === t ? "2-digit" : "numeric";
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
                                                                g.month = ["numeric", "2-digit", "short", "long", "narrow"][t - 1];
                                                                break;
                                                            case "w":
                                                            case "W":
                                                                throw RangeError("`w/W` (week) patterns are not supported");
                                                            case "d":
                                                                g.day = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "D":
                                                            case "F":
                                                            case "g":
                                                                throw RangeError("`D/F/g` (day) patterns are not supported, use `d` instead");
                                                            case "E":
                                                                g.weekday = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                break;
                                                            case "e":
                                                                if (t < 4) throw RangeError("`e..eee` (weekday) patterns are not supported");
                                                                g.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                break;
                                                            case "c":
                                                                if (t < 4) throw RangeError("`c..ccc` (weekday) patterns are not supported");
                                                                g.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                break;
                                                            case "a":
                                                                g.hour12 = !0;
                                                                break;
                                                            case "b":
                                                            case "B":
                                                                throw RangeError("`b/B` (period) patterns are not supported, use `a` instead");
                                                            case "h":
                                                                g.hourCycle = "h12", g.hour = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "H":
                                                                g.hourCycle = "h23", g.hour = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "K":
                                                                g.hourCycle = "h11", g.hour = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "k":
                                                                g.hourCycle = "h24", g.hour = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "j":
                                                            case "J":
                                                            case "C":
                                                                throw RangeError("`j/J/C` (hour) patterns are not supported, use `h/H/K/k` instead");
                                                            case "m":
                                                                g.minute = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "s":
                                                                g.second = ["numeric", "2-digit"][t - 1];
                                                                break;
                                                            case "S":
                                                            case "A":
                                                                throw RangeError("`S/A` (second) patterns are not supported, use `s` instead");
                                                            case "z":
                                                                g.timeZoneName = t < 4 ? "short" : "long";
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
                                                    }), g) : {}
                                                }
                                            },
                                            err: null
                                        }
                                    }
                                    return {
                                        val: {
                                            type: "number" === o ? 2 : "date" === o ? 3 : 4,
                                            value: n,
                                            location: d,
                                            style: null != (u = null == c ? void 0 : c.style) ? u : null
                                        }, err: null
                                    };
                                case "plural":
                                case "selectordinal":
                                case "select":
                                    var y = this.clonePosition();
                                    if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, eI(y, R({}, y)));
                                    this.bumpSpace();
                                    var b = this.parseIdentifierIfPossible(),
                                        _ = 0;
                                    if ("select" !== o && "offset" === b.value) {
                                        if (!this.bumpIf(":")) return this.error(13, eI(this.clonePosition(), this.clonePosition()));
                                        this.bumpSpace();
                                        var w = this.tryParseDecimalInteger(13, 14);
                                        if (w.err) return w;
                                        this.bumpSpace(), b = this.parseIdentifierIfPossible(), _ = w.val
                                    }
                                    var E = this.tryParsePluralOrSelectOptions(e, o, t, b);
                                    if (E.err) return E;
                                    var A = this.tryParseArgumentClose(r);
                                    if (A.err) return A;
                                    var x = eI(r, this.clonePosition());
                                    if ("select" === o) return {
                                        val: {
                                            type: 5,
                                            value: n,
                                            options: eL(E.val),
                                            location: x
                                        },
                                        err: null
                                    };
                                    return {
                                        val: {
                                            type: 6,
                                            value: n,
                                            options: eL(E.val),
                                            offset: _,
                                            pluralType: "plural" === o ? "cardinal" : "ordinal",
                                            location: x
                                        }, err: null
                                    };
                                default:
                                    return this.error(5, eI(i, a))
                            }
                        }
                    }, {
                        key: "tryParseArgumentClose",
                        value: function(e) {
                            return this.isEOF() || 125 !== this.char() ? this.error(1, eI(e, this.clonePosition())) : (this.bump(), {
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
                                    if (!this.bumpUntil("'")) return this.error(11, eI(n, this.clonePosition()));
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
                                    var t = e.split(ev).filter(function(e) {
                                            return e.length > 0
                                        }),
                                        n = [],
                                        r = !0,
                                        i = !1,
                                        o = void 0;
                                    try {
                                        for (var a, u = t[Symbol.iterator](); !(r = (a = u.next()).done); r = !0) {
                                            var c = a.value.split("/");
                                            if (0 === c.length) throw Error("Invalid number skeleton");
                                            var s = ed(c),
                                                l = s[0],
                                                f = s.slice(1),
                                                h = !0,
                                                d = !1,
                                                p = void 0;
                                            try {
                                                for (var v, g = f[Symbol.iterator](); !(h = (v = g.next()).done); h = !0) {
                                                    var m = v.value;
                                                    if (0 === m.length) throw Error("Invalid number skeleton")
                                                }
                                            } catch (e) {
                                                d = !0, p = e
                                            } finally {
                                                try {
                                                    h || null == g.return || g.return()
                                                } finally {
                                                    if (d) throw p
                                                }
                                            }
                                            n.push({
                                                stem: l,
                                                options: f
                                            })
                                        }
                                    } catch (e) {
                                        i = !0, o = e
                                    } finally {
                                        try {
                                            r || null == u.return || u.return()
                                        } finally {
                                            if (i) throw o
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
                                            i = void 0;
                                        try {
                                            for (var o, a = e[Symbol.iterator](); !(n = (o = a.next()).done); n = !0) {
                                                var u = o.value;
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
                                                        t = R(D(R({}, t), {
                                                            notation: "scientific"
                                                        }), u.options.reduce(function(e, t) {
                                                            return R({}, e, eE(t))
                                                        }, {}));
                                                        continue;
                                                    case "engineering":
                                                        t = R(D(R({}, t), {
                                                            notation: "engineering"
                                                        }), u.options.reduce(function(e, t) {
                                                            return R({}, e, eE(t))
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
                                                        u.options[0].replace(ey, function(e, n, r, i, o, a) {
                                                            if (n) t.minimumIntegerDigits = r.length;
                                                            else if (i && o) throw Error("We currently do not support maximum integer digits");
                                                            else if (a) throw Error("We currently do not support exact integer digits");
                                                            return ""
                                                        });
                                                        continue
                                                }
                                                if (eb.test(u.stem)) {
                                                    t.minimumIntegerDigits = u.stem.length;
                                                    continue
                                                }
                                                if (eg.test(u.stem)) {
                                                    if (u.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                    u.stem.replace(eg, function(e, n, r, i, o, a) {
                                                        return "*" === r ? t.minimumFractionDigits = n.length : i && "#" === i[0] ? t.maximumFractionDigits = i.length : o && a ? (t.minimumFractionDigits = o.length, t.maximumFractionDigits = o.length + a.length) : (t.minimumFractionDigits = n.length, t.maximumFractionDigits = n.length), ""
                                                    });
                                                    var c = u.options[0];
                                                    "w" === c ? t = D(R({}, t), {
                                                        trailingZeroDisplay: "stripIfInteger"
                                                    }) : c && (t = R({}, t, e_(c)));
                                                    continue
                                                }
                                                if (em.test(u.stem)) {
                                                    t = R({}, t, e_(u.stem));
                                                    continue
                                                }
                                                var s = ew(u.stem);
                                                s && (t = R({}, t, s));
                                                var l = function(e) {
                                                    var t;
                                                    if ("E" === e[0] && "E" === e[1] ? (t = {
                                                            notation: "engineering"
                                                        }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                            notation: "scientific"
                                                        }, e = e.slice(1)), t) {
                                                        var n = e.slice(0, 2);
                                                        if ("+!" === n ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === n && (t.signDisplay = "exceptZero", e = e.slice(2)), !eb.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                        t.minimumIntegerDigits = e.length
                                                    }
                                                    return t
                                                }(u.stem);
                                                l && (t = R({}, t, l))
                                            }
                                        } catch (e) {
                                            r = !0, i = e
                                        } finally {
                                            try {
                                                n || null == a.return || a.return()
                                            } finally {
                                                if (r) throw i
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
                            for (var i = !1, o = [], a = new Set, u = r.value, c = r.location;;) {
                                if (0 === u.length) {
                                    var s, l = this.clonePosition();
                                    if ("select" !== t && this.bumpIf("=")) {
                                        var f = this.tryParseDecimalInteger(16, 19);
                                        if (f.err) return f;
                                        c = eI(l, this.clonePosition()), u = this.message.slice(l.offset, this.offset())
                                    } else break
                                }
                                if (a.has(u)) return this.error("select" === t ? 21 : 20, c);
                                "other" === u && (i = !0), this.bumpSpace();
                                var h = this.clonePosition();
                                if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, eI(this.clonePosition(), this.clonePosition()));
                                var d = this.parseMessage(e + 1, t, n);
                                if (d.err) return d;
                                var p = this.tryParseArgumentClose(h);
                                if (p.err) return p;
                                o.push([u, {
                                    value: d.val,
                                    location: eI(h, this.clonePosition())
                                }]), a.add(u), this.bumpSpace(), u = (s = this.parseIdentifierIfPossible()).value, c = s.location
                            }
                            return 0 === o.length ? this.error("select" === t ? 15 : 16, eI(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !i ? this.error(22, eI(this.clonePosition(), this.clonePosition())) : {
                                val: o,
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseDecimalInteger",
                        value: function(e, t) {
                            var n = 1,
                                r = this.clonePosition();
                            this.bumpIf("+") || this.bumpIf("-") && (n = -1);
                            for (var i = !1, o = 0; !this.isEOF();) {
                                var a = this.char();
                                if (a >= 48 && a <= 57) i = !0, o = 10 * o + (a - 48), this.bump();
                                else break
                            }
                            var u = eI(r, this.clonePosition());
                            return i ? Number.isSafeInteger(o *= n) ? {
                                val: o,
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

            function eD(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }
            var eU = function(e) {
                    function t(e, n, r) {
                        var i;
                        return W(this, t), (i = G(this, t, [e])).code = n, i.originalMessage = r, i
                    }
                    return X(t, e), Q(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }($(Error)),
                eF = function(e) {
                    function t(e, n, r, i) {
                        return W(this, t), G(this, t, ['Invalid values for "'.concat(e, '": "').concat(n, '". Options are "').concat(Object.keys(r).join('", "'), '"'), "INVALID_VALUE", i])
                    }
                    return X(t, e), t
                }(eU),
                ez = function(e) {
                    function t(e, n, r) {
                        return W(this, t), G(this, t, ['Value for "'.concat(e, '" must be of type ').concat(n), "INVALID_VALUE", r])
                    }
                    return X(t, e), t
                }(eU),
                eG = function(e) {
                    function t(e, n) {
                        return W(this, t), G(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(n, '"'), "MISSING_VALUE", n])
                    }
                    return X(t, e), t
                }(eU);

            function eV(e) {
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
            var eW = ((b = function() {
                function e(t) {
                    var n, r = this,
                        i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        o = arguments.length > 2 ? arguments[2] : void 0,
                        a = arguments.length > 3 ? arguments[3] : void 0;
                    if (W(this, e), this.formatterCache = {
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
                            return function e(t, n, r, i, o, a, u) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var c = [],
                                    s = !0,
                                    l = !1,
                                    f = void 0;
                                try {
                                    for (var h, d = t[Symbol.iterator](); !(s = (h = d.next()).done); s = !0) {
                                        var p = h.value;
                                        if (0 === p.type) {
                                            c.push({
                                                type: 0,
                                                value: p.value
                                            });
                                            continue
                                        }
                                        if (7 === p.type) {
                                            "number" == typeof a && c.push({
                                                type: 0,
                                                value: r.getNumberFormat(n).format(a)
                                            });
                                            continue
                                        }
                                        var v = p.value;
                                        if (!(o && v in o)) throw new eG(v, u);
                                        var g = o[v];
                                        if (1 === p.type) {
                                            g && "string" != typeof g && "number" != typeof g && (void 0 === g ? "undefined" : (0, z._)(g)) !== "bigint" || (g = "string" == typeof g || "number" == typeof g || (void 0 === g ? "undefined" : (0, z._)(g)) === "bigint" ? String(g) : ""), c.push({
                                                type: +("string" != typeof g),
                                                value: g
                                            });
                                            continue
                                        }
                                        if (3 === p.type) {
                                            var m = "string" == typeof p.style ? i.date[p.style] : eS(p.style) ? p.style.parsedOptions : void 0;
                                            c.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, m).format(g)
                                            });
                                            continue
                                        }
                                        if (4 === p.type) {
                                            var y = "string" == typeof p.style ? i.time[p.style] : eS(p.style) ? p.style.parsedOptions : i.time.medium;
                                            c.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, y).format(g)
                                            });
                                            continue
                                        }
                                        if (2 === p.type) {
                                            var b = "string" == typeof p.style ? i.number[p.style] : ex(p.style) ? p.style.parsedOptions : void 0;
                                            if (b && b.scale) {
                                                var _ = b.scale || 1;
                                                if ((void 0 === g ? "undefined" : (0, z._)(g)) === "bigint") {
                                                    if (!Number.isInteger(_)) throw TypeError("Cannot apply fractional scale ".concat(_, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    g *= BigInt(_)
                                                } else g *= _
                                            }
                                            c.push({
                                                type: 0,
                                                value: r.getNumberFormat(n, b).format(g)
                                            });
                                            continue
                                        }
                                        if (8 === p.type) {
                                            var w = p.children,
                                                E = p.value,
                                                A = o[E];
                                            if ("function" != typeof A) throw new ez(E, "function", u);
                                            var x = A(e(w, n, r, i, o, a).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(x) || (x = [x]), c.push.apply(c, Y(x.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === p.type) {
                                            var S = g,
                                                B = (Object.prototype.hasOwnProperty.call(p.options, S) ? p.options[S] : void 0) || p.options.other;
                                            if (!B) throw new eF(p.value, g, Object.keys(p.options), u);
                                            c.push.apply(c, Y(e(B.value, n, r, i, o)));
                                            continue
                                        }
                                        if (6 === p.type) {
                                            var T = "=".concat(g),
                                                N = Object.prototype.hasOwnProperty.call(p.options, T) ? p.options[T] : void 0;
                                            if (!N) {
                                                if (!Intl.PluralRules) throw new eU('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", u);
                                                var O = (void 0 === g ? "undefined" : (0, z._)(g)) === "bigint" ? Number(g) : g,
                                                    I = r.getPluralRules(n, {
                                                        type: p.pluralType
                                                    }).select(O - (p.offset || 0));
                                                N = (Object.prototype.hasOwnProperty.call(p.options, I) ? p.options[I] : void 0) || p.options.other
                                            }
                                            if (!N) throw new eF(p.value, g, Object.keys(p.options), u);
                                            var k = (void 0 === g ? "undefined" : (0, z._)(g)) === "bigint" ? Number(g) : g;
                                            c.push.apply(c, Y(e(N.value, n, r, i, o, k - (p.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    l = !0, f = e
                                } finally {
                                    try {
                                        s || null == d.return || d.return()
                                    } finally {
                                        if (l) throw f
                                    }
                                }
                                return c.length < 2 ? c : c.reduce(function(e, t) {
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
                        var u = a || {},
                            c = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(u), eh({}, u));
                        this.ast = e.__parse(t, D(R({}, c), {
                            locale: this.resolvedLocale
                        }))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (n = e.formats, o ? Object.keys(n).reduce(function(e, t) {
                        var r, i;
                        return e[t] = (r = n[t], (i = o[t]) ? R({}, r, i, Object.keys(r).reduce(function(e, t) {
                            return e[t] = R({}, r[t], i[t]), e
                        }, {})) : r), e
                    }, R({}, n)) : n), this.formatters = a && a.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: ee(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return Z(Intl.NumberFormat, Y(t))
                            }, {
                                cache: eV(e.number),
                                strategy: ea.variadic
                            }),
                            getDateTimeFormat: ee(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return Z(Intl.DateTimeFormat, Y(t))
                            }, {
                                cache: eV(e.dateTime),
                                strategy: ea.variadic
                            }),
                            getPluralRules: ee(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return Z(Intl.PluralRules, Y(t))
                            }, {
                                cache: eV(e.pluralRules),
                                strategy: ea.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return Q(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, b.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, b.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = new eH(e, t = R({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (n.err) {
                    var r = SyntaxError(eA[n.err.kind]);
                    throw r.location = n.err.location, r.originalMessage = n.err.message, r
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var n in t.options) delete t.options[n].location, e(t.options[n].value);
                        else 2 === t.type && ex(t.style) || (3 === t.type || 4 === t.type) && eS(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(n.val), n.val
            }, b.formats = {
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
            }, b);

            function eK() {
                for (var e, t, n, r, i, o = arguments.length, a = Array(o), u = 0; u < o; u++) a[u] = arguments[u];
                var c = H(a, 4),
                    s = (c[0], c[1]),
                    l = c[2],
                    f = c[3];
                if (Array.isArray(s)) throw new eu(ec.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === s ? "undefined" : (0, z._)(s))) throw new eu(ec.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof s) {
                    var h = l || /'[{}<#|']/.test(s) ? void 0 : s;
                    if (h) return h
                }
                var d = f.cache,
                    p = f.formats,
                    v = f.formatters,
                    g = f.globalFormats,
                    m = f.locale,
                    y = f.timeZone;
                v.getMessageFormat || (v.getMessageFormat = es(function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return new eW(t[0], t[1], t[2], R({
                        formatters: v
                    }, t[3]))
                }, d.message));
                try {
                    i = v.getMessageFormat(s, m, (e = eW.formats.date, t = eW.formats.time, n = R({}, null == g ? void 0 : g.dateTime, null == p ? void 0 : p.dateTime), r = {
                        date: R({}, e, n),
                        time: R({}, t, n),
                        number: R({}, null == g ? void 0 : g.number, null == p ? void 0 : p.number)
                    }, y && ["date", "time"].forEach(function(e) {
                        var t = r[e],
                            n = !0,
                            i = !1,
                            o = void 0;
                        try {
                            for (var a, u = Object.entries(t)[Symbol.iterator](); !(n = (a = u.next()).done); n = !0) {
                                var c = H(a.value, 2),
                                    s = c[0],
                                    l = c[1];
                                t[s] = R({
                                    timeZone: y
                                }, l)
                            }
                        } catch (e) {
                            i = !0, o = e
                        } finally {
                            try {
                                n || null == u.return || u.return()
                            } finally {
                                if (i) throw o
                            }
                        }
                    }), r), {
                        formatters: D(R({}, v), {
                            getDateTimeFormat: function(e, t) {
                                var n;
                                return v.getDateTimeFormat(e, D(R({}, t), {
                                    timeZone: null != (n = null == t ? void 0 : t.timeZone) ? n : y
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new eu(ec.INVALID_MESSAGE, void 0)
                }
                var b = i.format(l);
                return (0, T.isValidElement)(b) || Array.isArray(b) || "string" == typeof b ? b : String(b)
            }

            function eZ() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return t.filter(Boolean).join(".")
            }

            function eX(e) {
                return eZ(e.namespace, e.key)
            }

            function eq(e) {
                console.error(e)
            }

            function eY(e, t, n, r) {
                var i = eZ(r, n);
                if (!t) throw Error(i);
                var o = t;
                return n.split(".").forEach(function(t) {
                    var n = o[t];
                    if (null == t || null == n) throw Error(i + " (".concat(e, ")"));
                    o = n
                }), o
            }
            eK.raw = !0;
            var e$ = (0, T.createContext)(void 0);

            function eJ(e) {
                var t = e.children,
                    n = e.formats,
                    r = e.getMessageFallback,
                    i = e.locale,
                    o = e.messages,
                    a = e.now,
                    u = e.onError,
                    c = e.timeZone,
                    s = (0, T.useContext)(e$),
                    l = (0, T.useMemo)(function() {
                        return (null == s ? void 0 : s.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [i, null == s ? void 0 : s.cache]),
                    f = (0, T.useMemo)(function() {
                        return (null == s ? void 0 : s.formatters) || {
                            getDateTimeFormat: el(Intl.DateTimeFormat, l.dateTime),
                            getNumberFormat: el(Intl.NumberFormat, l.number),
                            getPluralRules: el(Intl.PluralRules, l.pluralRules),
                            getRelativeTimeFormat: el(Intl.RelativeTimeFormat, l.relativeTime),
                            getListFormat: el(Intl.ListFormat, l.list),
                            getDisplayNames: el(Intl.DisplayNames, l.displayNames)
                        }
                    }, [l, null == s ? void 0 : s.formatters]),
                    h = (0, T.useMemo)(function() {
                        var e, t, h, d, p;
                        return D(R({}, (t = (e = {
                            locale: i,
                            formats: void 0 === n ? null == s ? void 0 : s.formats : n,
                            getMessageFallback: r || (null == s ? void 0 : s.getMessageFallback),
                            messages: void 0 === o ? null == s ? void 0 : s.messages : o,
                            now: a || (null == s ? void 0 : s.now),
                            onError: u || (null == s ? void 0 : s.onError),
                            timeZone: c || (null == s ? void 0 : s.timeZone)
                        }).formats, h = e.getMessageFallback, d = e.messages, p = e.onError, D(R({}, ef(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: d || void 0,
                            onError: p || eq,
                            getMessageFallback: h || eX
                        }))), {
                            formatters: f,
                            cache: l
                        })
                    }, [l, n, f, r, i, o, a, u, s, c]);
                return (0, x.jsx)(e$.Provider, {
                    value: h,
                    children: t
                })
            }

            function eQ() {
                var e = (0, T.useContext)(e$);
                if (!e) throw Error(void 0);
                return e
            }
            var e0 = !1,
                e1 = "u" < typeof window,
                e2 = window.Roblox["core-lib"].index;
            Y(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(Y(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var e3 = Y(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(Y(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                e5 = Y(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(Y(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            Y(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(Y(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var e8 = new Map([
                    ["zh_cjv", "zh_cn"]
                ]),
                e6 = function(e) {
                    return e.replaceAll(".", ":")
                },
                e4 = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                e7 = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = H(e, 2),
                            n = t[0],
                            r = t[1];
                        return null == r ? [] : [
                            [e6(n), r]
                        ]
                    }))
                },
                e9 = function(e) {
                    var t = e4(),
                        n = t.Lang,
                        r = t.LangDynamic,
                        i = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [e6(e), R({}, e7(null == i ? void 0 : i[e]), e7(null == n ? void 0 : n[e]), e7(null == r ? void 0 : r[e]))]
                    }))
                },
                te = function(e) {
                    var t, n, r = e.namespaces,
                        i = e.locale,
                        o = e.children,
                        a = r.join(","),
                        u = (0, T.useMemo)(function() {
                            return e9(r)
                        }, [a]);
                    return (0, x.jsx)(eJ, {
                        locale: null != i ? i : null != (t = null != (n = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, e2.arrayIncludes)(e5, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? n : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if ((0, V._)(t, HTMLMetaElement)) {
                                var n = t.dataset.languageCode;
                                if (n) {
                                    var r = null != (e = e8.get(n)) ? e : n;
                                    if ((0, e2.arrayIncludes)(e3, r)) return r.replace("_", "-")
                                }
                            }
                        }()) ? t : "en-us",
                        messages: u,
                        children: o
                    })
                },
                tt = function() {
                    for (var e, t, n = 0, r = "", i = arguments.length; n < i; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : (0, z._)(t)))
                            if (Array.isArray(t)) {
                                var o = t.length;
                                for (n = 0; n < o; n++) t[n] && (r = e(t[n])) && (i && (i += " "), i += r)
                            } else
                                for (r in t) t[r] && (i && (i += " "), i += r);
                        return i
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                tn = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                tr = function(e) {
                    var t = e.className;
                    return N().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: tt("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                ti = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                to = N().forwardRef(function(e, t) {
                    var n = ed([e, t]),
                        r = n[0],
                        i = n.slice(1),
                        o = r.name,
                        a = r.size,
                        u = r.className,
                        c = (r.children, ef(r, ["name", "size", "className", "children"])),
                        s = H(i, 1)[0];
                    return N().createElement("span", R({
                        ref: s,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: tt("grow-0 shrink-0 basis-auto icon", o, ti[void 0 === a ? "Medium" : a], u)
                    }, c))
                });
            to.displayName = "Icon";
            var ta = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                tu = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                tc = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        i = e.className,
                        o = ef(e, ["variant", "size", "isCircular", "className"]);
                    return N().createElement("button", R({
                        type: "button",
                        className: tt("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", tn, tu[t], ta[n], r && "radius-circle", i)
                    }, o), N().createElement(tr, null), N().createElement(to, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };

            function ts(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    i = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === i || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function tl(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tf() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = tl(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : tl(t[e], null)
                        }
                    }
                }
            }

            function th() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return T.useCallback(tf.apply(void 0, Y(t)), t)
            }

            function td() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                var r = t[0];
                if (1 === t.length) return r;
                var i = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var n = e.reduce(function(e, n) {
                            var r = n.useScope,
                                i = n.scopeName;
                            return R({}, e, r(t)["__scope".concat(i)])
                        }, {});
                        return T.useMemo(function() {
                            return C({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return i.scopeName = r.scopeName, i
            }
            var tp = (null == (_ = globalThis) ? void 0 : _.document) ? T.useLayoutEffect : function() {},
                tv = T[" useId ".trim().toString()] || function() {},
                tg = 0;

            function tm(e) {
                var t = H(T.useState(tv()), 2),
                    n = t[0],
                    r = t[1];
                return tp(function() {
                    e || r(function(e) {
                        return null != e ? e : String(tg++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function ty(e) {
                var t = T.useRef(e);
                return T.useEffect(function() {
                    t.current = e
                }), T.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(Y(r)))
                    }
                }, [])
            }
            var tb = window.RadixUI["react-dismissable-layer"],
                t_ = window.RadixUI["react-focus-scope"];

            function tw(e) {
                var t, n, r = (t = e, (n = T.forwardRef(function(e, t) {
                        var n = e.children,
                            r = ef(e, ["children"]);
                        if (T.isValidElement(n)) {
                            var i, o, a, u, c, s = (c = (u = null == (o = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : o.get) && "isReactWarning" in u && u.isReactWarning) ? i.ref : (c = (u = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                l = function(e, t) {
                                    var n = R({}, t);
                                    for (var r in t) ! function(r) {
                                        var i = e[r],
                                            o = t[r];
                                        /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            o.apply(void 0, Y(t)), i.apply(void 0, Y(t))
                                        } : i && (n[r] = i) : "style" === r ? n[r] = R({}, i, o) : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                                    }(r);
                                    return R({}, e, n)
                                }(r, n.props);
                            return n.type !== T.Fragment && (l.ref = t ? tf(t, s) : s), T.cloneElement(n, l)
                        }
                        return T.Children.count(n) > 1 ? T.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    i = T.forwardRef(function(e, t) {
                        var n = e.children,
                            i = ef(e, ["children"]),
                            o = T.Children.toArray(n),
                            a = o.find(tA);
                        if (a) {
                            var u = a.props.children,
                                c = o.map(function(e) {
                                    return e !== a ? e : T.Children.count(u) > 1 ? T.Children.only(null) : T.isValidElement(u) ? u.props.children : null
                                });
                            return (0, x.jsx)(r, D(R({}, i), {
                                ref: t,
                                children: T.isValidElement(u) ? T.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, x.jsx)(r, D(R({}, i), {
                            ref: t,
                            children: n
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var tE = Symbol("radix.slottable");

            function tA(e) {
                return T.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tE
            }
            var tx = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = tw("Primitive.".concat(t)),
                        r = T.forwardRef(function(e, r) {
                            var i = e.asChild,
                                o = ef(e, ["asChild"]),
                                a = i ? n : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, x.jsx)(a, D(R({}, o), {
                                ref: r
                            }))
                        });
                    return r.displayName = "Primitive.".concat(t), D(R({}, e), C({}, t, r))
                }, {}),
                tS = T.forwardRef(function(e, t) {
                    var n, r, i = e.container,
                        o = ef(e, ["container"]),
                        a = H(T.useState(!1), 2),
                        u = a[0],
                        c = a[1];
                    tp(function() {
                        return c(!0)
                    }, []);
                    var s = i || u && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
                    return s ? I().createPortal((0, x.jsx)(tx.div, D(R({}, o), {
                        ref: t
                    })), s) : null
                });
            tS.displayName = "Portal";
            var tB = function(e) {
                var t, n, r, i, o, a, u, c, s, l, f, h, d, p, v, g, m, y = e.present,
                    b = e.children,
                    _ = (t = y, o = (i = H(T.useState(), 2))[0], a = i[1], u = T.useRef({}), c = T.useRef(t), s = T.useRef("none"), f = (l = H((n = t ? "mounted" : "unmounted", r = {
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
                    }, T.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], h = l[1], T.useEffect(function() {
                        var e = tT(u.current);
                        s.current = "mounted" === f ? e : "none"
                    }, [f]), tp(function() {
                        var e = u.current,
                            n = c.current;
                        if (n !== t) {
                            var r = s.current,
                                i = tT(e);
                            t ? h("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? h("UNMOUNT") : n && r !== i ? h("ANIMATION_OUT") : h("UNMOUNT"), c.current = t
                        }
                    }, [t, h]), tp(function() {
                        if (o) {
                            var e, t, n = null != (e = o.ownerDocument.defaultView) ? e : window,
                                r = function(e) {
                                    var r = tT(u.current).includes(e.animationName);
                                    if (e.target === o && r && (h("ANIMATION_END"), !c.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (s.current = tT(u.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", r), o.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", r), o.removeEventListener("animationend", r)
                                }
                        }
                        h("ANIMATION_END")
                    }, [o, h]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: T.useCallback(function(e) {
                            e && (u.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    w = "function" == typeof b ? b({
                        present: _.isPresent
                    }) : T.Children.only(b),
                    E = th(_.ref, (m = (g = null == (p = Object.getOwnPropertyDescriptor((d = w).props, "ref")) ? void 0 : p.get) && "isReactWarning" in g && g.isReactWarning) ? d.ref : (m = (g = null == (v = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : v.get) && "isReactWarning" in g && g.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
                return "function" == typeof b || _.isPresent ? T.cloneElement(w, {
                    ref: E
                }) : null
            };

            function tT(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            tB.displayName = "Presence";
            var tN = window.RadixUI["react-focus-guards"],
                tO = function() {
                    return (tO = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function tI(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) 0 > t.indexOf(r[i]) && Object.prototype.propertyIsEnumerable.call(e, r[i]) && (n[r[i]] = e[r[i]]);
                return n
            }
            var tk = "right-scroll-bar-position",
                tC = "width-before-scroll-bar";

            function tR(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var tL = "u" > typeof window ? T.useLayoutEffect : T.useEffect,
                tM = new WeakMap,
                tj = (void 0 === u && (u = {}), (void 0 === c && (c = function(e) {
                    return e
                }), s = [], l = !1, f = {
                    read: function() {
                        if (l) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return s.length ? s[s.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = c(e, l);
                        return s.push(t),
                            function() {
                                s = s.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (l = !0; s.length;) {
                            var t = s;
                            s = [], t.forEach(e)
                        }
                        s = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return s
                            }
                        }
                    },
                    assignMedium: function(e) {
                        l = !0;
                        var t = [];
                        if (s.length) {
                            var n = s;
                            s = [], n.forEach(e), t = s
                        }
                        var r = function() {
                                var n = t;
                                t = [], n.forEach(e)
                            },
                            i = function() {
                                return Promise.resolve().then(r)
                            };
                        i(), s = {
                            push: function(e) {
                                t.push(e), i()
                            },
                            filter: function(e) {
                                return t = t.filter(e), s
                            }
                        }
                    }
                }).options = tO({
                    async: !0,
                    ssr: !1
                }, u), f),
                tP = function() {},
                tH = T.forwardRef(function(e, t) {
                    var n, r, i, o, a = T.useRef(null),
                        u = T.useState({
                            onScrollCapture: tP,
                            onWheelCapture: tP,
                            onTouchMoveCapture: tP
                        }),
                        c = u[0],
                        s = u[1],
                        l = e.forwardProps,
                        f = e.children,
                        h = e.className,
                        d = e.removeScrollBar,
                        p = e.enabled,
                        v = e.shards,
                        g = e.sideCar,
                        m = e.noRelative,
                        y = e.noIsolation,
                        b = e.inert,
                        _ = e.allowPinchZoom,
                        w = e.as,
                        E = e.gapMode,
                        A = tI(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        x = (n = [a, t], r = function(e) {
                            return n.forEach(function(t) {
                                return tR(t, e)
                            })
                        }, (i = (0, T.useState)(function() {
                            return {
                                value: null,
                                callback: r,
                                facade: {
                                    get current() {
                                        return i.value
                                    },
                                    set current(value) {
                                        var e = i.value;
                                        e !== value && (i.value = value, i.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = r, o = i.facade, tL(function() {
                            var e = tM.get(o);
                            if (e) {
                                var t = new Set(e),
                                    r = new Set(n),
                                    i = o.current;
                                t.forEach(function(e) {
                                    r.has(e) || tR(e, null)
                                }), r.forEach(function(e) {
                                    t.has(e) || tR(e, i)
                                })
                            }
                            tM.set(o, n)
                        }, [n]), o),
                        S = tO(tO({}, A), c);
                    return T.createElement(T.Fragment, null, p && T.createElement(g, {
                        sideCar: tj,
                        removeScrollBar: d,
                        shards: v,
                        noRelative: m,
                        noIsolation: y,
                        inert: b,
                        setCallbacks: s,
                        allowPinchZoom: !!_,
                        lockRef: a,
                        gapMode: E
                    }), l ? T.cloneElement(T.Children.only(f), tO(tO({}, S), {
                        ref: x
                    })) : T.createElement(void 0 === w ? "div" : w, tO({}, S, {
                        className: h,
                        ref: x
                    }), f))
                });
            tH.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, tH.classNames = {
                fullWidth: tC,
                zeroRight: tk
            };
            var tD = function(e) {
                var t = e.sideCar,
                    n = tI(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var r = t.read();
                if (!r) throw Error("Sidecar medium not found");
                return T.createElement(r, tO({}, n))
            };
            tD.isSideCarExport = !0;
            var tU = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = w || n.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var i, o;
                                (i = t).styleSheet ? i.styleSheet.cssText = r : i.appendChild(document.createTextNode(r)), o = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(o)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                tF = function() {
                    var e = tU();
                    return function(t, n) {
                        T.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && n])
                    }
                },
                tz = function() {
                    var e = tF();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                tG = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                tV = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                tW = function(e) {
                    var t = window.getComputedStyle(document.body),
                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [tV(n), tV(r), tV(i)]
                },
                tK = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return tG;
                    var t = tW(e),
                        n = document.documentElement.clientWidth,
                        r = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, r - n + t[2] - t[0])
                    }
                },
                tZ = tz(),
                tX = "data-scroll-locked",
                tq = function(e, t, n, r) {
                    var i = e.left,
                        o = e.top,
                        a = e.right,
                        u = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(tX, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(tk, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(tC, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(tk, " .").concat(tk, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(tC, " .").concat(tC, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(tX, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
                },
                tY = function() {
                    var e = parseInt(document.body.getAttribute(tX) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                t$ = function() {
                    T.useEffect(function() {
                        return document.body.setAttribute(tX, (tY() + 1).toString()),
                            function() {
                                var e = tY() - 1;
                                e <= 0 ? document.body.removeAttribute(tX) : document.body.setAttribute(tX, e.toString())
                            }
                    }, [])
                },
                tJ = function(e) {
                    var t = e.noRelative,
                        n = e.noImportant,
                        r = e.gapMode,
                        i = void 0 === r ? "margin" : r;
                    t$();
                    var o = T.useMemo(function() {
                        return tK(i)
                    }, [i]);
                    return T.createElement(tZ, {
                        styles: tq(o, !t, i, n ? "" : "!important")
                    })
                },
                tQ = !1;
            if ("u" > typeof window) try {
                var t0 = Object.defineProperty({}, "passive", {
                    get: function() {
                        return tQ = !0, !0
                    }
                });
                window.addEventListener("test", t0, t0), window.removeEventListener("test", t0, t0)
            } catch (e) {
                tQ = !1
            }
            var t1 = !!tQ && {
                    passive: !1
                },
                t2 = function(e, t) {
                    if (!(0, V._)(e, Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
                },
                t3 = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("u" > typeof ShadowRoot && (0, V._)(r, ShadowRoot) && (r = r.host), t5(e, r)) {
                            var i = t8(e, r);
                            if (i[1] > i[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                t5 = function(e, t) {
                    return "v" === e ? t2(t, "overflowY") : t2(t, "overflowX")
                },
                t8 = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                t6 = function(e, t, n, r, i) {
                    var o, a = (o = window.getComputedStyle(t).direction, "h" === e && "rtl" === o ? -1 : 1),
                        u = a * r,
                        c = n.target,
                        s = t.contains(c),
                        l = !1,
                        f = u > 0,
                        h = 0,
                        d = 0;
                    do {
                        if (!c) break;
                        var p = t8(e, c),
                            v = p[0],
                            g = p[1] - p[2] - a * v;
                        (v || g) && t5(e, c) && (h += g, d += v);
                        var m = c.parentNode;
                        c = m && m.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? m.host : m
                    } while (!s && c !== document.body || s && (t.contains(c) || t === c));
                    return f && (i && 1 > Math.abs(h) || !i && u > h) ? l = !0 : !f && (i && 1 > Math.abs(d) || !i && -u > d) && (l = !0), l
                },
                t4 = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                t7 = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                t9 = function(e) {
                    return e && "current" in e ? e.current : e
                },
                ne = 0,
                nt = [],
                nn = (h = function(e) {
                    var t = T.useRef([]),
                        n = T.useRef([0, 0]),
                        r = T.useRef(),
                        i = T.useState(ne++)[0],
                        o = T.useState(tz)[0],
                        a = T.useRef(e);
                    T.useEffect(function() {
                        a.current = e
                    }, [e]), T.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, n) {
                                if (n || 2 == arguments.length)
                                    for (var r, i = 0, o = t.length; i < o; i++) !r && i in t || (r || (r = Array.prototype.slice.call(t, 0, i)), r[i] = t[i]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(t9), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(i))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(i)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(i))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var u = T.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var i, o = t4(e),
                                u = n.current,
                                c = "deltaX" in e ? e.deltaX : u[0] - o[0],
                                s = "deltaY" in e ? e.deltaY : u[1] - o[1],
                                l = e.target,
                                f = Math.abs(c) > Math.abs(s) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === l.type) return !1;
                            var h = t3(f, l);
                            if (!h) return !0;
                            if (h ? i = f : (i = "v" === f ? "h" : "v", h = t3(f, l)), !h) return !1;
                            if (!r.current && "changedTouches" in e && (c || s) && (r.current = i), !i) return !0;
                            var d = r.current || i;
                            return t6(d, t, e, "h" === d ? c : s, !0)
                        }, []),
                        c = T.useCallback(function(e) {
                            if (nt.length && nt[nt.length - 1] === o) {
                                var n = "deltaY" in e ? t7(e) : t4(e),
                                    r = t.current.filter(function(t) {
                                        var r;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                                    })[0];
                                if (r && r.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!r) {
                                    var i = (a.current.shards || []).map(t9).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? u(e, i[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        s = T.useCallback(function(e, n, r, i) {
                            var o = {
                                name: e,
                                delta: n,
                                target: r,
                                should: i,
                                shadowParent: function(e) {
                                    for (var t = null; null !== e;)(0, V._)(e, ShadowRoot) && (t = e.host, e = e.host), e = e.parentNode;
                                    return t
                                }(r)
                            };
                            t.current.push(o), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== o
                                })
                            }, 1)
                        }, []),
                        l = T.useCallback(function(e) {
                            n.current = t4(e), r.current = void 0
                        }, []),
                        f = T.useCallback(function(t) {
                            s(t.type, t7(t), t.target, u(t, e.lockRef.current))
                        }, []),
                        h = T.useCallback(function(t) {
                            s(t.type, t4(t), t.target, u(t, e.lockRef.current))
                        }, []);
                    T.useEffect(function() {
                        return nt.push(o), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: h
                            }), document.addEventListener("wheel", c, t1), document.addEventListener("touchmove", c, t1), document.addEventListener("touchstart", l, t1),
                            function() {
                                nt = nt.filter(function(e) {
                                    return e !== o
                                }), document.removeEventListener("wheel", c, t1), document.removeEventListener("touchmove", c, t1), document.removeEventListener("touchstart", l, t1)
                            }
                    }, []);
                    var d = e.removeScrollBar,
                        p = e.inert;
                    return T.createElement(T.Fragment, null, p ? T.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, d ? T.createElement(tJ, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, tj.useMedium(h), tD),
                nr = T.forwardRef(function(e, t) {
                    return T.createElement(tH, tO({}, e, {
                        ref: t,
                        sideCar: nn
                    }))
                });
            nr.classNames = tH.classNames;
            var ni = new WeakMap,
                no = new WeakMap,
                na = {},
                nu = 0,
                nc = function(e) {
                    return e && (e.host || nc(e.parentNode))
                },
                ns = function(e, t, n, r) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var n = nc(e);
                        return n && t.contains(n) ? n : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    na[n] || (na[n] = new WeakMap);
                    var o = na[n],
                        a = [],
                        u = new Set,
                        c = new Set(i),
                        s = function(e) {
                            !e || u.has(e) || (u.add(e), s(e.parentNode))
                        };
                    i.forEach(s);
                    var l = function(e) {
                        !e || c.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (u.has(e)) l(e);
                            else try {
                                var t = e.getAttribute(r),
                                    i = null !== t && "false" !== t,
                                    c = (ni.get(e) || 0) + 1,
                                    s = (o.get(e) || 0) + 1;
                                ni.set(e, c), o.set(e, s), a.push(e), 1 === c && i && no.set(e, !0), 1 === s && e.setAttribute(n, "true"), i || e.setAttribute(r, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return l(t), u.clear(), nu++,
                        function() {
                            a.forEach(function(e) {
                                var t = ni.get(e) - 1,
                                    i = o.get(e) - 1;
                                ni.set(e, t), o.set(e, i), t || (no.has(e) || e.removeAttribute(r), no.delete(e)), i || e.removeAttribute(n)
                            }), --nu || (ni = new WeakMap, ni = new WeakMap, no = new WeakMap, na = {})
                        }
                },
                nl = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (r.push.apply(r, Array.from(i.querySelectorAll("[aria-live], script"))), ns(r, i, n, "aria-hidden")) : function() {
                        return null
                    }
                },
                nf = "Dialog",
                nh = H(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        r = function() {
                            var t = n.map(function(e) {
                                return T.createContext(e)
                            });
                            return function(n) {
                                var r = (null == n ? void 0 : n[e]) || t;
                                return T.useMemo(function() {
                                    return C({}, "__scope".concat(e), D(R({}, n), C({}, e, r)))
                                }, [n, r])
                            }
                        };
                    return r.scopeName = e, [function(t, r) {
                        var i = T.createContext(r),
                            o = n.length;
                        n = Y(n).concat([r]);
                        var a = function(t) {
                            var n, r = t.scope,
                                a = t.children,
                                u = ef(t, ["scope", "children"]),
                                c = (null == r || null == (n = r[e]) ? void 0 : n[o]) || i,
                                s = T.useMemo(function() {
                                    return u
                                }, Object.values(u));
                            return (0, x.jsx)(c.Provider, {
                                value: s,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(n, a) {
                            var u, c = (null == a || null == (u = a[e]) ? void 0 : u[o]) || i,
                                s = T.useContext(c);
                            if (s) return s;
                            if (void 0 !== r) return r;
                            throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                        }]
                    }, td.apply(void 0, [r].concat(Y(t)))]
                }(nf), 2),
                nd = nh[0];
            nh[1];
            var np = H(nd(nf), 2),
                nv = np[0],
                ng = np[1],
                nm = function(e) {
                    var t, n, r, i, o, a, u, c, s, l, f, h, d, p, v, g, m, y = e.__scopeDialog,
                        b = e.children,
                        _ = e.open,
                        w = e.defaultOpen,
                        E = e.onOpenChange,
                        A = e.modal,
                        S = T.useRef(null),
                        B = T.useRef(null),
                        N = H((s = (c = {
                            prop: _,
                            defaultProp: w,
                            onChange: E
                        }).prop, d = (h = H((n = (t = {
                            defaultProp: c.defaultProp,
                            onChange: f = void 0 === (l = c.onChange) ? function() {} : l
                        }).defaultProp, r = t.onChange, o = H(i = T.useState(n), 1)[0], a = T.useRef(o), u = ty(r), T.useEffect(function() {
                            a.current !== o && (u(o), a.current = o)
                        }, [o, a, u]), i), 2))[0], p = h[1], g = (v = void 0 !== s) ? s : d, m = ty(f), [g, T.useCallback(function(e) {
                            if (v) {
                                var t = "function" == typeof e ? e(s) : e;
                                t !== s && m(t)
                            } else p(e)
                        }, [v, s, p, m])]), 2),
                        O = N[0],
                        I = N[1];
                    return (0, x.jsx)(nv, {
                        scope: y,
                        triggerRef: S,
                        contentRef: B,
                        contentId: tm(),
                        titleId: tm(),
                        descriptionId: tm(),
                        open: void 0 !== O && O,
                        onOpenChange: I,
                        onOpenToggle: T.useCallback(function() {
                            return I(function(e) {
                                return !e
                            })
                        }, [I]),
                        modal: void 0 === A || A,
                        children: b
                    })
                };
            nm.displayName = nf;
            var ny = "DialogTrigger";
            T.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = ef(e, ["__scopeDialog"]),
                    i = ng(ny, n),
                    o = th(t, i.triggerRef);
                return (0, x.jsx)(tx.button, D(R({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": nH(i.open)
                }, r), {
                    ref: o,
                    onClick: ts(e.onClick, i.onOpenToggle)
                }))
            }).displayName = ny;
            var nb = "DialogPortal",
                n_ = H(nd(nb, {
                    forceMount: void 0
                }), 2),
                nw = n_[0],
                nE = n_[1],
                nA = function(e) {
                    var t = e.__scopeDialog,
                        n = e.forceMount,
                        r = e.children,
                        i = e.container,
                        o = ng(nb, t);
                    return (0, x.jsx)(nw, {
                        scope: t,
                        forceMount: n,
                        children: T.Children.map(r, function(e) {
                            return (0, x.jsx)(tB, {
                                present: n || o.open,
                                children: (0, x.jsx)(tS, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            nA.displayName = nb;
            var nx = "DialogOverlay",
                nS = T.forwardRef(function(e, t) {
                    var n = nE(nx, e.__scopeDialog),
                        r = e.forceMount,
                        i = void 0 === r ? n.forceMount : r,
                        o = ef(e, ["forceMount"]),
                        a = ng(nx, e.__scopeDialog);
                    return a.modal ? (0, x.jsx)(tB, {
                        present: i || a.open,
                        children: (0, x.jsx)(nT, D(R({}, o), {
                            ref: t
                        }))
                    }) : null
                });
            nS.displayName = nx;
            var nB = tw("DialogOverlay.RemoveScroll"),
                nT = T.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = ef(e, ["__scopeDialog"]),
                        i = ng(nx, n);
                    return (0, x.jsx)(nr, {
                        as: nB,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, x.jsx)(tx.div, D(R({
                            "data-state": nH(i.open)
                        }, r), {
                            ref: t,
                            style: R({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                }),
                nN = "DialogContent",
                nO = T.forwardRef(function(e, t) {
                    var n = nE(nN, e.__scopeDialog),
                        r = e.forceMount,
                        i = void 0 === r ? n.forceMount : r,
                        o = ef(e, ["forceMount"]),
                        a = ng(nN, e.__scopeDialog);
                    return (0, x.jsx)(tB, {
                        present: i || a.open,
                        children: a.modal ? (0, x.jsx)(nI, D(R({}, o), {
                            ref: t
                        })) : (0, x.jsx)(nk, D(R({}, o), {
                            ref: t
                        }))
                    })
                });
            nO.displayName = nN;
            var nI = T.forwardRef(function(e, t) {
                    var n = ng(nN, e.__scopeDialog),
                        r = T.useRef(null),
                        i = th(t, n.contentRef, r);
                    return T.useEffect(function() {
                        var e = r.current;
                        if (e) return nl(e)
                    }, []), (0, x.jsx)(nC, D(R({}, e), {
                        ref: i,
                        trapFocus: n.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: ts(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = n.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: ts(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                n = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || n) && e.preventDefault()
                        }),
                        onFocusOutside: ts(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                nk = T.forwardRef(function(e, t) {
                    var n = ng(nN, e.__scopeDialog),
                        r = T.useRef(!1),
                        i = T.useRef(!1);
                    return (0, x.jsx)(nC, D(R({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var o, a;
                            null == (o = e.onCloseAutoFocus) || o.call(e, t), t.defaultPrevented || (r.current || null == (a = n.triggerRef.current) || a.focus(), t.preventDefault()), r.current = !1, i.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (o = e.onInteractOutside) || o.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                            var o, a, u = t.target;
                            (null == (a = n.triggerRef.current) ? void 0 : a.contains(u)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                        }
                    }))
                }),
                nC = T.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        o = e.onCloseAutoFocus,
                        a = ef(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        u = ng(nN, n),
                        c = T.useRef(null),
                        s = th(t, c);
                    return (0, tN.useFocusGuards)(), (0, x.jsxs)(x.Fragment, {
                        children: [(0, x.jsx)(t_.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: r,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: o,
                            children: (0, x.jsx)(tb.DismissableLayer, D(R({
                                role: "dialog",
                                id: u.contentId,
                                "aria-describedby": u.descriptionId,
                                "aria-labelledby": u.titleId,
                                "data-state": nH(u.open)
                            }, a), {
                                ref: s,
                                onDismiss: function() {
                                    return u.onOpenChange(!1)
                                }
                            }))
                        }), (0, x.jsxs)(x.Fragment, {
                            children: [(0, x.jsx)(nz, {
                                titleId: u.titleId
                            }), (0, x.jsx)(nG, {
                                contentRef: c,
                                descriptionId: u.descriptionId
                            })]
                        })]
                    })
                }),
                nR = "DialogTitle",
                nL = T.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = ef(e, ["__scopeDialog"]),
                        i = ng(nR, n);
                    return (0, x.jsx)(tx.h2, D(R({
                        id: i.titleId
                    }, r), {
                        ref: t
                    }))
                });
            nL.displayName = nR;
            var nM = "DialogDescription";
            T.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = ef(e, ["__scopeDialog"]),
                    i = ng(nM, n);
                return (0, x.jsx)(tx.p, D(R({
                    id: i.descriptionId
                }, r), {
                    ref: t
                }))
            }).displayName = nM;
            var nj = "DialogClose",
                nP = T.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = ef(e, ["__scopeDialog"]),
                        i = ng(nj, n);
                    return (0, x.jsx)(tx.button, D(R({
                        type: "button"
                    }, r), {
                        ref: t,
                        onClick: ts(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function nH(e) {
                return e ? "open" : "closed"
            }
            nP.displayName = nj;
            var nD = "DialogTitleWarning",
                nU = H((d = {
                    contentName: nN,
                    titleName: nR,
                    docsSlug: "dialog"
                }, p = T.createContext(d), (v = function(e) {
                    var t = e.children,
                        n = ef(e, ["children"]),
                        r = T.useMemo(function() {
                            return n
                        }, Object.values(n));
                    return (0, x.jsx)(p.Provider, {
                        value: r,
                        children: t
                    })
                }).displayName = nD + "Provider", [v, function(e) {
                    var t = T.useContext(p);
                    if (t) return t;
                    if (void 0 !== d) return d;
                    throw Error("`".concat(e, "` must be used within `").concat(nD, "`"))
                }]), 2),
                nF = (nU[0], nU[1]),
                nz = function(e) {
                    var t = e.titleId,
                        n = nF(nD),
                        r = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
                    return T.useEffect(function() {
                        t && (document.getElementById(t) || console.error(r))
                    }, [r, t]), null
                },
                nG = function(e) {
                    var t = e.contentRef,
                        n = e.descriptionId,
                        r = nF("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
                    return T.useEffect(function() {
                        var e, r = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        n && r && (document.getElementById(n) || console.warn(i))
                    }, [i, t, n]), null
                },
                nV = Symbol("radix.slottable");

            function nW(e) {
                return T.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nV
            }
            var nK = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                    var n, r, i, o, a, u = (n = i = "Primitive.".concat(t), (r = T.forwardRef(function(e, t) {
                            var n = e.children,
                                r = ef(e, ["children"]);
                            if (T.isValidElement(n)) {
                                var i, o, a, u, c, s = (c = (u = null == (o = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : o.get) && "isReactWarning" in u && u.isReactWarning) ? i.ref : (c = (u = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                    l = function(e, t) {
                                        var n = R({}, t);
                                        for (var r in t) ! function(r) {
                                            var i = e[r],
                                                o = t[r];
                                            /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                var r = o.apply(void 0, Y(t));
                                                return i.apply(void 0, Y(t)), r
                                            } : i && (n[r] = i) : "style" === r ? n[r] = R({}, i, o) : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                                        }(r);
                                        return R({}, e, n)
                                    }(r, n.props);
                                return n.type !== T.Fragment && (l.ref = t ? tf(t, s) : s), T.cloneElement(n, l)
                            }
                            return T.Children.count(n) > 1 ? T.Children.only(null) : null
                        })).displayName = "".concat(n, ".SlotClone"), o = r, (a = T.forwardRef(function(e, t) {
                            var n = e.children,
                                r = ef(e, ["children"]),
                                i = T.Children.toArray(n),
                                a = i.find(nW);
                            if (a) {
                                var u = a.props.children,
                                    c = i.map(function(e) {
                                        return e !== a ? e : T.Children.count(u) > 1 ? T.Children.only(null) : T.isValidElement(u) ? u.props.children : null
                                    });
                                return (0, x.jsx)(o, D(R({}, r), {
                                    ref: t,
                                    children: T.isValidElement(u) ? T.cloneElement(u, void 0, c) : null
                                }))
                            }
                            return (0, x.jsx)(o, D(R({}, r), {
                                ref: t,
                                children: n
                            }))
                        })).displayName = "".concat(i, ".Slot"), a),
                        c = T.forwardRef(function(e, n) {
                            var r = e.asChild,
                                i = ef(e, ["asChild"]),
                                o = r ? u : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, x.jsx)(o, D(R({}, i), {
                                ref: n
                            }))
                        });
                    return c.displayName = "Primitive.".concat(t), D(R({}, e), C({}, t, c))
                }, {}),
                nZ = Object.freeze({
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
                nX = T.forwardRef(function(e, t) {
                    return (0, x.jsx)(nK.span, D(R({}, e), {
                        ref: t,
                        style: R({}, nZ, e.style)
                    }))
                });
            nX.displayName = "VisuallyHidden";
            var nq = (0, T.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                nY = function() {
                    var e = (0, T.useContext)(nq);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                n$ = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                nJ = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                nQ = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                n0 = function(e) {
                    var t = e.open,
                        n = e.onOpenChange,
                        r = e.children,
                        i = e.size,
                        o = e.type,
                        a = void 0 === o ? "Default" : o,
                        u = e.isModal,
                        c = e.hasCloseAffordance,
                        s = e.closeLabel,
                        l = e.hasMarginTop,
                        f = void 0 === l || l,
                        h = e.hasMarginBottom,
                        d = void 0 === h || h,
                        p = e.hasDescription,
                        v = void 0 !== p && p,
                        g = e.experimentalDisablePointerEventsStylingOnBody,
                        m = void 0 !== g && g,
                        y = (0, T.useMemo)(function() {
                            return {
                                size: i,
                                isModal: u,
                                type: a,
                                hasCloseAffordance: c,
                                closeLabel: s,
                                hasMarginTop: f,
                                hasMarginBottom: d,
                                hasDescription: v
                            }
                        }, [i, u, a, c, s, f, d, v]);
                    return (0, T.useEffect)(function() {
                        m && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [m, t]), N().createElement(nq.Provider, {
                        value: y
                    }, N().createElement(nm, {
                        open: t,
                        onOpenChange: n
                    }, r))
                };
            n0.displayName = "Dialog";
            var n1 = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.style,
                    i = e.overlayClassName,
                    o = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    u = ef(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = nY(),
                    s = c.size,
                    l = c.isModal,
                    f = c.hasCloseAffordance,
                    h = c.closeLabel,
                    d = c.hasDescription,
                    p = tt("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", l && "bg-common-backdrop", i),
                    v = tt("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", n);
                return N().createElement(nA, null, N().createElement(nS, {
                    className: p,
                    style: o
                }, N().createElement(nO, R({
                    className: v,
                    "data-size": s,
                    style: r,
                    onOpenAutoFocus: a
                }, !d && {
                    "aria-describedby": void 0
                }, u), f && N().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, N().createElement(nP, {
                    asChild: !0
                }, N().createElement(tc, {
                    variant: "OverMedia",
                    size: s,
                    isCircular: !0,
                    "aria-label": h
                }))), t)))
            };
            n1.displayName = "DialogContent";
            var n2 = function(e) {
                var t = e.children,
                    n = e.className,
                    r = ef(e, ["children", "className"]),
                    i = nY(),
                    o = i.size,
                    a = i.hasMarginTop,
                    u = i.hasMarginBottom,
                    c = tt(n$[o], a && nJ[o], u && nQ[o], n);
                return N().createElement("div", R({
                    className: c
                }, r), t)
            };
            n2.displayName = "DialogBody";
            var n3 = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.hidden,
                    i = ef(e, ["children", "className", "hidden"]),
                    o = N().createElement(nL, R({
                        className: n
                    }, i), t);
                return r ? N().createElement(nX, null, o) : o
            };
            n3.displayName = "DialogTitle";
            var n5 = function(e) {
                var t = e.children,
                    n = e.className,
                    r = ef(e, ["children", "className"]),
                    i = nY().size,
                    o = tt(n$[i], nQ[i], n);
                return N().createElement("div", R({
                    className: o
                }, r), t)
            };
            n5.displayName = "DialogFooter";
            var n8 = window.ReactStyleGuide,
                n6 = "__FN_nvfToKPAOuiV__",
                n4 = "__FN_END_nvfToKPAOuiV__",
                n7 = new RegExp("".concat(n6, "(\\d+)\\|")),
                n9 = new RegExp("".concat(n4, "(\\d+)\\|")),
                re = function(e, t, n) {
                    var r = R({}, n),
                        i = {};
                    t.forEach(function(e, t) {
                        var n = t.toString(),
                            o = "".concat(n6).concat(n, "|"),
                            a = "".concat(n4).concat(n, "|");
                        r[e.opening] = o, r[e.closing] = a, i[n] = {
                            start: o,
                            end: a,
                            render: e.render
                        }
                    });
                    var o = function(e) {
                            var t = [],
                                n = n7.exec(e),
                                r = n9.exec(e);
                            if (r && (!n || r.index < n.index)) return null;
                            if (!n) return [e];
                            n.index > 0 && t.push(e.slice(0, n.index));
                            var a = null == n[1] ? void 0 : i[n[1]];
                            if (null == a) return null;
                            var u = e.indexOf(a.end);
                            if (u < n.index + n[0].length) return null;
                            var c = o(e.slice(n.index + n[0].length, u));
                            if (null == c) return null;
                            t.push(a.render(c));
                            var s = e.slice(u + a.end.length);
                            if (s.length > 0) {
                                var l = o(s);
                                if (null == l) return null;
                                t.push.apply(t, Y(l))
                            }
                            return t
                        },
                        a = o(e(r));
                    return null == a ? null : a.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, x.jsx)(T.Fragment, {
                            children: e
                        }, t)
                    })
                },
                rt = window.Roblox["core-scripts"].environmentUrls,
                rn = n.n(rt);

            function rr() {
                return null != E || (E = "".concat(rn().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), E
            }
            var ri = function() {},
                ro = function(e, t) {
                    return e << 3 | t
                },
                ra = ro(1, 2),
                ru = ro(2, 2),
                rc = ro(5, 2),
                rs = ro(6, 2),
                rl = ro(8, 2),
                rf = ro(1, 2),
                rh = ro(2, 1),
                rd = ro(3, 0),
                rp = ro(5, 2);
            ro(1, 2), ro(2, 1), ro(3, 0), ro(4, 2), ro(5, 2), ro(6, 0), ro(8, 2);
            var rv = ro(4, 0),
                rg = ro(6, 2),
                rm = ro(7, 2);
            ro(1, 0), ro(2, 2);
            var ry = ro(1, 2),
                rb = ro(2, 2),
                r_ = ro(1, 2);
            ro(1, 2), ro(2, 2), ro(1, 2);
            var rw = new TextEncoder,
                rE = function() {
                    function e() {
                        W(this, e), C(this, "buf", [])
                    }
                    return Q(e, [{
                        key: "writeVarint",
                        value: function(e) {
                            var t = (void 0 === e ? "undefined" : (0, z._)(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                            this.buf.push(Number(t))
                        }
                    }, {
                        key: "writeString",
                        value: function(e) {
                            var t = rw.encode(e);
                            this.writeVarint(t.length);
                            var n = !0,
                                r = !1,
                                i = void 0;
                            try {
                                for (var o, a = t[Symbol.iterator](); !(n = (o = a.next()).done); n = !0) {
                                    var u = o.value;
                                    this.buf.push(u)
                                }
                            } catch (e) {
                                r = !0, i = e
                            } finally {
                                try {
                                    n || null == a.return || a.return()
                                } finally {
                                    if (r) throw i
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
                                for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) {
                                    var a = i.value;
                                    this.buf.push(a)
                                }
                            } catch (e) {
                                n = !0, r = e
                            } finally {
                                try {
                                    t || null == o.return || o.return()
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

            function rA(e, t, n) {
                var r = new rE;
                return r.writeVarint(ro(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
            }

            function rx(e) {
                var t = new rE;
                if (t.writeVarint(rf), t.writeString(e.name), t.writeVarint(rh), t.writeDouble(e.value), t.writeVarint(rd), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var n = function(e) {
                        var t = new rE,
                            n = !0,
                            r = !1,
                            i = void 0;
                        try {
                            for (var o, a = Object.entries(e)[Symbol.iterator](); !(n = (o = a.next()).done); n = !0) ! function() {
                                var e = H(o.value, 2),
                                    n = e[0],
                                    r = e[1];
                                if ("string" == typeof r) {
                                    var i = rA(n, ro(2, 2), function(e) {
                                        e.writeString(r)
                                    });
                                    t.writeVarint(rc), t.writeBytes(i)
                                } else if ("boolean" == typeof r) {
                                    var a = rA(n, ro(2, 0), function(e) {
                                        e.writeVarint(+!!r)
                                    });
                                    t.writeVarint(rs), t.writeBytes(a)
                                } else if ((void 0 === r ? "undefined" : (0, z._)(r)) === "bigint") {
                                    var u = rA(n, ro(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(ru), t.writeBytes(u)
                                } else if ("number" == typeof r)
                                    if (Number.isFinite(r))
                                        if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                            var c = rA(n, ro(2, 0), function(e) {
                                                e.writeVarint(r)
                                            });
                                            t.writeVarint(ra), t.writeBytes(c)
                                        } else if (Number.isInteger(r)) {
                                    var s = rA(n, ro(2, 0), function(e) {
                                        e.writeVarint(BigInt(r))
                                    });
                                    t.writeVarint(ru), t.writeBytes(s)
                                } else {
                                    var l = rA(n, ro(2, 1), function(e) {
                                        e.writeDouble(r)
                                    });
                                    t.writeVarint(rl), t.writeBytes(l)
                                } else {
                                    var f = rA(n, ro(2, 2), function(e) {
                                        e.writeString(String(r))
                                    });
                                    t.writeVarint(rc), t.writeBytes(f)
                                }
                            }()
                        } catch (e) {
                            r = !0, i = e
                        } finally {
                            try {
                                n || null == a.return || a.return()
                            } finally {
                                if (r) throw i
                            }
                        }
                        return t.toBytes()
                    }(e.attributes);
                    t.writeVarint(rp), t.writeBytes(n)
                }
                return t.toBytes()
            }

            function rS(e, t, n) {
                var r = new rE;
                r.writeVarint(rv), r.writeVarint(n);
                var i = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var u, c = e[Symbol.iterator](); !(i = (u = c.next()).done); i = !0) {
                        var s = u.value;
                        r.writeVarint(rg), r.writeBytes(s)
                    }
                } catch (e) {
                    o = !0, a = e
                } finally {
                    try {
                        i || null == c.return || c.return()
                    } finally {
                        if (o) throw a
                    }
                }
                var l = !0,
                    f = !1,
                    h = void 0;
                try {
                    for (var d, p = t[Symbol.iterator](); !(l = (d = p.next()).done); l = !0) {
                        var v = d.value;
                        r.writeVarint(rm), r.writeBytes(v)
                    }
                } catch (e) {
                    f = !0, h = e
                } finally {
                    try {
                        l || null == p.return || p.return()
                    } finally {
                        if (f) throw h
                    }
                }
                return r.toBytes()
            }

            function rB(e) {
                var t = new rE;
                t.writeVarint(ry), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(rb), t.writeBytes(e);
                var n = t.toBytes(),
                    r = new rE;
                return r.writeVarint(r_), r.writeBytes(n), r.toBytes()
            }
            var rT = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function rN(e) {
                return rT.test(e)
            }
            var rO = [],
                rI = !1,
                rk = !1;

            function rC(e, n) {
                var i, o, a = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    u = BigInt(Date.now());
                !0 === n || rk || "u" > typeof document && "hidden" === document.visibilityState ? (i = rB(rS(a.map(rx), [], u)).buffer, fetch("".concat(rr()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: i,
                    credentials: "include",
                    keepalive: !0
                }).catch(ri)) : (o = rB(rS(a.map(rx), [], u)), t(function() {
                    var e, t, n, i, a, u, c, s, l, f, h, d, p;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: o.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(o).catch(ri), t.close().catch(ri), n = [], [4, (i = e.readable.getReader()).read()];
                            case 1:
                                a = r.sent(), r.label = 2;
                            case 2:
                                if (a.done) return [3, 4];
                                return n.push(a.value), [4, i.read()];
                            case 3:
                                return a = r.sent(), [3, 2];
                            case 4:
                                u = new Uint8Array(n.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), c = 0, s = !0, l = !1, f = void 0;
                                try {
                                    for (h = n[Symbol.iterator](); !(s = (d = h.next()).done); s = !0) p = d.value, u.set(p, c), c += p.length
                                } catch (e) {
                                    l = !0, f = e
                                } finally {
                                    try {
                                        s || null == h.return || h.return()
                                    } finally {
                                        if (l) throw f
                                    }
                                }
                                return [2, {
                                    body: u.buffer,
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
                    return n && (r["Content-Encoding"] = "gzip"), fetch("".concat(rr()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: r,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(ri)
            }

            function rR() {
                var e = !0,
                    t = !1,
                    n = void 0;
                try {
                    for (var r, i = rO[Symbol.iterator](); !(e = (r = i.next()).done); e = !0) {
                        var o = r.value.splice(0);
                        0 !== o.length && rC(o, !0)
                    }
                } catch (e) {
                    t = !0, n = e
                } finally {
                    try {
                        e || null == i.return || i.return()
                    } finally {
                        if (t) throw n
                    }
                }
            }
            var rL = "WwwCommon",
                rM = function(e) {
                    var t = e.publish,
                        n = e.captureException,
                        r = e.featureName;

                    function i(e, t, i) {
                        if (null != i) {
                            var o = (0, V._)(i, Error) ? i.name || "Error" : "UnknownError",
                                a = r ? "".concat(r, "_").concat(e) : e;
                            return null == n || n(i, {
                                error_counter: a
                            }), D(R({}, t), {
                                errorType: o
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = H(n, 2);
                            t(i[0], i[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var o = H(n, 3),
                                a = o[0],
                                u = o[1],
                                c = o[2],
                                s = i(a, D(R({}, null != u ? u : {}), {
                                    severity: "error"
                                }), c);
                            t(a, s)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var o = H(n, 3),
                                a = o[0],
                                u = o[1],
                                c = o[2],
                                s = i(a, D(R({}, null != u ? u : {}), {
                                    severity: "critical"
                                }), c);
                            t(a, s)
                        }
                    }
                }({
                    publish: function(e) {
                        var t, n = Math.max(1, 10),
                            r = 250;

                        function i(e, t) {
                            console.error(e, t)
                        }
                        if (!rN(e)) return i('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                                name: e
                            }),
                            function() {};
                        var o = [];
                        return rO.push(o), rI || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                                "hidden" === document.visibilityState && rR()
                            }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                                rk = !0, rR()
                            }), rI = !0),
                            function(a, u, c) {
                                var s = "".concat(e, "_").concat(a);
                                if (! function(e, t) {
                                        if (!rN(e)) return !1;
                                        if (t) {
                                            var n = !0,
                                                r = !1,
                                                i = void 0;
                                            try {
                                                for (var o, a = Object.keys(t)[Symbol.iterator](); !(n = (o = a.next()).done); n = !0) {
                                                    var u = o.value;
                                                    if (!rN(u)) return !1
                                                }
                                            } catch (e) {
                                                r = !0, i = e
                                            } finally {
                                                try {
                                                    n || null == a.return || a.return()
                                                } finally {
                                                    if (r) throw i
                                                }
                                            }
                                        }
                                        return !0
                                    }(s, u)) return void i("@rbx/web-telemetry: invalid event name or attribute key", {
                                    name: a,
                                    attributes: u
                                });
                                var l = null != c ? c : 1;
                                if (!Number.isFinite(l)) return void i("@rbx/web-telemetry: value must be a finite number", {
                                    name: a,
                                    attributes: u
                                });
                                var f = u && Object.keys(u).length > 0 ? u : void 0;
                                o.push({
                                    name: s,
                                    attributes: f,
                                    value: l,
                                    timestampMs: BigInt(Date.now())
                                }), o.length >= n ? (void 0 !== t && (clearTimeout(t), t = void 0), rC(o.splice(0, n))) : void 0 === t && (t = setTimeout(function() {
                                    for (t = void 0; o.length > 0;) rC(o.splice(0, n))
                                }, r))
                            }
                    }(rL)
                });
            rM.trackCounter;
            var rj = rM.trackError;
            rM.trackCriticalError;
            var rP = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                rH = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                rD = function(e, t, n) {
                    var r;
                    "u" > typeof window && rj(e, {
                        key: n,
                        namespace: t,
                        internalPageName: null != (r = rP()) ? r : "unknown"
                    })
                },
                rU = function(e) {
                    var t, n, r, i, o, a, u, c, s, l, f, h, d, p = (t = e6(e), n = {
                        "!": eQ().messages
                    }, r = t ? "!.".concat(t) : "!", o = (i = eQ()).cache, a = i.formats, u = i.formatters, c = i.getMessageFallback, s = i.locale, l = i.onError, f = i.timeZone, h = n["!"], d = "!" === r ? void 0 : r.slice(2), f || e0 || !e1 || (e0 = !0, l(new eu(ec.ENVIRONMENT_FALLBACK, void 0))), (0, T.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, n) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var r = n ? eY(e, t, n) : t;
                                    if (!r) throw Error(n);
                                    return r
                                } catch (e) {
                                    return new eu(ec.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: o,
                                formatters: u,
                                getMessageFallback: c,
                                messages: h,
                                namespace: d,
                                onError: l,
                                formats: a,
                                locale: s,
                                timeZone: f
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    n = e.formats,
                                    r = e.formatters,
                                    i = e.getMessageFallback,
                                    o = void 0 === i ? eX : i,
                                    a = e.locale,
                                    u = e.messagesOrError,
                                    c = e.namespace,
                                    s = e.onError,
                                    l = e.timeZone,
                                    f = (0, V._)(u, eu);

                                function h(e, t, n, r) {
                                    var i = new eu(t, n);
                                    return s(i), null != r ? r : o({
                                        error: i,
                                        key: e,
                                        namespace: c
                                    })
                                }

                                function d(e, i, d, p) {
                                    var v, g, m;
                                    if (f) {
                                        if (!p) return s(u), o({
                                            error: u,
                                            key: e,
                                            namespace: c
                                        });
                                        v = p
                                    } else try {
                                        v = eY(a, u, e, c)
                                    } catch (t) {
                                        if (!p) return h(e, ec.MISSING_MESSAGE, t.message, p);
                                        v = p
                                    }
                                    try {
                                        var y, b = eZ(c, e);
                                        return eK(b, v, i ? (y = {}, Object.keys(i).forEach(function(e) {
                                            var t, n = 0,
                                                r = i[e];
                                            t = "function" == typeof r ? function(t) {
                                                var i = r(t);
                                                return (0, T.isValidElement)(i) ? (0, T.cloneElement)(i, {
                                                    key: e + n++
                                                }) : i
                                            } : r, y[e] = t
                                        }), y) : i, {
                                            cache: t,
                                            formatters: r,
                                            globalFormats: n,
                                            formats: d,
                                            locale: a,
                                            timeZone: l
                                        })
                                    } catch (t) {
                                        return (0, V._)(t, eu) ? (g = t.code, m = t.originalMessage) : (g = ec.FORMATTING_ERROR, m = t.message), h(e, g, m, p)
                                    }
                                }

                                function p(e, t, n, r) {
                                    var i = d(e, t, n, r);
                                    return "string" != typeof i ? h(e, ec.INVALID_MESSAGE, void 0) : i
                                }
                                return p.rich = d, p.markup = function(e, t, n, r) {
                                    return d(e, t, n, r)
                                }, p.raw = function(e) {
                                    if (f) return s(u), o({
                                        error: u,
                                        key: e,
                                        namespace: c
                                    });
                                    try {
                                        return eY(a, u, e, c)
                                    } catch (t) {
                                        return h(e, ec.MISSING_MESSAGE, t.message)
                                    }
                                }, p.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return eY(a, u, e, c), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, p
                            }(D(R({}, e), {
                                messagesOrError: t
                            }))
                    }, [o, u, c, h, d, l, a, s, f]));
                    return (0, T.useMemo)(function() {
                        return Object.assign(function(t, n, r) {
                            var i = e6(t);
                            return void 0 === r || p.has(i) ? p(i, n) : (rD("TranslationKeyNotFound", e, i), r)
                        }, {
                            rich: function(e, t) {
                                return p.rich(e6(e), t)
                            },
                            has: function(e) {
                                return rH(e) && p.has(e6(e))
                            },
                            dynamic: function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!rH(t)) return rD("TranslationKeyNotFound", e, String(t)), r;
                                var i = e6(t),
                                    o = p.has(i);
                                return o || rD("TranslationKeyNotFound", e, i), o ? p(i, n) : r
                            },
                            html: function(t, n, r) {
                                if (!rH(t)) return rD("TranslationKeyNotFound", e, String(t)), null;
                                var i = e6(t);
                                if (!p.has(i)) return rD("TranslationKeyNotFound", e, i), null;
                                var o = re(function(e) {
                                    return p(i, e)
                                }, n, r);
                                return null == o && rD("TranslationMalformed", e, i), o
                            }
                        })
                    }, [p, e])
                },
                rF = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                rz = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
                },
                rG = function(e) {
                    var t = rF(e);
                    return null == t ? null : rz(t)
                },
                rV = "blackbird",
                rW = function(e) {
                    var t, n, r, i, o = null != (t = e.userid) ? t : e.user,
                        a = null == o ? void 0 : null != (n = rG(o)) ? n : void 0;
                    if ("string" == typeof a) return {
                        isAuthenticated: !0,
                        id: a,
                        userName: null != (r = e.name) ? r : e.userName,
                        displayName: null != (i = e.displayname) ? i : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === rV || e.userMembership === rV ? rV : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                rK = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return rW(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                },
                rZ = "authButtonClick",
                rX = "authModalShown",
                rq = "authClientError",
                rY = "authOperationTiming",
                r$ = "accountSwitcherConfirmation",
                rJ = "accountSwitcherModal",
                rQ = "accountSwitcherLogin",
                r0 = "accountSwitcherBackendRequestFailure",
                r1 = "accountSwitcherLocalStorageFailure",
                r2 = "accountSwitcher",
                r3 = "dismiss",
                r5 = "switch",
                r8 = "addAccount",
                r6 = "primaryButton",
                r4 = "secondaryButton",
                r7 = "userInfoFetchFailed",
                r9 = "localStorageSetFailure",
                ie = "localStorageGetFailure",
                it = {
                    switchSuccess: "success",
                    invalidSession: "invalidSession",
                    requestFailed: "requestFailed",
                    switchError: "switchError"
                },
                ir = (0, T.createContext)(null),
                ii = function(e) {
                    var t = e.userId,
                        n = (0, T.useContext)(ir);
                    return n ? (0, x.jsx)(n, {
                        userId: t,
                        containerClass: "avatar-card-image"
                    }) : null
                },
                io = function(e) {
                    var t = e.userId,
                        n = e.displayName,
                        r = e.username,
                        i = e.onAccountSelection,
                        o = e.showIcon,
                        a = H((0, T.useState)(!1), 2),
                        u = a[0],
                        c = a[1],
                        s = function() {
                            if (!o && !u) {
                                c(!0);
                                try {
                                    i(t)
                                } catch (e) {
                                    c(!1)
                                }
                            }
                        };
                    return (0, x.jsxs)("div", {
                        className: o ? "active-account" : "account-selection",
                        role: "button",
                        tabIndex: 0,
                        onClick: s,
                        onKeyDown: s,
                        children: [(0, x.jsx)("div", {
                            className: "account-selection-thumbnail",
                            children: (0, x.jsx)(ii, {
                                userId: t
                            })
                        }), (0, x.jsxs)("div", {
                            className: "account-selection-name-container",
                            children: [(0, x.jsx)("p", {
                                className: "account-selection-displayname",
                                children: n || r
                            }), (0, x.jsx)("p", {
                                className: "account-selection-username",
                                children: r ? "@" + r : ""
                            })]
                        }), o && (0, x.jsx)("div", {
                            className: "accept-icon-image"
                        }), u && (0, x.jsx)("div", {
                            className: "spinner spinner-sm spinner-no-margin spinner-block"
                        })]
                    })
                },
                ia = "Action.AddAccount",
                iu = "Heading.SwitchAccount",
                ic = "unavailableError";
            rt.EnvironmentUrls.websiteUrl;
            var is = "RBXASBlob",
                il = "RBXASBlobSynced",
                ih = "Accounts.AccountSwitcher",
                id = "isFoundationAccountSwitcherListEnabled",
                ip = ((g = {})[g.AccountSwitcherModalType = 0] = "AccountSwitcherModalType", g[g.LogoutAllAccountsModalType = 1] = "LogoutAllAccountsModalType", g[g.LoginConfirmationForLogoutAllAccountsModalType = 2] = "LoginConfirmationForLogoutAllAccountsModalType", g[g.SignupConfirmationForLogoutAllAccountsModalType = 3] = "SignupConfirmationForLogoutAllAccountsModalType", g),
                iv = function(e) {
                    var t = e.handleAddAccount,
                        n = rU("Authentication.AccountSwitch"),
                        r = H((0, T.useState)(!1), 2),
                        i = r[0],
                        o = r[1];
                    return (0, x.jsxs)("div", {
                        className: "account-selection",
                        role: "button",
                        tabIndex: 0,
                        onClick: function() {
                            o(!0), t()
                        },
                        onKeyDown: function() {
                            o(!0), t()
                        },
                        children: [(0, x.jsx)("div", {
                            className: "account-switcher-icon-add",
                            children: (0, x.jsx)("span", {
                                className: "icon-plus"
                            })
                        }), (0, x.jsx)("div", {
                            className: "account-selection-name-container",
                            children: (0, x.jsx)("p", {
                                className: "account-selection-add-account",
                                children: n(ia)
                            })
                        }), i && (0, x.jsx)("div", {
                            className: "spinner spinner-sm spinner-block"
                        })]
                    })
                },
                ig = function(e) {
                    var t = e.users,
                        n = e.titleText,
                        r = e.helpText,
                        i = e.onAccountSelection,
                        o = e.handleAddAccount,
                        a = e.suppressAddAccountRow,
                        u = H((0, T.useState)(!1), 2),
                        c = u[0],
                        s = u[1],
                        l = function(e) {
                            if (!c) {
                                s(!0);
                                try {
                                    i(e)
                                } catch (e) {
                                    s(!1)
                                }
                            }
                        };
                    return (0, x.jsxs)("div", {
                        className: "section-content account-switcher-section",
                        children: [n && (0, x.jsx)("h1", {
                            className: "account-switcher-header",
                            children: n
                        }), r && (0, x.jsx)("h2", {
                            className: "account-switcher-help-text",
                            children: r
                        }), (0, x.jsxs)("ul", {
                            className: "account-switcher-list ",
                            children: [t.map(function(e) {
                                return (0, x.jsx)("li", {
                                    children: (0, x.jsx)("div", {
                                        className: "account-selection-list-item",
                                        role: "button",
                                        tabIndex: 0,
                                        children: (0, x.jsx)(io, {
                                            userId: e.id,
                                            username: e.name,
                                            displayName: e.displayName,
                                            onAccountSelection: l,
                                            showIcon: !1
                                        })
                                    })
                                }, e.id)
                            }), !(void 0 !== a && a) && (0, x.jsx)("li", {
                                className: "account-selection-list-item",
                                children: (0, x.jsx)(iv, {
                                    handleAddAccount: o
                                })
                            })]
                        })]
                    })
                },
                im = "opacity-[0.5]",
                iy = function(e) {
                    var t = e.width,
                        n = e.height;
                    return N().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, N().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                ib = Symbol.for("react.lazy"),
                i_ = T[" use ".trim().toString()];

            function iw(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : (0, z._)(e)) === "object" && "$$typeof" in e && e.$$typeof === ib && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : (0, z._)(t)) === "object" && null !== t && "then" in t
            }
            var iE = ((i = T.forwardRef(function(e, t) {
                    var n = e.children,
                        r = ef(e, ["children"]);
                    if (iw(n) && "function" == typeof i_ && (n = i_(n._payload)), T.isValidElement(n)) {
                        var i, o, a, u, c, s = (c = (u = null == (o = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : o.get) && "isReactWarning" in u && u.isReactWarning) ? i.ref : (c = (u = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            l = function(e, t) {
                                var n = R({}, t);
                                for (var r in t) ! function(r) {
                                    var i = e[r],
                                        o = t[r];
                                    /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = o.apply(void 0, Y(t));
                                        return i.apply(void 0, Y(t)), r
                                    } : i && (n[r] = i) : "style" === r ? n[r] = R({}, i, o) : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                                }(r);
                                return R({}, e, n)
                            }(r, n.props);
                        return n.type !== T.Fragment && (l.ref = t ? tf(t, s) : s), T.cloneElement(n, l)
                    }
                    return T.Children.count(n) > 1 ? T.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), m = i, (y = T.forwardRef(function(e, t) {
                    var n = e.children,
                        r = ef(e, ["children"]);
                    iw(n) && "function" == typeof i_ && (n = i_(n._payload));
                    var i = T.Children.toArray(n),
                        o = i.find(ix);
                    if (o) {
                        var a = o.props.children,
                            u = i.map(function(e) {
                                return e !== o ? e : T.Children.count(a) > 1 ? T.Children.only(null) : T.isValidElement(a) ? a.props.children : null
                            });
                        return (0, x.jsx)(m, D(R({}, r), {
                            ref: t,
                            children: T.isValidElement(a) ? T.cloneElement(a, void 0, u) : null
                        }))
                    }
                    return (0, x.jsx)(m, D(R({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), y),
                iA = Symbol("radix.slottable");

            function ix(e) {
                return T.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === iA
            }
            var iS = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                iB = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                iT = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                iN = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                iO = (0, T.forwardRef)(function(e, t) {
                    var n = ed([e, t]),
                        r = n[0],
                        i = n.slice(1),
                        o = r.children,
                        a = r.className,
                        u = r.style,
                        c = r.isDisabled,
                        s = void 0 !== c && c,
                        l = r.isLoading,
                        f = void 0 !== l && l,
                        h = r.icon,
                        d = r.size,
                        p = void 0 === d ? "Large" : d,
                        v = r.variant,
                        g = void 0 === v ? "Emphasis" : v,
                        m = r.asChild,
                        y = ef(r, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        b = H(i, 1)[0],
                        _ = tt("foundation-web-button", s ? im : [tn, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", iB[p], s ? iN[g] : iT[g], a),
                        w = R({
                            textDecoration: "none"
                        }, u),
                        E = function(e) {
                            return N().createElement(N().Fragment, null, N().createElement(tr, null), f && N().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, N().createElement(iy, {
                                width: iS[p],
                                height: iS[p]
                            })), N().createElement("span", {
                                className: tt("flex items-center min-width-0", "Large" === p || "Medium" === p ? "gap-small" : "gap-xsmall", f && "invisible")
                            }, h && N().createElement(to, {
                                name: h,
                                size: p
                            }), N().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (m) {
                        y.as;
                        var A = ef(y, ["as"]),
                            x = N().Children.only(o);
                        return N().createElement(iE, D(R({
                            ref: b
                        }, A), {
                            className: _,
                            style: w,
                            "aria-disabled": s || void 0
                        }), N().cloneElement(x, {}, E(x.props.children)))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var S = y.href,
                            B = ef(y, ["as", "href"]);
                        return N().createElement("a", D(R({
                            ref: b
                        }, B), {
                            "aria-disabled": s,
                            href: s ? void 0 : S,
                            className: _,
                            style: w
                        }), E(o))
                    }
                    y.as;
                    var T = ef(y, ["as"]);
                    return N().createElement("button", D(R({
                        ref: b,
                        type: "button"
                    }, T), {
                        disabled: s,
                        className: _,
                        style: w
                    }), E(o))
                }),
                iI = window.Roblox["core-scripts"].eventStream,
                ik = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    (0, iI.sendEventWithTarget)(rX, rJ, R({
                        field: r2,
                        state: e
                    }, t))
                },
                iC = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                    (0, iI.sendEventWithTarget)(rZ, rJ, R({
                        btn: r3
                    }, e))
                },
                iR = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    (0, iI.sendEventWithTarget)(rZ, e, R({
                        btn: r5,
                        state: t
                    }, n))
                },
                iL = function(e, t, n) {
                    var r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {};
                    (0, iI.sendEventWithTarget)(rY, e, R({
                        state: t,
                        elapsedTime: Math.round(n).toString()
                    }, r))
                },
                iM = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    (0, iI.sendEventWithTarget)(rq, e, R({
                        state: t
                    }, n))
                },
                ij = function(e) {
                    (0, iI.sendEventWithTarget)(rX, r$, {
                        state: e
                    })
                },
                iP = function(e, t) {
                    (0, iI.sendEventWithTarget)(rZ, r$, {
                        state: e,
                        btn: t
                    })
                },
                iH = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    (0, iI.sendEventWithTarget)(rZ, e, R({
                        btn: t
                    }, n))
                },
                iD = function(e) {
                    var t = e.origin,
                        n = e.localizedTitleText,
                        r = e.localizedBodyText,
                        i = e.primaryButtonCallback,
                        o = e.localizedPrimaryButtonText,
                        a = e.secondaryButtonCallback,
                        u = e.localizedSecondaryButtonText,
                        c = e.isTextLeftAligned;
                    (0, T.useEffect)(function() {
                        ij(t)
                    }, [t]);
                    var s = !!(o && i),
                        l = !!(u && a);
                    return (0, x.jsxs)(T.Fragment, {
                        children: [(0, x.jsxs)(n2, {
                            className: void 0 !== c && c ? "flex flex-col gap-xsmall" : "flex flex-col gap-xsmall text-align-x-center",
                            children: [(0, x.jsx)(n3, {
                                className: "text-heading-small content-emphasis",
                                children: n
                            }), (0, x.jsx)("p", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        }), (s || l) && (0, x.jsxs)(n5, {
                            className: "flex flex-col gap-small padding-top-medium",
                            children: [s && (0, x.jsx)(iO, {
                                id: "account-switch-primary-button",
                                variant: "Emphasis",
                                size: "Medium",
                                onClick: function() {
                                    iP(t, r6), i && i()
                                },
                                children: o
                            }), l && (0, x.jsx)(iO, {
                                id: "account-switch-secondary-button",
                                variant: "Standard",
                                size: "Medium",
                                onClick: function() {
                                    iP(t, r4), a && a()
                                },
                                children: u
                            })]
                        })]
                    })
                },
                iU = {
                    invalidSession: "Description.StaleSessionSignInAgain",
                    switchError: "Description.SomethingWentWrongSignInAgain",
                    requestFailed: "Description.SomethingWentWrongSignInAgain"
                },
                iF = function(e) {
                    var t = e.failure,
                        n = e.onClose,
                        r = e.onSignIn,
                        i = rU("Authentication.AccountSwitch");
                    return (0, x.jsx)(n0, {
                        open: null != t,
                        isModal: !0,
                        size: "Small",
                        type: "Default",
                        hasCloseAffordance: !1,
                        onOpenChange: function(e) {
                            e || n()
                        },
                        children: null != t && (0, x.jsx)(n1, {
                            children: (0, x.jsx)(iD, {
                                origin: ic,
                                isTextLeftAligned: !0,
                                localizedTitleText: i("Header.CantSwitchAccountsSentenceCase"),
                                localizedBodyText: i(iU[t.reason]),
                                localizedPrimaryButtonText: i("Action.SignIn"),
                                primaryButtonCallback: function() {
                                    n(), r()
                                }
                            })
                        })
                    })
                },
                iz = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                iG = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                iV = {
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
                iW = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                iK = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                iZ = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                iX = {
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
                iq = {
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
                iY = (0, T.forwardRef)(function(e, t) {
                    var n, r = ed([e, t]),
                        i = r[0],
                        o = r.slice(1),
                        a = i.className,
                        u = i.icon,
                        c = i.ariaLabel,
                        s = i.isDisabled,
                        l = void 0 !== s && s,
                        f = i.isCircular,
                        h = i.isSelected,
                        d = i.size,
                        p = void 0 === d ? "Large" : d,
                        v = i.variant,
                        g = void 0 === v ? "Emphasis" : v,
                        m = i.iconColor,
                        y = void 0 === m ? "Default" : m,
                        b = i.asChild,
                        _ = i.children,
                        w = ef(i, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        E = H(o, 1)[0];
                    n = l ? iK[g] : void 0 !== h && h ? iZ[g] : iW[g];
                    var A = tt("foundation-web-icon-button", l ? im : [tn, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", iz[p], iV[p][void 0 !== f && f ? "circular" : "square"], n, a),
                        x = N().createElement(N().Fragment, null, N().createElement(tr, null), N().createElement("span", {
                            className: tt("icon", u, iG[p], l ? iq[y][g] : iX[y][g])
                        }));
                    if (b) {
                        w.as;
                        var S = ef(w, ["as"]),
                            B = N().Children.only(_);
                        return N().createElement(iE, D(R({
                            ref: E
                        }, S), {
                            className: A,
                            "aria-label": c,
                            "aria-disabled": l || void 0
                        }), N().cloneElement(B, {}, x))
                    }
                    if ("a" === w.as) {
                        w.as;
                        var T = w.href,
                            O = ef(w, ["as", "href"]);
                        return N().createElement("a", D(R({
                            ref: E
                        }, O), {
                            "aria-label": c,
                            "aria-disabled": l,
                            href: l ? void 0 : T,
                            className: A
                        }), x)
                    }
                    w.as;
                    var I = ef(w, ["as"]);
                    return N().createElement("button", D(R({
                        ref: E,
                        type: "button"
                    }, I), {
                        "aria-label": c,
                        disabled: l,
                        className: A
                    }), x)
                }),
                i$ = function(e) {
                    var t = e.isActive,
                        n = e.user;
                    return (0, x.jsxs)(N().Fragment, {
                        children: [(0, x.jsx)("div", {
                            className: "account-selection-thumbnail",
                            children: (0, x.jsx)(ii, {
                                userId: n.id
                            })
                        }), (0, x.jsxs)("div", {
                            className: "account-selection-name-container",
                            children: [(0, x.jsx)("p", {
                                className: "account-selection-displayname",
                                children: n.displayName || n.name
                            }), (0, x.jsx)("p", {
                                className: "account-selection-username",
                                children: n.name ? "@" + n.name : ""
                            })]
                        }), void 0 !== t && t && (0, x.jsx)(to, {
                            className: "account-switcher-foundation-check content-system-success",
                            name: "icon-regular-circle-check",
                            size: "Medium"
                        })]
                    })
                },
                iJ = function(e) {
                    var t = e.isActive,
                        n = e.onAccountSelection,
                        r = e.user,
                        i = H((0, T.useState)(!1), 2),
                        o = i[0],
                        a = i[1];
                    return void 0 !== t && t ? (0, x.jsx)("li", {
                        className: "account-selection-list-item",
                        children: (0, x.jsx)("div", {
                            "aria-current": "true",
                            className: "active-account account-switcher-foundation-row",
                            "data-testid": "foundation-account-switcher-active-account-row",
                            children: (0, x.jsx)(i$, {
                                isActive: !0,
                                user: r
                            })
                        })
                    }) : (0, x.jsx)("li", {
                        className: "account-selection-list-item",
                        children: (0, x.jsxs)("button", {
                            className: "account-selection account-switcher-foundation-row",
                            "data-testid": "foundation-account-switcher-account-row",
                            onClick: function() {
                                if (!o) {
                                    a(!0);
                                    try {
                                        n(r.id)
                                    } catch (e) {
                                        a(!1)
                                    }
                                }
                            },
                            type: "button",
                            children: [(0, x.jsx)(i$, {
                                user: r
                            }), o && (0, x.jsx)("div", {
                                className: "spinner spinner-sm spinner-no-margin spinner-block"
                            })]
                        })
                    })
                },
                iQ = function(e) {
                    var t = e.handleAddAccount,
                        n = rU("Authentication.AccountSwitch"),
                        r = H((0, T.useState)(!1), 2),
                        i = r[0],
                        o = r[1];
                    return (0, x.jsx)("li", {
                        className: "account-selection-list-item",
                        children: (0, x.jsxs)("button", {
                            className: "account-selection account-switcher-foundation-row",
                            "data-testid": "foundation-account-switcher-add-account-row",
                            onClick: function() {
                                o(!0), t()
                            },
                            type: "button",
                            children: [(0, x.jsx)("div", {
                                className: "account-switcher-icon-add",
                                children: (0, x.jsx)("span", {
                                    className: "icon-plus"
                                })
                            }), (0, x.jsx)("div", {
                                className: "account-selection-name-container",
                                children: (0, x.jsx)("p", {
                                    className: "account-selection-add-account",
                                    children: n(ia)
                                })
                            }), i && (0, x.jsx)("div", {
                                className: "spinner spinner-sm spinner-block"
                            })]
                        })
                    })
                },
                i0 = function(e) {
                    var t = e.activeUser,
                        n = e.handleAddAccount,
                        r = e.isAccountLimitReached,
                        i = e.onAccountSelection,
                        o = e.suppressAddAccountRow,
                        a = e.users;
                    return (0, x.jsxs)("ul", {
                        className: "account-switcher-list account-switcher-foundation-list",
                        children: [t && (0, x.jsx)(iJ, {
                            isActive: !0,
                            onAccountSelection: i,
                            user: t
                        }, t.id), a.map(function(e) {
                            return (0, x.jsx)(iJ, {
                                onAccountSelection: i,
                                user: e
                            }, e.id)
                        }), !r && !(void 0 !== o && o) && (0, x.jsx)(iQ, {
                            handleAddAccount: n
                        })]
                    })
                },
                i1 = function(e) {
                    var t = e.users,
                        n = e.isAccountLimitReached,
                        r = e.onAccountSelection,
                        i = e.handleAddAccount,
                        o = e.suppressAddAccountRow,
                        a = void 0 !== o && o,
                        u = e.handleModalDismiss,
                        c = e.activeUser,
                        s = e.accountListVariant,
                        l = void 0 === s ? "legacy" : s,
                        f = e.isAccountListVariantResolved,
                        h = void 0 === f || f,
                        d = rU("Authentication.AccountSwitch"),
                        p = rU("CommonUI.Controls"),
                        v = H((0, T.useState)(!1), 2),
                        g = v[0],
                        m = v[1];
                    (0, T.useEffect)(function() {
                        !g && h && (ik(t.map(function(e) {
                            return e.id
                        }).join(","), {
                            accountSwitcherComponentVariant: l,
                            hasActiveAccount: +(null != c),
                            switchableAccountCount: t.length
                        }), m(!0))
                    }, [l, c, g, h, t]);
                    var y = "foundation" === l ? (0, x.jsx)(i0, {
                            activeUser: c,
                            handleAddAccount: i,
                            isAccountLimitReached: n,
                            onAccountSelection: r,
                            suppressAddAccountRow: a,
                            users: t
                        }) : (0, x.jsxs)("ul", {
                            className: "account-switcher-list ",
                            children: [c && (0, x.jsx)("li", {
                                className: "account-selection-list-item",
                                children: (0, x.jsx)(io, {
                                    userId: c.id,
                                    username: c.name,
                                    displayName: c.displayName,
                                    onAccountSelection: r,
                                    showIcon: !0
                                }, c.id)
                            }), t.map(function(e) {
                                return (0, x.jsx)("li", {
                                    className: "account-selection-list-item",
                                    children: (0, x.jsx)(io, {
                                        userId: e.id,
                                        username: e.name,
                                        displayName: e.displayName,
                                        onAccountSelection: r,
                                        showIcon: !1
                                    }, e.id)
                                }, e.id)
                            }), !n && !a && (0, x.jsx)("li", {
                                className: "account-selection-list-item",
                                children: (0, x.jsx)(iv, {
                                    handleAddAccount: i
                                })
                            })]
                        }),
                        b = (0, x.jsxs)("div", {
                            className: "foundation" === l ? "account-switcher-foundation-section modal-section" : "section-content modal-section",
                            children: [n && (0, x.jsx)("p", {
                                className: "account-switcher-help-text",
                                children: d("Description.AccountLimit")
                            }), y]
                        });
                    return "foundation" === l ? (0, x.jsxs)(T.Fragment, {
                        children: [(0, x.jsxs)("div", {
                            className: "account-switcher-foundation-header",
                            children: [(0, x.jsx)(iY, {
                                ariaLabel: p("Action.Close"),
                                className: "account-switcher-foundation-close",
                                icon: "icon-regular-x",
                                onClick: u,
                                size: "Large",
                                variant: "Utility"
                            }), (0, x.jsx)(n3, {
                                className: "account-switcher-foundation-title",
                                children: d(iu)
                            }), (0, x.jsx)("span", {
                                className: "account-switcher-foundation-header-spacer"
                            })]
                        }), (0, x.jsx)(n2, {
                            className: "account-switcher-foundation-body",
                            children: b
                        })]
                    }) : (0, x.jsxs)(T.Fragment, {
                        children: [(0, x.jsx)(n8.Modal.Header, {
                            className: "account-switcher-header",
                            title: d(iu),
                            onClose: u
                        }), (0, x.jsx)(n8.Modal.Body, {
                            children: b
                        })]
                    })
                },
                i2 = n(689),
                i3 = function() {
                    function e(t) {
                        W(this, e), C(this, "value", void 0), this.value = t
                    }
                    return Q(e, [{
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
                            return i8.fromResult(this.cast())
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
                i5 = function() {
                    function e(t) {
                        W(this, e), C(this, "error", void 0), this.error = t
                    }
                    return Q(e, [{
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
                            return i8.fromResult(this.cast())
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
                return -1 === t ? new i3(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var i8 = function() {
                    function e(t) {
                        W(this, e), C(this, "promise", void 0), this.promise = t
                    }
                    return Q(e, [{
                        key: "map",
                        value: function(n) {
                            return new e(this.promise.then(function(e) {
                                return t(function() {
                                    var t, i;
                                    return r(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return i = i3.bind, [4, n(e.value)];
                                            case 1:
                                                return t = new(i.apply(i3, [void 0, r.sent()])), [3, 3];
                                            case 2:
                                                t = e.cast(), r.label = 3;
                                            case 3:
                                                return [2, t]
                                        }
                                    })
                                })()
                            }))
                        }
                    }, {
                        key: "mapErr",
                        value: function(n) {
                            return new e(this.promise.then(function(e) {
                                return t(function() {
                                    var t, i;
                                    return r(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return i = i5.bind, [4, n(e.error)];
                                            case 1:
                                                return t = new(i.apply(i5, [void 0, r.sent()])), [3, 3];
                                            case 2:
                                                t = e.cast(), r.label = 3;
                                            case 3:
                                                return [2, t]
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
                                return (0, V._)(r, e) ? r.promise : r
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(n) {
                                if (n.isOk()) return n.cast();
                                var r = t(n.error);
                                return (0, V._)(r, e) ? r.promise : r
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
                                return new i3(e)
                            }).catch(function(e) {
                                return new i5(n(e))
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
                            return (0, V._)(t, e) ? t : (0, V._)(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                                return e.fromPromiseResult(t.apply(void 0, Y(r)))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(A.all))
                        }
                    }]), e
                }(),
                i6 = function(e) {
                    return new i3(e)
                },
                i4 = function(e) {
                    return new i5(e)
                },
                i7 = n(848),
                i9 = function(e) {
                    function t(e) {
                        var n;
                        return W(this, t), C(n = G(this, t, [e.error.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return X(t, e), t
                }($(Error)),
                oe = function(e) {
                    function t(e) {
                        var n;
                        return W(this, t), C(n = G(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return X(t, e), t
                }($(Error)),
                ot = function(e) {
                    var t;
                    try {
                        t = JSON.parse(e)
                    } catch (e) {
                        return i4(new i9({
                            code: "Syntax",
                            error: e
                        }))
                    }
                    if (null != t && (void 0 === t ? "undefined" : (0, z._)(t)) === "object") try {
                        (0, i7.scan)(t)
                    } catch (e) {
                        return i4(new i9({
                            code: "PrototypeProperty",
                            error: e
                        }))
                    }
                    return i6(t)
                },
                on = function(e, t) {
                    try {
                        return i6(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return i4(new oe(e))
                    }
                },
                or = function(e) {
                    try {
                        return null != localStorage.getItem(e)
                    } catch (e) {
                        return !1
                    }
                },
                oi = function(e) {
                    try {
                        localStorage.removeItem(e)
                    } catch (e) {}
                },
                oo = function(e) {
                    var t = null;
                    try {
                        t = localStorage.getItem(e)
                    } catch (e) {}
                    return null == t ? null : ot(t).getOrNull()
                },
                oa = function(e) {
                    function t(e) {
                        var n;
                        return W(this, t), C(n = G(this, t, [e.code, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return X(t, e), t
                }($(Error)),
                ou = function(e, t) {
                    var n = on(t);
                    if (n.isErr()) return i4(new oa({
                        code: "JsonSerialization",
                        error: n.error
                    }));
                    try {
                        return localStorage.setItem(e, n.value), i6(null)
                    } catch (e) {
                        return i4(new oa({
                            code: "Unknown",
                            error: e
                        }))
                    }
                },
                oc = 0,
                os = function(e) {
                    oc = Number.MAX_SAFE_INTEGER;
                    var t = oo("expiryList");
                    if (null != t && 0 !== t.version) return i4(new oa({
                        code: "PageRefreshNeeded"
                    }));
                    var n = Date.now(),
                        r = {},
                        i = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var u, c, s = Object.entries(null != (u = null == t ? void 0 : t.data) ? u : {})[Symbol.iterator](); !(i = (c = s.next()).done); i = !0) {
                            var l = H(c.value, 2),
                                f = l[0],
                                h = l[1];
                            if (f === (null == e ? void 0 : e.key)) {
                                var d = e.options.maxAge;
                                if (null != d) {
                                    var p = n + d;
                                    oc = Math.min(oc, p), r[f] = p
                                }
                            } else n >= h ? oi(f) : (oc = Math.min(oc, h), r[f] = h)
                        }
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            i || null == s.return || s.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return ou("expiryList", {
                        version: 0,
                        data: r
                    })
                },
                ol = function(e) {
                    return Date.now() >= oc && os(), oo(e)
                },
                of = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    return os({
                        key: e,
                        options: n
                    }).andThen(function() {
                        return ou(e, t)
                    })
                },
                oh = window.Roblox.ExperimentationService,
                od = n.n(oh),
                op = globalThis.window,
                ov = globalThis.document,
                og = void 0 === op ? void 0 : op,
                om = void 0 === ov ? void 0 : ov,
                oy = n(773),
                ob = function() {
                    if ("true" === oy.env.NEXT_PUBLIC_IS_NEXTJS) return !0;
                    var e, t = null == om ? void 0 : om.querySelector('meta[name="account-switching-data"]');
                    return "true" === (null != (e = null == t ? void 0 : t.dataset) ? e : {}).isAccountSwitchingEnabled
                },
                o_ = function() {
                    if (!ob()) return "";
                    try {
                        var e = ol(is);
                        if (null == e && or(is) && (null == og ? void 0 : og.localStorage.getItem(is)) !== "null") throw Error("Stored account switcher blob is not valid JSON");
                        return e
                    } catch (e) {
                        return console.warn(e), iM(r1, ie), ""
                    }
                },
                ow = function(e) {
                    if (ob()) try {
                        of(is, e).getOrThrow(), of(il, !0).getOrThrow()
                    } catch (e) {
                        console.warn(e), iM(r1, r9)
                    }
                },
                oE = window.Roblox["core-lib"].http.index,
                oA = window.Roblox["core-lib"].url.index,
                ox = function(e, n) {
                    return t(function() {
                        return r(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, oE.postUntyped(oA.Url.parse(rt.EnvironmentUrls.apiGatewayUrl).getOrThrow().withPath(e), n, {
                                        credentials: "include"
                                    })];
                                case 1:
                                    return [2, t.sent().getOrThrow()]
                            }
                        })
                    })()
                },
                oS = function(e) {
                    var t = e.errors;
                    return !!t && t.some(function(e) {
                        return 1 === e.code
                    })
                },
                oB = (0, i2.memoize)(function() {
                    return t(function() {
                        var e;
                        return r(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return t.trys.push([0, 2, , 3]), [4, null === od() || void 0 === od() ? void 0 : od().getAllValuesForLayer(ih)];
                                case 1:
                                    return [2, !!(null == (e = t.sent()) ? void 0 : e.isAccountSwitcherEnabled)];
                                case 2:
                                    return console.info("Failed to get experiment parameter values for Account Switching", t.sent()), [2, !1];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                }),
                oT = function() {
                    return t(function() {
                        var e, t;
                        return r(this, function(n) {
                            return !ob() || (null == (e = rK()) ? void 0 : e.isUnder13) ? [2, !1] : null !== (t = o_()) && "" !== t.trim() ? [2, !0] : null == e ? [2, !1] : [2, oB()]
                        })
                    })()
                },
                oN = function(e) {
                    var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                    return t(function() {
                        var i, o, a, u, c, s, l, f, h, d;
                        return r(this, function(p) {
                            switch (p.label) {
                                case 0:
                                    return a = [], u = -1, [4, oT()];
                                case 1:
                                    if (!p.sent()) return [2, {
                                        activeUser: o,
                                        usersAvailableForSwitching: a,
                                        isAccountLimitReached: !1,
                                        loggedOutUser: i
                                    }];
                                    return [4, t(function() {
                                        var t, n, i, o, a, u;
                                        return r(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    if (t = o_(), n = {}, i = !1, null == (o = rK()) && !t) return [2, [n, i]];
                                                    if (null == o ? void 0 : o.isUnder13) return [3, 4];
                                                    r.label = 1;
                                                case 1:
                                                    return r.trys.push([1, 3, , 4]), [4, ox("/account-switcher/v1/getLoggedInUsersMetadata", {
                                                        encrypted_users_data_blob: t,
                                                        remove_invalid_active_user: e
                                                    })];
                                                case 2:
                                                    return (n = r.sent()) && (ow(n.encrypted_users_data_blob), a = n.logged_in_users_metadata.length, n.active_user_id && null != o && n.active_user_id !== o.id && (a += 1), i = a >= 5), [3, 4];
                                                case 3:
                                                    throw console.warn("Parse user meta data failed!", u = r.sent()), u;
                                                case 4:
                                                    return [2, [n, i]]
                                            }
                                        })
                                    })()];
                                case 2:
                                    if (s = (c = H.apply(void 0, [p.sent(), 2]))[0], l = c[1], !s) return [3, 7];
                                    p.label = 3;
                                case 3:
                                    if (p.trys.push([3, 6, , 7]), f = [], s.removed_user_metadata && "" !== s.removed_user_metadata.user_id && (u = Number(s.removed_user_metadata.user_id), f.push(s.removed_user_metadata.user_id)), s.logged_in_users_metadata && s.logged_in_users_metadata.forEach(function(e) {
                                            f.push(e.user_id)
                                        }), h = [], !n) return [3, 5];
                                    return [4, t(function() {
                                        return r(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    var n;
                                                    return [4, (n = {
                                                        userIds: f
                                                    }, t(function() {
                                                        return r(this, function(e) {
                                                            switch (e.label) {
                                                                case 0:
                                                                    return [4, oE.postUntyped(oA.Url.parse(rt.EnvironmentUrls.usersApi).getOrThrow().withPath("/v1/users"), n, {
                                                                        credentials: "omit"
                                                                    })];
                                                                case 1:
                                                                    return [2, e.sent().getOrThrow()]
                                                            }
                                                        })
                                                    })())];
                                                case 1:
                                                    return [2, e.sent().data]
                                            }
                                        })
                                    })()];
                                case 4:
                                    (h = p.sent()) && ("" !== s.active_user_id && (o = h.find(function(e) {
                                        return e.id.toString() === s.active_user_id
                                    })), -1 !== u && (i = h.find(function(e) {
                                        return e.id === u
                                    })), a = h.filter(function(e) {
                                        return e.id !== u && e.id.toString() !== s.active_user_id
                                    })), p.label = 5;
                                case 5:
                                    return [3, 7];
                                case 6:
                                    throw console.warn("Getting user info failed!", d = p.sent()), iM(r0, r7), d;
                                case 7:
                                    return [2, {
                                        activeUser: o,
                                        usersAvailableForSwitching: a,
                                        isAccountLimitReached: l,
                                        loggedOutUser: i
                                    }]
                            }
                        })
                    })()
                },
                oO = function(e) {
                    return {
                        isEnrolled: id in e,
                        variant: !0 === e[id] ? "foundation" : "legacy"
                    }
                },
                oI = function() {
                    try {
                        var e;
                        null === od() || void 0 === od() || null == (e = od().logLayerExposure) || e.call(od(), ih)
                    } catch (e) {}
                },
                ok = function(e) {
                    if ("u" < typeof window) return !1;
                    var t, n, r, i = window.Roblox;
                    return null != (t = null == i || null == (r = i.AccountSwitcherService) || null == (n = r.renderBaseConfirmationModal) ? void 0 : n.call(r, e)) && t
                },
                oC = function(e) {
                    var n, i = e.modalType,
                        o = void 0 === i ? ip.AccountSwitcherModalType : i,
                        a = e.titleText,
                        u = e.helpText,
                        c = e.onAccountSwitched,
                        s = e.handleAddAccount,
                        l = e.suppressAddAccountRow,
                        f = void 0 !== l && l,
                        h = e.removeInvalidActiveUser,
                        d = void 0 !== h && h,
                        p = e.isModal,
                        v = e.loggedInUsers,
                        g = function() {
                            iH(W(), r8, K()), s()
                        },
                        m = rU("Authentication.AccountSwitch"),
                        y = rU("CommonUI.Controls"),
                        b = H((0, T.useState)(!!v), 2),
                        _ = b[0],
                        w = b[1],
                        E = H((0, T.useState)(o), 1)[0],
                        A = H((0, T.useState)("legacy"), 2),
                        S = A[0],
                        B = A[1],
                        O = H((0, T.useState)(!1), 2),
                        I = O[0],
                        k = O[1],
                        C = H((0, T.useState)(!1), 2),
                        R = C[0],
                        L = C[1],
                        M = (0, T.useRef)(!1),
                        j = (0, T.useRef)(!1),
                        P = H((0, T.useState)(null), 2),
                        D = P[0],
                        U = P[1],
                        F = H((0, T.useState)({
                            activeUser: {},
                            usersAvailableForSwitching: [],
                            isAccountLimitReached: !1
                        }), 2),
                        z = F[0],
                        G = F[1],
                        V = null != rK() && p,
                        W = function() {
                            return V ? rJ : rQ
                        },
                        K = function() {
                            return V ? {
                                accountSwitcherComponentVariant: S
                            } : {}
                        },
                        Z = function(e) {
                            return t(function() {
                                var n;
                                return r(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            if (j.current) return [2];
                                            j.current = !0, i.label = 1;
                                        case 1:
                                            var o, a;
                                            return i.trys.push([1, , 3, 4]), [4, (o = {
                                                id: e
                                            }, a = {
                                                context: W(),
                                                eventParams: K()
                                            }, t(function() {
                                                var e, t, n, i, u, c, s;
                                                return r(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            if (!(e = o_())) return [2, {
                                                                kind: "noBlob"
                                                            }];
                                                            t = Date.now(), iR(a.context, String(o.id), a.eventParams), r.label = 1;
                                                        case 1:
                                                            return r.trys.push([1, 3, , 4]), [4, ox("/account-switcher/v1/switch", {
                                                                switched_from_user_id: null == (i = rK()) ? void 0 : i.id,
                                                                switched_to_user_id: String(o.id),
                                                                encrypted_users_data_blob: e
                                                            })];
                                                        case 2:
                                                            return ow((u = r.sent()).encrypted_users_data_blob), n = oS(u) ? "invalidSession" : null != u.errors && u.errors.length > 0 ? "switchError" : "switched", [3, 4];
                                                        case 3:
                                                            return r.sent(), n = "requestFailed", [3, 4];
                                                        case 4:
                                                            if (c = Date.now() - t, s = function(e) {
                                                                    iL(a.context, e, c, a.eventParams)
                                                                }, "switched" === n) return s(it.switchSuccess), [2, {
                                                                kind: "switched"
                                                            }];
                                                            return s(n), [2, {
                                                                kind: "signInRequired",
                                                                failure: {
                                                                    reason: n
                                                                }
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            switch ((n = i.sent()).kind) {
                                                case "switched":
                                                    return c(e), [2];
                                                case "signInRequired":
                                                    return U(n.failure), [2];
                                                case "noBlob":
                                                    return [2];
                                                default:
                                                    return [2, n]
                                            }
                                        case 3:
                                            return j.current = !1, [7];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        X = function(e) {
                            G(e)
                        };
                    (0, T.useEffect)(function() {
                        t(function() {
                            var e, t, n;
                            return r(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        if (!v) return [3, 1];
                                        return X(v), [3, 5];
                                    case 1:
                                        return r.trys.push([1, 3, , 4]), [4, oN(d)];
                                    case 2:
                                        return e = r.sent(), [3, 4];
                                    case 3:
                                        return r.sent(), ok({
                                            containerId: "navigation-account-switcher-container",
                                            origin: ic,
                                            localizedTitleText: m("Header.AccountSwitchingUnavailable"),
                                            localizedBodyText: m("Description.AccountSwitchingNotWorking"),
                                            localizedPrimaryButtonText: y("Action.OK"),
                                            primaryButtonCallback: function() {}
                                        }), [2];
                                    case 4:
                                        t = e.activeUser, n = e.usersAvailableForSwitching, X({
                                            activeUser: t,
                                            usersAvailableForSwitching: n,
                                            isAccountLimitReached: e.isAccountLimitReached,
                                            loggedOutUser: e.loggedOutUser
                                        }), r.label = 5;
                                    case 5:
                                        return w(!0), [2]
                                }
                            })
                        })().catch()
                    }, [v, d]), (0, T.useEffect)(function() {
                        t(function() {
                            var e, n;
                            return r(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return [4, t(function() {
                                            var e, t;
                                            return r(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return n.trys.push([0, 2, 3, 4]), [4, Promise.race([null === od() || void 0 === od() ? void 0 : od().getAllValuesForLayer(ih), new Promise(function(t) {
                                                            e = setTimeout(function() {
                                                                return t(void 0)
                                                            }, 2e3)
                                                        })])];
                                                    case 1:
                                                        return [2, oO(null != (t = n.sent()) ? t : {})];
                                                    case 2:
                                                        return n.sent(), [2, oO({})];
                                                    case 3:
                                                        return void 0 !== e && clearTimeout(e), [7];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return n = (e = i.sent()).isEnrolled, B(e.variant), L(n), k(!0), [2]
                                }
                            })
                        })().catch(function() {
                            B("legacy"), L(!1), k(!0)
                        })
                    }, []), (0, T.useEffect)(function() {
                        !M.current && V && E === ip.AccountSwitcherModalType && _ && I && R && (M.current = !0, oI())
                    }, [E, R, I, _, V]);
                    var q = function() {
                        w(!1), iC(K())
                    };
                    return null != D ? (0, x.jsx)(iF, {
                        failure: D,
                        onClose: function() {
                            U(null), V && w(!1)
                        },
                        onSignIn: s
                    }) : V && E === ip.AccountSwitcherModalType && !I ? (0, x.jsx)(N().Fragment, {}) : V ? E === ip.AccountSwitcherModalType && "foundation" === S && I ? (0, x.jsx)(n0, {
                        open: _,
                        isModal: !0,
                        size: "Small",
                        type: "Default",
                        hasCloseAffordance: !1,
                        onOpenChange: function(e) {
                            e || q()
                        },
                        children: (0, x.jsx)(n1, {
                            className: "account-switcher-modal account-switcher-foundation-dialog",
                            children: (0, x.jsx)(i1, {
                                users: z.usersAvailableForSwitching,
                                isAccountLimitReached: z.isAccountLimitReached,
                                onAccountSelection: Z,
                                handleAddAccount: g,
                                suppressAddAccountRow: f,
                                handleModalDismiss: q,
                                activeUser: z.activeUser,
                                accountListVariant: S,
                                isAccountListVariantResolved: I
                            })
                        })
                    }) : (0, x.jsx)(n8.Modal, {
                        className: "account-switcher-modal",
                        show: _,
                        onHide: q,
                        size: "sm",
                        children: E === ip.AccountSwitcherModalType && (0, x.jsx)(i1, {
                            users: z.usersAvailableForSwitching,
                            isAccountLimitReached: z.isAccountLimitReached,
                            onAccountSelection: Z,
                            handleAddAccount: g,
                            suppressAddAccountRow: f,
                            handleModalDismiss: q,
                            activeUser: z.activeUser,
                            accountListVariant: S,
                            isAccountListVariantResolved: I
                        })
                    }) : (0, x.jsx)("div", {
                        className: "account-switcher-container",
                        children: (null == (n = z.usersAvailableForSwitching) ? void 0 : n.length) > 0 && (0, x.jsx)(ig, {
                            users: z.usersAvailableForSwitching,
                            titleText: a,
                            helpText: u,
                            onAccountSelection: Z,
                            handleAddAccount: g,
                            suppressAddAccountRow: f
                        })
                    })
                },
                oR = function(e) {
                    var t = e.AvatarHeadshot,
                        n = ef(e, ["AvatarHeadshot"]);
                    return (0, x.jsx)(ir.Provider, {
                        value: t,
                        children: (0, x.jsx)(oC, R({}, n))
                    })
                },
                oL = window.RobloxThumbnails,
                oM = function(e) {
                    var t = e.userId,
                        n = e.altName,
                        r = e.containerClass;
                    return (0, x.jsx)(oL.Thumbnail2d, {
                        containerClass: r,
                        type: oL.ThumbnailTypes.avatarHeadshot,
                        targetId: t,
                        size: oL.ThumbnailAvatarHeadshotSize.size60,
                        altName: n,
                        includeProfileFrame: !0
                    })
                },
                oj = function(e) {
                    var t = e.origin,
                        n = e.localizedTitleText,
                        r = e.localizedBodyText,
                        i = e.primaryButtonCallback,
                        o = e.localizedPrimaryButtonText,
                        a = e.secondaryButtonCallback,
                        u = e.localizedSecondaryButtonText,
                        c = e.isModalDismissable,
                        s = H((0, T.useState)(!0), 2),
                        l = s[0],
                        f = s[1],
                        h = function() {
                            c && f(!1)
                        };
                    return (0, x.jsx)(n0, {
                        open: l,
                        isModal: !0,
                        size: "Small",
                        type: "Default",
                        hasCloseAffordance: !1,
                        onOpenChange: function(e) {
                            e || h()
                        },
                        children: (0, x.jsx)(n1, {
                            children: (0, x.jsx)(iD, {
                                origin: t,
                                localizedTitleText: n,
                                localizedBodyText: r,
                                primaryButtonCallback: function() {
                                    i && i(), f(!1)
                                },
                                localizedPrimaryButtonText: o,
                                secondaryButtonCallback: function() {
                                    a && a(), f(!1)
                                },
                                localizedSecondaryButtonText: u
                            })
                        })
                    })
                },
                oP = JSON.parse('{"P":["Authentication.AccountSwitch","CommonUI.Controls"]}').P;
            Object.assign(B(), {
                AccountSwitcherService: {
                    isAccountSwitcherAvailable: oT,
                    renderAccountSwitcher: function(e) {
                        var n = e.containerId,
                            i = e.titleText,
                            o = e.helpText,
                            a = e.onAccountSwitched,
                            u = e.handleAddAccount,
                            c = e.suppressAddAccountRow,
                            s = e.removeInvalidActiveUser,
                            l = e.isModal,
                            f = void 0 === l || l,
                            h = e.loggedInUsers;
                        return t(function() {
                            var e;
                            return r(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = document.getElementById(n), [4, oT()];
                                    case 1:
                                        if (t.sent() && null != e) return (0, O.unmountComponentAtNode)(e), (0, k.renderWithErrorBoundary)((0, x.jsx)(te, {
                                            namespaces: oP,
                                            children: (0, x.jsx)(oR, {
                                                AvatarHeadshot: oM,
                                                titleText: i,
                                                helpText: o,
                                                onAccountSwitched: a,
                                                handleAddAccount: u,
                                                suppressAddAccountRow: c,
                                                removeInvalidActiveUser: s,
                                                isModal: f,
                                                loggedInUsers: h
                                            })
                                        }), e), [2, !0];
                                        return [2, !1]
                                }
                            })
                        })()
                    },
                    renderBaseConfirmationModal: function(e) {
                        var t = e.containerId,
                            n = e.origin,
                            r = e.localizedTitleText,
                            i = e.localizedBodyText,
                            o = e.primaryButtonCallback,
                            a = e.localizedPrimaryButtonText,
                            u = e.secondaryButtonCallback,
                            c = e.localizedSecondaryButtonText,
                            s = e.isModalDismissable,
                            l = document.getElementById(t);
                        return !!ob() && null != l && ((0, O.unmountComponentAtNode)(l), (0, k.renderWithErrorBoundary)((0, x.jsx)(oj, {
                            origin: n,
                            localizedTitleText: r,
                            localizedBodyText: i,
                            primaryButtonCallback: o,
                            localizedPrimaryButtonText: a,
                            secondaryButtonCallback: u,
                            localizedSecondaryButtonText: c,
                            isModalDismissable: void 0 === s || s
                        }), l), !0)
                    },
                    getStoredAccountSwitcherBlob: o_,
                    storeAccountSwitcherBlob: ow,
                    useIsAccountSwitcherAvailableForBrowser: function() {
                        var e = H((0, T.useState)(!1), 2),
                            t = e[0],
                            n = e[1],
                            r = H((0, T.useState)(!1), 2),
                            i = r[0],
                            o = r[1];
                        return (0, T.useEffect)(function() {
                            oT().then(function(e) {
                                n(e)
                            }).finally(function() {
                                o(!0)
                            })
                        }, []), [t, i]
                    },
                    parseLoggedInUsers: oN,
                    syncAccountSwitcherBlobIfNeeded: function() {
                        return t(function() {
                            var e;
                            return r(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        try {
                                            if (ol(il)) return [2]
                                        } catch (e) {
                                            return console.warn(e), iM(r1, ie), [2]
                                        }
                                        if (null === (e = o_()) || "" === e.trim()) return [3, 2];
                                        return [4, oN(!1, !1)];
                                    case 1:
                                        t.sent(), t.label = 2;
                                    case 2:
                                        return [2]
                                }
                            })
                        })()
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "AccountSwitcher");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/accountSwitcher-dedbcd48ec04093d.js.map