! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "4714915e0bdce0384a99615087df78cde4d2b364"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "31ff2ae0-5106-4c5e-ae36-47ef4f8b526f", e._sentryDebugIdIdentifier = "sentry-dbid-31ff2ae0-5106-4c5e-ae36-47ef4f8b526f")
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
                    var t = s(e),
                        n = t[0],
                        r = t[1];
                    return (n + r) * 3 / 4 - r
                }, t.toByteArray = function(e) {
                    var t, n, a = s(e),
                        o = a[0],
                        l = a[1],
                        u = new i((o + l) * 3 / 4 - l),
                        c = 0,
                        d = l > 0 ? o - 4 : o;
                    for (n = 0; n < d; n += 4) t = r[e.charCodeAt(n)] << 18 | r[e.charCodeAt(n + 1)] << 12 | r[e.charCodeAt(n + 2)] << 6 | r[e.charCodeAt(n + 3)], u[c++] = t >> 16 & 255, u[c++] = t >> 8 & 255, u[c++] = 255 & t;
                    return 2 === l && (t = r[e.charCodeAt(n)] << 2 | r[e.charCodeAt(n + 1)] >> 4, u[c++] = 255 & t), 1 === l && (t = r[e.charCodeAt(n)] << 10 | r[e.charCodeAt(n + 1)] << 4 | r[e.charCodeAt(n + 2)] >> 2, u[c++] = t >> 8 & 255, u[c++] = 255 & t), u
                }, t.fromByteArray = function(e) {
                    for (var t, r = e.length, i = r % 3, a = [], o = 0, l = r - i; o < l; o += 16383) a.push(function(e, t, r) {
                        for (var i, a = [], o = t; o < r; o += 3) i = (e[o] << 16 & 0xff0000) + (e[o + 1] << 8 & 65280) + (255 & e[o + 2]), a.push(n[i >> 18 & 63] + n[i >> 12 & 63] + n[i >> 6 & 63] + n[63 & i]);
                        return a.join("")
                    }(e, o, o + 16383 > l ? l : o + 16383));
                    return 1 === i ? a.push(n[(t = e[r - 1]) >> 2] + n[t << 4 & 63] + "==") : 2 === i && a.push(n[(t = (e[r - 2] << 8) + e[r - 1]) >> 10] + n[t >> 4 & 63] + n[t << 2 & 63] + "="), a.join("")
                };
                for (var n = [], r = [], i = "u" > typeof Uint8Array ? Uint8Array : Array, a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", o = 0, l = a.length; o < l; ++o) n[o] = a[o], r[a.charCodeAt(o)] = o;

                function s(e) {
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
                    a = n(742),
                    o = n(619),
                    l = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function s(e) {
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
                            a = t;
                        if (("string" != typeof a || "" === a) && (a = "utf8"), !u.isEncoding(a)) throw TypeError("Unknown encoding: " + a);
                        var o = 0 | v(r, a),
                            l = s(o),
                            c = l.write(r, a);
                        return c !== o && (l = l.slice(0, c)), l
                    }
                    if (ArrayBuffer.isView(e)) {
                        var d = e;
                        if (O(d, Uint8Array)) {
                            var f = new Uint8Array(d);
                            return p(f.buffer, f.byteOffset, f.byteLength)
                        }
                        return h(d)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : i._(e)));
                    if (O(e, ArrayBuffer) || e && O(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (O(e, SharedArrayBuffer) || e && O(e.buffer, SharedArrayBuffer))) return p(e, t, n);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var y = e.valueOf && e.valueOf();
                    if (null != y && y !== e) return u.from(y, t, n);
                    var g = function(e) {
                        if (u.isBuffer(e)) {
                            var t = 0 | m(e.length),
                                n = s(t);
                            return 0 === n.length || e.copy(n, 0, 0, t), n
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? s(0) : h(e) : "Buffer" === e.type && Array.isArray(e.data) ? h(e.data) : void 0
                    }(e);
                    if (g) return g;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return u.from(e[Symbol.toPrimitive]("string"), t, n);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : i._(e)))
                }

                function d(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return d(e), s(e < 0 ? 0 : 0 | m(e))
                }

                function h(e) {
                    for (var t = e.length < 0 ? 0 : 0 | m(e.length), n = s(t), r = 0; r < t; r += 1) n[r] = 255 & e[r];
                    return n
                }

                function p(e, t, n) {
                    var r;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (n || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(r = void 0 === t && void 0 === n ? new Uint8Array(e) : void 0 === n ? new Uint8Array(e, t) : new Uint8Array(e, t, n), u.prototype), r
                }

                function m(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function v(e, t) {
                    if (u.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || O(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + (void 0 === e ? "undefined" : i._(e)));
                    var n = e.length,
                        r = arguments.length > 2 && !0 === arguments[2];
                    if (!r && 0 === n) return 0;
                    for (var a = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return n;
                        case "utf8":
                        case "utf-8":
                            return T(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * n;
                        case "hex":
                            return n >>> 1;
                        case "base64":
                            return k(e).length;
                        default:
                            if (a) return r ? -1 : T(e).length;
                            t = ("" + t).toLowerCase(), a = !0
                    }
                }

                function y(e, t, n) {
                    var r, i, o, l = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === n || n > this.length) && (n = this.length), n <= 0 || (n >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, n) {
                                var r = e.length;
                                (!t || t < 0) && (t = 0), (!n || n < 0 || n > r) && (n = r);
                                for (var i = "", a = t; a < n; ++a) i += N[e[a]];
                                return i
                            }(this, t, n);
                        case "utf8":
                        case "utf-8":
                            return E(this, t, n);
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
                            return r = this, i = t, o = n, 0 === i && o === r.length ? a.fromByteArray(r) : a.fromByteArray(r.slice(i, o));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, n) {
                                for (var r = e.slice(t, n), i = "", a = 0; a < r.length - 1; a += 2) i += String.fromCharCode(r[a] + 256 * r[a + 1]);
                                return i
                            }(this, t, n);
                        default:
                            if (l) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), l = !0
                    }
                }

                function g(e, t, n) {
                    var r = e[t];
                    e[t] = e[n], e[n] = r
                }

                function b(e, t, n, r, i) {
                    var a;
                    if (0 === e.length) return -1;
                    if ("string" == typeof n ? (r = n, n = 0) : n > 0x7fffffff ? n = 0x7fffffff : n < -0x80000000 && (n = -0x80000000), (a = n *= 1) != a && (n = i ? 0 : e.length - 1), n < 0 && (n = e.length + n), n >= e.length)
                        if (i) return -1;
                        else n = e.length - 1;
                    else if (n < 0)
                        if (!i) return -1;
                        else n = 0;
                    if ("string" == typeof t && (t = u.from(t, r)), u.isBuffer(t)) return 0 === t.length ? -1 : w(e, t, n, r, i);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (i) return Uint8Array.prototype.indexOf.call(e, t, n);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, n);
                        return w(e, [t], n, r, i)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function w(e, t, n, r, i) {
                    var a, o = 1,
                        l = e.length,
                        s = t.length;
                    if (void 0 !== r && ("ucs2" === (r = String(r).toLowerCase()) || "ucs-2" === r || "utf16le" === r || "utf-16le" === r)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        o = 2, l /= 2, s /= 2, n /= 2
                    }

                    function u(e, t) {
                        return 1 === o ? e[t] : e.readUInt16BE(t * o)
                    }
                    if (i) {
                        var c = -1;
                        for (a = n; a < l; a++)
                            if (u(e, a) === u(t, -1 === c ? 0 : a - c)) {
                                if (-1 === c && (c = a), a - c + 1 === s) return c * o
                            } else - 1 !== c && (a -= a - c), c = -1
                    } else
                        for (n + s > l && (n = l - s), a = n; a >= 0; a--) {
                            for (var d = !0, f = 0; f < s; f++)
                                if (u(e, a + f) !== u(t, f)) {
                                    d = !1;
                                    break
                                } if (d) return a
                        }
                    return -1
                }

                function E(e, t, n) {
                    n = Math.min(e.length, n);
                    for (var r = [], i = t; i < n;) {
                        var a, o, l, s, u = e[i],
                            c = null,
                            d = u > 239 ? 4 : u > 223 ? 3 : u > 191 ? 2 : 1;
                        if (i + d <= n) switch (d) {
                            case 1:
                                u < 128 && (c = u);
                                break;
                            case 2:
                                (192 & (a = e[i + 1])) == 128 && (s = (31 & u) << 6 | 63 & a) > 127 && (c = s);
                                break;
                            case 3:
                                a = e[i + 1], o = e[i + 2], (192 & a) == 128 && (192 & o) == 128 && (s = (15 & u) << 12 | (63 & a) << 6 | 63 & o) > 2047 && (s < 55296 || s > 57343) && (c = s);
                                break;
                            case 4:
                                a = e[i + 1], o = e[i + 2], l = e[i + 3], (192 & a) == 128 && (192 & o) == 128 && (192 & l) == 128 && (s = (15 & u) << 18 | (63 & a) << 12 | (63 & o) << 6 | 63 & l) > 65535 && s < 1114112 && (c = s)
                        }
                        null === c ? (c = 65533, d = 1) : c > 65535 && (c -= 65536, r.push(c >>> 10 & 1023 | 55296), c = 56320 | 1023 & c), r.push(c), i += d
                    }
                    var f = r,
                        h = f.length;
                    if (h <= 4096) return String.fromCharCode.apply(String, f);
                    for (var p = "", m = 0; m < h;) p += String.fromCharCode.apply(String, f.slice(m, m += 4096));
                    return p
                }

                function P(e, t, n) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > n) throw RangeError("Trying to access beyond buffer length")
                }

                function I(e, t, n, r, i, a) {
                    if (!u.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > i || t < a) throw RangeError('"value" argument is out of bounds');
                    if (n + r > e.length) throw RangeError("Index out of range")
                }

                function S(e, t, n, r, i, a) {
                    if (n + r > e.length || n < 0) throw RangeError("Index out of range")
                }

                function x(e, t, n, r, i) {
                    return t *= 1, n >>>= 0, i || S(e, t, n, 4, 34028234663852886e22, -34028234663852886e22), o.write(e, t, n, r, 23, 4), n + 4
                }

                function A(e, t, n, r, i) {
                    return t *= 1, n >>>= 0, i || S(e, t, n, 8, 17976931348623157e292, -17976931348623157e292), o.write(e, t, n, r, 52, 8), n + 8
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
                    return (d(e), e <= 0) ? s(e) : void 0 !== t ? "string" == typeof n ? s(e).fill(t, n) : s(e).fill(t) : s(e)
                }, u.allocUnsafe = function(e) {
                    return f(e)
                }, u.allocUnsafeSlow = function(e) {
                    return f(e)
                }, u.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== u.prototype
                }, u.compare = function(e, t) {
                    if (O(e, Uint8Array) && (e = u.from(e, e.offset, e.byteLength)), O(t, Uint8Array) && (t = u.from(t, t.offset, t.byteLength)), !u.isBuffer(e) || !u.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var n = e.length, r = t.length, i = 0, a = Math.min(n, r); i < a; ++i)
                        if (e[i] !== t[i]) {
                            n = e[i], r = t[i];
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
                        i = 0;
                    for (n = 0; n < e.length; ++n) {
                        var a = e[n];
                        if (O(a, Uint8Array)) i + a.length > r.length ? u.from(a).copy(r, i) : Uint8Array.prototype.set.call(r, a, i);
                        else if (u.isBuffer(a)) a.copy(r, i);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        i += a.length
                    }
                    return r
                }, u.byteLength = v, u.prototype._isBuffer = !0, u.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) g(this, t, t + 1);
                    return this
                }, u.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) g(this, t, t + 3), g(this, t + 1, t + 2);
                    return this
                }, u.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) g(this, t, t + 7), g(this, t + 1, t + 6), g(this, t + 2, t + 5), g(this, t + 3, t + 4);
                    return this
                }, u.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? E(this, 0, e) : y.apply(this, arguments)
                }, u.prototype.toLocaleString = u.prototype.toString, u.prototype.equals = function(e) {
                    if (!u.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === u.compare(this, e)
                }, u.prototype.inspect = function() {
                    var e = "",
                        n = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, n).replace(/(.{2})/g, "$1 ").trim(), this.length > n && (e += " ... "), "<Buffer " + e + ">"
                }, l && (u.prototype[l] = u.prototype.inspect), u.prototype.compare = function(e, t, n, r, a) {
                    if (O(e, Uint8Array) && (e = u.from(e, e.offset, e.byteLength)), !u.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : i._(e)));
                    if (void 0 === t && (t = 0), void 0 === n && (n = e ? e.length : 0), void 0 === r && (r = 0), void 0 === a && (a = this.length), t < 0 || n > e.length || r < 0 || a > this.length) throw RangeError("out of range index");
                    if (r >= a && t >= n) return 0;
                    if (r >= a) return -1;
                    if (t >= n) return 1;
                    if (t >>>= 0, n >>>= 0, r >>>= 0, a >>>= 0, this === e) return 0;
                    for (var o = a - r, l = n - t, s = Math.min(o, l), c = this.slice(r, a), d = e.slice(t, n), f = 0; f < s; ++f)
                        if (c[f] !== d[f]) {
                            o = c[f], l = d[f];
                            break
                        } return o < l ? -1 : +(l < o)
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
                    var i, a, o, l, s, u, c, d, f = this.length - t;
                    if ((void 0 === n || n > f) && (n = f), e.length > 0 && (n < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    r || (r = "utf8");
                    for (var h = !1;;) switch (r) {
                        case "hex":
                            return function(e, t, n, r) {
                                n = Number(n) || 0;
                                var i = e.length - n;
                                r ? (r = Number(r)) > i && (r = i) : r = i;
                                var a = t.length;
                                r > a / 2 && (r = a / 2);
                                for (var o = 0; o < r; ++o) {
                                    var l, s = parseInt(t.substr(2 * o, 2), 16);
                                    if ((l = s) != l) break;
                                    e[n + o] = s
                                }
                                return o
                            }(this, e, t, n);
                        case "utf8":
                        case "utf-8":
                            return i = t, a = n, _(T(e, this.length - i), this, i, a);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return o = t, l = n, _(function(e) {
                                for (var t = [], n = 0; n < e.length; ++n) t.push(255 & e.charCodeAt(n));
                                return t
                            }(e), this, o, l);
                        case "base64":
                            return s = t, u = n, _(k(e), this, s, u);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return c = t, d = n, _(function(e, t) {
                                for (var n, r, i = [], a = 0; a < e.length && !((t -= 2) < 0); ++a) r = (n = e.charCodeAt(a)) >> 8, i.push(n % 256), i.push(r);
                                return i
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
                    e >>>= 0, t >>>= 0, n || P(e, t, this.length);
                    for (var r = this[e], i = 1, a = 0; ++a < t && (i *= 256);) r += this[e + a] * i;
                    return r
                }, u.prototype.readUintBE = u.prototype.readUIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || P(e, t, this.length);
                    for (var r = this[e + --t], i = 1; t > 0 && (i *= 256);) r += this[e + --t] * i;
                    return r
                }, u.prototype.readUint8 = u.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || P(e, 1, this.length), this[e]
                }, u.prototype.readUint16LE = u.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || P(e, 2, this.length), this[e] | this[e + 1] << 8
                }, u.prototype.readUint16BE = u.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || P(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, u.prototype.readUint32LE = u.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, u.prototype.readUint32BE = u.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, u.prototype.readIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || P(e, t, this.length);
                    for (var r = this[e], i = 1, a = 0; ++a < t && (i *= 256);) r += this[e + a] * i;
                    return r >= (i *= 128) && (r -= Math.pow(2, 8 * t)), r
                }, u.prototype.readIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || P(e, t, this.length);
                    for (var r = t, i = 1, a = this[e + --r]; r > 0 && (i *= 256);) a += this[e + --r] * i;
                    return a >= (i *= 128) && (a -= Math.pow(2, 8 * t)), a
                }, u.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || P(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, u.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || P(e, 2, this.length);
                    var n = this[e] | this[e + 1] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, u.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || P(e, 2, this.length);
                    var n = this[e + 1] | this[e] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, u.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, u.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, u.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), o.read(this, e, !0, 23, 4)
                }, u.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || P(e, 4, this.length), o.read(this, e, !1, 23, 4)
                }, u.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || P(e, 8, this.length), o.read(this, e, !0, 52, 8)
                }, u.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || P(e, 8, this.length), o.read(this, e, !1, 52, 8)
                }, u.prototype.writeUintLE = u.prototype.writeUIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n) - 1;
                        I(this, e, t, n, i, 0)
                    }
                    var a = 1,
                        o = 0;
                    for (this[t] = 255 & e; ++o < n && (a *= 256);) this[t + o] = e / a & 255;
                    return t + n
                }, u.prototype.writeUintBE = u.prototype.writeUIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n) - 1;
                        I(this, e, t, n, i, 0)
                    }
                    var a = n - 1,
                        o = 1;
                    for (this[t + a] = 255 & e; --a >= 0 && (o *= 256);) this[t + a] = e / o & 255;
                    return t + n
                }, u.prototype.writeUint8 = u.prototype.writeUInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, u.prototype.writeUint16LE = u.prototype.writeUInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, u.prototype.writeUint16BE = u.prototype.writeUInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, u.prototype.writeUint32LE = u.prototype.writeUInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, u.prototype.writeUint32BE = u.prototype.writeUInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, u.prototype.writeIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n - 1);
                        I(this, e, t, n, i - 1, -i)
                    }
                    var a = 0,
                        o = 1,
                        l = 0;
                    for (this[t] = 255 & e; ++a < n && (o *= 256);) e < 0 && 0 === l && 0 !== this[t + a - 1] && (l = 1), this[t + a] = (e / o | 0) - l & 255;
                    return t + n
                }, u.prototype.writeIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var i = Math.pow(2, 8 * n - 1);
                        I(this, e, t, n, i - 1, -i)
                    }
                    var a = n - 1,
                        o = 1,
                        l = 0;
                    for (this[t + a] = 255 & e; --a >= 0 && (o *= 256);) e < 0 && 0 === l && 0 !== this[t + a + 1] && (l = 1), this[t + a] = (e / o | 0) - l & 255;
                    return t + n
                }, u.prototype.writeInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, u.prototype.writeInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, u.prototype.writeInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, u.prototype.writeInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, u.prototype.writeInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || I(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, u.prototype.writeFloatLE = function(e, t, n) {
                    return x(this, e, t, !0, n)
                }, u.prototype.writeFloatBE = function(e, t, n) {
                    return x(this, e, t, !1, n)
                }, u.prototype.writeDoubleLE = function(e, t, n) {
                    return A(this, e, t, !0, n)
                }, u.prototype.writeDoubleBE = function(e, t, n) {
                    return A(this, e, t, !1, n)
                }, u.prototype.copy = function(e, t, n, r) {
                    if (!u.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (n || (n = 0), r || 0 === r || (r = this.length), t >= e.length && (t = e.length), t || (t = 0), r > 0 && r < n && (r = n), r === n || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (n < 0 || n >= this.length) throw RangeError("Index out of range");
                    if (r < 0) throw RangeError("sourceEnd out of bounds");
                    r > this.length && (r = this.length), e.length - t < r - n && (r = e.length - t + n);
                    var i = r - n;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, n, r) : Uint8Array.prototype.set.call(e, this.subarray(n, r), t), i
                }, u.prototype.fill = function(e, t, n, r) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (r = t, t = 0, n = this.length) : "string" == typeof n && (r = n, n = this.length), void 0 !== r && "string" != typeof r) throw TypeError("encoding must be a string");
                        if ("string" == typeof r && !u.isEncoding(r)) throw TypeError("Unknown encoding: " + r);
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
                        var o = u.isBuffer(e) ? e : u.from(e, r),
                            l = o.length;
                        if (0 === l) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (i = 0; i < n - t; ++i) this[i + t] = o[i % l]
                    }
                    return this
                };
                var C = /[^+/0-9A-Za-z-_]/g;

                function T(e, t) {
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

                function k(e) {
                    return a.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(C, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function _(e, t, n, r) {
                    for (var i = 0; i < r && !(i + n >= t.length) && !(i >= e.length); ++i) t[i + n] = e[i];
                    return i
                }

                function O(e, t) {
                    return r._(e, t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var N = function() {
                    for (var e = "0123456789abcdef", t = Array(256), n = 0; n < 16; ++n)
                        for (var r = 16 * n, i = 0; i < 16; ++i) t[r + i] = e[n] + e[i];
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
                        for (var e = "", a = 0; a < arguments.length; a++) {
                            var o = arguments[a];
                            o && (e = i(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : r._(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var a = "";
                                for (var o in e) t.call(e, o) && e[o] && (a = i(a, o));
                                return a
                            }(o)))
                        }
                        return e
                    }

                    function i(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === r._(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, n, r, i) {
                    var a, o, l = 8 * i - r - 1,
                        s = (1 << l) - 1,
                        u = s >> 1,
                        c = -7,
                        d = n ? i - 1 : 0,
                        f = n ? -1 : 1,
                        h = e[t + d];
                    for (d += f, a = h & (1 << -c) - 1, h >>= -c, c += l; c > 0; a = 256 * a + e[t + d], d += f, c -= 8);
                    for (o = a & (1 << -c) - 1, a >>= -c, c += r; c > 0; o = 256 * o + e[t + d], d += f, c -= 8);
                    if (0 === a) a = 1 - u;
                    else {
                        if (a === s) return o ? NaN : 1 / 0 * (h ? -1 : 1);
                        o += Math.pow(2, r), a -= u
                    }
                    return (h ? -1 : 1) * o * Math.pow(2, a - r)
                }, t.write = function(e, t, n, r, i, a) {
                    var o, l, s, u = 8 * a - i - 1,
                        c = (1 << u) - 1,
                        d = c >> 1,
                        f = 5960464477539062e-23 * (23 === i),
                        h = r ? 0 : a - 1,
                        p = r ? 1 : -1,
                        m = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (l = +!!isNaN(t), o = c) : (o = Math.floor(Math.log(t) / Math.LN2), t * (s = Math.pow(2, -o)) < 1 && (o--, s *= 2), o + d >= 1 ? t += f / s : t += f * Math.pow(2, 1 - d), t * s >= 2 && (o++, s /= 2), o + d >= c ? (l = 0, o = c) : o + d >= 1 ? (l = (t * s - 1) * Math.pow(2, i), o += d) : (l = t * Math.pow(2, d - 1) * Math.pow(2, i), o = 0)); i >= 8; e[n + h] = 255 & l, h += p, l /= 256, i -= 8);
                    for (o = o << i | l, u += i; u > 0; e[n + h] = 255 & o, h += p, o /= 256, u -= 8);
                    e[n + h - p] |= 128 * m
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
                                for (var t = e, n = a(t); n;) n = a(t = n.ownerDocument);
                                return t
                            }(window.document),
                            t = [],
                            n = null,
                            i = null;
                        l.prototype.THROTTLE_TIMEOUT = 100, l.prototype.POLL_INTERVAL = null, l.prototype.USE_MUTATION_OBSERVER = !0, l._setupCrossOriginUpdater = function() {
                            return n || (n = function(e, n) {
                                i = e && n ? h(e, n) : d(), t.forEach(function(e) {
                                    e._checkForIntersections()
                                })
                            }), n
                        }, l._resetCrossOriginUpdater = function() {
                            n = null, i = null
                        }, l.prototype.observe = function(e) {
                            if (!this._observationTargets.some(function(t) {
                                    return t.element == e
                                })) {
                                if (!(e && 1 == e.nodeType)) throw Error("target must be an Element");
                                this._registerInstance(), this._observationTargets.push({
                                    element: e,
                                    entry: null
                                }), this._monitorIntersections(e.ownerDocument), this._checkForIntersections()
                            }
                        }, l.prototype.unobserve = function(e) {
                            this._observationTargets = this._observationTargets.filter(function(t) {
                                return t.element != e
                            }), this._unmonitorIntersections(e.ownerDocument), 0 == this._observationTargets.length && this._unregisterInstance()
                        }, l.prototype.disconnect = function() {
                            this._observationTargets = [], this._unmonitorAllIntersections(), this._unregisterInstance()
                        }, l.prototype.takeRecords = function() {
                            var e = this._queuedEntries.slice();
                            return this._queuedEntries = [], e
                        }, l.prototype._initThresholds = function(e) {
                            var t = e || [0];
                            return Array.isArray(t) || (t = [t]), t.sort().filter(function(e, t, n) {
                                if ("number" != typeof e || isNaN(e) || e < 0 || e > 1) throw Error("threshold must be a number between 0 and 1 inclusively");
                                return e !== n[t - 1]
                            })
                        }, l.prototype._parseRootMargin = function(e) {
                            var t = (e || "0px").split(/\s+/).map(function(e) {
                                var t = /^(-?\d*\.?\d+)(px|%)$/.exec(e);
                                if (!t) throw Error("rootMargin must be specified in pixels or percent");
                                return {
                                    value: parseFloat(t[1]),
                                    unit: t[2]
                                }
                            });
                            return t[1] = t[1] || t[0], t[2] = t[2] || t[0], t[3] = t[3] || t[1], t
                        }, l.prototype._monitorIntersections = function(t) {
                            var n = t.defaultView;
                            if (n && -1 == this._monitoringDocuments.indexOf(t)) {
                                var r = this._checkForIntersections,
                                    i = null,
                                    o = null;
                                if (this.POLL_INTERVAL ? i = n.setInterval(r, this.POLL_INTERVAL) : (s(n, "resize", r, !0), s(t, "scroll", r, !0), this.USE_MUTATION_OBSERVER && "MutationObserver" in n && (o = new n.MutationObserver(r)).observe(t, {
                                        attributes: !0,
                                        childList: !0,
                                        characterData: !0,
                                        subtree: !0
                                    })), this._monitoringDocuments.push(t), this._monitoringUnsubscribes.push(function() {
                                        var e = t.defaultView;
                                        e && (i && e.clearInterval(i), u(e, "resize", r, !0)), u(t, "scroll", r, !0), o && o.disconnect()
                                    }), t != (this.root && (this.root.ownerDocument || this.root) || e)) {
                                    var l = a(t);
                                    l && this._monitorIntersections(l.ownerDocument)
                                }
                            }
                        }, l.prototype._unmonitorIntersections = function(t) {
                            var n = this._monitoringDocuments.indexOf(t);
                            if (-1 != n) {
                                var r = this.root && (this.root.ownerDocument || this.root) || e;
                                if (!this._observationTargets.some(function(e) {
                                        var n = e.element.ownerDocument;
                                        if (n == t) return !0;
                                        for (; n && n != r;) {
                                            var i = a(n);
                                            if ((n = i && i.ownerDocument) == t) return !0
                                        }
                                        return !1
                                    })) {
                                    var i = this._monitoringUnsubscribes[n];
                                    if (this._monitoringDocuments.splice(n, 1), this._monitoringUnsubscribes.splice(n, 1), i(), t != r) {
                                        var o = a(t);
                                        o && this._unmonitorIntersections(o.ownerDocument)
                                    }
                                }
                            }
                        }, l.prototype._unmonitorAllIntersections = function() {
                            var e = this._monitoringUnsubscribes.slice(0);
                            this._monitoringDocuments.length = 0, this._monitoringUnsubscribes.length = 0;
                            for (var t = 0; t < e.length; t++) e[t]()
                        }, l.prototype._checkForIntersections = function() {
                            if (this.root || !n || i) {
                                var e = this._rootIsInDom(),
                                    t = e ? this._getRootRect() : d();
                                this._observationTargets.forEach(function(r) {
                                    var i = r.element,
                                        a = c(i),
                                        l = this._rootContainsTarget(i),
                                        s = r.entry,
                                        u = e && l && this._computeTargetAndRootIntersection(i, a, t),
                                        f = null;
                                    this._rootContainsTarget(i) ? (!n || this.root) && (f = t) : f = d();
                                    var h = r.entry = new o({
                                        time: window.performance && performance.now && performance.now(),
                                        target: i,
                                        boundingClientRect: a,
                                        rootBounds: f,
                                        intersectionRect: u
                                    });
                                    s ? e && l ? this._hasCrossedThreshold(s, h) && this._queuedEntries.push(h) : s && s.isIntersecting && this._queuedEntries.push(h) : this._queuedEntries.push(h)
                                }, this), this._queuedEntries.length && this._callback(this.takeRecords(), this)
                            }
                        }, l.prototype._computeTargetAndRootIntersection = function(t, r, a) {
                            if ("none" != window.getComputedStyle(t).display) {
                                for (var o = r, l = m(t), s = !1; !s && l;) {
                                    var u = null,
                                        d = 1 == l.nodeType ? window.getComputedStyle(l) : {};
                                    if ("none" == d.display) return null;
                                    if (l == this.root || 9 == l.nodeType)
                                        if (s = !0, l == this.root || l == e) n && !this.root ? i && (0 != i.width || 0 != i.height) ? u = i : (l = null, u = null, o = null) : u = a;
                                        else {
                                            var f = m(l),
                                                p = f && c(f),
                                                v = f && this._computeTargetAndRootIntersection(f, p, a);
                                            p && v ? (l = f, u = h(p, v)) : (l = null, o = null)
                                        }
                                    else {
                                        var y = l.ownerDocument;
                                        l != y.body && l != y.documentElement && "visible" != d.overflow && (u = c(l))
                                    }
                                    if (u && (o = function(e, t) {
                                            var n = Math.max(e.top, t.top),
                                                r = Math.min(e.bottom, t.bottom),
                                                i = Math.max(e.left, t.left),
                                                a = Math.min(e.right, t.right),
                                                o = a - i,
                                                l = r - n;
                                            return o >= 0 && l >= 0 && {
                                                top: n,
                                                bottom: r,
                                                left: i,
                                                right: a,
                                                width: o,
                                                height: l
                                            } || null
                                        }(u, o)), !o) break;
                                    l = l && m(l)
                                }
                                return o
                            }
                        }, l.prototype._getRootRect = function() {
                            var t;
                            if (this.root && !v(this.root)) t = c(this.root);
                            else {
                                var n = v(this.root) ? this.root : e,
                                    r = n.documentElement,
                                    i = n.body;
                                t = {
                                    top: 0,
                                    left: 0,
                                    right: r.clientWidth || i.clientWidth,
                                    width: r.clientWidth || i.clientWidth,
                                    bottom: r.clientHeight || i.clientHeight,
                                    height: r.clientHeight || i.clientHeight
                                }
                            }
                            return this._expandRectByRootMargin(t)
                        }, l.prototype._expandRectByRootMargin = function(e) {
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
                        }, l.prototype._hasCrossedThreshold = function(e, t) {
                            var n = e && e.isIntersecting ? e.intersectionRatio || 0 : -1,
                                r = t.isIntersecting ? t.intersectionRatio || 0 : -1;
                            if (n !== r)
                                for (var i = 0; i < this.thresholds.length; i++) {
                                    var a = this.thresholds[i];
                                    if (a == n || a == r || a < n != a < r) return !0
                                }
                        }, l.prototype._rootIsInDom = function() {
                            return !this.root || p(e, this.root)
                        }, l.prototype._rootContainsTarget = function(t) {
                            var n = this.root && (this.root.ownerDocument || this.root) || e;
                            return p(n, t) && (!this.root || n == t.ownerDocument)
                        }, l.prototype._registerInstance = function() {
                            0 > t.indexOf(this) && t.push(this)
                        }, l.prototype._unregisterInstance = function() {
                            var e = t.indexOf(this); - 1 != e && t.splice(e, 1)
                        }, window.IntersectionObserver = l, window.IntersectionObserverEntry = o
                    }

                    function a(e) {
                        try {
                            return e.defaultView && e.defaultView.frameElement || null
                        } catch (e) {
                            return null
                        }
                    }

                    function o(e) {
                        this.time = e.time, this.target = e.target, this.rootBounds = f(e.rootBounds), this.boundingClientRect = f(e.boundingClientRect), this.intersectionRect = f(e.intersectionRect || d()), this.isIntersecting = !!e.intersectionRect;
                        var t = this.boundingClientRect,
                            n = t.width * t.height,
                            r = this.intersectionRect,
                            i = r.width * r.height;
                        n ? this.intersectionRatio = Number((i / n).toFixed(4)) : this.intersectionRatio = +!!this.isIntersecting
                    }

                    function l(e, t) {
                        var n, r, i, a = t || {};
                        if ("function" != typeof e) throw Error("callback must be a function");
                        if (a.root && 1 != a.root.nodeType && 9 != a.root.nodeType) throw Error("root must be a Document or Element");
                        this._checkForIntersections = (n = this._checkForIntersections.bind(this), r = this.THROTTLE_TIMEOUT, i = null, function() {
                            i || (i = setTimeout(function() {
                                n(), i = null
                            }, r))
                        }), this._callback = e, this._observationTargets = [], this._queuedEntries = [], this._rootMarginValues = this._parseRootMargin(a.rootMargin), this.thresholds = this._initThresholds(a.threshold), this.root = a.root || null, this.rootMargin = this._rootMarginValues.map(function(e) {
                            return e.value + e.unit
                        }).join(" "), this._monitoringDocuments = [], this._monitoringUnsubscribes = []
                    }

                    function s(e, t, n, r) {
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
                            n = m(n)
                        }
                        return !1
                    }

                    function m(t) {
                        var n = t.parentNode;
                        return 9 == t.nodeType && t != e ? a(t) : (n && n.assignedSlot && (n = n.assignedSlot.parentNode), n && 11 == n.nodeType && n.host) ? n.host : n
                    }

                    function v(e) {
                        return e && 9 === e.nodeType
                    }
                }()
            },
            977: function(e, t, n) {
                var r = n(844),
                    i = 0 / 0,
                    a = /^\s+|\s+$/g,
                    o = /^[-+]0x[0-9a-f]+$/i,
                    l = /^0b[01]+$/i,
                    s = /^0o[0-7]+$/i,
                    u = parseInt,
                    c = (void 0 === n.g ? "undefined" : r._(n.g)) == "object" && n.g && n.g.Object === Object && n.g,
                    d = ("u" < typeof self ? "undefined" : r._(self)) == "object" && self && self.Object === Object && self,
                    f = c || d || Function("return this")(),
                    h = Object.prototype.toString,
                    p = Math.max,
                    m = Math.min,
                    v = function() {
                        return f.Date.now()
                    };

                function y(e) {
                    var t = void 0 === e ? "undefined" : r._(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function g(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : r._(t)) == "symbol" || t && (void 0 === t ? "undefined" : r._(t)) == "object" && "[object Symbol]" == h.call(t)) return i;
                    if (y(e)) {
                        var t, n = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = y(n) ? n + "" : n
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(a, "");
                    var c = l.test(e);
                    return c || s.test(e) ? u(e.slice(2), c ? 2 : 8) : o.test(e) ? i : +e
                }
                e.exports = function(e, t, n) {
                    var r, i, a, o, l, s, u = 0,
                        c = !1,
                        d = !1,
                        f = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function h(t) {
                        var n = r,
                            a = i;
                        return r = i = void 0, u = t, o = e.apply(a, n)
                    }

                    function b(e) {
                        var n = e - s,
                            r = e - u;
                        return void 0 === s || n >= t || n < 0 || d && r >= a
                    }

                    function w() {
                        var e, n, r, i = v();
                        if (b(i)) return E(i);
                        l = setTimeout(w, (e = i - s, n = i - u, r = t - e, d ? m(r, a - n) : r))
                    }

                    function E(e) {
                        return (l = void 0, f && r) ? h(e) : (r = i = void 0, o)
                    }

                    function P() {
                        var e, n = v(),
                            a = b(n);
                        if (r = arguments, i = this, s = n, a) {
                            if (void 0 === l) return u = e = s, l = setTimeout(w, t), c ? h(e) : o;
                            if (d) return l = setTimeout(w, t), h(s)
                        }
                        return void 0 === l && (l = setTimeout(w, t)), o
                    }
                    return t = g(t) || 0, y(n) && (c = !!n.leading, a = (d = "maxWait" in n) ? p(g(n.maxWait) || 0, t) : a, f = "trailing" in n ? !!n.trailing : f), P.cancel = function() {
                        void 0 !== l && clearTimeout(l), u = 0, r = s = i = l = void 0
                    }, P.flush = function() {
                        return void 0 === l ? o : E(v())
                    }, P
                }
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var n, r, i, a = {
                        exports: {}
                    },
                    o = a.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function s() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    n = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    n = l
                }
                try {
                    r = "function" == typeof clearTimeout ? clearTimeout : s
                } catch (e) {
                    r = s
                }

                function u(e) {
                    if (n === setTimeout) return setTimeout(e, 0);
                    if ((n === l || !n) && setTimeout) return n = setTimeout, setTimeout(e, 0);
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
                var c = [],
                    d = !1,
                    f = -1;

                function h() {
                    d && i && (d = !1, i.length ? c = i.concat(c) : f = -1, c.length && p())
                }

                function p() {
                    if (!d) {
                        var e = u(h);
                        d = !0;
                        for (var t = c.length; t;) {
                            for (i = c, c = []; ++f < t;) i && i[f].run();
                            f = -1, t = c.length
                        }
                        i = null, d = !1,
                            function(e) {
                                if (r === clearTimeout) return clearTimeout(e);
                                if ((r === s || !r) && clearTimeout) return r = clearTimeout, clearTimeout(e);
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

                function m(e, t) {
                    this.fun = e, this.array = t
                }

                function v() {}

                function y() {}
                o.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var n = 1; n < arguments.length; n++) t[n - 1] = arguments[n];
                    c.push(new m(e, t)), 1 !== c.length || d || u(p)
                }, m.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, o.title = "browser", o.browser = !0, o.env = {}, o.argv = [], o.version = "", o.versions = {}, o.on = v, o.addListener = v, o.once = v, o.off = v, o.removeListener = v, o.removeAllListeners = v, o.emit = v, o.prependListener = v, o.prependOnceListener = v, o.listeners = function(e) {
                    return []
                }, o.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, o.cwd = function() {
                    return "/"
                }, o.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, o.umask = function() {
                    return 0
                };
                var g = a.exports.browser,
                    b = a.exports.binding,
                    w = {},
                    E = "browser",
                    P = "browser",
                    I = "browser",
                    S = [],
                    x = {
                        nextTick: a.exports.nextTick,
                        title: a.exports.title,
                        browser: g,
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
                        emitWarning: y,
                        prependListener: a.exports.prependListener,
                        prependOnceListener: a.exports.prependOnceListener,
                        listeners: a.exports.listeners,
                        binding: b,
                        cwd: a.exports.cwd,
                        chdir: a.exports.chdir,
                        umask: a.exports.umask,
                        exit: y,
                        pid: 1,
                        features: w,
                        kill: y,
                        dlopen: y,
                        uptime: y,
                        memoryUsage: y,
                        uvCounters: y,
                        platform: E,
                        arch: P,
                        execPath: I,
                        execArgv: S
                    };
                t.addListener = a.exports.addListener, t.arch = P, t.argv = a.exports.argv, t.binding = b, t.browser = g, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = x, t.dlopen = y, t.emit = a.exports.emit, t.emitWarning = y, t.env = a.exports.env, t.execArgv = S, t.execPath = I, t.exit = y, t.features = w, t.kill = y, t.listeners = a.exports.listeners, t.memoryUsage = y, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = E, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = y, t.uvCounters = y, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = x
            },
            848: function(e, t, n) {
                "use strict";
                var r = n(564).Buffer,
                    i = n(844),
                    a = void 0 !== r,
                    o = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    l = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function s(e, t, n) {
                    null == n && null !== t && (void 0 === t ? "undefined" : i._(t)) === "object" && (n = t, t = void 0), a && r.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var s = JSON.parse(e, t);
                    if (null === s || (void 0 === s ? "undefined" : i._(s)) !== "object") return s;
                    var c = n && n.protoAction || "error",
                        d = n && n.constructorAction || "error";
                    if ("ignore" === c && "ignore" === d) return s;
                    if ("ignore" !== c && "ignore" !== d) {
                        if (!1 === o.test(e) && !1 === l.test(e)) return s
                    } else if ("ignore" !== c && "ignore" === d) {
                        if (!1 === o.test(e)) return s
                    } else if (!1 === l.test(e)) return s;
                    return u(s, {
                        protoAction: c,
                        constructorAction: d,
                        safe: n && n.safe
                    })
                }

                function u(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = t.protoAction, r = void 0 === n ? "error" : n, a = t.constructorAction, o = void 0 === a ? "error" : a, l = t.safe, s = [e]; s.length;) {
                        var u = s;
                        s = [];
                        var c = !0,
                            d = !1,
                            f = void 0;
                        try {
                            for (var h, p = u[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                                var m = h.value;
                                if ("ignore" !== r && Object.prototype.hasOwnProperty.call(m, "__proto__")) {
                                    if (!0 === l) return null;
                                    if ("error" === r) throw SyntaxError("Object contains forbidden prototype property");
                                    delete m.__proto__
                                }
                                if ("ignore" !== o && Object.prototype.hasOwnProperty.call(m, "constructor") && null !== m.constructor && "object" === i._(m.constructor) && Object.prototype.hasOwnProperty.call(m.constructor, "prototype")) {
                                    if (!0 === l) return null;
                                    if ("error" === o) throw SyntaxError("Object contains forbidden prototype property");
                                    delete m.constructor
                                }
                                for (var v in m) {
                                    var y = m[v];
                                    y && (void 0 === y ? "undefined" : i._(y)) === "object" && s.push(y)
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
                        return s(e, t, n)
                    } finally {
                        Error.stackTraceLimit = r
                    }
                }
                e.exports = c, e.exports.default = c, e.exports.parse = c, e.exports.safeParse = function(e, t) {
                    var n = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return s(e, t, {
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
        var i = t[r];
        if (void 0 !== i) return i.exports;
        var a = t[r] = {
            exports: {}
        };
        return e[r](a, a.exports, n), a.exports
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
            var e, t, r, i, a, o, l, s, u, c, d, f, h, p, m, v, y, g, b, w, E, P, I, S, x, A, C, T, k, _, O, N, R, L, U, B, D, M, j, F, H, G, z, V, W, q, K, Z, Y, J, X, $, Q, ee, et, en, er, ei, ea, eo, el, es, eu, ec, ed, ef, eh, ep, em, ev, ey, eg, eb, ew, eE, eP, eI, eS, ex, eA, eC, eT, ek, e_, eO, eN, eR = window.jQuery,
                eL = n.n(eR),
                eU = window.Roblox;

            function eB(e, t, n, r, i, a, o) {
                try {
                    var l = e[a](o),
                        s = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(s) : Promise.resolve(s).then(r, i)
            }

            function eD(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var a = e.apply(t, n);

                        function o(e) {
                            eB(a, r, i, o, l, "next", e)
                        }

                        function l(e) {
                            eB(a, r, i, o, l, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function eM(e, t) {
                var n, r, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(o, "next", {
                    value: s(0)
                }), l(o, "throw", {
                    value: s(1)
                }), l(o, "return", {
                    value: s(2)
                }), "function" == typeof Symbol && l(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function s(l) {
                    return function(s) {
                        var u = [l, s];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                            if (n = 1, r && (i = 2 & u[0] ? r.return : u[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, u[1])).done) return i;
                            switch (r = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, r = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < i[1]) {
                                        a.label = i[1], i = u;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(u);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], r = 0
                        } finally {
                            n = i = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ej = window.React,
                eF = n.n(ej),
                eH = window.TanstackQuery;

            function eG(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ez(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        eG(e, t, n[t])
                    })
                }
                return e
            }
            var eV = window.Roblox["core-scripts"].environmentUrls,
                eW = n.n(eV),
                eq = window.Roblox["core-lib"].http.index,
                eK = window.Roblox["core-lib"].url.index,
                eZ = function() {
                    return eK.Url.parse(eW().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                eY = function(e, t, n) {
                    try {
                        eq.postUntyped(e().withSearchParams(ez({
                            name: t
                        }, n)), "", {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e4)
                        })
                    } catch (e) {}
                },
                eJ = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    t.forEach(function(e) {
                        eY(eZ, e)
                    })
                },
                eX = window.Roblox["core-scripts"].http.http,
                e$ = window.Roblox["core-scripts"].dataStore,
                eQ = n.n(e$),
                e0 = window.Roblox["core-scripts"].guac,
                e1 = eQ().gamesDataStore,
                e2 = function() {
                    return eD(function() {
                        return eM(this, function(e) {
                            return [2, (0, e0.callBehaviour)("play-button-ui")]
                        })
                    })()
                },
                e3 = function() {
                    var e = {
                        url: "".concat(eW().apiGatewayUrl, "/user-settings-api/v1/user-settings/settings-and-options"),
                        withCredentials: !0
                    };
                    return eX.get(e).then(function(e) {
                        return e.data
                    })
                },
                e5 = function(e) {
                    var t = {
                        url: "".concat(eW().apiGatewayUrl, "/experience-guidelines-api/experience-guidelines/get-age-recommendation"),
                        withCredentials: !0
                    };
                    return eX.post(t, {
                        universeId: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                e4 = function(e, t) {
                    var n = {
                        url: "".concat(eW().apiGatewayUrl, "/fiat-paid-access-service/v1/purchase"),
                        withCredentials: !0,
                        retryable: !0
                    };
                    return eX.post(n, {
                        rootPlaceId: e,
                        expectedBasePriceId: t
                    }).then(function(e) {
                        var t, n;
                        return null != (n = JSON.parse(null != (t = e.data.checkoutUrl) ? t : "").checkoutUrl) ? n : ""
                    })
                };

            function e6(e, t) {
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
            var e8 = {
                    UnplayableOtherReason: "UnplayableOtherReason",
                    Playable: "Playable",
                    GuestProhibited: "GuestProhibited",
                    GameUnapproved: "GameUnapproved",
                    IncorrectConfiguration: "IncorrectConfiguration",
                    UniverseRootPlaceIsPrivate: "UniverseRootPlaceIsPrivate",
                    InsufficientPermissionFriendsOnly: "InsufficientPermissionFriendsOnly",
                    InsufficientPermissionGroupOnly: "InsufficientPermissionGroupOnly",
                    InsufficientPermissionEditorsOnly: "InsufficientPermissionEditorsOnly",
                    InsufficientPermissionPlayTestersOnly: "InsufficientPermissionPlayTestersOnly",
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
                    ContextualPlayabilityGeneral: "ContextualPlayabilityGeneral",
                    ContextualPlayabilityAgeGatedByDescriptor: "ContextualPlayabilityAgeGatedByDescriptor",
                    ContextualPlayabilityExperienceBlockedParentalControls: "ContextualPlayabilityExperienceBlockedParentalControls",
                    ContextualPlayabilityRequireParentApproval: "ContextualPlayabilityRequireParentApproval",
                    ContextualPlayabilityCoreGated: "ContextualPlayabilityCoreGated",
                    ContextualPlayabilityAgeCheckRequired: "ContextualPlayabilityAgeCheckRequired",
                    ContextualPlayabilityPlaytestDisabled: "ContextualPlayabilityPlaytestDisabled",
                    ContextualPlayabilityTrustedFriendRequired: "ContextualPlayabilityTrustedFriendRequired",
                    FiatPurchaseDeviceRestricted: "FiatPurchaseDeviceRestricted"
                },
                e7 = (eG(eh = {}, e8.UnplayableOtherReason, "UnplayableError.UnplayableOther"), eG(eh, e8.TemporarilyUnavailable, "UnplayableError.TemporarilyUnavailable"), eG(eh, e8.GameUnapproved, "UnplayableError.GameUnapproved"), eG(eh, e8.IncorrectConfiguration, "UnplayableError.IncorrectConfiguration"), eG(eh, e8.UniverseRootPlaceIsPrivate, "UnplayableError.CreatorHasntMadeAvailable"), eG(eh, e8.InsufficientPermissionFriendsOnly, "UnplayableError.CreatorHasntMadeAvailable"), eG(eh, e8.InsufficientPermissionGroupOnly, "UnplayableError.CreatorHasntMadeAvailable"), eG(eh, e8.InsufficientPermissionEditorsOnly, "UnplayableError.UnplayableOther"), eG(eh, e8.InsufficientPermissionPlayTestersOnly, "UnplayableError.UnplayableOther"), eG(eh, e8.DeviceRestricted, "UnplayableError.DeviceRestrictedDefault"), eG(eh, e8.FiatPurchaseDeviceRestricted, "UnplayableError.FiatPurchaseDeviceRestricted"), eG(eh, e8.UnderReview, "UnplayableError.Moderated"), eG(eh, e8.AccountRestricted, "UnplayableError.AccountRestricted"), eG(eh, e8.ComplianceBlocked, "UnplayableError.ComplianceBlocked"), eG(eh, e8.ContextualPlayabilityRegionalAvailability, "UnplayableError.ContextualPlayabilityRegionalAvailability"), eG(eh, e8.ContextualPlayabilityRegionalCompliance, "UnplayableError.ContextualPlayabilityRegionalCompliance"), eG(eh, e8.ContextualPlayabilityAgeRecommendationParentalControls, "UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls"), eG(eh, e8.ContextualPlayabilityAgeGated, "UnplayableError.ContextualPlayabilityAgeGated"), eG(eh, e8.PlaceHasNoPublishedVersion, "UnplayableError.CreatorHasntMadeAvailable"), eG(eh, e8.ContextualPlayabilityUnrated, "UnplayableError.ContextualPlayabilityUnrated"), eG(eh, e8.ContextualPlayabilityGeneral, "UnplayableError.UnplayableOther"), eG(eh, e8.ContextualPlayabilityAgeGatedByDescriptor, "UnplayableError.ContextualPlayabilityAgeGatedByDescriptor"), eG(eh, e8.ContextualPlayabilityExperienceBlockedParentalControls, "UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls"), eG(eh, e8.ContextualPlayabilityRequireParentApproval, "UnplayableError.ContextualPlayabilityRequireParentApproval"), eh),
                e9 = "PlayButtonMessage.AgreeToNotice",
                te = {
                    Unlock: "PlayButtonText.Unlock",
                    Unplayable: "PlayButtonText.Unavailable",
                    Buy: "PlayButtonText.Buy",
                    PlayDemo: "PlayButtonText.PlayDemo",
                    PlayOnWeb: "PlayButtonText.PlayOnWeb",
                    PlayOnWebBetaNotice: "PlayButtonText.PlayOnWebBetaNotice",
                    Playtest: "PlayButtonText.Playtest"
                },
                tt = function(e, t) {
                    return {
                        eventName: "playGameClicked",
                        ctx: "click",
                        properties: e6(ez({}, t), {
                            placeId: e
                        }),
                        gamePlayIntentEventCtx: "PlayButton"
                    }
                },
                tn = {
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
                    PlayableUxTreatmentPlayabilityStatusStillLoading: "PlayableUxTreatmentPlayabilityStatusStillLoading",
                    MobileWebSignupLayerReadFailed: "MobileWebSignupLayerReadFailed",
                    MobileWebSignupExposureLogFailed: "MobileWebSignupExposureLogFailed"
                },
                tr = {
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
                ti = "gameJoinAgeCheckRequired",
                ta = "gameJoinContentMaturityLock",
                to = {
                    settingChange: "account_management/SettingsChange",
                    accountManagement: "account_management/AccountManagement"
                },
                tl = {
                    playabilityStatus: e8.TemporarilyUnavailable,
                    isPlayable: void 0,
                    unplayableDisplayText: void 0,
                    playableUxTreatment: void 0,
                    upsellUxTreatment: void 0,
                    demoModeAvailable: void 0,
                    privatePlaytestInfo: void 0
                },
                ts = function(e) {
                    var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                        n = (0, eH.useQuery)({
                            queryKey: ["playabilityStatus", e],
                            queryFn: function() {
                                return eD(function() {
                                    var t, n;
                                    return eM(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!e) throw eJ(tn.PlayabilityStatusFetchInvalidUniverseId), Error("Invalid universe ID for playability status fetch");
                                                r.label = 1;
                                            case 1:
                                                var i;
                                                return r.trys.push([1, 3, , 4]), [4, (i = [e], eD(function() {
                                                    var e;
                                                    return eM(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, e1.getPlayabilityStatus(i)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())];
                                            case 2:
                                                return n = r.sent(), [3, 4];
                                            case 3:
                                                throw r.sent(), eJ(tn.PlayabilityStatusFetchFailed), Error("Playability status fetch failed");
                                            case 4:
                                                if (!(null == n ? void 0 : n.playabilityStatus) || void 0 === n.isPlayable) throw eJ(tn.PlayabilityStatusFetchInvalidResponse), Error("Invalid playability status response");
                                                return [2, {
                                                    playabilityStatus: n.playabilityStatus,
                                                    isPlayable: n.isPlayable,
                                                    unplayableDisplayText: n.unplayableDisplayText,
                                                    playableUxTreatment: n.playableUxTreatment,
                                                    upsellUxTreatment: n.upsellUxTreatment,
                                                    demoModeAvailable: n.demoModeAvailable,
                                                    privatePlaytestInfo: null != (t = n.privatePlaytestInfo) ? t : void 0
                                                }]
                                        }
                                    })
                                })()
                            },
                            staleTime: 3e4,
                            enabled: t
                        }),
                        r = n.data,
                        i = n.isFetching,
                        a = n.isError,
                        o = n.refetch,
                        l = (0, ej.useCallback)(function() {
                            o()
                        }, [o]);
                    return (0, ej.useEffect)(function() {
                        var e = function(e) {
                            e.persisted && t && l()
                        };
                        return window.addEventListener("pageshow", e),
                            function() {
                                window.removeEventListener("pageshow", e)
                            }
                    }, [l, t]), (0, ej.useMemo)(function() {
                        return a ? {
                            playabilityStatus: tl.playabilityStatus,
                            isPlayable: tl.isPlayable,
                            unplayableDisplayText: tl.unplayableDisplayText,
                            playableUxTreatment: tl.playableUxTreatment,
                            upsellUxTreatment: tl.upsellUxTreatment,
                            demoModeAvailable: tl.demoModeAvailable,
                            privatePlaytestInfo: tl.privatePlaytestInfo,
                            isFetchingPlayability: i,
                            refetchPlayabilityData: l
                        } : {
                            playabilityStatus: null == r ? void 0 : r.playabilityStatus,
                            isPlayable: null == r ? void 0 : r.isPlayable,
                            unplayableDisplayText: null == r ? void 0 : r.unplayableDisplayText,
                            playableUxTreatment: null == r ? void 0 : r.playableUxTreatment,
                            upsellUxTreatment: null == r ? void 0 : r.upsellUxTreatment,
                            demoModeAvailable: null == r ? void 0 : r.demoModeAvailable,
                            privatePlaytestInfo: null == r ? void 0 : r.privatePlaytestInfo,
                            isFetchingPlayability: i,
                            refetchPlayabilityData: l
                        }
                    }, [r, a, i, l])
                };

            function tu(e, t) {
                if (null == e) return {};
                var n, r, i, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, n = Reflect.ownKeys(Object(e)); i < n.length; i++) r = n[i], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var n, r, i = {},
                            a = Object.getOwnPropertyNames(e);
                        for (r = 0; r < a.length; r++) n = a[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) r = n[i], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                return a
            }
            var tc = window.Roblox["core-scripts"].endpoints,
                td = window.Roblox["core-scripts"].game,
                tf = window.Roblox["core-scripts"].eventStream,
                th = window.Roblox["core-scripts"].util.url,
                tp = "function" == typeof crypto.randomUUID,
                tm = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                tv = function() {
                    return tp ? crypto.randomUUID() : tm()
                },
                ty = window.Roblox["core-scripts"].meta.device,
                tg = window.Roblox.NavigationService,
                tb = function(e, t, n) {
                    return new Promise(function(r) {
                        var i = new CustomEvent(e, {
                            cancelable: !0,
                            detail: t(r)
                        });
                        window.dispatchEvent(i) && r(n)
                    })
                },
                tw = function() {
                    return null
                };

            function tE(e) {
                if (Array.isArray(e)) return e
            }

            function tP() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tS(e, t) {
                if (e) {
                    if ("string" == typeof e) return tI(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tI(e, t)
                }
            }

            function tx(e, t) {
                return tE(e) || function(e, t) {
                    var n, r, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(o = (n = i.next()).done) && (a.push(n.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            l = !0, r = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (l) throw r
                            }
                        }
                        return a
                    }
                }(e, t) || tS(e, t) || tP()
            }
            var tA = globalThis.window,
                tC = globalThis.navigator,
                tT = void 0 === tA ? void 0 : tA,
                tk = null == tT || void 0 === tC ? void 0 : tC,
                t_ = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null == tk ? void 0 : tk.userAgent;
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

            function tO(e) {
                return (tO = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function tN() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (tN = function() {
                    return !!e
                })()
            }
            var tR = n(844);

            function tL(e, t, n) {
                t = tO(t);
                var r = tN() ? Reflect.construct(t, n || [], tO(e).constructor) : t.apply(e, n);
                if (r && ("object" === (0, tR._)(r) || "function" == typeof r)) return r;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }
            var tU = n(784);

            function tB(e, t) {
                if (!(0, tU._)(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function tD(e, t) {
                return (tD = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function tM(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && tD(e, t)
            }

            function tj(e, t, n) {
                return (tj = tN() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var i = new(Function.bind.apply(e, r));
                    return n && tD(i, n.prototype), i
                }).apply(null, arguments)
            }

            function tF(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (tF = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return tj(e, arguments, tO(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), tD(n, e)
                })(e)
            }

            function tH(e, t, n) {
                function r(n, r) {
                    var i, a;
                    for (var l in Object.defineProperty(n, "_zod", {
                            value: null != (i = n._zod) ? i : {},
                            enumerable: !1
                        }), null != (a = n._zod).traits || (a.traits = new Set), n._zod.traits.add(e), t(n, r), o.prototype) l in n || Object.defineProperty(n, l, {
                        value: o.prototype[l].bind(n)
                    });
                    n._zod.constr = o, n._zod.def = r
                }
                var i, a = function(e) {
                    function t() {
                        return tB(this, t), tL(this, t, arguments)
                    }
                    return tM(t, e), t
                }(null != (i = null == n ? void 0 : n.Parent) ? i : Object);

                function o(e) {
                    var t = (null == n ? void 0 : n.Parent) ? new a : this;
                    r(t, e), null != (u = t._zod).deferred || (u.deferred = []);
                    var i = !0,
                        o = !1,
                        l = void 0;
                    try {
                        for (var s, u, c, d = t._zod.deferred[Symbol.iterator](); !(i = (c = d.next()).done); i = !0)(0, c.value)()
                    } catch (e) {
                        o = !0, l = e
                    } finally {
                        try {
                            i || null == d.return || d.return()
                        } finally {
                            if (o) throw l
                        }
                    }
                    return t
                }
                return Object.defineProperty(a, "name", {
                    value: e
                }), Object.defineProperty(o, "init", {
                    value: r
                }), Object.defineProperty(o, Symbol.hasInstance, {
                    value: function(t) {
                        var r, i;
                        return !!((null == n ? void 0 : n.Parent) && (0, tU._)(t, n.Parent)) || (null == t || null == (i = t._zod) || null == (r = i.traits) ? void 0 : r.has(e))
                    }
                }), Object.defineProperty(o, "name", {
                    value: e
                }), o
            }
            Object.freeze({
                status: "aborted"
            }), Symbol("zod_brand");
            var tG = function(e) {
                function t() {
                    return tB(this, t), tL(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                }
                return tM(t, e), t
            }(tF(Error));
            tF(Error);
            var tz = {};

            function tV(e) {
                return e && Object.assign(tz, e), tz
            }

            function tW(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function tq(e) {
                return function(e) {
                    if (Array.isArray(e)) return tI(e)
                }(e) || tW(e) || tS(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tK(e, t) {
                return (void 0 === t ? "undefined" : (0, tR._)(t)) === "bigint" ? t.toString() : t
            }

            function tZ(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }

            function tY(e) {
                var t = +!!e.startsWith("^"),
                    n = e.endsWith("$") ? e.length - 1 : e.length;
                return e.slice(t, n)
            }
            var tJ = Symbol("evaluating");

            function tX(e, t, n) {
                var r = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (r !== tJ) return void 0 === r && (r = tJ, r = n()), r
                    },
                    set: function(n) {
                        Object.defineProperty(e, t, {
                            value: n
                        })
                    },
                    configurable: !0
                })
            }
            var t$ = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
            };

            function tQ(e) {
                return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
            }

            function t0(e) {
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
                return (delete e.message, "string" == typeof e.error) ? e6(ez({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function t1(e) {
                var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var r = n; r < e.issues.length; r++)
                    if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function t2(e, t) {
                return t.map(function(t) {
                    return null != t.path || (t.path = []), t.path.unshift(e), t
                })
            }

            function t3(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function t5(e, t, n) {
                var r, i, a, o, l, s, u, c, d, f, h, p = e6(ez({}, e), {
                    path: null != (r = e.path) ? r : []
                });
                return e.message || (p.message = null != (i = null != (a = null != (o = null != (l = t3(null == (c = e.inst) || null == (u = c._zod.def) || null == (s = u.error) ? void 0 : s.call(u, e))) ? l : t3(null == t || null == (d = t.error) ? void 0 : d.call(t, e))) ? o : t3(null == (f = n.customError) ? void 0 : f.call(n, e))) ? a : t3(null == (h = n.localeError) ? void 0 : h.call(n, e))) ? i : "Invalid input"), delete p.inst, delete p.continue, (null == t ? void 0 : t.reportInput) || delete p.input, p
            }
            tZ(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var t4 = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, tK, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                t6 = tH("$ZodError", t4),
                t8 = tH("$ZodError", t4, {
                    Parent: Error
                }),
                t7 = (e = t8, function(t, n, r, i) {
                    var a = r ? Object.assign(r, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        o = t._zod.run({
                            value: n,
                            issues: []
                        }, a);
                    if ((0, tU._)(o, Promise)) throw new tG;
                    if (o.issues.length) {
                        var l, s = new(null != (l = null == i ? void 0 : i.Err) ? l : e)(o.issues.map(function(e) {
                            return t5(e, a, tV())
                        }));
                        throw t$(s, null == i ? void 0 : i.callee), s
                    }
                    return o.value
                }),
                t9 = (t = t8, function(e, n, r, i) {
                    return eD(function() {
                        var a, o, l, s;
                        return eM(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    if (a = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, o = e._zod.run({
                                            value: n,
                                            issues: []
                                        }, a), !(0, tU._)(o, Promise)) return [3, 2];
                                    return [4, o];
                                case 1:
                                    o = u.sent(), u.label = 2;
                                case 2:
                                    if (o.issues.length) throw t$(s = new(null != (l = null == i ? void 0 : i.Err) ? l : t)(o.issues.map(function(e) {
                                        return t5(e, a, tV())
                                    })), null == i ? void 0 : i.callee), s;
                                    return [2, o.value]
                            }
                        })
                    })()
                }),
                ne = (r = t8, function(e, t, n) {
                    var i = n ? e6(ez({}, n), {
                            async: !1
                        }) : {
                            async: !1
                        },
                        a = e._zod.run({
                            value: t,
                            issues: []
                        }, i);
                    if ((0, tU._)(a, Promise)) throw new tG;
                    return a.issues.length ? {
                        success: !1,
                        error: new(null != r ? r : t6)(a.issues.map(function(e) {
                            return t5(e, i, tV())
                        }))
                    } : {
                        success: !0,
                        data: a.value
                    }
                }),
                nt = (i = t8, function(e, t, n) {
                    return eD(function() {
                        var r, a;
                        return eM(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (r = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, a = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, r), !(0, tU._)(a, Promise)) return [3, 2];
                                    return [4, a];
                                case 1:
                                    a = o.sent(), o.label = 2;
                                case 2:
                                    return [2, a.issues.length ? {
                                        success: !1,
                                        error: new i(a.issues.map(function(e) {
                                            return t5(e, r, tV())
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
            var nn = function(e) {
                    var t, n, r = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (n = null == e ? void 0 : e.maximum) ? n : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(r, "$"))
                },
                nr = {
                    major: 4,
                    minor: 1,
                    patch: 11
                },
                ni = tH("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = nr;
                    var n, r = tq(null != (l = e._zod.def.checks) ? l : []);
                    e._zod.traits.has("$ZodCheck") && r.unshift(e);
                    var i = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var l, s, u, c = r[Symbol.iterator](); !(i = (u = c.next()).done); i = !0) {
                            var d = u.value,
                                f = !0,
                                h = !1,
                                p = void 0;
                            try {
                                for (var m, v = d._zod.onattach[Symbol.iterator](); !(f = (m = v.next()).done); f = !0)(0, m.value)(e)
                            } catch (e) {
                                h = !0, p = e
                            } finally {
                                try {
                                    f || null == v.return || v.return()
                                } finally {
                                    if (h) throw p
                                }
                            }
                        }
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            i || null == c.return || c.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                    if (0 === r.length) null != (s = e._zod).deferred || (s.deferred = []), null == (n = e._zod.deferred) || n.push(function() {
                        e._zod.run = e._zod.parse
                    });
                    else {
                        var y = function(e, t, n) {
                                var r = t1(e),
                                    i = !0,
                                    a = !1,
                                    o = void 0;
                                try {
                                    for (var l, s, u = t[Symbol.iterator](); !(i = (s = u.next()).done); i = !0) ! function() {
                                        var t = s.value;
                                        if (t._zod.def.when) {
                                            if (!t._zod.def.when(e)) return
                                        } else if (r) return;
                                        var i = e.issues.length,
                                            a = t._zod.check(e);
                                        if ((0, tU._)(a, Promise) && (null == n ? void 0 : n.async) === !1) throw new tG;
                                        if (l || (0, tU._)(a, Promise)) l = (null != l ? l : Promise.resolve()).then(function() {
                                            return eD(function() {
                                                return eM(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, a];
                                                        case 1:
                                                            if (t.sent(), e.issues.length === i) return [2];
                                                            return r || (r = t1(e, i)), [2]
                                                    }
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === i) return;
                                            r || (r = t1(e, i))
                                        }
                                    }()
                                } catch (e) {
                                    a = !0, o = e
                                } finally {
                                    try {
                                        i || null == u.return || u.return()
                                    } finally {
                                        if (a) throw o
                                    }
                                }
                                return l ? l.then(function() {
                                    return e
                                }) : e
                            },
                            g = function(t, n, i) {
                                if (t1(t)) return t.aborted = !0, t;
                                var a = y(n, r, i);
                                if ((0, tU._)(a, Promise)) {
                                    if (!1 === i.async) throw new tG;
                                    return a.then(function(t) {
                                        return e._zod.parse(t, i)
                                    })
                                }
                                return e._zod.parse(a, i)
                            };
                        e._zod.run = function(t, n) {
                            if (n.skipChecks) return e._zod.parse(t, n);
                            if ("backward" === n.direction) {
                                var i = e._zod.parse({
                                    value: t.value,
                                    issues: []
                                }, e6(ez({}, n), {
                                    skipChecks: !0
                                }));
                                return (0, tU._)(i, Promise) ? i.then(function(e) {
                                    return g(e, t, n)
                                }) : g(i, t, n)
                            }
                            var a = e._zod.parse(t, n);
                            if ((0, tU._)(a, Promise)) {
                                if (!1 === n.async) throw new tG;
                                return a.then(function(e) {
                                    return y(e, r, n)
                                })
                            }
                            return y(a, r, n)
                        }
                    }
                    e["~standard"] = {
                        validate: function(t) {
                            try {
                                var n, r = ne(e, t);
                                return r.success ? {
                                    value: r.data
                                } : {
                                    issues: null == (n = r.error) ? void 0 : n.issues
                                }
                            } catch (n) {
                                return nt(e, t).then(function(e) {
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
                na = tH("$ZodString", function(e, t) {
                    var n, r, i;
                    ni.init(e, t), e._zod.pattern = null != (n = tq(null != (r = null == e || null == (i = e._zod.bag) ? void 0 : i.patterns) ? r : []).pop()) ? n : nn(e._zod.bag), e._zod.parse = function(n, r) {
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

            function no(e, t, n) {
                if (e.issues.length) {
                    var r;
                    (r = t.issues).push.apply(r, tq(t2(n, e.issues)))
                }
                t.value[n] = e.value
            }
            var nl = tH("$ZodArray", function(e, t) {
                ni.init(e, t), e._zod.parse = function(n, r) {
                    var i = function(e) {
                            var i = a[e],
                                l = t.element._zod.run({
                                    value: i,
                                    issues: []
                                }, r);
                            (0, tU._)(l, Promise) ? o.push(l.then(function(t) {
                                return no(t, n, e)
                            })): no(l, n, e)
                        },
                        a = n.value;
                    if (!Array.isArray(a)) return n.issues.push({
                        expected: "array",
                        code: "invalid_type",
                        input: a,
                        inst: e
                    }), n;
                    n.value = Array(a.length);
                    for (var o = [], l = 0; l < a.length; l++) i(l);
                    return o.length ? Promise.all(o).then(function() {
                        return n
                    }) : n
                }
            });

            function ns(e, t, n, r) {
                if (e.issues.length) {
                    var i;
                    (i = t.issues).push.apply(i, tq(t2(n, e.issues)))
                }
                void 0 === e.value ? n in r && (t.value[n] = void 0) : t.value[n] = e.value
            }
            var nu = tH("$ZodObject", function(e, t) {
                    ni.init(e, t);
                    var n, r = Object.getOwnPropertyDescriptor(t, "shape");
                    if (!(null == r ? void 0 : r.get)) {
                        var i = t.shape;
                        Object.defineProperty(t, "shape", {
                            get: function() {
                                var e = ez({}, i);
                                return Object.defineProperty(t, "shape", {
                                    value: e
                                }), e
                            }
                        })
                    }
                    var a = tZ(function() {
                        return function(e) {
                            var t, n = Object.keys(e.shape),
                                r = !0,
                                i = !1,
                                a = void 0;
                            try {
                                for (var o, l = n[Symbol.iterator](); !(r = (o = l.next()).done); r = !0) {
                                    var s, u, c, d, f = o.value;
                                    if (!(null == (d = e.shape) || null == (c = d[f]) || null == (u = c._zod) || null == (s = u.traits) ? void 0 : s.has("$ZodType"))) throw Error('Invalid element at key "'.concat(f, '": expected a Zod schema'))
                                }
                            } catch (e) {
                                i = !0, a = e
                            } finally {
                                try {
                                    r || null == l.return || l.return()
                                } finally {
                                    if (i) throw a
                                }
                            }
                            var h = Object.keys(t = e.shape).filter(function(e) {
                                return "optional" === t[e]._zod.optin && "optional" === t[e]._zod.optout
                            });
                            return e6(ez({}, e), {
                                keys: n,
                                keySet: new Set(n),
                                numKeys: n.length,
                                optionalKeys: new Set(h)
                            })
                        }(t)
                    });
                    tX(e._zod, "propValues", function() {
                        var e = t.shape,
                            n = {};
                        for (var r in e) {
                            var i = e[r]._zod;
                            if (i.values) {
                                null != n[r] || (n[r] = new Set);
                                var a = !0,
                                    o = !1,
                                    l = void 0;
                                try {
                                    for (var s, u, c = i.values[Symbol.iterator](); !(a = (u = c.next()).done); a = !0) {
                                        var d = u.value;
                                        n[r].add(d)
                                    }
                                } catch (e) {
                                    o = !0, l = e
                                } finally {
                                    try {
                                        a || null == c.return || c.return()
                                    } finally {
                                        if (o) throw l
                                    }
                                }
                            }
                        }
                        return n
                    });
                    var o = t.catchall;
                    e._zod.parse = function(t, r) {
                        null != n || (n = a.value);
                        var i = t.value;
                        if (!((void 0 === (f = i) ? "undefined" : (0, tR._)(f)) === "object" && null !== f && !Array.isArray(f))) return t.issues.push({
                            expected: "object",
                            code: "invalid_type",
                            input: i,
                            inst: e
                        }), t;
                        t.value = {};
                        var l = [],
                            s = n.shape,
                            u = !0,
                            c = !1,
                            d = void 0;
                        try {
                            for (var f, h, p = n.keys[Symbol.iterator](); !(u = (h = p.next()).done); u = !0) ! function() {
                                var e = h.value,
                                    n = s[e]._zod.run({
                                        value: i[e],
                                        issues: []
                                    }, r);
                                (0, tU._)(n, Promise) ? l.push(n.then(function(n) {
                                    return ns(n, t, e, i)
                                })): ns(n, t, e, i)
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
                        return o ? function(e, t, n, r, i, a) {
                            var o = [],
                                l = i.keySet,
                                s = i.catchall._zod,
                                u = s.def.type,
                                c = !0,
                                d = !1,
                                f = void 0;
                            try {
                                for (var h, p = Object.keys(t)[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) ! function() {
                                    var i = h.value;
                                    if (!l.has(i)) {
                                        if ("never" === u) return o.push(i);
                                        var a = s.run({
                                            value: t[i],
                                            issues: []
                                        }, r);
                                        (0, tU._)(a, Promise) ? e.push(a.then(function(e) {
                                            return ns(e, n, i, t)
                                        })): ns(a, n, i, t)
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
                            return (o.length && n.issues.push({
                                code: "unrecognized_keys",
                                keys: o,
                                input: t,
                                inst: a
                            }), e.length) ? Promise.all(e).then(function() {
                                return n
                            }) : n
                        }(l, i, t, r, a.value, e) : l.length ? Promise.all(l).then(function() {
                            return t
                        }) : t
                    }
                }),
                nc = tH("$ZodLiteral", function(e, t) {
                    if (ni.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
                    e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                        return "string" == typeof e ? tQ(e) : e ? tQ(e.toString()) : String(e)
                    }).join("|"), ")$")), e._zod.parse = function(n, r) {
                        var i = n.value;
                        return e._zod.values.has(i) || n.issues.push({
                            code: "invalid_value",
                            values: t.values,
                            input: i,
                            inst: e
                        }), n
                    }
                });

            function nd(e, t) {
                return e.issues.length && void 0 === t ? {
                    issues: [],
                    value: void 0
                } : e
            }
            var nf = tH("$ZodOptional", function(e, t) {
                    ni.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", tX(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tq(t.innerType._zod.values).concat([void 0])) : void 0
                    }), tX(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(tY(e.source), ")?$")) : void 0
                    }), e._zod.parse = function(e, n) {
                        if ("optional" === t.innerType._zod.optin) {
                            var r = t.innerType._zod.run(e, n);
                            return (0, tU._)(r, Promise) ? r.then(function(t) {
                                return nd(t, e.value)
                            }) : nd(r, e.value)
                        }
                        return void 0 === e.value ? e : t.innerType._zod.run(e, n)
                    }
                }),
                nh = tH("$ZodNullable", function(e, t) {
                    ni.init(e, t), tX(e._zod, "optin", function() {
                        return t.innerType._zod.optin
                    }), tX(e._zod, "optout", function() {
                        return t.innerType._zod.optout
                    }), tX(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(tY(e.source), "|null)$")) : void 0
                    }), tX(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tq(t.innerType._zod.values).concat([null])) : void 0
                    }), e._zod.parse = function(e, n) {
                        return null === e.value ? e : t.innerType._zod.run(e, n)
                    }
                });
            Symbol("ZodOutput"), Symbol("ZodInput");
            var np = tH("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    ni.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, n) {
                        return t7(e, t, n, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, n) {
                        return ne(e, t, n)
                    }, e.parseAsync = function(t, n) {
                        return eD(function() {
                            return eM(this, function(r) {
                                return [2, t9(e, t, n, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, n) {
                        return eD(function() {
                            return eM(this, function(r) {
                                return [2, nt(e, t, n)]
                            })
                        })()
                    }, e.check = function() {
                        for (var n, r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                        return e.clone(e6(ez({}, t), {
                            checks: tq(null != (n = t.checks) ? n : []).concat(tq(i.map(function(e) {
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
                nm = tH("ZodMiniString", function(e, t) {
                    na.init(e, t), np.init(e, t)
                });

            function nv(e) {
                return new nm(ez({
                    type: "string"
                }, t0(e)))
            }
            var ny = tH("ZodMiniArray", function(e, t) {
                    nl.init(e, t), np.init(e, t)
                }),
                ng = tH("ZodMiniObject", function(e, t) {
                    nu.init(e, t), np.init(e, t), tX(e, "shape", function() {
                        return t.shape
                    })
                });

            function nb(e, t) {
                return new ng(ez({
                    type: "object",
                    shape: null != e ? e : {}
                }, t0(t)))
            }
            var nw = tH("ZodMiniLiteral", function(e, t) {
                    nc.init(e, t), np.init(e, t)
                }),
                nE = tH("ZodMiniOptional", function(e, t) {
                    nf.init(e, t), np.init(e, t)
                }),
                nP = tH("ZodMiniNullable", function(e, t) {
                    nh.init(e, t), np.init(e, t)
                });

            function nI(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function nS(e, t, n) {
                return t && nI(e.prototype, t), n && nI(e, n), e
            }
            n(848);
            var nx = function() {
                    function e(t) {
                        tB(this, e), eG(this, "value", void 0), this.value = t
                    }
                    return nS(e, [{
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
                            return nC.fromResult(this.cast())
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
                nA = function() {
                    function e(t) {
                        tB(this, e), eG(this, "error", void 0), this.error = t
                    }
                    return nS(e, [{
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
                            return nC.fromResult(this.cast())
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
            (ep || (ep = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new nx(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var nC = function() {
                    function e(t) {
                        tB(this, e), eG(this, "promise", void 0), this.promise = t
                    }
                    return nS(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return eD(function() {
                                    var n, r;
                                    return eM(this, function(i) {
                                        switch (i.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return r = nx.bind, [4, t(e.value)];
                                            case 1:
                                                return n = new(r.apply(nx, [void 0, i.sent()])), [3, 3];
                                            case 2:
                                                n = e.cast(), i.label = 3;
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
                                return eD(function() {
                                    var n, r;
                                    return eM(this, function(i) {
                                        switch (i.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return r = nA.bind, [4, t(e.error)];
                                            case 1:
                                                return n = new(r.apply(nA, [void 0, i.sent()])), [3, 3];
                                            case 2:
                                                n = e.cast(), i.label = 3;
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
                                return (0, tU._)(r, e) ? r.promise : r
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(n) {
                                if (n.isOk()) return n.cast();
                                var r = t(n.error);
                                return (0, tU._)(r, e) ? r.promise : r
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
                                return new nx(e)
                            }).catch(function(e) {
                                return new nA(n(e))
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
                            return (0, tU._)(t, e) ? t : (0, tU._)(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                                return e.fromPromiseResult(t.apply(void 0, tq(r)))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(ep.all))
                        }
                    }]), e
                }(),
                nT = function(e) {
                    return new nx(e)
                },
                nk = function(e) {
                    return new nA(e)
                };
            tF(Error);
            var n_ = function(e) {
                    function t(e) {
                        var n;
                        return tB(this, t), eG(n = tL(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return tM(t, e), t
                }(tF(Error)),
                nO = function(e, t) {
                    try {
                        return nT(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return nk(new n_(e))
                    }
                },
                nN = function(e, t) {
                    return eK.Url.parse("".concat(e.replace(/\/+$/, "")).concat(t)).getOrThrow()
                },
                nR = nb({
                    status: nv()
                }),
                nL = ["Unknown", "BootstrapperInstalling", "AppStarted", "AcquiringGame", "JoiningGame", "InGame", "LeftGame"],
                nU = function() {
                    return eD(function() {
                        var e, t, n, r;
                        return eM(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return [4, eq.getUntyped(nN(eW().authApi, "/v1/client-assertion/"), {
                                        credentials: "include"
                                    })];
                                case 1:
                                    return t = i.sent(), [4, eq.fetch(nN(eW().authApi, "/v1/authentication-ticket/"), {
                                        method: "POST",
                                        credentials: "include",
                                        headers: {
                                            "content-type": "application/json"
                                        },
                                        body: nO(null != (e = t.isOk() ? t.value : null) ? e : {}).getOrThrow()
                                    })];
                                case 2:
                                    if ((n = i.sent()).isErr() || !(r = n.value.headers.get("rbx-authentication-ticket"))) return [2, void 0];
                                    return [2, r]
                            }
                        })
                    })()
                },
                nB = function(e) {
                    return "play" !== e
                },
                nD = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
                nM = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : eW().domain;
                    return nD.includes(t) ? "".concat(e, "-").concat(t.split(".")[0]) : e
                },
                nj = function(e, t, n) {
                    var r = ["1", "launchmode:".concat(e.launchMode)];
                    return t && r.push("gameinfo:".concat(encodeURIComponent(t))), r.push("launchtime:".concat(String(e.launchTime))), n && (null != n.userId && r.push("distributorType:Global", "userId:".concat(String(n.userId))), r.push("browser:".concat(n.browser))), Object.entries(e.otherParams).forEach(function(e) {
                        var t = tx(e, 2),
                            n = t[0],
                            i = t[1];
                        r.push(n === i ? n : "".concat(n, ":").concat(encodeURIComponent(String(i))))
                    }), "".concat(e.protocolName, ":").concat(r.join("+"))
                },
                nF = function() {
                    var e, t, n;
                    return null != tw() || null != (e = null == (n = window.Roblox) || null == (t = n.GameLauncher) ? void 0 : t.isJoinAttemptIdEnabled()) && e
                },
                nH = function(e, t, n, r) {
                    var i = n.eventName,
                        a = n.ctx,
                        o = n.gamePlayIntentEventCtx,
                        l = n.properties,
                        s = t.rootPlaceId,
                        u = t.placeId,
                        c = t.gameInstanceId,
                        d = t.playerId,
                        f = t.joinData,
                        h = t.privateServerLinkCode,
                        p = t.referredByPlayerId,
                        m = t.isEarlyTesting;
                    if (null != u) {
                        var v = tv(),
                            y = function(e) {
                                return ez(e6(ez({}, e), {
                                    joinAttemptId: null != v ? v : tv()
                                }), o ? {
                                    joinAttemptOrigin: o
                                } : {})
                            },
                            g = function(e) {
                                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                (0, tf.sendEventWithTarget)(i, a, ez(e6(ez({}, l), {
                                    joinAttemptId: v
                                }), t, null == r ? {} : {
                                    actionType: r
                                })), (0, tf.sendGamePlayEvent)(o, e, void 0, v, r)
                            };
                        return u === s && c ? (g(s, {
                            gameInstanceId: c
                        }), e.joinGameInstance(y({
                            placeId: u,
                            gameId: c,
                            isPlayTogetherGame: !0,
                            referredByPlayerId: p
                        }))) : s && d ? (g(s, {
                            playerId: d
                        }), e.followPlayerIntoGame(y({
                            userId: d
                        }))) : h ? (g(u), e.joinPrivateGame(y({
                            placeId: u,
                            linkCode: h
                        }))) : (g(u), e.joinMultiplayerGame(y({
                            placeId: u,
                            isPlayTogetherGame: !1,
                            launchData: null == f ? void 0 : f.launchData,
                            eventId: null == f ? void 0 : f.eventId,
                            referredByPlayerId: p,
                            isEarlyTesting: !0 === m ? "true" : void 0
                        })))
                    }
                },
                nG = function(e, t, n) {
                    var r = tw();
                    null == r ? (0, td.launchGame)(e, t, n) : nH(r, e, t, n)
                },
                nz = function(e) {
                    var t = e.featureName,
                        n = e.redirectLink,
                        r = e.ampFeatureCheckData,
                        i = void 0 === r ? [] : r,
                        a = e.isAsyncCall,
                        o = void 0 === a || a,
                        l = e.usePrologue,
                        s = void 0 !== l && l,
                        u = e.ampRecourseData,
                        c = void 0 === u ? null : u,
                        d = e.featureSpecificData,
                        f = e.namespace,
                        h = e.wizardIntent;
                    return tb("StartAccessManagementUpsell", function(e) {
                        return {
                            featureName: t,
                            redirectLink: null != n ? n : null,
                            ampFeatureCheckData: i,
                            isAsyncCall: o,
                            usePrologue: s,
                            ampRecourseData: c,
                            featureSpecificData: null != d ? d : null,
                            namespace: null != f ? f : null,
                            wizardIntent: null != h ? h : null,
                            closeCallback: function(t) {
                                e("Granted" === t)
                            }
                        }
                    }, !1)
                },
                nV = "true" === n(773).env.NEXT_PUBLIC_IS_NEXTJS,
                nW = function() {
                    if (nV) return nz;
                    var e = null == tT ? void 0 : tT.Roblox.AccessManagementUpsellV2Service;
                    return e && function(t) {
                        return e.startAccessManagementUpsell(t)
                    }
                },
                nq = "AgeVerification",
                nK = "UpdatePlaytestSettings",
                nZ = {
                    pid: "experiencestart_mobileweb",
                    is_retargeting: "false"
                };

            function nY(e) {
                if (!nF()) return {};
                var t = e.joinAttemptOrigin,
                    n = e.joinAttemptId;
                return {
                    joinAttemptId: n = "string" == typeof n ? n : tv(),
                    joinAttemptOrigin: t
                }
            }

            function nJ(e, t, n, r) {
                var i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : "click";
                n.getPlayOnWeb;
                var a = tu(n, ["getPlayOnWeb"]),
                    o = ez({
                        placeId: t
                    }, e, nY(e), a, null == r ? {} : {
                        actionType: r
                    });
                return (0, tf.sendEventWithTarget)("playGameClicked", i, o), o
            }

            function nX(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = "";
                if (nF()) {
                    var r = nY(e),
                        i = r.joinAttemptId,
                        a = r.joinAttemptOrigin;
                    "string" == typeof i && i.length > 0 && (n += "&joinAttemptId=".concat(i), "string" == typeof a && a.length > 0 && (n += "&joinAttemptOrigin=".concat(a)))
                }
                var o = e.launchData,
                    l = e.eventId;
                return "string" == typeof o && o.length > 0 && (n += "&launchData=".concat(o)), "string" == typeof l && l.length > 0 && (n += "&eventId=".concat(l)), t && (n += "&isEarlyTesting=true"), n
            }

            function n$(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return encodeURIComponent("".concat(eW().websiteUrl, "/games/start?placeid=").concat(e).concat(nX(t, n)))
            }

            function nQ(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return encodeURIComponent("roblox://experiences/start?placeId=".concat(e).concat(nX(t, n)))
            }
            var n0 = function(e, t, n, r) {
                    var i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : {},
                        a = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {},
                        o = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : {},
                        l = arguments.length > 7 ? arguments[7] : void 0,
                        s = arguments.length > 8 && void 0 !== arguments[8] && arguments[8],
                        u = (0, ty.getDeviceMeta)();
                    if ((null == u ? void 0 : u.isIosDevice) || (null == u ? void 0 : u.isAndroidDevice) || (0, ty.isIos13Ipad)() || (null == u ? void 0 : u.isChromeOs)) {
                        var c = nJ(i, e, a, l),
                            d = n$(e, c, s),
                            f = nQ(e, c, s),
                            h = (0, th.composeQueryString)(ez({}, nZ, o));
                        window.open("https://ro.blox.com/Ebh5?".concat(h, "&af_dp=").concat(f, "&af_web_dp=").concat(d, "&deep_link_value=").concat(d), "_self")
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
                        }()[e]), nG((0, td.buildPlayGameProperties)(t, e, r, void 0, n, p, a, s), tt(e, i), l), window.localStorage.getItem("ref_info") && window.localStorage.removeItem("ref_info")
                    }
                },
                n1 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = (0, ty.getDeviceMeta)();
                    if ((null == n ? void 0 : n.isIosDevice) || (null == n ? void 0 : n.isAndroidDevice) || (0, ty.isIos13Ipad)() || (null == n ? void 0 : n.isChromeOs)) {
                        var r = nJ({}, e, {}),
                            i = n$(e, r),
                            a = nQ(e, r),
                            o = (0, th.composeQueryString)(ez({}, nZ, t));
                        window.open("https://ro.blox.com/Ebh5?".concat(o, "&af_dp=").concat(a, "&af_web_dp=").concat(i, "&deep_link_value=").concat(i), "_self")
                    } else nG((0, td.buildPlayGameProperties)(void 0, e), tt(e, {}))
                },
                n2 = /^(\/[a-z]{2}(-[a-z]{2})?)?\/games\/[0-9]+(\/|$)/i,
                n3 = function(e) {
                    nJ({}, e, {});
                    var t = "/games/".concat(e),
                        n = n2.test(window.location.pathname) ? void 0 : {
                            pathname: t,
                            search: "",
                            href: (0, tc.getAbsoluteUrl)(t)
                        };
                    window.location.assign((0, tg.getSignupUrl)(!1, n))
                },
                n5 = function() {
                    var e;
                    return null == (e = window.Roblox) ? void 0 : e.IdentityVerificationService
                },
                n4 = function(e) {
                    var t = e.context,
                        n = e.pageContext;
                    return eD(function() {
                        var e, r, i, a;
                        return eM(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return o.trys.push([0, 2, , 3]), i = {
                                        featureName: "TriggerAgeCheckUpsellIncludingVPC",
                                        isAsyncCall: !1,
                                        usePrologue: !1,
                                        namespace: "core_content/CoreContent",
                                        featureSpecificData: {
                                            context: "".concat(t, "-").concat(n)
                                        }
                                    }, [4, null == (r = nW()) ? void 0 : r(i)];
                                case 1:
                                    return [2, null != (e = o.sent()) && e];
                                case 2:
                                    throw a = o.sent(), eJ(tn.PlayButtonUpsellAgeRestrictionVerificationError), a;
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                n6 = function(e, t) {
                    try {
                        var n = eK.UrlSearchParams.parse(window.location.search).get("shareLinkSourceType");
                        if ((null == n ? void 0 : n.toLowerCase()) !== "experiencedetails") return;
                        (0, tf.sendEventWithTarget)("shareLinkGameJoin", "GamePlayButtonWeb", {
                            placeId: e,
                            universeId: t
                        }, tf.targetTypes.WWW)
                    } catch (e) {}
                },
                n8 = function(e, t) {
                    return void 0 !== e && e !== e8.Playable && e !== e8.GuestProhibited && e !== e8.PurchaseRequired && e !== e8.ContextualPlayabilityUnverifiedSeventeenPlusUser && e !== e8.FiatPurchaseRequired && e !== e8.ContextualPlayabilityAgeCheckRequired && (e !== e8.ContextualPlayabilityAgeRecommendationParentalControls && e !== e8.ContextualPlayabilityRequireParentApproval || !t) && !0
                },
                n7 = function(e, t, n, r) {
                    (0, tf.sendEvent)({
                        name: tr.eventName,
                        type: tr.eventName,
                        context: tf.eventTypes.formInteraction
                    }, {
                        universeId: e,
                        upsellName: t,
                        playabilityStatus: n,
                        pg: r
                    })
                },
                n9 = function(e) {
                    return e === e8.ContextualPlayabilityUnverifiedSeventeenPlusUser || e === e8.ContextualPlayabilityAgeCheckRequired ? nq : e === e8.ContextualPlayabilityRequireParentApproval || e === e8.ContextualPlayabilityPlaytestDisabled ? nK : e === e8.ContextualPlayabilityTrustedFriendRequired ? "AddTrustedFriend" : void 0
                },
                re = function() {
                    window.location.assign((0, tc.getAbsoluteUrl)("/my/account#!/privacy/ContentRestrictions/PrivatePlaytest"))
                },
                rt = function(e) {
                    window.location.assign((0, tc.getAbsoluteUrl)("/users/".concat(e, "/profile")))
                },
                rn = function(e) {
                    var t, n;
                    return {
                        launchData: null != (t = new URLSearchParams(window.location.search).get("launchData")) ? t : e,
                        eventId: null != (n = new URLSearchParams(window.location.search).get("eventId")) ? n : void 0
                    }
                },
                rr = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                        r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
                        i = arguments.length > 4 ? arguments[4] : void 0;
                    n6(e, t);
                    var a = nJ(n, e, r, "PlayOnWebButtonClick", i),
                        o = a.joinAttemptId,
                        l = a.joinAttemptOrigin;
                    return nF() && "string" == typeof o && "" !== o ? {
                        joinAttemptId: o,
                        joinAttemptOrigin: "string" == typeof l && l.length > 0 ? l : void 0
                    } : {}
                },
                ri = window.ReactJSX,
                ra = n(611),
                ro = n.n(ra),
                rl = function(e) {
                    return e
                },
                rs = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                ru = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? rl(e.toString()) : null
                },
                rc = function(e) {
                    var t = rs(e);
                    return null == t ? null : ru(t)
                },
                rd = "blackbird",
                rf = function(e) {
                    var t, n, r, i, a = null != (t = e.userid) ? t : e.user,
                        o = null == a ? void 0 : null != (n = rc(a)) ? n : void 0;
                    if ("string" == typeof o) return {
                        isAuthenticated: !0,
                        id: o,
                        userName: null != (r = e.name) ? r : e.userName,
                        displayName: null != (i = e.displayname) ? i : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === rd || e.userMembership === rd ? rd : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                rh = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return rf(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                };

            function rp(e) {
                return tE(e) || tW(e) || tS(e) || tP()
            }
            var rm = function() {
                    for (var e, t, n = 0, r = "", i = arguments.length; n < i; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : (0, tR._)(t)))
                            if (Array.isArray(t)) {
                                var a = t.length;
                                for (n = 0; n < a; n++) t[n] && (r = e(t[n])) && (i && (i += " "), i += r)
                            } else
                                for (r in t) t[r] && (i && (i += " "), i += r);
                        return i
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                rv = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                ry = function(e) {
                    var t = e.className;
                    return eF().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: rm("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                rg = function(e) {
                    var t = e.width,
                        n = e.height;
                    return eF().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, eF().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                rb = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                rw = eF().forwardRef(function(e, t) {
                    var n = rp([e, t]),
                        r = n[0],
                        i = n.slice(1),
                        a = r.name,
                        o = r.size,
                        l = r.className,
                        s = (r.children, tu(r, ["name", "size", "className", "children"])),
                        u = tx(i, 1)[0];
                    return eF().createElement("span", ez({
                        ref: u,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: rm("grow-0 shrink-0 basis-auto icon", a, rb[void 0 === o ? "Medium" : o], l)
                    }, s))
                });

            function rE(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rP() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = rE(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : rE(t[e], null)
                        }
                    }
                }
            }

            function rI() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return ej.useCallback(rP.apply(void 0, tq(t)), t)
            }
            rw.displayName = "Icon";
            var rS = Symbol.for("react.lazy"),
                rx = ej[" use ".trim().toString()];

            function rA(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : (0, tR._)(e)) === "object" && "$$typeof" in e && e.$$typeof === rS && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : (0, tR._)(t)) === "object" && null !== t && "then" in t
            }
            var rC = ((a = ej.forwardRef(function(e, t) {
                    var n = e.children,
                        r = tu(e, ["children"]);
                    if (rA(n) && "function" == typeof rx && (n = rx(n._payload)), ej.isValidElement(n)) {
                        var i, a, o, l, s, u = (s = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (s = (l = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            c = function(e, t) {
                                var n = ez({}, t);
                                for (var r in t) ! function(r) {
                                    var i = e[r],
                                        a = t[r];
                                    /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = a.apply(void 0, tq(t));
                                        return i.apply(void 0, tq(t)), r
                                    } : i && (n[r] = i) : "style" === r ? n[r] = ez({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                }(r);
                                return ez({}, e, n)
                            }(r, n.props);
                        return n.type !== ej.Fragment && (c.ref = t ? rP(t, u) : u), ej.cloneElement(n, c)
                    }
                    return ej.Children.count(n) > 1 ? ej.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), m = a, (v = ej.forwardRef(function(e, t) {
                    var n = e.children,
                        r = tu(e, ["children"]);
                    rA(n) && "function" == typeof rx && (n = rx(n._payload));
                    var i = ej.Children.toArray(n),
                        a = i.find(rk);
                    if (a) {
                        var o = a.props.children,
                            l = i.map(function(e) {
                                return e !== a ? e : ej.Children.count(o) > 1 ? ej.Children.only(null) : ej.isValidElement(o) ? o.props.children : null
                            });
                        return (0, ri.jsx)(m, e6(ez({}, r), {
                            ref: t,
                            children: ej.isValidElement(o) ? ej.cloneElement(o, void 0, l) : null
                        }))
                    }
                    return (0, ri.jsx)(m, e6(ez({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), v),
                rT = Symbol("radix.slottable");

            function rk(e) {
                return ej.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rT
            }
            var r_ = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                rO = {
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
                rL = (0, ej.forwardRef)(function(e, t) {
                    var n = rp([e, t]),
                        r = n[0],
                        i = n.slice(1),
                        a = r.children,
                        o = r.className,
                        l = r.style,
                        s = r.isDisabled,
                        u = void 0 !== s && s,
                        c = r.isLoading,
                        d = void 0 !== c && c,
                        f = r.icon,
                        h = r.size,
                        p = void 0 === h ? "Large" : h,
                        m = r.variant,
                        v = void 0 === m ? "Emphasis" : m,
                        y = r.asChild,
                        g = tu(r, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        b = tx(i, 1)[0],
                        w = rm("foundation-web-button", u ? "opacity-[0.5]" : [rv, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", rO[p], u ? rR[v] : rN[v], o),
                        E = ez({
                            textDecoration: "none"
                        }, l),
                        P = function(e) {
                            return eF().createElement(eF().Fragment, null, eF().createElement(ry, null), d && eF().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, eF().createElement(rg, {
                                width: r_[p],
                                height: r_[p]
                            })), eF().createElement("span", {
                                className: rm("flex items-center min-width-0", "Large" === p || "Medium" === p ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, f && eF().createElement(rw, {
                                name: f,
                                size: p
                            }), eF().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (y) {
                        g.as;
                        var I = tu(g, ["as"]),
                            S = eF().Children.only(a);
                        return eF().createElement(rC, e6(ez({
                            ref: b
                        }, I), {
                            className: w,
                            style: E,
                            "aria-disabled": u || void 0
                        }), eF().cloneElement(S, {}, P(S.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var x = g.href,
                            A = tu(g, ["as", "href"]);
                        return eF().createElement("a", e6(ez({
                            ref: b
                        }, A), {
                            "aria-disabled": u,
                            href: u ? void 0 : x,
                            className: w,
                            style: E
                        }), P(a))
                    }
                    g.as;
                    var C = tu(g, ["as"]);
                    return eF().createElement("button", e6(ez({
                        ref: b,
                        type: "button"
                    }, C), {
                        disabled: u,
                        className: w,
                        style: E
                    }), P(a))
                }),
                rU = window.Roblox.ExperimentationService,
                rB = n.n(rU),
                rD = "full",
                rM = function(e) {
                    return e === rD && "btn-full-width"
                },
                rj = {
                    display: "flex"
                },
                rF = "OneButton",
                rH = "TwoButton";

            function rG(e, t) {
                var n = t && t.cache ? t.cache : rK,
                    r = t && t.serializer ? t.serializer : rW;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var n, r, i = 1 === e.length ? rz : rV;
                    return n = t.cache.create(), r = t.serializer, i.bind(this, e, n, r)
                })(e, {
                    cache: n,
                    serializer: r
                })
            }

            function rz(e, t, n, r) {
                var i = null == r || "number" == typeof r || "boolean" == typeof r ? r : n(r),
                    a = t.get(i);
                return void 0 === a && (a = e.call(this, r), t.set(i, a)), a
            }

            function rV(e, t, n) {
                var r = Array.prototype.slice.call(arguments, 3),
                    i = n(r),
                    a = t.get(i);
                return void 0 === a && (a = e.apply(this, r), t.set(i, a)), a
            }
            var rW = function() {
                    return JSON.stringify(arguments)
                },
                rq = function() {
                    function e() {
                        tB(this, e), this.cache = Object.create(null)
                    }
                    return nS(e, [{
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
                rK = {
                    create: function() {
                        return new rq
                    }
                },
                rZ = {
                    variadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, rV.bind(this, e, n, r)
                    },
                    monadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, rz.bind(this, e, n, r)
                    }
                },
                rY = function(e) {
                    function t(e, n) {
                        tB(this, t);
                        var r, i = e;
                        return n && (i += ": " + n), (r = tL(this, t, [i])).code = e, n && (r.originalMessage = n), r
                    }
                    return tM(t, e), t
                }(tF(Error)),
                rJ = ((y = rJ || {}).MISSING_MESSAGE = "MISSING_MESSAGE", y.MISSING_FORMAT = "MISSING_FORMAT", y.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", y.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", y.INVALID_MESSAGE = "INVALID_MESSAGE", y.INVALID_KEY = "INVALID_KEY", y.FORMATTING_ERROR = "FORMATTING_ERROR", y);

            function rX(e, t) {
                return rG(e, {
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
                    strategy: rZ.variadic
                })
            }

            function r$(e, t) {
                return rX(function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return tj(e, tq(n))
                }, t)
            }

            function rQ() {
                return (rQ = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }).apply(this, arguments)
            }
            var r0 = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                r1 = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                r2 = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                r3 = /^(@+)?(\+|#+)?[rs]?$/g,
                r5 = /(\*)(0+)|(#+)(0+)|(0+)/g,
                r4 = /^(0+)$/;

            function r6(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(r3, function(e, n, r) {
                    return "string" != typeof r ? (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length) : "+" === r ? t.minimumSignificantDigits = n.length : "#" === n[0] ? t.maximumSignificantDigits = n.length : (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length + ("string" == typeof r ? r.length : 0)), ""
                }), t
            }

            function r8(e) {
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

            function r7(e) {
                var t = r8(e);
                return t || {}
            }
            var r9 = ((g = {})[g.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", g[g.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", g[g.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", g[g.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", g[g.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", g[g.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", g[g.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", g[g.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", g[g.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", g[g.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", g[g.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", g[g.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", g[g.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", g[g.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", g[g.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", g[g.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", g[g.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", g[g.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", g[g.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", g[g.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", g[g.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", g[g.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", g[g.INVALID_TAG = 23] = "INVALID_TAG", g[g.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", g[g.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", g[g.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", g);

            function ie(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, tR._)(e)) === "object" && 0 === e.type)
            }

            function it(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, tR._)(e)) === "object" && 1 === e.type)
            }
            var ir = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                ii = {
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
                ia = new RegExp("^".concat(ir.source, "*")),
                io = new RegExp("".concat(ir.source, "*$"));

            function il(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var is = !!Object.fromEntries,
                iu = !!String.prototype.trimStart,
                ic = !!String.prototype.trimEnd,
                id = is ? Object.fromEntries : function(e) {
                    var t = {},
                        n = !0,
                        r = !1,
                        i = void 0;
                    try {
                        for (var a, o = e[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) {
                            var l = tx(a.value, 2),
                                s = l[0],
                                u = l[1];
                            t[s] = u
                        }
                    } catch (e) {
                        r = !0, i = e
                    } finally {
                        try {
                            n || null == o.return || o.return()
                        } finally {
                            if (r) throw i
                        }
                    }
                    return t
                },
                ih = iu ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(ia, "")
                },
                ip = ic ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(io, "")
                },
                im = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                iv = function() {
                    function e(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        tB(this, e), this.message = t, this.position = {
                            offset: 0,
                            line: 1,
                            column: 1
                        }, this.ignoreTag = !!n.ignoreTag, this.locale = n.locale, this.requiresOtherClause = !!n.requiresOtherClause, this.shouldParseSkeletons = !!n.shouldParseSkeletons
                    }
                    return nS(e, [{
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
                                                var a = e.charCodeAt(r + 1);
                                                r += a >= 56320 && a <= 57343 ? 2 : 1
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
                                                location: il(n, this.clonePosition())
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
                                    var a = this.parseArgument(e, n);
                                    if (a.err) return a;
                                    r.push(a.val)
                                } else if (125 === i && e > 0) break;
                                else if (35 === i && ("plural" === t || "selectordinal" === t)) {
                                    var o = this.clonePosition();
                                    this.bump(), r.push({
                                        type: 7,
                                        location: il(o, this.clonePosition())
                                    })
                                } else if (60 !== i || this.ignoreTag || 47 !== this.peek())
                                    if (60 === i && !this.ignoreTag && iy(this.peek() || 0)) {
                                        var l = this.parseTag(e, t);
                                        if (l.err) return l;
                                        r.push(l.val)
                                    } else {
                                        var s = this.parseLiteral(e, t);
                                        if (s.err) return s;
                                        r.push(s.val)
                                    }
                                else if (!n) return this.error(26, il(this.clonePosition(), this.clonePosition()));
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
                                    location: il(n, this.clonePosition())
                                },
                                err: null
                            };
                            if (!this.bumpIf(">")) return this.error(23, il(n, this.clonePosition()));
                            var i = this.parseMessage(e + 1, t, !0);
                            if (i.err) return i;
                            var a = i.val,
                                o = this.clonePosition();
                            if (!this.bumpIf("</")) return this.error(27, il(n, this.clonePosition()));
                            if (this.isEOF() || !iy(this.char())) return this.error(23, il(o, this.clonePosition()));
                            var l = this.clonePosition();
                            return r !== this.parseTagName() ? this.error(26, il(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                val: {
                                    type: 8,
                                    value: r,
                                    children: a,
                                    location: il(n, this.clonePosition())
                                },
                                err: null
                            } : this.error(23, il(o, this.clonePosition()))
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
                                var a = this.tryParseUnquoted(e, t);
                                if (a) {
                                    r += a;
                                    continue
                                }
                                var o = this.tryParseLeftAngleBracket();
                                if (o) {
                                    r += o;
                                    continue
                                }
                                break
                            }
                            return {
                                val: {
                                    type: 0,
                                    value: r,
                                    location: il(n, this.clonePosition())
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseLeftAngleBracket",
                        value: function() {
                            var e;
                            return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (iy(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                            return (t = String).fromCodePoint.apply(t, tq(n))
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
                            if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, il(n, this.clonePosition()));
                            if (125 === this.char()) return this.bump(), this.error(2, il(n, this.clonePosition()));
                            var r = this.parseIdentifierIfPossible().value;
                            if (!r) return this.error(3, il(n, this.clonePosition()));
                            if (this.bumpSpace(), this.isEOF()) return this.error(1, il(n, this.clonePosition()));
                            switch (this.char()) {
                                case 125:
                                    return this.bump(), {
                                        val: {
                                            type: 1,
                                            value: r,
                                            location: il(n, this.clonePosition())
                                        },
                                        err: null
                                    };
                                case 44:
                                    if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, il(n, this.clonePosition()));
                                    return this.parseArgumentOptions(e, t, r, n);
                                default:
                                    return this.error(3, il(n, this.clonePosition()))
                            }
                        }
                    }, {
                        key: "parseIdentifierIfPossible",
                        value: function() {
                            var e, t, n = this.clonePosition(),
                                r = this.offset(),
                                i = (e = this.message, im.lastIndex = r, null != (t = im.exec(e)[1]) ? t : ""),
                                a = r + i.length;
                            return this.bumpTo(a), {
                                value: i,
                                location: il(n, this.clonePosition())
                            }
                        }
                    }, {
                        key: "parseArgumentOptions",
                        value: function(e, t, n, r) {
                            var i = this.clonePosition(),
                                a = this.parseIdentifierIfPossible().value,
                                o = this.clonePosition();
                            switch (a) {
                                case "":
                                    return this.error(4, il(i, o));
                                case "number":
                                case "date":
                                case "time":
                                    this.bumpSpace();
                                    var l, s = null;
                                    if (this.bumpIf(",")) {
                                        this.bumpSpace();
                                        var u = this.clonePosition(),
                                            c = this.parseSimpleArgStyleIfPossible();
                                        if (c.err) return c;
                                        var d = ip(c.val);
                                        if (0 === d.length) return this.error(6, il(this.clonePosition(), this.clonePosition()));
                                        s = {
                                            style: d,
                                            styleLocation: il(u, this.clonePosition())
                                        }
                                    }
                                    var f = this.tryParseArgumentClose(r);
                                    if (f.err) return f;
                                    var h = il(r, this.clonePosition());
                                    if (s && s.style.startsWith("::")) {
                                        var p = ih(s.style.slice(2));
                                        if ("number" === a) {
                                            var m = this.parseNumberSkeletonFromString(p, s.styleLocation);
                                            if (m.err) return m;
                                            return {
                                                val: {
                                                    type: 2,
                                                    value: n,
                                                    location: h,
                                                    style: m.val
                                                },
                                                err: null
                                            }
                                        }
                                        if (0 === p.length) return this.error(10, h);
                                        var v, y = p;
                                        return this.locale && (y = function(e, t) {
                                            for (var n = "", r = 0; r < e.length; r++) {
                                                var i = e.charAt(r);
                                                if ("j" === i) {
                                                    for (var a = 0; r + 1 < e.length && e.charAt(r + 1) === i;) a++, r++;
                                                    var o = 1 + (1 & a),
                                                        l = a < 2 ? 1 : 3 + (a >> 1),
                                                        s = function(e) {
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
                                                            return "root" !== r && (t = e.maximize().region), (ii[t || ""] || ii[r || ""] || ii["".concat(r, "-001")] || ii["001"])[0]
                                                        }(t);
                                                    for (("H" == s || "k" == s) && (l = 0); l-- > 0;) n += "a";
                                                    for (; o-- > 0;) n = s + n
                                                } else "J" === i ? n += "H" : n += i
                                            }
                                            return n
                                        }(p, this.locale)), {
                                            val: {
                                                type: "date" === a ? 3 : 4,
                                                value: n,
                                                location: h,
                                                style: {
                                                    type: 1,
                                                    pattern: y,
                                                    location: s.styleLocation,
                                                    parsedOptions: this.shouldParseSkeletons ? (v = {}, y.replace(r0, function(e) {
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
                                            type: "number" === a ? 2 : "date" === a ? 3 : 4,
                                            value: n,
                                            location: h,
                                            style: null != (l = null == s ? void 0 : s.style) ? l : null
                                        }, err: null
                                    };
                                case "plural":
                                case "selectordinal":
                                case "select":
                                    var g = this.clonePosition();
                                    if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, il(g, ez({}, g)));
                                    this.bumpSpace();
                                    var b = this.parseIdentifierIfPossible(),
                                        w = 0;
                                    if ("select" !== a && "offset" === b.value) {
                                        if (!this.bumpIf(":")) return this.error(13, il(this.clonePosition(), this.clonePosition()));
                                        this.bumpSpace();
                                        var E = this.tryParseDecimalInteger(13, 14);
                                        if (E.err) return E;
                                        this.bumpSpace(), b = this.parseIdentifierIfPossible(), w = E.val
                                    }
                                    var P = this.tryParsePluralOrSelectOptions(e, a, t, b);
                                    if (P.err) return P;
                                    var I = this.tryParseArgumentClose(r);
                                    if (I.err) return I;
                                    var S = il(r, this.clonePosition());
                                    if ("select" === a) return {
                                        val: {
                                            type: 5,
                                            value: n,
                                            options: id(P.val),
                                            location: S
                                        },
                                        err: null
                                    };
                                    return {
                                        val: {
                                            type: 6,
                                            value: n,
                                            options: id(P.val),
                                            offset: w,
                                            pluralType: "plural" === a ? "cardinal" : "ordinal",
                                            location: S
                                        }, err: null
                                    };
                                default:
                                    return this.error(5, il(i, o))
                            }
                        }
                    }, {
                        key: "tryParseArgumentClose",
                        value: function(e) {
                            return this.isEOF() || 125 !== this.char() ? this.error(1, il(e, this.clonePosition())) : (this.bump(), {
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
                                    if (!this.bumpUntil("'")) return this.error(11, il(n, this.clonePosition()));
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
                                    var t = e.split(r1).filter(function(e) {
                                            return e.length > 0
                                        }),
                                        n = [],
                                        r = !0,
                                        i = !1,
                                        a = void 0;
                                    try {
                                        for (var o, l = t[Symbol.iterator](); !(r = (o = l.next()).done); r = !0) {
                                            var s = o.value.split("/");
                                            if (0 === s.length) throw Error("Invalid number skeleton");
                                            var u = rp(s),
                                                c = u[0],
                                                d = u.slice(1),
                                                f = !0,
                                                h = !1,
                                                p = void 0;
                                            try {
                                                for (var m, v = d[Symbol.iterator](); !(f = (m = v.next()).done); f = !0) {
                                                    var y = m.value;
                                                    if (0 === y.length) throw Error("Invalid number skeleton")
                                                }
                                            } catch (e) {
                                                h = !0, p = e
                                            } finally {
                                                try {
                                                    f || null == v.return || v.return()
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
                                        i = !0, a = e
                                    } finally {
                                        try {
                                            r || null == l.return || l.return()
                                        } finally {
                                            if (i) throw a
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
                                            for (var a, o = e[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) {
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
                                                        t = ez(e6(ez({}, t), {
                                                            notation: "scientific"
                                                        }), l.options.reduce(function(e, t) {
                                                            return ez({}, e, r7(t))
                                                        }, {}));
                                                        continue;
                                                    case "engineering":
                                                        t = ez(e6(ez({}, t), {
                                                            notation: "engineering"
                                                        }), l.options.reduce(function(e, t) {
                                                            return ez({}, e, r7(t))
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
                                                        l.options[0].replace(r5, function(e, n, r, i, a, o) {
                                                            if (n) t.minimumIntegerDigits = r.length;
                                                            else if (i && a) throw Error("We currently do not support maximum integer digits");
                                                            else if (o) throw Error("We currently do not support exact integer digits");
                                                            return ""
                                                        });
                                                        continue
                                                }
                                                if (r4.test(l.stem)) {
                                                    t.minimumIntegerDigits = l.stem.length;
                                                    continue
                                                }
                                                if (r2.test(l.stem)) {
                                                    if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                    l.stem.replace(r2, function(e, n, r, i, a, o) {
                                                        return "*" === r ? t.minimumFractionDigits = n.length : i && "#" === i[0] ? t.maximumFractionDigits = i.length : a && o ? (t.minimumFractionDigits = a.length, t.maximumFractionDigits = a.length + o.length) : (t.minimumFractionDigits = n.length, t.maximumFractionDigits = n.length), ""
                                                    });
                                                    var s = l.options[0];
                                                    "w" === s ? t = e6(ez({}, t), {
                                                        trailingZeroDisplay: "stripIfInteger"
                                                    }) : s && (t = ez({}, t, r6(s)));
                                                    continue
                                                }
                                                if (r3.test(l.stem)) {
                                                    t = ez({}, t, r6(l.stem));
                                                    continue
                                                }
                                                var u = r8(l.stem);
                                                u && (t = ez({}, t, u));
                                                var c = function(e) {
                                                    var t;
                                                    if ("E" === e[0] && "E" === e[1] ? (t = {
                                                            notation: "engineering"
                                                        }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                            notation: "scientific"
                                                        }, e = e.slice(1)), t) {
                                                        var n = e.slice(0, 2);
                                                        if ("+!" === n ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === n && (t.signDisplay = "exceptZero", e = e.slice(2)), !r4.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                        t.minimumIntegerDigits = e.length
                                                    }
                                                    return t
                                                }(l.stem);
                                                c && (t = ez({}, t, c))
                                            }
                                        } catch (e) {
                                            r = !0, i = e
                                        } finally {
                                            try {
                                                n || null == o.return || o.return()
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
                            for (var i = !1, a = [], o = new Set, l = r.value, s = r.location;;) {
                                if (0 === l.length) {
                                    var u, c = this.clonePosition();
                                    if ("select" !== t && this.bumpIf("=")) {
                                        var d = this.tryParseDecimalInteger(16, 19);
                                        if (d.err) return d;
                                        s = il(c, this.clonePosition()), l = this.message.slice(c.offset, this.offset())
                                    } else break
                                }
                                if (o.has(l)) return this.error("select" === t ? 21 : 20, s);
                                "other" === l && (i = !0), this.bumpSpace();
                                var f = this.clonePosition();
                                if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, il(this.clonePosition(), this.clonePosition()));
                                var h = this.parseMessage(e + 1, t, n);
                                if (h.err) return h;
                                var p = this.tryParseArgumentClose(f);
                                if (p.err) return p;
                                a.push([l, {
                                    value: h.val,
                                    location: il(f, this.clonePosition())
                                }]), o.add(l), this.bumpSpace(), l = (u = this.parseIdentifierIfPossible()).value, s = u.location
                            }
                            return 0 === a.length ? this.error("select" === t ? 15 : 16, il(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !i ? this.error(22, il(this.clonePosition(), this.clonePosition())) : {
                                val: a,
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseDecimalInteger",
                        value: function(e, t) {
                            var n = 1,
                                r = this.clonePosition();
                            this.bumpIf("+") || this.bumpIf("-") && (n = -1);
                            for (var i = !1, a = 0; !this.isEOF();) {
                                var o = this.char();
                                if (o >= 48 && o <= 57) i = !0, a = 10 * a + (o - 48), this.bump();
                                else break
                            }
                            var l = il(r, this.clonePosition());
                            return i ? Number.isSafeInteger(a *= n) ? {
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

            function iy(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }
            var ig = function(e) {
                    function t(e, n, r) {
                        var i;
                        return tB(this, t), (i = tL(this, t, [e])).code = n, i.originalMessage = r, i
                    }
                    return tM(t, e), nS(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(tF(Error)),
                ib = function(e) {
                    function t(e, n, r, i) {
                        return tB(this, t), tL(this, t, ['Invalid values for "'.concat(e, '": "').concat(n, '". Options are "').concat(Object.keys(r).join('", "'), '"'), "INVALID_VALUE", i])
                    }
                    return tM(t, e), t
                }(ig),
                iw = function(e) {
                    function t(e, n, r) {
                        return tB(this, t), tL(this, t, ['Value for "'.concat(e, '" must be of type ').concat(n), "INVALID_VALUE", r])
                    }
                    return tM(t, e), t
                }(ig),
                iE = function(e) {
                    function t(e, n) {
                        return tB(this, t), tL(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(n, '"'), "MISSING_VALUE", n])
                    }
                    return tM(t, e), t
                }(ig);

            function iP(e) {
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
            var iI = ((em = function() {
                function e(t) {
                    var n, r = this,
                        i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        a = arguments.length > 2 ? arguments[2] : void 0,
                        o = arguments.length > 3 ? arguments[3] : void 0;
                    if (tB(this, e), this.formatterCache = {
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
                            return function e(t, n, r, i, a, o, l) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var s = [],
                                    u = !0,
                                    c = !1,
                                    d = void 0;
                                try {
                                    for (var f, h = t[Symbol.iterator](); !(u = (f = h.next()).done); u = !0) {
                                        var p = f.value;
                                        if (0 === p.type) {
                                            s.push({
                                                type: 0,
                                                value: p.value
                                            });
                                            continue
                                        }
                                        if (7 === p.type) {
                                            "number" == typeof o && s.push({
                                                type: 0,
                                                value: r.getNumberFormat(n).format(o)
                                            });
                                            continue
                                        }
                                        var m = p.value;
                                        if (!(a && m in a)) throw new iE(m, l);
                                        var v = a[m];
                                        if (1 === p.type) {
                                            v && "string" != typeof v && "number" != typeof v && (void 0 === v ? "undefined" : (0, tR._)(v)) !== "bigint" || (v = "string" == typeof v || "number" == typeof v || (void 0 === v ? "undefined" : (0, tR._)(v)) === "bigint" ? String(v) : ""), s.push({
                                                type: +("string" != typeof v),
                                                value: v
                                            });
                                            continue
                                        }
                                        if (3 === p.type) {
                                            var y = "string" == typeof p.style ? i.date[p.style] : it(p.style) ? p.style.parsedOptions : void 0;
                                            s.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, y).format(v)
                                            });
                                            continue
                                        }
                                        if (4 === p.type) {
                                            var g = "string" == typeof p.style ? i.time[p.style] : it(p.style) ? p.style.parsedOptions : i.time.medium;
                                            s.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, g).format(v)
                                            });
                                            continue
                                        }
                                        if (2 === p.type) {
                                            var b = "string" == typeof p.style ? i.number[p.style] : ie(p.style) ? p.style.parsedOptions : void 0;
                                            if (b && b.scale) {
                                                var w = b.scale || 1;
                                                if ((void 0 === v ? "undefined" : (0, tR._)(v)) === "bigint") {
                                                    if (!Number.isInteger(w)) throw TypeError("Cannot apply fractional scale ".concat(w, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    v *= BigInt(w)
                                                } else v *= w
                                            }
                                            s.push({
                                                type: 0,
                                                value: r.getNumberFormat(n, b).format(v)
                                            });
                                            continue
                                        }
                                        if (8 === p.type) {
                                            var E = p.children,
                                                P = p.value,
                                                I = a[P];
                                            if ("function" != typeof I) throw new iw(P, "function", l);
                                            var S = I(e(E, n, r, i, a, o).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(S) || (S = [S]), s.push.apply(s, tq(S.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === p.type) {
                                            var x = v,
                                                A = (Object.prototype.hasOwnProperty.call(p.options, x) ? p.options[x] : void 0) || p.options.other;
                                            if (!A) throw new ib(p.value, v, Object.keys(p.options), l);
                                            s.push.apply(s, tq(e(A.value, n, r, i, a)));
                                            continue
                                        }
                                        if (6 === p.type) {
                                            var C = "=".concat(v),
                                                T = Object.prototype.hasOwnProperty.call(p.options, C) ? p.options[C] : void 0;
                                            if (!T) {
                                                if (!Intl.PluralRules) throw new ig('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var k = (void 0 === v ? "undefined" : (0, tR._)(v)) === "bigint" ? Number(v) : v,
                                                    _ = r.getPluralRules(n, {
                                                        type: p.pluralType
                                                    }).select(k - (p.offset || 0));
                                                T = (Object.prototype.hasOwnProperty.call(p.options, _) ? p.options[_] : void 0) || p.options.other
                                            }
                                            if (!T) throw new ib(p.value, v, Object.keys(p.options), l);
                                            var O = (void 0 === v ? "undefined" : (0, tR._)(v)) === "bigint" ? Number(v) : v;
                                            s.push.apply(s, tq(e(T.value, n, r, i, a, O - (p.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    c = !0, d = e
                                } finally {
                                    try {
                                        u || null == h.return || h.return()
                                    } finally {
                                        if (c) throw d
                                    }
                                }
                                return s.length < 2 ? s : s.reduce(function(e, t) {
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
                        var l = o || {},
                            s = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(l), rQ({}, l));
                        this.ast = e.__parse(t, e6(ez({}, s), {
                            locale: this.resolvedLocale
                        }))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (n = e.formats, a ? Object.keys(n).reduce(function(e, t) {
                        var r, i;
                        return e[t] = (r = n[t], (i = a[t]) ? ez({}, r, i, Object.keys(r).reduce(function(e, t) {
                            return e[t] = ez({}, r[t], i[t]), e
                        }, {})) : r), e
                    }, ez({}, n)) : n), this.formatters = o && o.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: rG(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tj(Intl.NumberFormat, tq(t))
                            }, {
                                cache: iP(e.number),
                                strategy: rZ.variadic
                            }),
                            getDateTimeFormat: rG(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tj(Intl.DateTimeFormat, tq(t))
                            }, {
                                cache: iP(e.dateTime),
                                strategy: rZ.variadic
                            }),
                            getPluralRules: rG(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tj(Intl.PluralRules, tq(t))
                            }, {
                                cache: iP(e.pluralRules),
                                strategy: rZ.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return nS(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, em.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, em.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = new iv(e, t = ez({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (n.err) {
                    var r = SyntaxError(r9[n.err.kind]);
                    throw r.location = n.err.location, r.originalMessage = n.err.message, r
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var n in t.options) delete t.options[n].location, e(t.options[n].value);
                        else 2 === t.type && ie(t.style) || (3 === t.type || 4 === t.type) && it(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(n.val), n.val
            }, em.formats = {
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
            }, em);

            function iS() {
                for (var e, t, n, r, i, a = arguments.length, o = Array(a), l = 0; l < a; l++) o[l] = arguments[l];
                var s = tx(o, 4),
                    u = (s[0], s[1]),
                    c = s[2],
                    d = s[3];
                if (Array.isArray(u)) throw new rY(rJ.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === u ? "undefined" : (0, tR._)(u))) throw new rY(rJ.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof u) {
                    var f = c || /'[{}<#|']/.test(u) ? void 0 : u;
                    if (f) return f
                }
                var h = d.cache,
                    p = d.formats,
                    m = d.formatters,
                    v = d.globalFormats,
                    y = d.locale,
                    g = d.timeZone;
                m.getMessageFormat || (m.getMessageFormat = rX(function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return new iI(t[0], t[1], t[2], ez({
                        formatters: m
                    }, t[3]))
                }, h.message));
                try {
                    i = m.getMessageFormat(u, y, (e = iI.formats.date, t = iI.formats.time, n = ez({}, null == v ? void 0 : v.dateTime, null == p ? void 0 : p.dateTime), r = {
                        date: ez({}, e, n),
                        time: ez({}, t, n),
                        number: ez({}, null == v ? void 0 : v.number, null == p ? void 0 : p.number)
                    }, g && ["date", "time"].forEach(function(e) {
                        var t = r[e],
                            n = !0,
                            i = !1,
                            a = void 0;
                        try {
                            for (var o, l = Object.entries(t)[Symbol.iterator](); !(n = (o = l.next()).done); n = !0) {
                                var s = tx(o.value, 2),
                                    u = s[0],
                                    c = s[1];
                                t[u] = ez({
                                    timeZone: g
                                }, c)
                            }
                        } catch (e) {
                            i = !0, a = e
                        } finally {
                            try {
                                n || null == l.return || l.return()
                            } finally {
                                if (i) throw a
                            }
                        }
                    }), r), {
                        formatters: e6(ez({}, m), {
                            getDateTimeFormat: function(e, t) {
                                var n;
                                return m.getDateTimeFormat(e, e6(ez({}, t), {
                                    timeZone: null != (n = null == t ? void 0 : t.timeZone) ? n : g
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new rY(rJ.INVALID_MESSAGE, void 0)
                }
                var b = i.format(c);
                return (0, ej.isValidElement)(b) || Array.isArray(b) || "string" == typeof b ? b : String(b)
            }

            function ix() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return t.filter(Boolean).join(".")
            }

            function iA(e) {
                return ix(e.namespace, e.key)
            }

            function iC(e) {
                console.error(e)
            }

            function iT(e, t, n, r) {
                var i = ix(r, n);
                if (!t) throw Error(i);
                var a = t;
                return n.split(".").forEach(function(t) {
                    var n = a[t];
                    if (null == t || null == n) throw Error(i + " (".concat(e, ")"));
                    a = n
                }), a
            }
            iS.raw = !0;
            var ik = (0, ej.createContext)(void 0);

            function i_(e) {
                var t = e.children,
                    n = e.formats,
                    r = e.getMessageFallback,
                    i = e.locale,
                    a = e.messages,
                    o = e.now,
                    l = e.onError,
                    s = e.timeZone,
                    u = (0, ej.useContext)(ik),
                    c = (0, ej.useMemo)(function() {
                        return (null == u ? void 0 : u.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [i, null == u ? void 0 : u.cache]),
                    d = (0, ej.useMemo)(function() {
                        return (null == u ? void 0 : u.formatters) || {
                            getDateTimeFormat: r$(Intl.DateTimeFormat, c.dateTime),
                            getNumberFormat: r$(Intl.NumberFormat, c.number),
                            getPluralRules: r$(Intl.PluralRules, c.pluralRules),
                            getRelativeTimeFormat: r$(Intl.RelativeTimeFormat, c.relativeTime),
                            getListFormat: r$(Intl.ListFormat, c.list),
                            getDisplayNames: r$(Intl.DisplayNames, c.displayNames)
                        }
                    }, [c, null == u ? void 0 : u.formatters]),
                    f = (0, ej.useMemo)(function() {
                        var e, t, f, h, p;
                        return e6(ez({}, (t = (e = {
                            locale: i,
                            formats: void 0 === n ? null == u ? void 0 : u.formats : n,
                            getMessageFallback: r || (null == u ? void 0 : u.getMessageFallback),
                            messages: void 0 === a ? null == u ? void 0 : u.messages : a,
                            now: o || (null == u ? void 0 : u.now),
                            onError: l || (null == u ? void 0 : u.onError),
                            timeZone: s || (null == u ? void 0 : u.timeZone)
                        }).formats, f = e.getMessageFallback, h = e.messages, p = e.onError, e6(ez({}, tu(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: h || void 0,
                            onError: p || iC,
                            getMessageFallback: f || iA
                        }))), {
                            formatters: d,
                            cache: c
                        })
                    }, [c, n, d, r, i, a, o, l, u, s]);
                return (0, ri.jsx)(ik.Provider, {
                    value: f,
                    children: t
                })
            }

            function iO() {
                var e = (0, ej.useContext)(ik);
                if (!e) throw Error(void 0);
                return e
            }
            var iN = !1,
                iR = "u" < typeof window,
                iL = "__FN_nvfToKPAOuiV__",
                iU = "__FN_END_nvfToKPAOuiV__",
                iB = new RegExp("".concat(iL, "(\\d+)\\|")),
                iD = new RegExp("".concat(iU, "(\\d+)\\|")),
                iM = function(e, t, n) {
                    var r = ez({}, n),
                        i = {};
                    t.forEach(function(e, t) {
                        var n = t.toString(),
                            a = "".concat(iL).concat(n, "|"),
                            o = "".concat(iU).concat(n, "|");
                        r[e.opening] = a, r[e.closing] = o, i[n] = {
                            start: a,
                            end: o,
                            render: e.render
                        }
                    });
                    var a = function(e) {
                            var t = [],
                                n = iB.exec(e),
                                r = iD.exec(e);
                            if (r && (!n || r.index < n.index)) return null;
                            if (!n) return [e];
                            n.index > 0 && t.push(e.slice(0, n.index));
                            var o = null == n[1] ? void 0 : i[n[1]];
                            if (null == o) return null;
                            var l = e.indexOf(o.end);
                            if (l < n.index + n[0].length) return null;
                            var s = a(e.slice(n.index + n[0].length, l));
                            if (null == s) return null;
                            t.push(o.render(s));
                            var u = e.slice(l + o.end.length);
                            if (u.length > 0) {
                                var c = a(u);
                                if (null == c) return null;
                                t.push.apply(t, tq(c))
                            }
                            return t
                        },
                        o = a(e(r));
                    return null == o ? null : o.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, ri.jsx)(ej.Fragment, {
                            children: e
                        }, t)
                    })
                },
                ij = function(e) {
                    return e.replaceAll(".", ":")
                };

            function iF() {
                return null != ev || (ev = "".concat(eW().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), ev
            }
            var iH = function() {},
                iG = function(e, t) {
                    return e << 3 | t
                },
                iz = iG(1, 2),
                iV = iG(2, 2),
                iW = iG(5, 2),
                iq = iG(6, 2),
                iK = iG(8, 2),
                iZ = iG(1, 2),
                iY = iG(2, 1),
                iJ = iG(3, 0),
                iX = iG(5, 2);
            iG(1, 2), iG(2, 1), iG(3, 0), iG(4, 2), iG(5, 2), iG(6, 0), iG(8, 2);
            var i$ = iG(4, 0),
                iQ = iG(6, 2),
                i0 = iG(7, 2);
            iG(1, 0), iG(2, 2);
            var i1 = iG(1, 2),
                i2 = iG(2, 2),
                i3 = iG(1, 2);
            iG(1, 2), iG(2, 2), iG(1, 2);
            var i5 = new TextEncoder,
                i4 = function() {
                    function e() {
                        tB(this, e), eG(this, "buf", [])
                    }
                    return nS(e, [{
                        key: "writeVarint",
                        value: function(e) {
                            var t = (void 0 === e ? "undefined" : (0, tR._)(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                            this.buf.push(Number(t))
                        }
                    }, {
                        key: "writeString",
                        value: function(e) {
                            var t = i5.encode(e);
                            this.writeVarint(t.length);
                            var n = !0,
                                r = !1,
                                i = void 0;
                            try {
                                for (var a, o = t[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) {
                                    var l = a.value;
                                    this.buf.push(l)
                                }
                            } catch (e) {
                                r = !0, i = e
                            } finally {
                                try {
                                    n || null == o.return || o.return()
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
                                for (var i, a = e[Symbol.iterator](); !(t = (i = a.next()).done); t = !0) {
                                    var o = i.value;
                                    this.buf.push(o)
                                }
                            } catch (e) {
                                n = !0, r = e
                            } finally {
                                try {
                                    t || null == a.return || a.return()
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

            function i6(e, t, n) {
                var r = new i4;
                return r.writeVarint(iG(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
            }

            function i8(e) {
                var t = new i4;
                if (t.writeVarint(iZ), t.writeString(e.name), t.writeVarint(iY), t.writeDouble(e.value), t.writeVarint(iJ), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var n = function(e) {
                        var t = new i4,
                            n = !0,
                            r = !1,
                            i = void 0;
                        try {
                            for (var a, o = Object.entries(e)[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) ! function() {
                                var e = tx(a.value, 2),
                                    n = e[0],
                                    r = e[1];
                                if ("string" == typeof r) {
                                    var i = i6(n, iG(2, 2), function(e) {
                                        e.writeString(r)
                                    });
                                    t.writeVarint(iW), t.writeBytes(i)
                                } else if ("boolean" == typeof r) {
                                    var o = i6(n, iG(2, 0), function(e) {
                                        e.writeVarint(+!!r)
                                    });
                                    t.writeVarint(iq), t.writeBytes(o)
                                } else if ((void 0 === r ? "undefined" : (0, tR._)(r)) === "bigint") {
                                    var l = i6(n, iG(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(iV), t.writeBytes(l)
                                } else if ("number" == typeof r)
                                    if (Number.isFinite(r))
                                        if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                            var s = i6(n, iG(2, 0), function(e) {
                                                e.writeVarint(r)
                                            });
                                            t.writeVarint(iz), t.writeBytes(s)
                                        } else if (Number.isInteger(r)) {
                                    var u = i6(n, iG(2, 0), function(e) {
                                        e.writeVarint(BigInt(r))
                                    });
                                    t.writeVarint(iV), t.writeBytes(u)
                                } else {
                                    var c = i6(n, iG(2, 1), function(e) {
                                        e.writeDouble(r)
                                    });
                                    t.writeVarint(iK), t.writeBytes(c)
                                } else {
                                    var d = i6(n, iG(2, 2), function(e) {
                                        e.writeString(String(r))
                                    });
                                    t.writeVarint(iW), t.writeBytes(d)
                                }
                            }()
                        } catch (e) {
                            r = !0, i = e
                        } finally {
                            try {
                                n || null == o.return || o.return()
                            } finally {
                                if (r) throw i
                            }
                        }
                        return t.toBytes()
                    }(e.attributes);
                    t.writeVarint(iX), t.writeBytes(n)
                }
                return t.toBytes()
            }

            function i7(e, t, n) {
                var r = new i4;
                r.writeVarint(i$), r.writeVarint(n);
                var i = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var l, s = e[Symbol.iterator](); !(i = (l = s.next()).done); i = !0) {
                        var u = l.value;
                        r.writeVarint(iQ), r.writeBytes(u)
                    }
                } catch (e) {
                    a = !0, o = e
                } finally {
                    try {
                        i || null == s.return || s.return()
                    } finally {
                        if (a) throw o
                    }
                }
                var c = !0,
                    d = !1,
                    f = void 0;
                try {
                    for (var h, p = t[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                        var m = h.value;
                        r.writeVarint(i0), r.writeBytes(m)
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

            function i9(e) {
                var t = new i4;
                t.writeVarint(i1), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(i2), t.writeBytes(e);
                var n = t.toBytes(),
                    r = new i4;
                return r.writeVarint(i3), r.writeBytes(n), r.toBytes()
            }
            var ae = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function at(e) {
                return ae.test(e)
            }
            var an = [],
                ar = !1,
                ai = !1;

            function aa(e, t) {
                var n, r, i = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || ai || "u" > typeof document && "hidden" === document.visibilityState ? (n = i9(i7(i.map(i8), [], a)).buffer, fetch("".concat(iF()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: n,
                    credentials: "include",
                    keepalive: !0
                }).catch(iH)) : (r = i9(i7(i.map(i8), [], a)), eD(function() {
                    var e, t, n, i, a, o, l, s, u, c, d, f, h;
                    return eM(this, function(p) {
                        switch (p.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: r.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(r).catch(iH), t.close().catch(iH), n = [], [4, (i = e.readable.getReader()).read()];
                            case 1:
                                a = p.sent(), p.label = 2;
                            case 2:
                                if (a.done) return [3, 4];
                                return n.push(a.value), [4, i.read()];
                            case 3:
                                return a = p.sent(), [3, 2];
                            case 4:
                                o = new Uint8Array(n.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), l = 0, s = !0, u = !1, c = void 0;
                                try {
                                    for (d = n[Symbol.iterator](); !(s = (f = d.next()).done); s = !0) h = f.value, o.set(h, l), l += h.length
                                } catch (e) {
                                    u = !0, c = e
                                } finally {
                                    try {
                                        s || null == d.return || d.return()
                                    } finally {
                                        if (u) throw c
                                    }
                                }
                                return [2, {
                                    body: o.buffer,
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
                    return n && (r["Content-Encoding"] = "gzip"), fetch("".concat(iF()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: r,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(iH)
            }

            function ao() {
                var e = !0,
                    t = !1,
                    n = void 0;
                try {
                    for (var r, i = an[Symbol.iterator](); !(e = (r = i.next()).done); e = !0) {
                        var a = r.value.splice(0);
                        0 !== a.length && aa(a, !0)
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

            function al(e, t) {
                var n, r, i, a = Math.max(1, null != (n = null == t ? void 0 : t.batchSize) ? n : 10),
                    o = null != (r = null == t ? void 0 : t.batchIntervalMs) ? r : 250;

                function l(e, n) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, n): console.error(e, n)
                }
                if (!at(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var s = [];
                return an.push(s), ar || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && ao()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        ai = !0, ao()
                    }), ar = !0),
                    function(t, n, r) {
                        var u = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!at(e)) return !1;
                                if (t) {
                                    var n = !0,
                                        r = !1,
                                        i = void 0;
                                    try {
                                        for (var a, o = Object.keys(t)[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) {
                                            var l = a.value;
                                            if (!at(l)) return !1
                                        }
                                    } catch (e) {
                                        r = !0, i = e
                                    } finally {
                                        try {
                                            n || null == o.return || o.return()
                                        } finally {
                                            if (r) throw i
                                        }
                                    }
                                }
                                return !0
                            }(u, n)) return void l("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: t,
                            attributes: n
                        });
                        var c = null != r ? r : 1;
                        if (!Number.isFinite(c)) return void l("@rbx/web-telemetry: value must be a finite number", {
                            name: t,
                            attributes: n
                        });
                        var d = n && Object.keys(n).length > 0 ? n : void 0;
                        s.push({
                            name: u,
                            attributes: d,
                            value: c,
                            timestampMs: BigInt(Date.now())
                        }), s.length >= a ? (void 0 !== i && (clearTimeout(i), i = void 0), aa(s.splice(0, a))) : void 0 === i && (i = setTimeout(function() {
                            for (i = void 0; s.length > 0;) aa(s.splice(0, a))
                        }, o))
                    }
            }
            var as = "WwwCommon",
                au = function(e) {
                    var t = e.publish,
                        n = e.captureException,
                        r = e.featureName;

                    function i(e, t, i) {
                        if (null != i) {
                            var a = (0, tU._)(i, Error) ? i.name || "Error" : "UnknownError",
                                o = r ? "".concat(r, "_").concat(e) : e;
                            return null == n || n(i, {
                                error_counter: o
                            }), e6(ez({}, t), {
                                errorType: a
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = tx(n, 2);
                            t(i[0], i[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var a = tx(n, 3),
                                o = a[0],
                                l = a[1],
                                s = a[2],
                                u = i(o, e6(ez({}, null != l ? l : {}), {
                                    severity: "error"
                                }), s);
                            t(o, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var a = tx(n, 3),
                                o = a[0],
                                l = a[1],
                                s = a[2],
                                u = i(o, e6(ez({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), s);
                            t(o, u)
                        }
                    }
                }({
                    publish: al(as)
                });
            au.trackCounter;
            var ac = au.trackError;
            au.trackCriticalError;
            var ad = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                af = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                ah = function(e, t, n) {
                    var r;
                    "u" > typeof window && ac(e, {
                        key: n,
                        namespace: t,
                        internalPageName: null != (r = ad()) ? r : "unknown"
                    })
                },
                ap = function(e) {
                    var t, n, r, i, a, o, l, s, u, c, d, f, h, p = (t = ij(e), n = {
                        "!": iO().messages
                    }, r = t ? "!.".concat(t) : "!", a = (i = iO()).cache, o = i.formats, l = i.formatters, s = i.getMessageFallback, u = i.locale, c = i.onError, d = i.timeZone, f = n["!"], h = "!" === r ? void 0 : r.slice(2), d || iN || !iR || (iN = !0, c(new rY(rJ.ENVIRONMENT_FALLBACK, void 0))), (0, ej.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, n) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var r = n ? iT(e, t, n) : t;
                                    if (!r) throw Error(n);
                                    return r
                                } catch (e) {
                                    return new rY(rJ.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: a,
                                formatters: l,
                                getMessageFallback: s,
                                messages: f,
                                namespace: h,
                                onError: c,
                                formats: o,
                                locale: u,
                                timeZone: d
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    n = e.formats,
                                    r = e.formatters,
                                    i = e.getMessageFallback,
                                    a = void 0 === i ? iA : i,
                                    o = e.locale,
                                    l = e.messagesOrError,
                                    s = e.namespace,
                                    u = e.onError,
                                    c = e.timeZone,
                                    d = (0, tU._)(l, rY);

                                function f(e, t, n, r) {
                                    var i = new rY(t, n);
                                    return u(i), null != r ? r : a({
                                        error: i,
                                        key: e,
                                        namespace: s
                                    })
                                }

                                function h(e, i, h, p) {
                                    var m, v, y;
                                    if (d) {
                                        if (!p) return u(l), a({
                                            error: l,
                                            key: e,
                                            namespace: s
                                        });
                                        m = p
                                    } else try {
                                        m = iT(o, l, e, s)
                                    } catch (t) {
                                        if (!p) return f(e, rJ.MISSING_MESSAGE, t.message, p);
                                        m = p
                                    }
                                    try {
                                        var g, b = ix(s, e);
                                        return iS(b, m, i ? (g = {}, Object.keys(i).forEach(function(e) {
                                            var t, n = 0,
                                                r = i[e];
                                            t = "function" == typeof r ? function(t) {
                                                var i = r(t);
                                                return (0, ej.isValidElement)(i) ? (0, ej.cloneElement)(i, {
                                                    key: e + n++
                                                }) : i
                                            } : r, g[e] = t
                                        }), g) : i, {
                                            cache: t,
                                            formatters: r,
                                            globalFormats: n,
                                            formats: h,
                                            locale: o,
                                            timeZone: c
                                        })
                                    } catch (t) {
                                        return (0, tU._)(t, rY) ? (v = t.code, y = t.originalMessage) : (v = rJ.FORMATTING_ERROR, y = t.message), f(e, v, y, p)
                                    }
                                }

                                function p(e, t, n, r) {
                                    var i = h(e, t, n, r);
                                    return "string" != typeof i ? f(e, rJ.INVALID_MESSAGE, void 0) : i
                                }
                                return p.rich = h, p.markup = function(e, t, n, r) {
                                    return h(e, t, n, r)
                                }, p.raw = function(e) {
                                    if (d) return u(l), a({
                                        error: l,
                                        key: e,
                                        namespace: s
                                    });
                                    try {
                                        return iT(o, l, e, s)
                                    } catch (t) {
                                        return f(e, rJ.MISSING_MESSAGE, t.message)
                                    }
                                }, p.has = function(e) {
                                    if (d) return !1;
                                    try {
                                        return iT(o, l, e, s), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, p
                            }(e6(ez({}, e), {
                                messagesOrError: t
                            }))
                    }, [a, l, s, f, h, c, o, u, d]));
                    return (0, ej.useMemo)(function() {
                        return Object.assign(function(t, n, r) {
                            var i = ij(t);
                            return void 0 === r || p.has(i) ? p(i, n) : (ah("TranslationKeyNotFound", e, i), r)
                        }, {
                            rich: function(e, t) {
                                return p.rich(ij(e), t)
                            },
                            has: function(e) {
                                return af(e) && p.has(ij(e))
                            },
                            dynamic: function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!af(t)) return ah("TranslationKeyNotFound", e, String(t)), r;
                                var i = ij(t),
                                    a = p.has(i);
                                return a || ah("TranslationKeyNotFound", e, i), a ? p(i, n) : r
                            },
                            html: function(t, n, r) {
                                if (!af(t)) return ah("TranslationKeyNotFound", e, String(t)), null;
                                var i = ij(t);
                                if (!p.has(i)) return ah("TranslationKeyNotFound", e, i), null;
                                var a = iM(function(e) {
                                    return p(i, e)
                                }, n, r);
                                return null == a && ah("TranslationMalformed", e, i), a
                            }
                        })
                    }, [p, e])
                },
                am = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding", "Feature.Build", "Feature.Friends"],
                av = function() {
                    var e = tx(am, 7),
                        t = e[0],
                        n = e[1],
                        r = e[2],
                        i = e[3],
                        a = e[4],
                        o = e[5],
                        l = e[6],
                        s = ap(t),
                        u = ap(n),
                        c = ap(r),
                        d = ap(i),
                        f = ap(a),
                        h = ap(o),
                        p = ap(l);
                    return (0, ej.useMemo)(function() {
                        var e = [p, h, f, d, c, u, s];
                        return function(t, n, r) {
                            var i = e.find(function(e) {
                                return e.has(t)
                            });
                            return i ? i.dynamic(t, n && Object.fromEntries(Object.entries(n).filter(function(e) {
                                return "string" == typeof e[1] || "number" == typeof e[1] || (0, tU._)(e[1], Date)
                            }))) : null != r ? r : ""
                        }
                    }, [s, u, c, d, f, h, p])
                },
                ay = function(e) {
                    var t = e.onButtonClick,
                        n = e.buttonWidth,
                        r = e.buttonClassName,
                        i = av();
                    return (0, ri.jsxs)(eF().Fragment, {
                        children: [(0, ri.jsx)(rL, {
                            "data-testid": "play-action-needed-button",
                            variant: "Emphasis",
                            style: rj,
                            className: ro()(rM(void 0 === n ? rD : n), void 0 === r ? "btn-common-play-game-action-needed-lg game-play-button-action-needed-lg" : r),
                            onClick: t,
                            children: i(te.Unlock)
                        }), (0, ri.jsx)("div", {
                            id: "access-management-upsell-container-v1"
                        })]
                    })
                },
                ag = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.pageContext,
                        i = (0, ej.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), eJ(tn.PlayButtonUpsellExperienceApprovalTriggered), n7(t, tr.experienceApprovalUpsellName, e8.ContextualPlayabilityRequireParentApproval, r);
                            var n = nW();
                            n ? n({
                                featureName: "CanApproveExperience",
                                namespace: to.accountManagement,
                                isAsyncCall: !1,
                                usePrologue: !0,
                                ampRecourseData: {
                                    universeId: t,
                                    experienceManagementAction: "Approve"
                                }
                            }).catch(function() {
                                eJ(tn.PlayButtonUpsellExperienceApprovalError)
                            }) : eJ(tn.PlayButtonUpsellExperienceApprovalError)
                        }, [t, r]);
                    return (0, ri.jsx)(ay, {
                        onButtonClick: i,
                        buttonClassName: n
                    })
                };
            ag.defaultProps = {
                buttonClassName: void 0
            };
            var ab = function(e) {
                    var t = e.buttonClassName,
                        n = e.buttonWidth;
                    return (0, ri.jsx)(rL, {
                        "data-testid": "play-button-loading",
                        variant: "Emphasis",
                        isLoading: !0,
                        "aria-label": "Loading",
                        style: rj,
                        className: ro()(rM(void 0 === n ? rD : n), void 0 === t ? "btn-common-play-game-lg game-play-button-lg" : t)
                    })
                },
                aw = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                aE = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                aP = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        i = e.className,
                        a = tu(e, ["variant", "size", "isCircular", "className"]);
                    return eF().createElement("button", ez({
                        type: "button",
                        className: rm("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", rv, aE[t], aw[n], r && "radius-circle", i)
                    }, a), eF().createElement(ry, null), eF().createElement(rw, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };

            function aI(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    i = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === i || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function aS() {
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
                            return ez({}, e, r(t)["__scope".concat(i)])
                        }, {});
                        return ej.useMemo(function() {
                            return eG({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return i.scopeName = r.scopeName, i
            }
            var ax = (null == (ey = globalThis) ? void 0 : ey.document) ? ej.useLayoutEffect : function() {},
                aA = ej[" useId ".trim().toString()] || function() {},
                aC = 0;

            function aT(e) {
                var t = tx(ej.useState(aA()), 2),
                    n = t[0],
                    r = t[1];
                return ax(function() {
                    e || r(function(e) {
                        return null != e ? e : String(aC++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function ak(e) {
                var t = ej.useRef(e);
                return ej.useEffect(function() {
                    t.current = e
                }), ej.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(tq(r)))
                    }
                }, [])
            }
            var a_ = window.RadixUI["react-dismissable-layer"],
                aO = window.RadixUI["react-focus-scope"],
                aN = window.ReactDOM,
                aR = n.n(aN);

            function aL(e) {
                var t, n, r = (t = e, (n = ej.forwardRef(function(e, t) {
                        var n = e.children,
                            r = tu(e, ["children"]);
                        if (ej.isValidElement(n)) {
                            var i, a, o, l, s, u = (s = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (s = (l = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                c = function(e, t) {
                                    var n = ez({}, t);
                                    for (var r in t) ! function(r) {
                                        var i = e[r],
                                            a = t[r];
                                        /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            a.apply(void 0, tq(t)), i.apply(void 0, tq(t))
                                        } : i && (n[r] = i) : "style" === r ? n[r] = ez({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                    }(r);
                                    return ez({}, e, n)
                                }(r, n.props);
                            return n.type !== ej.Fragment && (c.ref = t ? rP(t, u) : u), ej.cloneElement(n, c)
                        }
                        return ej.Children.count(n) > 1 ? ej.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    i = ej.forwardRef(function(e, t) {
                        var n = e.children,
                            i = tu(e, ["children"]),
                            a = ej.Children.toArray(n),
                            o = a.find(aB);
                        if (o) {
                            var l = o.props.children,
                                s = a.map(function(e) {
                                    return e !== o ? e : ej.Children.count(l) > 1 ? ej.Children.only(null) : ej.isValidElement(l) ? l.props.children : null
                                });
                            return (0, ri.jsx)(r, e6(ez({}, i), {
                                ref: t,
                                children: ej.isValidElement(l) ? ej.cloneElement(l, void 0, s) : null
                            }))
                        }
                        return (0, ri.jsx)(r, e6(ez({}, i), {
                            ref: t,
                            children: n
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var aU = Symbol("radix.slottable");

            function aB(e) {
                return ej.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === aU
            }
            var aD = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = aL("Primitive.".concat(t)),
                        r = ej.forwardRef(function(e, r) {
                            var i = e.asChild,
                                a = tu(e, ["asChild"]),
                                o = i ? n : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ri.jsx)(o, e6(ez({}, a), {
                                ref: r
                            }))
                        });
                    return r.displayName = "Primitive.".concat(t), e6(ez({}, e), eG({}, t, r))
                }, {}),
                aM = ej.forwardRef(function(e, t) {
                    var n, r, i = e.container,
                        a = tu(e, ["container"]),
                        o = tx(ej.useState(!1), 2),
                        l = o[0],
                        s = o[1];
                    ax(function() {
                        return s(!0)
                    }, []);
                    var u = i || l && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
                    return u ? aR().createPortal((0, ri.jsx)(aD.div, e6(ez({}, a), {
                        ref: t
                    })), u) : null
                });
            aM.displayName = "Portal";
            var aj = function(e) {
                var t, n, r, i, a, o, l, s, u, c, d, f, h, p, m, v, y, g = e.present,
                    b = e.children,
                    w = (t = g, a = (i = tx(ej.useState(), 2))[0], o = i[1], l = ej.useRef({}), s = ej.useRef(t), u = ej.useRef("none"), d = (c = tx((n = t ? "mounted" : "unmounted", r = {
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
                    }, ej.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], f = c[1], ej.useEffect(function() {
                        var e = aF(l.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), ax(function() {
                        var e = l.current,
                            n = s.current;
                        if (n !== t) {
                            var r = u.current,
                                i = aF(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : n && r !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), s.current = t
                        }
                    }, [t, f]), ax(function() {
                        if (a) {
                            var e, t, n = null != (e = a.ownerDocument.defaultView) ? e : window,
                                r = function(e) {
                                    var r = aF(l.current).includes(e.animationName);
                                    if (e.target === a && r && (f("ANIMATION_END"), !s.current)) {
                                        var i = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === a && (u.current = aF(l.current))
                                };
                            return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", r), a.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(t), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", r), a.removeEventListener("animationend", r)
                                }
                        }
                        f("ANIMATION_END")
                    }, [a, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: ej.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), o(e)
                        }, [])
                    }),
                    E = "function" == typeof b ? b({
                        present: w.isPresent
                    }) : ej.Children.only(b),
                    P = rI(w.ref, (y = (v = null == (p = Object.getOwnPropertyDescriptor((h = E).props, "ref")) ? void 0 : p.get) && "isReactWarning" in v && v.isReactWarning) ? h.ref : (y = (v = null == (m = Object.getOwnPropertyDescriptor(h, "ref")) ? void 0 : m.get) && "isReactWarning" in v && v.isReactWarning) ? h.props.ref : h.props.ref || h.ref);
                return "function" == typeof b || w.isPresent ? ej.cloneElement(E, {
                    ref: P
                }) : null
            };

            function aF(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            aj.displayName = "Presence";
            var aH = window.RadixUI["react-focus-guards"],
                aG = function() {
                    return (aG = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function az(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) 0 > t.indexOf(r[i]) && Object.prototype.propertyIsEnumerable.call(e, r[i]) && (n[r[i]] = e[r[i]]);
                return n
            }
            var aV = "right-scroll-bar-position",
                aW = "width-before-scroll-bar";

            function aq(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var aK = "u" > typeof window ? ej.useLayoutEffect : ej.useEffect,
                aZ = new WeakMap,
                aY = (void 0 === b && (b = {}), (void 0 === w && (w = function(e) {
                    return e
                }), E = [], P = !1, I = {
                    read: function() {
                        if (P) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return E.length ? E[E.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = w(e, P);
                        return E.push(t),
                            function() {
                                E = E.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (P = !0; E.length;) {
                            var t = E;
                            E = [], t.forEach(e)
                        }
                        E = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return E
                            }
                        }
                    },
                    assignMedium: function(e) {
                        P = !0;
                        var t = [];
                        if (E.length) {
                            var n = E;
                            E = [], n.forEach(e), t = E
                        }
                        var r = function() {
                                var n = t;
                                t = [], n.forEach(e)
                            },
                            i = function() {
                                return Promise.resolve().then(r)
                            };
                        i(), E = {
                            push: function(e) {
                                t.push(e), i()
                            },
                            filter: function(e) {
                                return t = t.filter(e), E
                            }
                        }
                    }
                }).options = aG({
                    async: !0,
                    ssr: !1
                }, b), I),
                aJ = function() {},
                aX = ej.forwardRef(function(e, t) {
                    var n, r, i, a, o = ej.useRef(null),
                        l = ej.useState({
                            onScrollCapture: aJ,
                            onWheelCapture: aJ,
                            onTouchMoveCapture: aJ
                        }),
                        s = l[0],
                        u = l[1],
                        c = e.forwardProps,
                        d = e.children,
                        f = e.className,
                        h = e.removeScrollBar,
                        p = e.enabled,
                        m = e.shards,
                        v = e.sideCar,
                        y = e.noRelative,
                        g = e.noIsolation,
                        b = e.inert,
                        w = e.allowPinchZoom,
                        E = e.as,
                        P = e.gapMode,
                        I = az(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (n = [o, t], r = function(e) {
                            return n.forEach(function(t) {
                                return aq(t, e)
                            })
                        }, (i = (0, ej.useState)(function() {
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
                        })[0]).callback = r, a = i.facade, aK(function() {
                            var e = aZ.get(a);
                            if (e) {
                                var t = new Set(e),
                                    r = new Set(n),
                                    i = a.current;
                                t.forEach(function(e) {
                                    r.has(e) || aq(e, null)
                                }), r.forEach(function(e) {
                                    t.has(e) || aq(e, i)
                                })
                            }
                            aZ.set(a, n)
                        }, [n]), a),
                        x = aG(aG({}, I), s);
                    return ej.createElement(ej.Fragment, null, p && ej.createElement(v, {
                        sideCar: aY,
                        removeScrollBar: h,
                        shards: m,
                        noRelative: y,
                        noIsolation: g,
                        inert: b,
                        setCallbacks: u,
                        allowPinchZoom: !!w,
                        lockRef: o,
                        gapMode: P
                    }), c ? ej.cloneElement(ej.Children.only(d), aG(aG({}, x), {
                        ref: S
                    })) : ej.createElement(void 0 === E ? "div" : E, aG({}, x, {
                        className: f,
                        ref: S
                    }), d))
                });
            aX.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, aX.classNames = {
                fullWidth: aW,
                zeroRight: aV
            };
            var a$ = function(e) {
                var t = e.sideCar,
                    n = az(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var r = t.read();
                if (!r) throw Error("Sidecar medium not found");
                return ej.createElement(r, aG({}, n))
            };
            a$.isSideCarExport = !0;
            var aQ = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = eg || n.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var i, a;
                                (i = t).styleSheet ? i.styleSheet.cssText = r : i.appendChild(document.createTextNode(r)), a = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(a)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                a0 = function() {
                    var e = aQ();
                    return function(t, n) {
                        ej.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && n])
                    }
                },
                a1 = function() {
                    var e = a0();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                a2 = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                a3 = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                a5 = function(e) {
                    var t = window.getComputedStyle(document.body),
                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [a3(n), a3(r), a3(i)]
                },
                a4 = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return a2;
                    var t = a5(e),
                        n = document.documentElement.clientWidth,
                        r = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, r - n + t[2] - t[0])
                    }
                },
                a6 = a1(),
                a8 = "data-scroll-locked",
                a7 = function(e, t, n, r) {
                    var i = e.left,
                        a = e.top,
                        o = e.right,
                        l = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(l, "px ").concat(r, ";\n  }\n  body[").concat(a8, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(o, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(l, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(aV, " {\n    right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(aW, " {\n    margin-right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(aV, " .").concat(aV, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(aW, " .").concat(aW, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(a8, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                a9 = function() {
                    var e = parseInt(document.body.getAttribute(a8) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                oe = function() {
                    ej.useEffect(function() {
                        return document.body.setAttribute(a8, (a9() + 1).toString()),
                            function() {
                                var e = a9() - 1;
                                e <= 0 ? document.body.removeAttribute(a8) : document.body.setAttribute(a8, e.toString())
                            }
                    }, [])
                },
                ot = function(e) {
                    var t = e.noRelative,
                        n = e.noImportant,
                        r = e.gapMode,
                        i = void 0 === r ? "margin" : r;
                    oe();
                    var a = ej.useMemo(function() {
                        return a4(i)
                    }, [i]);
                    return ej.createElement(a6, {
                        styles: a7(a, !t, i, n ? "" : "!important")
                    })
                },
                on = !1;
            if ("u" > typeof window) try {
                var or = Object.defineProperty({}, "passive", {
                    get: function() {
                        return on = !0, !0
                    }
                });
                window.addEventListener("test", or, or), window.removeEventListener("test", or, or)
            } catch (e) {
                on = !1
            }
            var oi = !!on && {
                    passive: !1
                },
                oa = function(e, t) {
                    if (!(0, tU._)(e, Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
                },
                oo = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("u" > typeof ShadowRoot && (0, tU._)(r, ShadowRoot) && (r = r.host), ol(e, r)) {
                            var i = os(e, r);
                            if (i[1] > i[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                ol = function(e, t) {
                    return "v" === e ? oa(t, "overflowY") : oa(t, "overflowX")
                },
                os = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                ou = function(e, t, n, r, i) {
                    var a, o = (a = window.getComputedStyle(t).direction, "h" === e && "rtl" === a ? -1 : 1),
                        l = o * r,
                        s = n.target,
                        u = t.contains(s),
                        c = !1,
                        d = l > 0,
                        f = 0,
                        h = 0;
                    do {
                        if (!s) break;
                        var p = os(e, s),
                            m = p[0],
                            v = p[1] - p[2] - o * m;
                        (m || v) && ol(e, s) && (f += v, h += m);
                        var y = s.parentNode;
                        s = y && y.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? y.host : y
                    } while (!u && s !== document.body || u && (t.contains(s) || t === s));
                    return d && (i && 1 > Math.abs(f) || !i && l > f) ? c = !0 : !d && (i && 1 > Math.abs(h) || !i && -l > h) && (c = !0), c
                },
                oc = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                od = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                of = function(e) {
                    return e && "current" in e ? e.current : e
                },
                oh = 0,
                op = [],
                om = (S = function(e) {
                    var t = ej.useRef([]),
                        n = ej.useRef([0, 0]),
                        r = ej.useRef(),
                        i = ej.useState(oh++)[0],
                        a = ej.useState(a1)[0],
                        o = ej.useRef(e);
                    ej.useEffect(function() {
                        o.current = e
                    }, [e]), ej.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, n) {
                                if (n || 2 == arguments.length)
                                    for (var r, i = 0, a = t.length; i < a; i++) !r && i in t || (r || (r = Array.prototype.slice.call(t, 0, i)), r[i] = t[i]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(of), !0).filter(Boolean);
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
                    var l = ej.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !o.current.allowPinchZoom;
                            var i, a = oc(e),
                                l = n.current,
                                s = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                c = e.target,
                                d = Math.abs(s) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === c.type) return !1;
                            var f = oo(d, c);
                            if (!f) return !0;
                            if (f ? i = d : (i = "v" === d ? "h" : "v", f = oo(d, c)), !f) return !1;
                            if (!r.current && "changedTouches" in e && (s || u) && (r.current = i), !i) return !0;
                            var h = r.current || i;
                            return ou(h, t, e, "h" === h ? s : u, !0)
                        }, []),
                        s = ej.useCallback(function(e) {
                            if (op.length && op[op.length - 1] === a) {
                                var n = "deltaY" in e ? od(e) : oc(e),
                                    r = t.current.filter(function(t) {
                                        var r;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                                    })[0];
                                if (r && r.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!r) {
                                    var i = (o.current.shards || []).map(of).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? l(e, i[0]) : !o.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = ej.useCallback(function(e, n, r, i) {
                            var a = {
                                name: e,
                                delta: n,
                                target: r,
                                should: i,
                                shadowParent: function(e) {
                                    for (var t = null; null !== e;)(0, tU._)(e, ShadowRoot) && (t = e.host, e = e.host), e = e.parentNode;
                                    return t
                                }(r)
                            };
                            t.current.push(a), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== a
                                })
                            }, 1)
                        }, []),
                        c = ej.useCallback(function(e) {
                            n.current = oc(e), r.current = void 0
                        }, []),
                        d = ej.useCallback(function(t) {
                            u(t.type, od(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        f = ej.useCallback(function(t) {
                            u(t.type, oc(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    ej.useEffect(function() {
                        return op.push(a), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", s, oi), document.addEventListener("touchmove", s, oi), document.addEventListener("touchstart", c, oi),
                            function() {
                                op = op.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", s, oi), document.removeEventListener("touchmove", s, oi), document.removeEventListener("touchstart", c, oi)
                            }
                    }, []);
                    var h = e.removeScrollBar,
                        p = e.inert;
                    return ej.createElement(ej.Fragment, null, p ? ej.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, h ? ej.createElement(ot, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, aY.useMedium(S), a$),
                ov = ej.forwardRef(function(e, t) {
                    return ej.createElement(aX, aG({}, e, {
                        ref: t,
                        sideCar: om
                    }))
                });
            ov.classNames = aX.classNames;
            var oy = new WeakMap,
                og = new WeakMap,
                ob = {},
                ow = 0,
                oE = function(e) {
                    return e && (e.host || oE(e.parentNode))
                },
                oP = function(e, t, n, r) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var n = oE(e);
                        return n && t.contains(n) ? n : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    ob[n] || (ob[n] = new WeakMap);
                    var a = ob[n],
                        o = [],
                        l = new Set,
                        s = new Set(i),
                        u = function(e) {
                            !e || l.has(e) || (l.add(e), u(e.parentNode))
                        };
                    i.forEach(u);
                    var c = function(e) {
                        !e || s.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) c(e);
                            else try {
                                var t = e.getAttribute(r),
                                    i = null !== t && "false" !== t,
                                    s = (oy.get(e) || 0) + 1,
                                    u = (a.get(e) || 0) + 1;
                                oy.set(e, s), a.set(e, u), o.push(e), 1 === s && i && og.set(e, !0), 1 === u && e.setAttribute(n, "true"), i || e.setAttribute(r, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return c(t), l.clear(), ow++,
                        function() {
                            o.forEach(function(e) {
                                var t = oy.get(e) - 1,
                                    i = a.get(e) - 1;
                                oy.set(e, t), a.set(e, i), t || (og.has(e) || e.removeAttribute(r), og.delete(e)), i || e.removeAttribute(n)
                            }), --ow || (oy = new WeakMap, oy = new WeakMap, og = new WeakMap, ob = {})
                        }
                },
                oI = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (r.push.apply(r, Array.from(i.querySelectorAll("[aria-live], script"))), oP(r, i, n, "aria-hidden")) : function() {
                        return null
                    }
                },
                oS = "Dialog",
                ox = tx(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        r = function() {
                            var t = n.map(function(e) {
                                return ej.createContext(e)
                            });
                            return function(n) {
                                var r = (null == n ? void 0 : n[e]) || t;
                                return ej.useMemo(function() {
                                    return eG({}, "__scope".concat(e), e6(ez({}, n), eG({}, e, r)))
                                }, [n, r])
                            }
                        };
                    return r.scopeName = e, [function(t, r) {
                        var i = ej.createContext(r),
                            a = n.length;
                        n = tq(n).concat([r]);
                        var o = function(t) {
                            var n, r = t.scope,
                                o = t.children,
                                l = tu(t, ["scope", "children"]),
                                s = (null == r || null == (n = r[e]) ? void 0 : n[a]) || i,
                                u = ej.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, ri.jsx)(s.Provider, {
                                value: u,
                                children: o
                            })
                        };
                        return o.displayName = t + "Provider", [o, function(n, o) {
                            var l, s = (null == o || null == (l = o[e]) ? void 0 : l[a]) || i,
                                u = ej.useContext(s);
                            if (u) return u;
                            if (void 0 !== r) return r;
                            throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                        }]
                    }, aS.apply(void 0, [r].concat(tq(t)))]
                }(oS), 2),
                oA = ox[0];
            ox[1];
            var oC = tx(oA(oS), 2),
                oT = oC[0],
                ok = oC[1],
                o_ = function(e) {
                    var t, n, r, i, a, o, l, s, u, c, d, f, h, p, m, v, y, g = e.__scopeDialog,
                        b = e.children,
                        w = e.open,
                        E = e.defaultOpen,
                        P = e.onOpenChange,
                        I = e.modal,
                        S = ej.useRef(null),
                        x = ej.useRef(null),
                        A = tx((u = (s = {
                            prop: w,
                            defaultProp: E,
                            onChange: P
                        }).prop, h = (f = tx((n = (t = {
                            defaultProp: s.defaultProp,
                            onChange: d = void 0 === (c = s.onChange) ? function() {} : c
                        }).defaultProp, r = t.onChange, a = tx(i = ej.useState(n), 1)[0], o = ej.useRef(a), l = ak(r), ej.useEffect(function() {
                            o.current !== a && (l(a), o.current = a)
                        }, [a, o, l]), i), 2))[0], p = f[1], v = (m = void 0 !== u) ? u : h, y = ak(d), [v, ej.useCallback(function(e) {
                            if (m) {
                                var t = "function" == typeof e ? e(u) : e;
                                t !== u && y(t)
                            } else p(e)
                        }, [m, u, p, y])]), 2),
                        C = A[0],
                        T = A[1];
                    return (0, ri.jsx)(oT, {
                        scope: g,
                        triggerRef: S,
                        contentRef: x,
                        contentId: aT(),
                        titleId: aT(),
                        descriptionId: aT(),
                        open: void 0 !== C && C,
                        onOpenChange: T,
                        onOpenToggle: ej.useCallback(function() {
                            return T(function(e) {
                                return !e
                            })
                        }, [T]),
                        modal: void 0 === I || I,
                        children: b
                    })
                };
            o_.displayName = oS;
            var oO = "DialogTrigger";
            ej.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = tu(e, ["__scopeDialog"]),
                    i = ok(oO, n),
                    a = rI(t, i.triggerRef);
                return (0, ri.jsx)(aD.button, e6(ez({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": oX(i.open)
                }, r), {
                    ref: a,
                    onClick: aI(e.onClick, i.onOpenToggle)
                }))
            }).displayName = oO;
            var oN = "DialogPortal",
                oR = tx(oA(oN, {
                    forceMount: void 0
                }), 2),
                oL = oR[0],
                oU = oR[1],
                oB = function(e) {
                    var t = e.__scopeDialog,
                        n = e.forceMount,
                        r = e.children,
                        i = e.container,
                        a = ok(oN, t);
                    return (0, ri.jsx)(oL, {
                        scope: t,
                        forceMount: n,
                        children: ej.Children.map(r, function(e) {
                            return (0, ri.jsx)(aj, {
                                present: n || a.open,
                                children: (0, ri.jsx)(aM, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            oB.displayName = oN;
            var oD = "DialogOverlay",
                oM = ej.forwardRef(function(e, t) {
                    var n = oU(oD, e.__scopeDialog),
                        r = e.forceMount,
                        i = void 0 === r ? n.forceMount : r,
                        a = tu(e, ["forceMount"]),
                        o = ok(oD, e.__scopeDialog);
                    return o.modal ? (0, ri.jsx)(aj, {
                        present: i || o.open,
                        children: (0, ri.jsx)(oF, e6(ez({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            oM.displayName = oD;
            var oj = aL("DialogOverlay.RemoveScroll"),
                oF = ej.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = tu(e, ["__scopeDialog"]),
                        i = ok(oD, n);
                    return (0, ri.jsx)(ov, {
                        as: oj,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, ri.jsx)(aD.div, e6(ez({
                            "data-state": oX(i.open)
                        }, r), {
                            ref: t,
                            style: ez({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                }),
                oH = "DialogContent",
                oG = ej.forwardRef(function(e, t) {
                    var n = oU(oH, e.__scopeDialog),
                        r = e.forceMount,
                        i = void 0 === r ? n.forceMount : r,
                        a = tu(e, ["forceMount"]),
                        o = ok(oH, e.__scopeDialog);
                    return (0, ri.jsx)(aj, {
                        present: i || o.open,
                        children: o.modal ? (0, ri.jsx)(oz, e6(ez({}, a), {
                            ref: t
                        })) : (0, ri.jsx)(oV, e6(ez({}, a), {
                            ref: t
                        }))
                    })
                });
            oG.displayName = oH;
            var oz = ej.forwardRef(function(e, t) {
                    var n = ok(oH, e.__scopeDialog),
                        r = ej.useRef(null),
                        i = rI(t, n.contentRef, r);
                    return ej.useEffect(function() {
                        var e = r.current;
                        if (e) return oI(e)
                    }, []), (0, ri.jsx)(oW, e6(ez({}, e), {
                        ref: i,
                        trapFocus: n.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: aI(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = n.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: aI(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                n = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || n) && e.preventDefault()
                        }),
                        onFocusOutside: aI(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                oV = ej.forwardRef(function(e, t) {
                    var n = ok(oH, e.__scopeDialog),
                        r = ej.useRef(!1),
                        i = ej.useRef(!1);
                    return (0, ri.jsx)(oW, e6(ez({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var a, o;
                            null == (a = e.onCloseAutoFocus) || a.call(e, t), t.defaultPrevented || (r.current || null == (o = n.triggerRef.current) || o.focus(), t.preventDefault()), r.current = !1, i.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (a = e.onInteractOutside) || a.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                            var a, o, l = t.target;
                            (null == (o = n.triggerRef.current) ? void 0 : o.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                        }
                    }))
                }),
                oW = ej.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        o = tu(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = ok(oH, n),
                        s = ej.useRef(null),
                        u = rI(t, s);
                    return (0, aH.useFocusGuards)(), (0, ri.jsxs)(ri.Fragment, {
                        children: [(0, ri.jsx)(aO.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: r,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: a,
                            children: (0, ri.jsx)(a_.DismissableLayer, e6(ez({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": oX(l.open)
                            }, o), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, ri.jsxs)(ri.Fragment, {
                            children: [(0, ri.jsx)(o1, {
                                titleId: l.titleId
                            }), (0, ri.jsx)(o2, {
                                contentRef: s,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                oq = "DialogTitle",
                oK = ej.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = tu(e, ["__scopeDialog"]),
                        i = ok(oq, n);
                    return (0, ri.jsx)(aD.h2, e6(ez({
                        id: i.titleId
                    }, r), {
                        ref: t
                    }))
                });
            oK.displayName = oq;
            var oZ = "DialogDescription";
            ej.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = tu(e, ["__scopeDialog"]),
                    i = ok(oZ, n);
                return (0, ri.jsx)(aD.p, e6(ez({
                    id: i.descriptionId
                }, r), {
                    ref: t
                }))
            }).displayName = oZ;
            var oY = "DialogClose",
                oJ = ej.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = tu(e, ["__scopeDialog"]),
                        i = ok(oY, n);
                    return (0, ri.jsx)(aD.button, e6(ez({
                        type: "button"
                    }, r), {
                        ref: t,
                        onClick: aI(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function oX(e) {
                return e ? "open" : "closed"
            }
            oJ.displayName = oY;
            var o$ = "DialogTitleWarning",
                oQ = tx((x = {
                    contentName: oH,
                    titleName: oq,
                    docsSlug: "dialog"
                }, A = ej.createContext(x), (C = function(e) {
                    var t = e.children,
                        n = tu(e, ["children"]),
                        r = ej.useMemo(function() {
                            return n
                        }, Object.values(n));
                    return (0, ri.jsx)(A.Provider, {
                        value: r,
                        children: t
                    })
                }).displayName = o$ + "Provider", [C, function(e) {
                    var t = ej.useContext(A);
                    if (t) return t;
                    if (void 0 !== x) return x;
                    throw Error("`".concat(e, "` must be used within `").concat(o$, "`"))
                }]), 2),
                o0 = (oQ[0], oQ[1]),
                o1 = function(e) {
                    var t = e.titleId,
                        n = o0(o$),
                        r = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
                    return ej.useEffect(function() {
                        t && (document.getElementById(t) || console.error(r))
                    }, [r, t]), null
                },
                o2 = function(e) {
                    var t = e.contentRef,
                        n = e.descriptionId,
                        r = o0("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
                    return ej.useEffect(function() {
                        var e, r = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        n && r && (document.getElementById(n) || console.warn(i))
                    }, [i, t, n]), null
                },
                o3 = Symbol("radix.slottable");

            function o5(e) {
                return ej.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o3
            }
            var o4 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                    var n, r, i, a, o, l = (n = i = "Primitive.".concat(t), (r = ej.forwardRef(function(e, t) {
                            var n = e.children,
                                r = tu(e, ["children"]);
                            if (ej.isValidElement(n)) {
                                var i, a, o, l, s, u = (s = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (s = (l = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                    c = function(e, t) {
                                        var n = ez({}, t);
                                        for (var r in t) ! function(r) {
                                            var i = e[r],
                                                a = t[r];
                                            /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                var r = a.apply(void 0, tq(t));
                                                return i.apply(void 0, tq(t)), r
                                            } : i && (n[r] = i) : "style" === r ? n[r] = ez({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                        }(r);
                                        return ez({}, e, n)
                                    }(r, n.props);
                                return n.type !== ej.Fragment && (c.ref = t ? rP(t, u) : u), ej.cloneElement(n, c)
                            }
                            return ej.Children.count(n) > 1 ? ej.Children.only(null) : null
                        })).displayName = "".concat(n, ".SlotClone"), a = r, (o = ej.forwardRef(function(e, t) {
                            var n = e.children,
                                r = tu(e, ["children"]),
                                i = ej.Children.toArray(n),
                                o = i.find(o5);
                            if (o) {
                                var l = o.props.children,
                                    s = i.map(function(e) {
                                        return e !== o ? e : ej.Children.count(l) > 1 ? ej.Children.only(null) : ej.isValidElement(l) ? l.props.children : null
                                    });
                                return (0, ri.jsx)(a, e6(ez({}, r), {
                                    ref: t,
                                    children: ej.isValidElement(l) ? ej.cloneElement(l, void 0, s) : null
                                }))
                            }
                            return (0, ri.jsx)(a, e6(ez({}, r), {
                                ref: t,
                                children: n
                            }))
                        })).displayName = "".concat(i, ".Slot"), o),
                        s = ej.forwardRef(function(e, n) {
                            var r = e.asChild,
                                i = tu(e, ["asChild"]),
                                a = r ? l : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ri.jsx)(a, e6(ez({}, i), {
                                ref: n
                            }))
                        });
                    return s.displayName = "Primitive.".concat(t), e6(ez({}, e), eG({}, t, s))
                }, {}),
                o6 = Object.freeze({
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
                o8 = ej.forwardRef(function(e, t) {
                    return (0, ri.jsx)(o4.span, e6(ez({}, e), {
                        ref: t,
                        style: ez({}, o6, e.style)
                    }))
                });
            o8.displayName = "VisuallyHidden";
            var o7 = (0, ej.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                o9 = function() {
                    var e = (0, ej.useContext)(o7);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                le = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                lt = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                ln = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                lr = function(e) {
                    var t = e.open,
                        n = e.onOpenChange,
                        r = e.children,
                        i = e.size,
                        a = e.type,
                        o = void 0 === a ? "Default" : a,
                        l = e.isModal,
                        s = e.hasCloseAffordance,
                        u = e.closeLabel,
                        c = e.hasMarginTop,
                        d = void 0 === c || c,
                        f = e.hasMarginBottom,
                        h = void 0 === f || f,
                        p = e.hasDescription,
                        m = void 0 !== p && p,
                        v = e.experimentalDisablePointerEventsStylingOnBody,
                        y = void 0 !== v && v,
                        g = (0, ej.useMemo)(function() {
                            return {
                                size: i,
                                isModal: l,
                                type: o,
                                hasCloseAffordance: s,
                                closeLabel: u,
                                hasMarginTop: d,
                                hasMarginBottom: h,
                                hasDescription: m
                            }
                        }, [i, l, o, s, u, d, h, m]);
                    return (0, ej.useEffect)(function() {
                        y && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [y, t]), eF().createElement(o7.Provider, {
                        value: g
                    }, eF().createElement(o_, {
                        open: t,
                        onOpenChange: n
                    }, r))
                };
            lr.displayName = "Dialog";
            var li = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.style,
                    i = e.overlayClassName,
                    a = e.overlayStyle,
                    o = e.onOpenAutoFocus,
                    l = tu(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    s = o9(),
                    u = s.size,
                    c = s.isModal,
                    d = s.hasCloseAffordance,
                    f = s.closeLabel,
                    h = s.hasDescription,
                    p = rm("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", c && "bg-common-backdrop", i),
                    m = rm("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", n);
                return eF().createElement(oB, null, eF().createElement(oM, {
                    className: p,
                    style: a
                }, eF().createElement(oG, ez({
                    className: m,
                    "data-size": u,
                    style: r,
                    onOpenAutoFocus: o
                }, !h && {
                    "aria-describedby": void 0
                }, l), d && eF().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, eF().createElement(oJ, {
                    asChild: !0
                }, eF().createElement(aP, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            li.displayName = "DialogContent";
            var la = function(e) {
                var t = e.children,
                    n = e.className,
                    r = tu(e, ["children", "className"]),
                    i = o9(),
                    a = i.size,
                    o = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    s = rm(le[a], o && lt[a], l && ln[a], n);
                return eF().createElement("div", ez({
                    className: s
                }, r), t)
            };
            la.displayName = "DialogBody";
            var lo = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.hidden,
                    i = tu(e, ["children", "className", "hidden"]),
                    a = eF().createElement(oK, ez({
                        className: n
                    }, i), t);
                return r ? eF().createElement(o8, null, a) : a
            };
            lo.displayName = "DialogTitle";
            var ll = function(e) {
                var t = e.children,
                    n = e.className,
                    r = tu(e, ["children", "className"]),
                    i = o9().size,
                    a = rm(le[i], ln[i], n);
                return eF().createElement("div", ez({
                    className: a
                }, r), t)
            }; /*! @license DOMPurify 3.4.17 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.4.17/LICENSE */
            function ls(e, t) {
                this.v = e, this.k = t
            }

            function lu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function lc(e) {
                var t, n;

                function r(t, n) {
                    try {
                        var a = e[t](n),
                            o = a.value,
                            l = (0, tU._)(o, ls);
                        Promise.resolve(l ? o.v : o).then(function(n) {
                            if (l) {
                                var s = "return" === t && o.k ? t : "next";
                                if (!o.k || n.done) return r(s, n);
                                n = e[s](n).value
                            }
                            i(!!a.done, n)
                        }, function(e) {
                            r("throw", e)
                        })
                    } catch (e) {
                        i(2, e)
                    }
                }

                function i(e, i) {
                    2 === e ? t.reject(i) : t.resolve({
                        value: i,
                        done: e
                    }), (t = t.next) ? r(t.key, t.arg) : n = null
                }
                this._invoke = function(e, i) {
                    return new Promise(function(a, o) {
                        var l = {
                            key: e,
                            arg: i,
                            resolve: a,
                            reject: o,
                            next: null
                        };
                        n ? n = n.next = l : (t = n = l, r(e, i))
                    })
                }, "function" != typeof e.return && (this.return = void 0)
            }
            ll.displayName = "DialogFooter", lc.prototype["function" == typeof Symbol && Symbol.asyncIterator || "@@asyncIterator"] = function() {
                return this
            }, lc.prototype.next = function(e) {
                return this._invoke("next", e)
            }, lc.prototype.throw = function(e) {
                return this._invoke("throw", e)
            }, lc.prototype.return = function(e) {
                return this._invoke("return", e)
            };
            var ld = Object.entries,
                lf = Object.setPrototypeOf,
                lh = Object.isFrozen,
                lp = Object.getPrototypeOf,
                lm = Object.getOwnPropertyDescriptor,
                lv = Object.freeze,
                ly = Object.seal,
                lg = Object.create,
                lb = "u" > typeof Reflect && Reflect,
                lw = lb.apply,
                lE = lb.construct;
            lv || (lv = function(e) {
                return e
            }), ly || (ly = function(e) {
                return e
            }), lw || (lw = function(e, t) {
                for (var n = arguments.length, r = Array(n > 2 ? n - 2 : 0), i = 2; i < n; i++) r[i - 2] = arguments[i];
                return e.apply(t, r)
            }), lE || (lE = function(e) {
                for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                return tj(e, tq(n))
            });
            var lP = lq(Array.prototype.forEach);
            Array.prototype.indexOf;
            var lI = lq(Array.prototype.lastIndexOf),
                lS = lq(Array.prototype.pop),
                lx = lq(Array.prototype.push),
                lA = lq(Array.prototype.slice),
                lC = lq(Array.prototype.splice),
                lT = Array.isArray,
                lk = lK(Set),
                l_ = lq(Set.prototype.add),
                lO = lq(Set.prototype.has),
                lN = lq(String.prototype.toLowerCase),
                lR = lq(String.prototype.toString),
                lL = lq(String.prototype.match),
                lU = lq(String.prototype.replace),
                lB = lq(String.prototype.indexOf),
                lD = lq(String.prototype.trim),
                lM = lq(Number.prototype.toString),
                lj = lq(Boolean.prototype.toString),
                lF = "u" < typeof BigInt ? null : lq(BigInt.prototype.toString),
                lH = "u" < typeof Symbol ? null : lq(Symbol.prototype.toString),
                lG = lq(Object.prototype.hasOwnProperty),
                lz = lq(Object.prototype.toString),
                lV = lq(RegExp.prototype.test),
                lW = lK(TypeError);

            function lq(e) {
                return function(t) {
                    (0, tU._)(t, RegExp) && (t.lastIndex = 0);
                    for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
                    return lw(e, t, r)
                }
            }

            function lK(e) {
                return function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return lE(e, n)
                }
            }

            function lZ(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : lN;
                if (lf && lf(e, null), !lT(t)) return e;
                for (var r = t.length; r--;) {
                    var i = t[r];
                    if ("string" == typeof i) {
                        var a = n(i);
                        a !== i && (lh(t) || (t[r] = a), i = a)
                    }
                    e[i] = !0
                }
                return e
            }

            function lY(e) {
                var t = lg(null),
                    n = !0,
                    r = !1,
                    i = void 0;
                try {
                    for (var a, o = ld(e)[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) {
                        var l, s = (l = a.value, function(e) {
                                if (Array.isArray(e)) return e
                            }(l) || function(e) {
                                var t = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != t) {
                                    var n, r, i, a, o = [],
                                        l = !0,
                                        s = !1;
                                    try {
                                        i = (t = t.call(e)).next, !1;
                                        for (; !(l = (n = i.call(t)).done) && (o.push(n.value), 2 !== o.length); l = !0);
                                    } catch (e) {
                                        s = !0, r = e
                                    } finally {
                                        try {
                                            if (!l && null != t.return && (a = t.return(), Object(a) !== a)) return
                                        } finally {
                                            if (s) throw r
                                        }
                                    }
                                    return o
                                }
                            }(l) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return lu(e, 2);
                                    var t = ({}).toString.call(e).slice(8, -1);
                                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? lu(e, 2) : void 0
                                }
                            }(l) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            u = s[0],
                            c = s[1];
                        lG(e, u) && (lT(c) ? t[u] = function(e) {
                            for (var t = 0; t < e.length; t++) lG(e, t) || (e[t] = null);
                            return e
                        }(c) : c && (void 0 === c ? "undefined" : (0, tR._)(c)) === "object" && c.constructor === Object ? t[u] = lY(c) : t[u] = c)
                    }
                } catch (e) {
                    r = !0, i = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw i
                    }
                }
                return t
            }

            function lJ(e, t) {
                for (; null !== e;) {
                    var n = lm(e, t);
                    if (n) {
                        if (n.get) return lq(n.get);
                        if ("function" == typeof n.value) return lq(n.value)
                    }
                    e = lp(e)
                }
                return function() {
                    return null
                }
            }
            var lX = lv(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
                l$ = lv(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
                lQ = lv(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
                l0 = lv(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
                l1 = lv(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
                l2 = lv(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
                l3 = lv(["#text"]),
                l5 = lv(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "command", "commandfor", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns"]),
                l4 = lv(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dominant-baseline", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "pointer-events", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-orientation", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "vector-effect", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
                l6 = lv(["accent", "accentunder", "align", "bevelled", "close", "columnalign", "columnlines", "columnspacing", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lquote", "lspace", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
                l8 = lv(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
                l7 = ly(/{{[\w\W]*|^[\w\W]*}}/g),
                l9 = ly(/<%[\w\W]*|^[\w\W]*%>/g),
                se = ly(/\${[\w\W]*/g),
                st = ly(/^data-[\-\w.\u00B7-\uFFFF]+$/),
                sn = ly(/^aria-[\-\w]+$/),
                sr = ly(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
                si = ly(/^(?:\w+script|data):/i),
                sa = ly(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
                so = ly(/^html$/i),
                sl = ly(/^[a-z][.\w]*(-[.\w]+)+$/i),
                ss = ly(/<[/\w!]/g),
                su = ly(/<[/\w]/g),
                sc = ly(/<\/no(script|embed|frames)/i),
                sd = ly(/\/>/i),
                sf = lv(lZ({}, ["style", "script", "xmp", "iframe", "noembed", "noframes", "plaintext", "noscript"])),
                sh = function(e, t) {
                    if ((void 0 === e ? "undefined" : (0, tR._)(e)) !== "object" || "function" != typeof e.createPolicy) return null;
                    var n = null,
                        r = "data-tt-policy-suffix";
                    t && t.hasAttribute(r) && (n = t.getAttribute(r));
                    var i = "dompurify" + (n ? "#" + n : "");
                    try {
                        return e.createPolicy(i, {
                            createHTML: function(e) {
                                return e
                            },
                            createScriptURL: function(e) {
                                return e
                            }
                        })
                    } catch (e) {
                        return console.warn("TrustedTypes policy " + i + " could not be created."), null
                    }
                },
                sp = function() {
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
                sm = function(e, t, n, r) {
                    return lG(e, t) && lT(e[t]) ? lZ(r.base ? lY(r.base) : {}, e[t], r.transform) : n
                },
                sv = function(e, t, n) {
                    var r = lG(e, t) ? e[t] : void 0;
                    return r && (void 0 === r ? "undefined" : (0, tR._)(r)) === "object" ? lY(r) : n()
                },
                sy = function e() {
                    var t, n, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "u" < typeof window ? null : window,
                        i = function(t) {
                            return e(t)
                        };
                    if (i.version = "3.4.17", i.removed = [], !r || !r.document || 9 !== r.document.nodeType || !r.Element) return i.isSupported = !1, i;
                    var a = r.document,
                        o = a,
                        l = o.currentScript;
                    r.DocumentFragment;
                    var s = r.HTMLTemplateElement,
                        u = r.Node,
                        c = r.Element,
                        d = r.NodeFilter;
                    void 0 === r.NamedNodeMap && (r.NamedNodeMap || r.MozNamedAttrMap), r.HTMLFormElement;
                    var f = r.DOMParser,
                        h = r.trustedTypes,
                        p = c.prototype,
                        m = lJ(p, "cloneNode"),
                        v = lJ(p, "remove"),
                        y = lJ(p, "removeAttributeNode"),
                        g = lJ(p, "nextSibling"),
                        b = lJ(p, "childNodes"),
                        w = lJ(p, "parentNode"),
                        E = lJ(p, "shadowRoot"),
                        P = lJ(p, "attributes"),
                        I = u && u.prototype ? lJ(u.prototype, "nodeType") : null,
                        S = u && u.prototype ? lJ(u.prototype, "nodeName") : null,
                        x = u && u.prototype ? lJ(u.prototype, "ownerDocument") : null,
                        A = function(e) {
                            return I ? I(e) : e.nodeType
                        },
                        C = function(e) {
                            return S ? S(e) : e.nodeName
                        },
                        T = function(e, t) {
                            for (; null !== e;) {
                                var n = lm(e, t);
                                if (n) return n.get ? lq(n.get) : null;
                                e = lp(e)
                            }
                            return null
                        }(p, "namespaceURI"),
                        k = function(e) {
                            return T ? T(e) : e.namespaceURI
                        };
                    if ("function" == typeof s) {
                        var _ = a.createElement("template");
                        _.content && _.content.ownerDocument && (a = _.content.ownerDocument)
                    }
                    var O = "",
                        N = !1,
                        R = 0,
                        L = function() {
                            if (R > 0) throw lW('A configured TRUSTED_TYPES_POLICY callback (createHTML or createScriptURL) must not call DOMPurify.sanitize, as that causes infinite recursion. Do not pass a policy whose callbacks wrap DOMPurify as TRUSTED_TYPES_POLICY; see the "DOMPurify and Trusted Types" section of the README.')
                        },
                        U = function(e) {
                            L(), R++;
                            try {
                                return t.createHTML(e)
                            } finally {
                                R--
                            }
                        },
                        B = function(e) {
                            L(), R++;
                            try {
                                return t.createScriptURL(e)
                            } finally {
                                R--
                            }
                        },
                        D = a,
                        M = D.implementation,
                        j = D.createNodeIterator,
                        F = D.createDocumentFragment,
                        H = D.getElementsByTagName,
                        G = o.importNode,
                        z = sp();
                    i.isSupported = "function" == typeof ld && "function" == typeof w && M && void 0 !== M.createHTMLDocument;
                    var V = sr,
                        W = null,
                        q = lZ({}, tq(lX).concat(tq(l$), tq(lQ), tq(l1), tq(l3))),
                        K = null,
                        Z = lZ({}, tq(l5).concat(tq(l4), tq(l6), tq(l8))),
                        Y = Object.seal(lg(null, {
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
                        J = null,
                        X = null,
                        $ = Object.seal(lg(null, {
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
                        en = !0,
                        er = !1,
                        ei = !0,
                        ea = !1,
                        eo = !1,
                        el = null,
                        es = null,
                        eu = !1,
                        ec = !1,
                        ed = !1,
                        ef = !1,
                        eh = !0,
                        ep = !1,
                        em = "user-content-",
                        ev = !0,
                        ey = !1,
                        eg = null,
                        eb = {},
                        ew = null,
                        eE = lZ({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "selectedcontent", "style", "svg", "template", "thead", "title", "video", "xmp"]),
                        eP = null,
                        eI = lZ({}, ["audio", "video", "img", "source", "image", "track"]),
                        eS = null,
                        ex = lZ({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
                        eA = "http://www.w3.org/1998/Math/MathML",
                        eC = "http://www.w3.org/2000/svg",
                        eT = "http://www.w3.org/1999/xhtml",
                        ek = eT,
                        e_ = !1,
                        eO = null,
                        eN = lZ({}, [eA, eC, eT], lR),
                        eR = lv(["mi", "mo", "mn", "ms", "mtext"]),
                        eL = lZ({}, eR),
                        eU = lv(["annotation-xml"]),
                        eB = lZ({}, eU),
                        eD = lZ({}, ["title", "style", "font", "a", "script"]),
                        eM = null,
                        ej = ["application/xhtml+xml", "text/html"],
                        eF = null,
                        eH = null,
                        eG = a.createElement("form"),
                        ez = function(e) {
                            return (0, tU._)(e, RegExp) || (0, tU._)(e, Function)
                        },
                        eV = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            if (!eH || eH !== e) {
                                e && (void 0 === e ? "undefined" : (0, tR._)(e)) === "object" || (e = {}), e = lY(e), eF = "application/xhtml+xml" === (eM = -1 === ej.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? lR : lN, W = sm(e, "ALLOWED_TAGS", q, {
                                    transform: eF
                                }), K = sm(e, "ALLOWED_ATTR", Z, {
                                    transform: eF
                                }), eO = sm(e, "ALLOWED_NAMESPACES", eN, {
                                    transform: lR
                                }), eS = sm(e, "ADD_URI_SAFE_ATTR", ex, {
                                    transform: eF,
                                    base: ex
                                }), eP = sm(e, "ADD_DATA_URI_TAGS", eI, {
                                    transform: eF,
                                    base: eI
                                }), ew = sm(e, "FORBID_CONTENTS", eE, {
                                    transform: eF
                                }), J = sm(e, "FORBID_TAGS", lY({}), {
                                    transform: eF
                                }), X = sm(e, "FORBID_ATTR", lY({}), {
                                    transform: eF
                                }), eb = !!lG(e, "USE_PROFILES") && (e.USE_PROFILES && "object" === (0, tR._)(e.USE_PROFILES) ? lY(e.USE_PROFILES) : e.USE_PROFILES), Q = !1 !== e.ALLOW_ARIA_ATTR, ee = !1 !== e.ALLOW_DATA_ATTR, et = e.ALLOW_UNKNOWN_PROTOCOLS || !1, en = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, er = e.SAFE_FOR_TEMPLATES || !1, ei = !1 !== e.SAFE_FOR_XML, ea = e.WHOLE_DOCUMENT || !1, ec = e.RETURN_DOM || !1, ed = e.RETURN_DOM_FRAGMENT || !1, ef = e.RETURN_TRUSTED_TYPE || !1, eu = e.FORCE_BODY || !1, eh = !1 !== e.SANITIZE_DOM, ep = e.SANITIZE_NAMED_PROPS || !1, ev = !1 !== e.KEEP_CONTENT, ey = e.IN_PLACE || !1, V = ! function(e) {
                                    try {
                                        return lV(e, ""), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }(e.ALLOWED_URI_REGEXP) ? sr : e.ALLOWED_URI_REGEXP, ek = "string" == typeof e.NAMESPACE ? e.NAMESPACE : eT, eL = sv(e, "MATHML_TEXT_INTEGRATION_POINTS", function() {
                                    return lZ({}, eR)
                                }), eB = sv(e, "HTML_INTEGRATION_POINTS", function() {
                                    return lZ({}, eU)
                                });
                                var r = sv(e, "CUSTOM_ELEMENT_HANDLING", function() {
                                    return lg(null)
                                });
                                if (Y = lg(null), lG(r, "tagNameCheck") && ez(r.tagNameCheck) && (Y.tagNameCheck = r.tagNameCheck), lG(r, "attributeNameCheck") && ez(r.attributeNameCheck) && (Y.attributeNameCheck = r.attributeNameCheck), lG(r, "allowCustomizedBuiltInElements") && "boolean" == typeof r.allowCustomizedBuiltInElements && (Y.allowCustomizedBuiltInElements = r.allowCustomizedBuiltInElements), ly(Y), er && (ee = !1), ed && (ec = !0), eb && (W = lZ({}, l3), K = lg(null), !0 === eb.html && (lZ(W, lX), lZ(K, l5)), !0 === eb.svg && (lZ(W, l$), lZ(K, l4), lZ(K, l8)), !0 === eb.svgFilters && (lZ(W, lQ), lZ(K, l4), lZ(K, l8)), !0 === eb.mathMl && (lZ(W, l1), lZ(K, l6), lZ(K, l8))), $.tagCheck = null, $.attributeCheck = null, lG(e, "ADD_TAGS") && ("function" == typeof e.ADD_TAGS ? $.tagCheck = e.ADD_TAGS : lT(e.ADD_TAGS) && (W === q && (W = lY(W)), lZ(W, e.ADD_TAGS, eF))), lG(e, "ADD_ATTR") && ("function" == typeof e.ADD_ATTR ? $.attributeCheck = e.ADD_ATTR : lT(e.ADD_ATTR) && (K === Z && (K = lY(K)), lZ(K, e.ADD_ATTR, eF))), lG(e, "ADD_FORBID_CONTENTS") && lT(e.ADD_FORBID_CONTENTS) && (ew === eE && (ew = lY(ew)), lZ(ew, e.ADD_FORBID_CONTENTS, eF)), ev && (W["#text"] = !0), ea && lZ(W, ["html", "head", "body"]), W.table && (lZ(W, ["tbody"]), delete J.tbody), e.TRUSTED_TYPES_POLICY) {
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw lW('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw lW('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                                    var i = t;
                                    t = e.TRUSTED_TYPES_POLICY;
                                    try {
                                        O = U("")
                                    } catch (e) {
                                        throw t = i, e
                                    }
                                } else null === e.TRUSTED_TYPES_POLICY ? (t = void 0, O = "") : (void 0 === t && (N || (n = sh(h, l), N = !0), t = n), t && "string" == typeof O && (O = U("")));
                                lv && lv(e), eH = e
                            }
                        },
                        eW = lZ({}, tq(l$).concat(tq(lQ), tq(l0))),
                        eq = lZ({}, tq(l1).concat(tq(l2))),
                        eK = function(e) {
                            var t, n, r, i, a, o, l, s, u = k(e),
                                c = lN(C(e)),
                                d = w(e);
                            return d && 1 === A(d) ? (l = {
                                namespaceURI: k(d)
                            }, s = lN(C(d))) : (l = {
                                namespaceURI: ek
                            }, s = "template"), !!eO[u] && (u === eC ? (t = l, n = s, t.namespaceURI === eT ? "svg" === c : t.namespaceURI === eA ? "svg" === c && ("annotation-xml" === n || eL[n]) : !!eW[c]) : u === eA ? (r = l, i = s, r.namespaceURI === eT ? "math" === c : r.namespaceURI === eC ? "math" === c && eB[i] : !!eq[c]) : u === eT ? (a = l, o = s, (a.namespaceURI !== eC || !!eB[o]) && (a.namespaceURI !== eA || !!eL[o]) && !eq[c] && (eD[c] || !eW[c])) : "application/xhtml+xml" === eM && !!eO[u])
                        },
                        eZ = function(e) {
                            lx(i.removed, {
                                element: e
                            });
                            try {
                                w(e).removeChild(e)
                            } catch (t) {
                                if (v(e), !w(e)) throw lW("a node selected for removal could not be detached from its tree and cannot be safely returned; refusing to sanitize in place")
                            }
                        },
                        eY = function(e, t, n) {
                            try {
                                y(e, t)
                            } catch (t) {
                                try {
                                    e.removeAttribute(n)
                                } catch (e) {}
                            }
                        },
                        eJ = function(e) {
                            e0(e);
                            var t = b(e);
                            t && lP(lA(t), function(e) {
                                try {
                                    v(e)
                                } catch (e) {}
                            });
                            var n = 1 === A(e) ? P(e) : null;
                            if (n)
                                for (var r = n.length - 1; r >= 0; --r) {
                                    var i = n[r],
                                        a = i && i.name;
                                    "string" == typeof a && eY(e, i, a)
                                }
                        },
                        eX = function(e, t, n) {
                            if (!n) try {
                                n = t.getAttributeNode(e)
                            } catch (e) {
                                n = null
                            }
                            lx(i.removed, {
                                attribute: n || null,
                                from: t
                            });
                            try {
                                n ? y(t, n) : t.removeAttribute(e)
                            } catch (n) {
                                try {
                                    t.removeAttribute(e)
                                } catch (e) {}
                            }
                            if ("is" === e)
                                if (ec || ed) try {
                                    eZ(t)
                                } catch (e) {} else try {
                                    t.setAttribute(e, "")
                                } catch (e) {}
                        },
                        e$ = function(e) {
                            var t = P(e);
                            if (t)
                                for (var n = t.length - 1; n >= 0; --n) {
                                    var r = t[n],
                                        i = r && r.name;
                                    "string" != typeof i || K[eF(i)] || eY(e, r, i)
                                }
                        },
                        eQ = function(e, t) {
                            for (var n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2], r = [e]; r.length > 0;) {
                                var i = r.pop();
                                if (!1 !== t(i)) {
                                    if (n && 1 === A(i)) {
                                        var a = E(i);
                                        ta(a) && r.push(a)
                                    }
                                    var o = b(i);
                                    if (o)
                                        for (var l = o.length - 1; l >= 0; --l) r.push(o[l])
                                }
                            }
                        },
                        e0 = function(e) {
                            eQ(e, function(e) {
                                1 === A(e) && e$(e)
                            })
                        },
                        e1 = function(e) {
                            var t = [];
                            return eQ(e, function(e) {
                                t.push(e)
                            }, !0), t
                        },
                        e2 = function(e, t) {
                            var n = lk();
                            lP(e1(e), function(e) {
                                1 === A(e) && l_(n, e)
                            }), lP(t, function(e) {
                                1 !== A(e) || lO(n, e) || e$(e)
                            })
                        },
                        e3 = function(e, t) {
                            var n = !1;
                            return lP(i.removed, function(t) {
                                t.element && (n = n || t.element === e, e0(t.element))
                            }), e2(e, t), n
                        },
                        e5 = function(e, t) {
                            for (var n = eg, r = null, i = function() {
                                    return r || (r = lk(), lP(t, function(e) {
                                        l_(r, e)
                                    })), r
                                }, a = 0;; a++) {
                                var o = function(t) {
                                    var r = e1(e),
                                        a = [e],
                                        o = !1;
                                    if (lP(r, function(e) {
                                            11 === A(e) ? lx(a, e) : o || lO(n, e) || (o = lO(i(), e))
                                        }), !o) return {
                                        v: void 0
                                    };
                                    if (t >= 8) throw lW("the tree kept changing during in-place sanitization; refusing to return it");
                                    lP(a, function(t, n) {
                                        e4(t, n > 0, e, i())
                                    })
                                }(a);
                                if ("object" === (0, tR._)(o)) return o.v
                            }
                        },
                        e4 = function(e, t, n, r) {
                            for (var i, a = te(e); i = a.nextNode();) !(!lO(r, i) || lO(eg, i)) && (t && tl(z.uponSanitizeShadowNode, i, null), tf(i, n), tb(i, n), ta(i.content) && tw(i.content))
                        },
                        e6 = function(e) {
                            eg && l_(eg, e)
                        },
                        e8 = function(e, t) {
                            return !!ei && ("patchsrc" === e || "for" === e && "label" !== t && "output" !== t)
                        },
                        e7 = function(e) {
                            ei && eQ(e, function(e) {
                                var t = A(e);
                                if (7 === t || 8 === t && lV(su, e.data)) {
                                    try {
                                        v(e)
                                    } catch (e) {}
                                    return !1
                                }
                                if (1 === t) {
                                    var n = eF(C(e));
                                    try {
                                        e.hasAttribute && e.hasAttribute("patchsrc") && e.removeAttribute("patchsrc"), e.hasAttribute && e.hasAttribute("for") && e8("for", n) && e.removeAttribute("for")
                                    } catch (e) {}
                                }
                                return !0
                            })
                        },
                        e9 = function(e) {
                            var n = null,
                                r = null;
                            if (eu) e = "<remove></remove>" + e;
                            else {
                                var i = lL(e, /^[\r\n\t ]+/);
                                r = i && i[0]
                            }
                            "application/xhtml+xml" === eM && ek === eT && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                            var o = t ? U(e) : e;
                            if (ek === eT) try {
                                n = new f().parseFromString(o, eM)
                            } catch (e) {}
                            if (!n || !n.documentElement) {
                                n = M.createDocument(ek, "template", null);
                                try {
                                    n.documentElement.innerHTML = e_ ? O : o
                                } catch (e) {}
                            }
                            var l = n.body || n.documentElement;
                            return (e && r && l.insertBefore(a.createTextNode(r), l.childNodes[0] || null), ek === eT) ? H.call(n, ea ? "html" : "body")[0] : ea ? n.documentElement : l
                        },
                        te = function(e) {
                            var t = x ? x(e) : e.ownerDocument;
                            return j.call(t || e, e, d.SHOW_ELEMENT | d.SHOW_COMMENT | d.SHOW_TEXT | d.SHOW_PROCESSING_INSTRUCTION | d.SHOW_CDATA_SECTION, null)
                        },
                        tt = function(e) {
                            return e = lU(e, l7, " "), e = lU(e, l9, " "), e = lU(e, se, " ")
                        },
                        tn = function(e) {
                            tr(e);
                            var t, n = null == (t = e.querySelectorAll) ? void 0 : t.call(e, "template");
                            n && lP(n, function(e) {
                                ta(e.content) && tn(e.content)
                            })
                        },
                        tr = function(e) {
                            e.normalize();
                            for (var t = x ? x(e) : e.ownerDocument, n = j.call(t || e, e, d.SHOW_TEXT | d.SHOW_COMMENT | d.SHOW_CDATA_SECTION | d.SHOW_PROCESSING_INSTRUCTION, null), r = n.nextNode(); r;) r.data = tt(r.data), r = n.nextNode()
                        },
                        ti = function(e) {
                            var t = S ? S(e) : null;
                            return "string" == typeof t && "form" === eF(t) && ("string" != typeof e.nodeName || "string" != typeof e.textContent || "function" != typeof e.removeChild || e.attributes !== P(e) || "function" != typeof e.removeAttribute || "function" != typeof e.removeAttributeNode || "function" != typeof e.getAttributeNode || "function" != typeof e.setAttribute || "string" != typeof e.namespaceURI || "function" != typeof e.insertBefore || "function" != typeof e.hasChildNodes || e.nodeType !== I(e) || e.childNodes !== b(e))
                        },
                        ta = function(e) {
                            if (!I || (void 0 === e ? "undefined" : (0, tR._)(e)) !== "object" || null === e) return !1;
                            try {
                                return 11 === I(e)
                            } catch (e) {
                                return !1
                            }
                        },
                        to = function(e) {
                            if (!I || (void 0 === e ? "undefined" : (0, tR._)(e)) !== "object" || null === e) return !1;
                            try {
                                return "number" == typeof I(e)
                            } catch (e) {
                                return !1
                            }
                        };

                    function tl(e, t, n) {
                        0 !== e.length && lP(e, function(e) {
                            e.call(i, t, n, eH)
                        })
                    }
                    var ts = function(e, t) {
                            if ((0, tU._)(e, RegExp)) return lV(e, t);
                            if ((0, tU._)(e, Function)) {
                                for (var n = arguments.length, r = Array(n > 2 ? n - 2 : 0), i = 2; i < n; i++) r[i - 2] = arguments[i];
                                return !!e.apply(void 0, [t].concat(tq(r)))
                            }
                            return !1
                        },
                        tu = function(e, t, n) {
                            if (!J[t] && tm(t) && ts(Y.tagNameCheck, t)) return !1;
                            if (ev && !ew[t] && !ew[lN(t)]) {
                                var r = w(e),
                                    i = b(e);
                                if (i && r)
                                    for (var a = i.length, o = a - 1; o >= 0; --o) {
                                        var l = e === n ? m(i[o], !0) : i[o];
                                        r.insertBefore(l, g(e))
                                    }
                            }
                            return eZ(e), !0
                        },
                        tc = function(e, t, n, r) {
                            return 0 === e.length ? t : t === n || t === r ? lY(t) : t
                        },
                        td = function(e, t) {
                            return e !== t && null === w(e) && (ey && e0(e), !0)
                        },
                        tf = function(e, t) {
                            if (e6(e), tl(z.beforeSanitizeElements, e, null), td(e, t)) return !0;
                            if (ti(e)) return eZ(e), !0;
                            var n = eF(C(e));
                            if (W = tc(z.uponSanitizeElement, W, q, el), tl(z.uponSanitizeElement, e, {
                                    tagName: n,
                                    allowedTags: W
                                }), td(e, t)) return !0;
                            if (ei && e.hasChildNodes() && !to(e.firstElementChild) && lV(ss, e.textContent) && lV(ss, e.innerHTML) || ei && sf[n] && 1 === A(e) && k(e) === eT && (to(e.firstElementChild) || "string" == typeof e.textContent && lV(ss, e.textContent)) || 7 === e.nodeType || ei && 8 === e.nodeType && lV(su, e.data)) return eZ(e), !0;
                            if (J[n] || !((0, tU._)($.tagCheck, Function) && $.tagCheck(n)) && !W[n]) {
                                var r = tu(e, n, t);
                                return !!(!1 === r && (tl(z.afterSanitizeElements, e, null), td(e, t))) || r
                            }
                            if (1 === A(e) && !eK(e) || ("noscript" === n || "noembed" === n || "noframes" === n) && lV(sc, e.innerHTML)) return eZ(e), !0;
                            if (er && 3 === e.nodeType) {
                                var a = tt(e.textContent);
                                e.textContent !== a && (lx(i.removed, {
                                    element: e.cloneNode()
                                }), e.textContent = a)
                            }
                            return tl(z.afterSanitizeElements, e, null), td(e, t)
                        },
                        th = function(e, t, n) {
                            if (X[t] || e8(t, e) || eh && ("id" === t || "name" === t) && (n in a || n in eG)) return !1;
                            var r = K[t] || (0, tU._)($.attributeCheck, Function) && $.attributeCheck(t, e);
                            return !!(ee && lV(st, t) || Q && lV(sn, t)) || (r ? !(!(eS[t] || lV(V, lU(n, sa, ""))) && ("src" !== t && "xlink:href" !== t && "href" !== t || "script" === e || 0 !== lB(n, "data:") || !eP[e]) && (!et || lV(si, lU(n, sa, "")))) || !n : tm(e) && ts(Y.tagNameCheck, e) && ts(Y.attributeNameCheck, t, e) || "is" === t && Y.allowCustomizedBuiltInElements && ts(Y.tagNameCheck, n))
                        },
                        tp = lZ({}, ["annotation-xml", "color-profile", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "missing-glyph"]),
                        tm = function(e) {
                            return !tp[lN(e)] && lV(sl, e)
                        },
                        tv = function(e, n, r, i) {
                            if (t && (void 0 === h ? "undefined" : (0, tR._)(h)) === "object" && "function" == typeof h.getAttributeType && !r) switch (h.getAttributeType(e, n)) {
                                case "TrustedHTML":
                                    return U(i);
                                case "TrustedScriptURL":
                                    return B(i)
                            }
                            return i
                        },
                        ty = function(e, t, n, r) {
                            try {
                                if (n ? e.setAttributeNS(n, t, r) : e.setAttribute(t, r), ti(e)) return eZ(e), !1;
                                return !0
                            } catch (n) {
                                return eX(t, e), !1
                            }
                        },
                        tg = function(e, t) {
                            return !!(ei && lV(/((--!?|])>)|<\/(style|script|title|xmp|textarea|noscript|iframe|noembed|noframes)/i, t)) || "attributename" === lN(e) && null !== lL(t, "href")
                        },
                        tb = function(e, t) {
                            if (tl(z.beforeSanitizeAttributes, e, null), !td(e, t)) {
                                var n = e.attributes;
                                if (!(!n || ti(e))) {
                                    for (var r = {
                                            attrName: "",
                                            attrValue: "",
                                            keepAttr: !0,
                                            allowedAttributes: K = tc(z.uponSanitizeAttribute, K, Z, es),
                                            forceKeepAttr: void 0
                                        }, a = n.length, o = eF(e.nodeName); a--;) {
                                        var l = n[a],
                                            s = l.name,
                                            u = l.namespaceURI,
                                            c = l.value,
                                            d = eF(s),
                                            f = "value" === s ? c : lD(c),
                                            h = !1;
                                        if (r.attrName = d, r.attrValue = f, r.keepAttr = !0, r.forceKeepAttr = void 0, tl(z.uponSanitizeAttribute, e, r), f = r.attrValue, ep && ("id" === d || "name" === d) && 0 !== lB(f, em) && (eX(s, e, l), f = em + f, h = !0), tg(s, f)) {
                                            eX(s, e, l);
                                            continue
                                        }
                                        if (!r.forceKeepAttr) {
                                            if (!r.keepAttr || !en && lV(sd, f) || (er && (f = tt(f)), !th(o, d, f))) {
                                                eX(s, e, l);
                                                continue
                                            }(f = tv(o, d, u, f)) !== c && ty(e, s, u, f) && h && lS(i.removed)
                                        }
                                    }
                                    tl(z.afterSanitizeAttributes, e, null), td(e, t)
                                }
                            }
                        },
                        tw = function(e) {
                            var t = null,
                                n = te(e);
                            for (tl(z.beforeSanitizeShadowDOM, e, null); t = n.nextNode();)
                                if (tl(z.uponSanitizeShadowNode, t, null), tf(t, e), tb(t, e), ta(t.content) && tw(t.content), 1 === A(t)) {
                                    var r = E(t);
                                    ta(r) && (tE(r), tw(r))
                                } er && tr(e), tl(z.afterSanitizeShadowDOM, e, null)
                        },
                        tE = function(e) {
                            for (var t = [{
                                    node: e,
                                    shadow: null
                                }]; t.length > 0;) {
                                var n = t.pop();
                                if (n.shadow) {
                                    tw(n.shadow);
                                    continue
                                }
                                var r = n.node,
                                    i = 1 === A(r),
                                    a = b(r);
                                if (a)
                                    for (var o = a.length - 1; o >= 0; --o) t.push({
                                        node: a[o],
                                        shadow: null
                                    });
                                if (i) {
                                    var l = S ? S(r) : null;
                                    if ("string" == typeof l && "template" === eF(l)) {
                                        var s = r.content;
                                        ta(s) && t.push({
                                            node: s,
                                            shadow: null
                                        })
                                    }
                                }
                                if (i) {
                                    var u = E(r);
                                    ta(u) && t.push({
                                        node: null,
                                        shadow: u
                                    }, {
                                        node: u,
                                        shadow: null
                                    })
                                }
                            }
                        };
                    return i.sanitize = function(e) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            r = null,
                            a = null,
                            l = null,
                            s = null;
                        if ((e_ = !e) && (e = "\x3c!--\x3e"), "string" != typeof e && !to(e) && "string" != typeof(e = function(e) {
                                switch (void 0 === e ? "undefined" : (0, tR._)(e)) {
                                    case "string":
                                        return e;
                                    case "number":
                                        return lM(e);
                                    case "boolean":
                                        return lj(e);
                                    case "bigint":
                                        return lF ? lF(e) : "0";
                                    case "symbol":
                                        return lH ? lH(e) : "Symbol()";
                                    case "undefined":
                                    default:
                                        return lz(e);
                                    case "function":
                                    case "object":
                                        if (null === e) return lz(e);
                                        var t = lJ(e, "toString");
                                        if ("function" == typeof t) {
                                            var n = t(e);
                                            return "string" == typeof n ? n : lz(n)
                                        }
                                        return lz(e)
                                }
                            }(e))) throw lW("dirty is not a string, aborting");
                        if (!i.isSupported) return e;
                        eo ? (W = el, K = es) : eV(n), (z.uponSanitizeElement.length > 0 || z.uponSanitizeAttribute.length > 0) && (W = lY(W)), z.uponSanitizeAttribute.length > 0 && (K = lY(K)), i.removed = [];
                        var u = ey && "string" != typeof e && to(e),
                            c = [],
                            d = eg;
                        if (u) {
                            e7(e);
                            var f = C(e);
                            if ("string" == typeof f) {
                                var h = eF(f);
                                if (!W[h] || J[h]) throw eJ(e), lW("root node is forbidden and cannot be sanitized in-place")
                            }
                            if (ti(e)) throw eJ(e), lW("root node is clobbered and cannot be sanitized in-place");
                            c = e1(e), eg = lk()
                        } else if (to(e)) 1 === (a = (r = e9("\x3c!----\x3e")).ownerDocument.importNode(e, !0)).nodeType && "BODY" === a.nodeName || "HTML" === a.nodeName ? r = a : r.appendChild(a), tE(r);
                        else {
                            if (!ec && !er && !ea && -1 === e.indexOf("<")) return t && ef ? U(e) : e;
                            if (!(r = e9(e))) return ec ? null : ef ? O : ""
                        }
                        r && eu && eZ(r.firstChild);
                        var p = u ? e : r;
                        try {
                            u && tE(e);
                            for (var m = te(p); l = m.nextNode();) tf(l, p), tb(l, p), ta(l.content) && tw(l.content);
                            u && e5(e, c)
                        } catch (t) {
                            throw u && (eJ(e), e3(e, c)), t
                        } finally {
                            eg = d
                        }
                        if (u) {
                            if (e3(e, c)) throw lW("a node selected for removal could not be safely returned; refusing to sanitize in place");
                            return er && tn(e), e
                        }
                        if (ec) {
                            if (er && tn(r), ed)
                                for (s = F.call(r.ownerDocument); r.firstChild;) s.appendChild(r.firstChild);
                            else s = r;
                            return (K.shadowroot || K.shadowrootmode) && (s = G.call(o, s, !0)), s
                        }
                        var v = ea ? r.outerHTML : r.innerHTML;
                        return ea && W["!doctype"] && r.ownerDocument && r.ownerDocument.doctype && r.ownerDocument.doctype.name && lV(so, r.ownerDocument.doctype.name) && (v = "<!DOCTYPE " + r.ownerDocument.doctype.name + ">\n" + v), er && (v = tt(v)), t && ef ? U(v) : v
                    }, i.setConfig = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        eV(e), eo = !0, el = W, es = K
                    }, i.clearConfig = function() {
                        eH = null, eo = !1, el = null, es = null, t = n, O = ""
                    }, i.isValidAttribute = function(e, t, n) {
                        eH || eV({});
                        var r = eF(e),
                            i = eF(t);
                        return !("string" == typeof n && (tg(t, n) || !en && lV(sd, n))) && th(r, i, n)
                    }, i.addHook = function(e, t) {
                        "function" != typeof t || lG(z, e) && lx(z[e], t)
                    }, i.removeHook = function(e, t) {
                        if (lG(z, e)) {
                            if (void 0 !== t) {
                                var n = lI(z[e], t);
                                return -1 === n ? void 0 : lC(z[e], n, 1)[0]
                            }
                            return lS(z[e])
                        }
                    }, i.removeHooks = function(e) {
                        lG(z, e) && (z[e] = [])
                    }, i.removeAllHooks = function() {
                        z = sp()
                    }, i
                }(),
                sg = sy.sanitize.bind(sy),
                sb = sy.isSupported;
            sy.addHook.bind(sy), sy.removeHook.bind(sy), sy.removeHooks.bind(sy), sy.removeAllHooks.bind(sy), sy.setConfig.bind(sy), sy.clearConfig.bind(sy), sy.isValidAttribute.bind(sy), sy.version, sy.removed;
            var sw = {
                    ADD_ATTR: ["target"]
                },
                sE = e6(ez({}, sw), {
                    RETURN_DOM_FRAGMENT: !0
                }),
                sP = function(e) {
                    e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer")
                },
                sI = function(e, t) {
                    if (!t || !sb) return sg(e, sw);
                    var n = sg(e, sE);
                    if ("string" == typeof n) return n;
                    n.querySelectorAll("a").forEach(sP);
                    var r = n.ownerDocument.createElement("div");
                    return r.appendChild(n), r.innerHTML
                },
                sS = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = t.shouldOpenLinksInNewTab;
                    return (0, ej.useMemo)(function() {
                        return sI(e, null != n && n)
                    }, [e, n])
                },
                sx = function(e) {
                    var t = e.titleText,
                        n = e.bodyText,
                        r = e.primaryButtonText,
                        i = e.secondaryButtonText,
                        a = e.closeLabelText,
                        o = e.onPrimaryButtonClick,
                        l = e.onSecondaryButtonClick,
                        s = e.isModalOpen,
                        u = e.onCloseModal,
                        c = e.hasCloseAffordance,
                        d = e.orientButtonsVertically,
                        f = void 0 !== d && d,
                        h = sS(n, {
                            shouldOpenLinksInNewTab: !0
                        }),
                        p = r && o ? (0, ri.jsx)(rL, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: o,
                            className: "grow basis-0",
                            children: r
                        }) : null,
                        m = i && l ? (0, ri.jsx)(rL, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: l,
                            className: "grow basis-0",
                            children: i
                        }) : null;
                    return (0, ri.jsx)(lr, {
                        open: s,
                        onOpenChange: function(e) {
                            e || u()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: void 0 === c || c,
                        closeLabel: a,
                        children: (0, ri.jsxs)(li, {
                            children: [(0, ri.jsxs)(la, {
                                className: "flex flex-col gap-large",
                                children: [(0, ri.jsx)(lo, {
                                    children: t
                                }), (0, ri.jsx)("span", {
                                    className: "[&_a]:[font-weight:700] [&_a]:underline",
                                    dangerouslySetInnerHTML: {
                                        __html: h
                                    }
                                })]
                            }), (0, ri.jsx)(ll, {
                                className: f ? "flex flex-col gap-small" : "flex gap-x-medium",
                                children: f ? (0, ri.jsxs)(ej.Fragment, {
                                    children: [p, m]
                                }) : (0, ri.jsxs)(ej.Fragment, {
                                    children: [m, p]
                                })
                            })]
                        })
                    })
                },
                sA = function(e) {
                    var t = e.isModalOpen,
                        n = e.navigateToAccountSettings,
                        r = e.closeModal,
                        i = e.translate;
                    return (0, ri.jsx)(sx, {
                        titleText: i("UpdateMaturitySettingModal.Label.Title"),
                        bodyText: i("UpdateMaturitySettingModal.Label.Body"),
                        primaryButtonText: i("UpdateMaturitySettingModal.Action.GoToSettings"),
                        secondaryButtonText: i("UpdateMaturitySettingModal.Action.Cancel"),
                        closeLabelText: i("Action.Close"),
                        onPrimaryButtonClick: n,
                        onSecondaryButtonClick: r,
                        isModalOpen: t,
                        onCloseModal: r
                    })
                },
                sC = function(e) {
                    var t = e.isModalOpen,
                        n = e.closeModal,
                        r = e.translate;
                    return (0, ri.jsx)(sx, {
                        titleText: r("RestrictedUnplayableModal.Label.Title"),
                        bodyText: r("RestrictedUnplayableModal.Label.Body"),
                        secondaryButtonText: r("RestrictedUnplayableModal.Action.Ok"),
                        closeLabelText: r("Action.Close"),
                        onSecondaryButtonClick: n,
                        isModalOpen: t,
                        onCloseModal: n
                    })
                },
                sT = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        n = !!e && !t,
                        r = (0, eH.useQuery)({
                            queryKey: ["ageRecommendation", e],
                            queryFn: function() {
                                return e5(e)
                            },
                            enabled: n
                        }),
                        i = r.data,
                        a = r.isError,
                        o = r.isLoading;
                    return {
                        ageRecommendationData: i,
                        hasError: a,
                        isLoading: n && o
                    }
                },
                sk = function(e) {
                    var t, n, r = tx((0, ej.useState)(void 0), 2),
                        i = r[0],
                        a = r[1],
                        o = tx((0, ej.useState)(!1), 2),
                        l = o[0],
                        s = o[1],
                        u = tx((0, ej.useState)(!1), 2),
                        c = u[0],
                        d = u[1];
                    (0, ej.useEffect)(function() {
                        d(!1), s(!0), e3().then(function(e) {
                            a(e.contentAgeRestriction)
                        }).catch(function() {
                            d(!0)
                        }).finally(function() {
                            s(!1)
                        })
                    }, []);
                    var f = sT(e),
                        h = f.ageRecommendationData,
                        p = f.hasError,
                        m = f.isLoading;
                    return {
                        contentAgeRestriction: i,
                        contentMaturityRating: null == h || null == (n = h.ageRecommendationDetails) || null == (t = n.summary.ageRecommendation) ? void 0 : t.contentMaturity,
                        isFetching: l || m,
                        hasError: c || p
                    }
                },
                s_ = function(e, t, n, r, i, a, o, l) {
                    var s = (0, eH.useQuery)({
                            queryKey: ["guacPlayButtonUI"],
                            queryFn: function() {
                                return e2()
                            },
                            staleTime: 6e4
                        }).data,
                        u = tx((0, ej.useState)(!1), 2),
                        c = u[0],
                        d = u[1],
                        f = tx((0, ej.useState)(!1), 2),
                        h = f[0],
                        p = f[1],
                        m = (0, ej.useCallback)(function() {
                            n0(e, r, i, a, o, void 0, l)
                        }, [o, a, e, i, r, l]),
                        v = (0, ej.useCallback)(function(e, r, i) {
                            return eD(function() {
                                var a, o, l, u, c, f;
                                return eM(this, function(h) {
                                    switch (h.label) {
                                        case 0:
                                            if (a = function(e) {
                                                    n7(t, e, e8.ContextualPlayabilityAgeRecommendationParentalControls, n)
                                                }, i || void 0 === e || void 0 === r) return m(), eJ(tn.PlayButtonUpsellUnknownSettingOrAge), a(tr.gameLaunchFallbackUpsellName), [2];
                                            if ("minimal" === r) return m(), eJ(tn.PlayButtonUpsellMinimalMaturityRating), a(tr.gameLaunchFallbackUpsellName), [2];
                                            if (!(o = ({
                                                    mild: "NinePlus",
                                                    moderate: "ThirteenPlus",
                                                    restricted: "SeventeenPlus",
                                                    unrated: "ThirteenPlus"
                                                })[r])) return m(), eJ(tn.PlayButtonUpsellAgeNotInMapping), a(tr.gameLaunchFallbackUpsellName), [2];
                                            if (!(l = e.options.find(function(e) {
                                                    return e.option.optionValue === o
                                                }))) return [3, 13];
                                            switch (u = l.requirement) {
                                                case "SelfUpdateSetting":
                                                    return [3, 1];
                                                case "ParentalConsent":
                                                    return [3, 2];
                                                case "ContentAgeRestrictionVerification":
                                                    return [3, 7]
                                            }
                                            return [3, 11];
                                        case 1:
                                            return d(!0), eJ(tn.PlayButtonUpsellSelfUpdateSettingTriggered), a(u), [3, 12];
                                        case 2:
                                            if (eJ(tn.PlayButtonUpsellAskYourParentTriggered), a(u), !(c = nW())) return eJ(tn.PlayButtonUpsellParentalConsentError), [3, 12];
                                            h.label = 3;
                                        case 3:
                                            return h.trys.push([3, 5, , 6]), f = (null == s ? void 0 : s.useExperienceApprovalForParentalConsent) ? {
                                                featureName: "CanApproveExperience",
                                                namespace: to.accountManagement,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    universeId: t,
                                                    experienceManagementAction: "Approve"
                                                }
                                            } : {
                                                featureName: "CanChangeSetting",
                                                namespace: to.settingChange,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    contentAgeRestriction: l.option.optionValue
                                                }
                                            }, [4, c(f)];
                                        case 4:
                                            return h.sent(), [3, 6];
                                        case 5:
                                            return h.sent(), m(), eJ(tn.PlayButtonUpsellParentalConsentError), a(tr.gameLaunchFallbackUpsellName), [3, 6];
                                        case 6:
                                        case 10:
                                            return [3, 12];
                                        case 7:
                                            return h.trys.push([7, 9, , 10]), eJ(tn.PlayButtonUpsellAgeRestrictionVerificationTriggered), a(u), [4, n4({
                                                context: ta,
                                                pageContext: n
                                            })];
                                        case 8:
                                            return h.sent() && window.location.reload(), [3, 10];
                                        case 9:
                                            return h.sent(), m(), a(tr.gameLaunchFallbackUpsellName), [3, 10];
                                        case 11:
                                            m(), eJ(tn.PlayButtonUpsellUnknownRequirement), a(tr.gameLaunchFallbackUpsellName), h.label = 12;
                                        case 12:
                                            return [3, 14];
                                        case 13:
                                            p(!0), eJ(tn.PlayButtonUpsellRestrictedUnplayableTriggered), a(tr.restrictedUnplayableUpsellName), h.label = 14;
                                        case 14:
                                            return [2]
                                    }
                                })
                            })()
                        }, [s, m, t, n]),
                        y = (0, ej.useCallback)(function() {
                            d(!1)
                        }, []),
                        g = (0, ej.useCallback)(function() {
                            p(!1)
                        }, []);
                    return {
                        launchPlayButtonUpsell: v,
                        isSelfUpdateSettingModalOpen: c,
                        navigateToAccountSettings: (0, ej.useCallback)(function() {
                            var e = (0, tc.getAbsoluteUrl)("/my/account#!/privacy");
                            "u" > typeof window && (window.location.href = e, d(!1))
                        }, []),
                        closeSelfUpdateSettingModal: y,
                        isRestrictedUnplayableModalOpen: h,
                        closeRestrictedUnplayableModal: g
                    }
                },
                sO = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.placeId,
                        i = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        o = e.gameInstanceId,
                        l = e.eventProperties,
                        s = e.appsFlyerReferralProperties,
                        u = e.pageContext,
                        c = av(),
                        d = sk(t),
                        f = d.contentAgeRestriction,
                        h = d.contentMaturityRating,
                        p = d.isFetching,
                        m = d.hasError,
                        v = s_(r, t, u, i, a, o, l, s),
                        y = v.launchPlayButtonUpsell,
                        g = v.isSelfUpdateSettingModalOpen,
                        b = v.navigateToAccountSettings,
                        w = v.closeSelfUpdateSettingModal,
                        E = v.isRestrictedUnplayableModalOpen,
                        P = v.closeRestrictedUnplayableModal,
                        I = (0, ej.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), y(f, h, m)
                        }, [y, f, h, m]);
                    return !m && p ? (0, ri.jsx)(ab, {
                        buttonClassName: null != n ? n : "btn-common-play-game-action-needed-lg game-play-button-action-needed-lg"
                    }) : (0, ri.jsxs)(eF().Fragment, {
                        children: [(0, ri.jsx)(ay, {
                            onButtonClick: I,
                            buttonClassName: n
                        }), g && (0, ri.jsx)(sA, {
                            isModalOpen: g,
                            navigateToAccountSettings: b,
                            closeModal: w,
                            translate: c
                        }), E && (0, ri.jsx)(sC, {
                            isModalOpen: E,
                            closeModal: P,
                            translate: c
                        })]
                    })
                };
            sO.defaultProps = {
                buttonClassName: void 0,
                rootPlaceId: void 0,
                privateServerLinkCode: void 0,
                gameInstanceId: void 0,
                eventProperties: {},
                appsFlyerReferralProperties: {}
            };
            var sN = function(e, t) {
                    var n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                        r = (0, eH.useQuery)({
                            queryKey: ["purchaseProductData", e, t],
                            queryFn: function() {
                                return eD(function() {
                                    var n;
                                    return eM(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                var i, a;
                                                return [4, Promise.all([(i = [e], eD(function() {
                                                    var e;
                                                    return eM(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, e1.getProductInfo(i)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data.data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })()), (a = [t], eD(function() {
                                                    var e;
                                                    return eM(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, e1.getPlaceDetails(a)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())])];
                                            case 1:
                                                return [2, {
                                                    productInfo: (n = tx.apply(void 0, [r.sent(), 2]))[0],
                                                    productDetails: n[1]
                                                }]
                                        }
                                    })
                                })()
                            },
                            enabled: n,
                            staleTime: 3e4
                        }).data,
                        i = null == r ? void 0 : r.productInfo,
                        a = null == r ? void 0 : r.productDetails;
                    return void 0 === i || void 0 === a ? {
                        isLoading: !0,
                        productInfo: void 0,
                        productDetails: void 0
                    } : {
                        isLoading: !1,
                        productInfo: i,
                        productDetails: a
                    }
                },
                sR = function(e) {
                    var t = e.buttonWidth,
                        n = e.buttonClassName,
                        r = e.iconClassName,
                        i = e.hideButtonText,
                        a = e.hideButtonIcon,
                        o = e.buttonContent,
                        l = e.onClick,
                        s = e.isPurchasing,
                        u = e.redirectUrl;
                    return u ? (0, ri.jsx)("a", {
                        href: u,
                        className: "purchase-button-link",
                        children: (0, ri.jsxs)(rL, {
                            "data-testid": "play-purchase-button",
                            variant: "Emphasis",
                            style: rj,
                            className: ro()(rM(t), n),
                            onClick: function() {
                                return null
                            },
                            isDisabled: s,
                            children: [!a && (0, ri.jsx)("span", {
                                className: r
                            }), !i && (0, ri.jsx)("span", {
                                className: "btn-text",
                                children: o
                            })]
                        })
                    }) : (0, ri.jsxs)(rL, {
                        "data-testid": "play-purchase-button",
                        variant: "Emphasis",
                        style: rj,
                        className: ro()(rM(t), n),
                        onClick: function(e) {
                            l && !s && l(e)
                        },
                        isDisabled: s,
                        children: [!a && (0, ri.jsx)("span", {
                            className: r
                        }), !i && (0, ri.jsx)("span", {
                            className: "btn-text",
                            children: o
                        })]
                    })
                };
            sR.defaultProps = {
                hideButtonText: !1,
                buttonWidth: rD,
                buttonClassName: "btn-economy-robux-white-lg game-play-button-purchase-lg",
                iconClassName: "icon icon-regular-robux size-400",
                hideButtonIcon: !1,
                isPurchasing: !1,
                onClick: void 0,
                redirectUrl: void 0
            };
            var sL = function(e) {
                    var t, n, r = e.universeId,
                        i = e.placeId,
                        a = e.productDetails,
                        o = e.translate,
                        l = e.iconClassName,
                        s = e.buttonWidth,
                        u = e.buttonClassName,
                        c = e.hideButtonText,
                        d = e.redirectPurchaseUrl,
                        f = e.showDefaultPurchaseText,
                        h = e.pageContext,
                        p = tx((0, ej.useState)(!1), 2),
                        m = p[0],
                        v = p[1],
                        y = (0, ej.useCallback)(function(e) {
                            return eD(function() {
                                var t, n, o;
                                return eM(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            if (e.preventDefault(), e.stopPropagation(), n = null == (t = a.fiatPurchaseData) ? void 0 : t.basePriceId, !i || !n) return [2];
                                            v(!0), l.label = 1;
                                        case 1:
                                            return l.trys.push([1, 3, 4, 5]), n7(r, tr.fiatPurchaseUpsellName, e8.FiatPurchaseRequired, h), [4, e4(i, n)];
                                        case 2:
                                            return (o = l.sent()) && (0, th.isValidStripeCheckoutUrl)(o) && (window.location.href = o), [3, 5];
                                        case 3:
                                            return l.sent(), eJ(tn.PreparePurchaseUrlError), console.error("Error preparing purchase url"), [3, 5];
                                        case 4:
                                            return v(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, [i, a, r, h]);
                    return (0, ri.jsx)(sR, {
                        buttonWidth: s,
                        buttonClassName: u,
                        iconClassName: l,
                        hideButtonText: c,
                        hideButtonIcon: !0,
                        buttonContent: void 0 !== f && f ? o(te.Buy) : null != (t = null == (n = a.fiatPurchaseData) ? void 0 : n.localizedFiatPrice) ? t : "",
                        onClick: d ? void 0 : y,
                        redirectUrl: d,
                        isPurchasing: m
                    })
                },
                sU = window.RobloxItemPurchase,
                sB = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
                sD = (0, ej.forwardRef)(function(e, t) {
                    var n = rp([e, t]),
                        r = n[0],
                        i = n.slice(1),
                        a = r.className,
                        o = r.style,
                        l = r.variant,
                        s = void 0 === l ? "Rectangle" : l,
                        u = r.isAnimated,
                        c = r.width,
                        d = r.height,
                        f = tu(r, ["className", "style", "variant", "isAnimated", "width", "height"]),
                        h = tx(i, 1)[0],
                        p = "Text" === s,
                        m = "Circle" === s,
                        v = {};
                    return p ? (v.height = null != d ? d : "1em", v.width = null != c ? c : "100%") : (void 0 !== c && (v.width = c), void 0 !== d && (v.height = d)), eF().createElement("div", e6(ez({
                        ref: h,
                        "aria-hidden": "true",
                        "data-variant": s
                    }, f), {
                        className: rm("relative clip block bg-[var(--color-common-shimmer)]", p && "radius-xsmall", m && "radius-circle", !p && !m && "radius-small", (void 0 === u || u) && sB, a),
                        style: ez({}, v, o)
                    }))
                });
            sD.displayName = "Skeleton";
            var sM = Error("thumbnail pending"),
                sj = function(e, t) {
                    return t === sM && e < 5
                },
                sF = function() {
                    var e, t;
                    return {
                        promise: new Promise(function(n, r) {
                            e = n, t = r
                        }),
                        resolve: e,
                        reject: t
                    }
                },
                sH = "150x150",
                sG = "webp",
                sz = function(e) {
                    var t, n, r, i;
                    return "".concat(e.type, ":").concat(e.targetId, ":").concat(null != (t = e.size) ? t : sH, ":").concat(null != (n = e.format) ? n : sG, ":").concat(null != (r = e.version) ? r : "", ":").concat(null != (i = e.headShape) ? i : "", ":").concat(e.includeBackground ? "bg" : "", ":").concat(e.includeProfileFrame ? "frame" : "")
                },
                sV = nb({
                    data: (k = nb({
                        requestId: nv(),
                        state: new nw(ez({
                            type: "literal",
                            values: Array.isArray(T = ["Completed", "Pending", "Blocked", "Error", "InReview"]) ? T : [T]
                        }, t0(void 0))),
                        imageUrl: new nE({
                            type: "optional",
                            innerType: new nP({
                                type: "nullable",
                                innerType: nv()
                            })
                        })
                    }), new ny(ez({
                        type: "array",
                        element: k
                    }, t0(void 0))))
                }),
                sW = function(e) {
                    var t = new Map;
                    return e.data.forEach(function(e) {
                        var n = e.requestId,
                            r = e.state,
                            i = e.imageUrl;
                        "Completed" === r ? t.set(n, null != i ? {
                            state: r,
                            imageUrl: i
                        } : {
                            state: "Error"
                        }) : t.set(n, null != i ? {
                            state: r,
                            imageUrl: i
                        } : {
                            state: r
                        })
                    }), t
                },
                sq = (_ = {
                    delay: 50,
                    maxSize: 100
                }, O = function(e) {
                    return eD(function() {
                        var t, n;
                        return eM(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return t = eK.Url.parse(eW().thumbnailsApi).getOrThrow().withPath("/v1/batch"), n = e.map(function(e) {
                                        var t, n;
                                        return ez({
                                            requestId: sz(e),
                                            type: e.type,
                                            targetId: e.targetId,
                                            size: null != (t = e.size) ? t : sH,
                                            format: null != (n = e.format) ? n : sG
                                        }, null != e.version ? {
                                            version: e.version
                                        } : {}, e.headShape ? {
                                            headShape: e.headShape
                                        } : {}, e.includeBackground ? {
                                            includeBackground: !0
                                        } : {}, e.includeProfileFrame && "AvatarHeadShot" === e.type ? {
                                            includeProfileFrame: !0
                                        } : {})
                                    }), [4, eq.post(t, n, sV, {
                                        credentials: "include",
                                        headers: {
                                            Accept: "application/json"
                                        },
                                        retry: eq.defaultBrowserRetryDelay
                                    })];
                                case 1:
                                    return [2, sW(r.sent().getOrThrow())]
                            }
                        })
                    })()
                }, N = function(e, t) {
                    var n;
                    return null != (n = e.get(sz(t))) ? n : {
                        state: "Error"
                    }
                }, o = _, l = O, u = o.delay, c = o.maxSize, d = [], f = sF(), h = function() {
                    var e = f.resolve,
                        t = f.reject,
                        n = d;
                    d = [], f = sF(), l(n).then(e).catch(t)
                }, R = function(e) {
                    0 === d.length && (s = setTimeout(h, u)), d.push(e);
                    var t = f.promise;
                    return null != c && d.length >= c && (clearTimeout(s), h()), t
                }, function(e) {
                    return R(e).then(function(t) {
                        return N(t, e)
                    })
                }),
                sK = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                        n = Number.parseInt(e, t);
                    return Number.isNaN(n) ? null : n
                },
                sZ = function() {
                    if ("u" < typeof document) return {
                        batchSize: 100,
                        waitMs: 1e3
                    };
                    var e, t, n, r, i, a = document.getElementsByName("performance")[0],
                        o = sK(null != (e = null == a ? void 0 : a.getAttribute("data-ui-performance-metrics-batch-size")) ? e : ""),
                        l = tx((null != (t = null == a ? void 0 : a.getAttribute("data-ui-performance-metrics-batch-wait-time")) ? t : "").split(":"), 3),
                        s = l[0],
                        u = l[1],
                        c = l[2],
                        d = ((null != (n = sK(null != s ? s : "")) ? n : 0) * 3600 + (null != (r = sK(null != u ? u : "")) ? r : 0) * 60 + (null != (i = sK(null != c ? c : "")) ? i : 0)) * 1e3;
                    return {
                        batchSize: null != o ? o : 100,
                        waitMs: 0 === d ? 1e3 : d
                    }
                },
                sY = [],
                sJ = !1,
                sX = function() {
                    if (sJ = !1, 0 !== sY.length) {
                        var e = sY;
                        sY = [], eq.postUntyped(eK.Url.parse("".concat(eW().beaconApi, "/v1/measurements")).getOrThrow(), e, {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e3)
                        })
                    }
                },
                s$ = function(e, t) {
                    var n = nO(t);
                    sY.push({
                        metricName: e,
                        jsonData: n.isOk() ? n.value : "{}"
                    });
                    var r = sZ(),
                        i = r.batchSize,
                        a = r.waitMs;
                    sY.length >= i ? sX() : sJ || (sJ = !0, setTimeout(sX, a))
                },
                sQ = function(e) {
                    var t, n = e.targetId,
                        r = e.type,
                        i = e.size,
                        a = e.format,
                        o = e.version,
                        l = e.headShape,
                        s = e.includeBackground,
                        u = e.includeProfileFrame,
                        c = e.altName,
                        d = e.imgClassName,
                        f = e.containerClassName,
                        h = e.onLoad,
                        p = (0, ej.useRef)(Date.now()),
                        m = (0, ej.useRef)(0),
                        v = (0, ej.useRef)(!1),
                        y = null != s ? s : (null == r ? void 0 : r.toLowerCase()) === "avatarheadshot",
                        g = (0, eH.useQuery)({
                            queryKey: ["thumbnail-2d", r, n, i, a, o, l, y, u],
                            staleTime: 1 / 0,
                            retry: sj,
                            queryFn: function() {
                                return eD(function() {
                                    var e;
                                    return eM(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, sq({
                                                    type: r,
                                                    targetId: n,
                                                    size: i,
                                                    format: a,
                                                    version: o,
                                                    headShape: l,
                                                    includeBackground: y,
                                                    includeProfileFrame: u
                                                })];
                                            case 1:
                                                if ("Pending" === (e = t.sent()).state) throw m.current += 1, sM;
                                                return [2, e]
                                        }
                                    })
                                })()
                            }
                        }),
                        b = g.data,
                        w = g.isError,
                        E = g.error,
                        P = g.isPending,
                        I = g.isLoading;
                    (0, ej.useEffect)(function() {
                        p.current = Date.now(), m.current = 0, v.current = !1
                    }, [r, n, i, a, o, l, y, u]), (0, ej.useEffect)(function() {
                        if (!v.current) {
                            var e = "".concat(r, "_2d");
                            if (b) {
                                if (v.current = !0, s$("ThumbnailStatusCountWebapp", {
                                        Status: b.state,
                                        ThumbnailType: e
                                    }), "Completed" === b.state) {
                                    var t = m.current;
                                    s$("ThumbnailLoadDurationWebapp", {
                                        Status: "Success",
                                        ThumbnailType: e,
                                        Value: String(Date.now() - p.current)
                                    }), s$(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                                        ThumbnailType: e
                                    } : {
                                        ThumbnailType: e,
                                        Value: String(t)
                                    })
                                }
                            } else w && E === sM && (v.current = !0, s$("ThumbnailTimeoutWebapp", {
                                ThumbnailType: e
                            }))
                        }
                    }, [b, w, E, r]);
                    var S = null != (t = null == b ? void 0 : b.imageUrl) ? t : null,
                        x = (null == b ? void 0 : b.state) === "Blocked" ? "icon-blocked" : (null == b ? void 0 : b.state) === "InReview" ? "icon-in-review" : (null == b ? void 0 : b.state) === "Error" ? "icon-broken" : w ? E === sM ? "icon-pending" : "icon-broken" : "",
                        A = null != P ? P : I,
                        C = ["thumbnail-2d-container float-left overflow-hidden", void 0 === f ? "" : f, x, A && "thumbnail-2d-loading"].filter(Boolean).join(" ");
                    return (0, ri.jsxs)("span", {
                        className: C,
                        children: [A && (0, ri.jsx)(sD, {
                            variant: "Rectangle",
                            width: "100%",
                            height: "100%"
                        }), null != S && (0, ri.jsx)("img", {
                            className: ["size-full", void 0 === d ? "" : d].filter(Boolean).join(" "),
                            src: S,
                            alt: void 0 === c ? "" : c,
                            onLoad: h
                        })]
                    })
                },
                s0 = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.price.toString()) ? t : ""
                },
                s1 = function(e) {
                    var t = e.universeId,
                        n = e.iconClassName,
                        r = e.buttonWidth,
                        i = e.buttonClassName,
                        a = e.hideButtonText,
                        o = e.redirectPurchaseUrl,
                        l = e.productDetails,
                        s = e.productInfo,
                        u = e.translate,
                        c = e.refetchPlayabilityStatus,
                        d = (0, ej.useRef)(void 0);
                    null != d.current || (d.current = (0, sU.createItemPurchase)());
                    var f = tx(d.current, 2),
                        h = f[0],
                        p = f[1],
                        m = (0, ej.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), p.start()
                        }, [p]);
                    return (0, ri.jsxs)(eF().Fragment, {
                        children: [(0, ri.jsx)(sR, {
                            buttonWidth: r,
                            buttonClassName: i,
                            iconClassName: n,
                            hideButtonText: a,
                            buttonContent: s0(s),
                            onClick: o ? void 0 : m,
                            redirectUrl: o
                        }), (0, ri.jsx)(h, {
                            translate: u,
                            productId: s.productId,
                            expectedPrice: s.price,
                            thumbnail: (0, ri.jsx)(sQ, {
                                type: "GameIcon",
                                size: "150x150",
                                targetId: t,
                                imgClassName: "game-card-thumb"
                            }),
                            assetName: l.name,
                            assetType: "Place",
                            sellerName: l.builder,
                            expectedCurrency: 1,
                            expectedSellerId: s.sellerId,
                            onPurchaseSuccess: c,
                            isPlace: !0
                        })]
                    })
                },
                s2 = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.iconClassName,
                        i = void 0 === r ? "icon icon-regular-robux size-400" : r,
                        a = e.buttonWidth,
                        o = void 0 === a ? rD : a,
                        l = e.buttonClassName,
                        s = void 0 === l ? "btn-economy-robux-white-lg game-play-button-purchase-lg" : l,
                        u = e.refetchPlayabilityStatus,
                        c = e.hideButtonText,
                        d = void 0 !== c && c,
                        f = e.redirectPurchaseUrl,
                        h = e.playabilityStatus,
                        p = e.showDefaultPurchaseText,
                        m = e.pageContext,
                        v = av(),
                        y = sN(t, n),
                        g = y.productInfo,
                        b = y.productDetails;
                    return y.isLoading ? (0, ri.jsx)(ab, {
                        buttonClassName: s,
                        buttonWidth: o
                    }) : "Fiat" == (h === e8.FiatPurchaseRequired && (null == b ? void 0 : b.fiatPurchaseData) ? "Fiat" : "Robux") ? (0, ri.jsx)(sL, {
                        universeId: t,
                        placeId: n,
                        iconClassName: i,
                        buttonWidth: o,
                        buttonClassName: s,
                        hideButtonText: d,
                        redirectPurchaseUrl: f,
                        productDetails: b,
                        translate: v,
                        showDefaultPurchaseText: void 0 !== p && p,
                        pageContext: m
                    }) : (0, ri.jsx)(s1, {
                        universeId: t,
                        iconClassName: i,
                        buttonWidth: o,
                        buttonClassName: s,
                        hideButtonText: d,
                        redirectPurchaseUrl: f,
                        productDetails: b,
                        productInfo: g,
                        translate: v,
                        refetchPlayabilityStatus: u
                    })
                },
                s3 = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        i = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.appsFlyerReferralProperties,
                        s = av(),
                        u = (0, ej.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), n6(n, t);
                            var s = rn((null == o ? void 0 : o.launchData) != null ? String(o.launchData) : void 0);
                            n0(n, r, i, a, o, s, l, "DemoPlayButtonClick")
                        }, [t, n, r, i, a, o, l]),
                        c = s(te.PlayDemo) || "Play Demo";
                    return (0, ri.jsx)("button", {
                        type: "button",
                        "data-testid": "demo-play-button",
                        className: "btn-control-lg btn-full-width demo-play-button",
                        onClick: u,
                        children: c
                    })
                },
                s5 = {
                    create: function(e) {
                        var t = e.userId;
                        return eD(function() {
                            return eM(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        var n;
                                        return [4, (n = "wasm-hash-v1:".concat(t), eD(function() {
                                            var e, t;
                                            return eM(this, function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        return e = Array.from, t = Uint8Array.bind, [4, crypto.subtle.digest("SHA-256", new TextEncoder().encode(n))];
                                                    case 1:
                                                        return [2, e.apply(Array, [new(t.apply(Uint8Array, [void 0, r.sent()])), function(e) {
                                                            return e.toString(16).padStart(2, "0")
                                                        }]).join("")]
                                                }
                                            })
                                        })())];
                                    case 1:
                                        return [2, e.sent().slice(0, 16)]
                                }
                            })
                        })()
                    },
                    verify: function(e, t) {
                        return eD(function() {
                            return eM(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, s5.create(t)];
                                    case 1:
                                        return [2, e === n.sent()]
                                }
                            })
                        })()
                    }
                },
                s4 = new Map([
                    ["3f", s5]
                ]),
                s6 = al("PlayButton"),
                s8 = function() {
                    s6("PlayOnWebImpression")
                },
                s7 = function() {
                    s6("PlayOnWebClick")
                },
                s9 = function(e) {
                    var t = e.placeId,
                        n = e.rootPlaceId,
                        r = e.universeId,
                        i = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.wasmJoinId,
                        s = e.joinData,
                        u = void 0 === s ? rn((null == o ? void 0 : o.launchData) != null ? String(o.launchData) : void 0) : s,
                        c = e.eventContext;
                    s7();
                    var d = rr(t, r, o, u, c),
                        f = d.joinAttemptId,
                        h = d.joinAttemptOrigin,
                        p = new URL("".concat(eW().playWebsite, "/games/start?placeId=").concat(t));
                    u.launchData && p.searchParams.set("launchData", u.launchData), u.eventId && p.searchParams.set("eventId", u.eventId), a && t === n ? p.searchParams.set("gameInstanceId", a) : i && p.searchParams.set("privateServerLinkCode", i), f && p.searchParams.set("joinAttemptId", f), null != h && p.searchParams.set("joinAttemptOrigin", String(h)), l && p.searchParams.set("wasmJoinId", l), window.open(p.toString(), "_blank", "noopener")
                },
                ue = function(e, t) {
                    var n = null == tT ? void 0 : tT.IntersectionObserver;
                    if ("function" != typeof n) return function() {};
                    var r = e.element,
                        i = tu(e, ["element"]);
                    try {
                        var a = new n(function(e, n) {
                            var r, i = tx(e, 1)[0];
                            t(null != (r = null == i ? void 0 : i.isIntersecting) && r, n)
                        }, i);
                        return a.observe(r),
                            function() {
                                a.disconnect()
                            }
                    } catch (e) {}
                    return function() {}
                },
                ut = function(e, t, n) {
                    var r = (0, ej.useRef)(!1);
                    (0, ej.useEffect)(function() {
                        r.current = !1
                    }, [t]), (0, ej.useEffect)(function() {
                        if (n && e.current && !r.current) return ue({
                            element: e.current,
                            threshold: .5
                        }, function(e, t) {
                            e && !r.current && (r.current = !0, s8(), t.disconnect())
                        })
                    }, [e, t, n])
                },
                un = function(e) {
                    var t = e.placeId,
                        n = e.rootPlaceId,
                        r = e.universeId,
                        i = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.wasmJoinId,
                        s = e.playOnWebVariant,
                        u = ap("Feature.ExperienceDetails"),
                        c = (0, ej.useRef)(null),
                        d = !!l;
                    ut(c, r, d);
                    var f = (0, ej.useCallback)(function(e) {
                        e.preventDefault(), e.stopPropagation(), s9({
                            placeId: t,
                            rootPlaceId: n,
                            universeId: r,
                            privateServerLinkCode: i,
                            gameInstanceId: a,
                            eventProperties: o,
                            wasmJoinId: l
                        })
                    }, [t, n, r, i, a, o, l]);
                    if (!d) return null;
                    var h = u.dynamic(te.PlayOnWeb, void 0, "Play in browser"),
                        p = s === rF;
                    return (0, ri.jsxs)("div", {
                        className: "play-on-web-button-container",
                        children: [(0, ri.jsx)(rL, {
                            ref: c,
                            "data-testid": "play-on-web-button",
                            variant: p ? "Emphasis" : "Standard",
                            size: "Large",
                            style: rj,
                            className: ro()("btn-full-width play-on-web-button", p ? "btn-common-play-game-lg" : "btn-control-lg"),
                            "aria-label": p ? h : void 0,
                            onClick: f,
                            children: p ? (0, ri.jsx)("span", {
                                className: "icon icon-filled-play-large size-700"
                            }) : h
                        }), (0, ri.jsx)("span", {
                            "data-testid": "play-on-web-beta-notice",
                            className: "text-caption-medium content-muted play-on-web-beta-notice",
                            children: u.dynamic(te.PlayOnWebBetaNotice, void 0, "Play in browser is in beta")
                        })]
                    })
                },
                ur = function(e) {
                    var t = e.activeUpsell,
                        n = e.closeUpsell,
                        r = e.creatorId,
                        i = av(),
                        a = i("Action.Cancel") || "Cancel",
                        o = i("Action.OK") || "OK",
                        l = i("Action.Close") || "Close";
                    return (0, ri.jsxs)(eF().Fragment, {
                        children: [(0, ri.jsx)(sx, {
                            titleText: i("Action.Settings") || "Settings",
                            bodyText: i("Message.UpdateSettingsToPlaytest") || "Update your settings to join this Playtest.",
                            primaryButtonText: i("Action.OpenSettings") || "Open Settings",
                            secondaryButtonText: a,
                            closeLabelText: l,
                            onPrimaryButtonClick: function() {
                                n(), re()
                            },
                            onSecondaryButtonClick: n,
                            isModalOpen: "settings" === t,
                            onCloseModal: n,
                            hasCloseAffordance: !1,
                            orientButtonsVertically: !0
                        }), (0, ri.jsx)(sx, {
                            titleText: i("TrustedFriend.Label.AddTrustedFriend") || "Add trusted friend",
                            bodyText: i("Message.TrustedFriendsRequiredForPlaytest") || "Add this creator as a trusted friend to join the Playtest.",
                            primaryButtonText: void 0 !== r ? i("Action.Add") || "Add" : void 0,
                            secondaryButtonText: void 0 !== r ? a : o,
                            closeLabelText: l,
                            onPrimaryButtonClick: void 0 !== r ? function() {
                                n(), rt(r)
                            } : void 0,
                            onSecondaryButtonClick: n,
                            isModalOpen: "trustedFriends" === t,
                            onCloseModal: n,
                            hasCloseAffordance: !1,
                            orientButtonsVertically: !0
                        })]
                    })
                },
                ui = function(e) {
                    var t = e.creatorId,
                        n = tx((0, ej.useState)(null), 2),
                        r = n[0],
                        i = n[1],
                        a = (0, ej.useCallback)(function() {
                            i(null)
                        }, []);
                    return {
                        openUpdatePlaytestSettingsUpsell: (0, ej.useCallback)(function() {
                            i("settings")
                        }, []),
                        openTrustedFriendsPlaytestUpsell: (0, ej.useCallback)(function() {
                            i("trustedFriends")
                        }, []),
                        playtestUpsellModals: (0, ri.jsx)(ur, {
                            activeUpsell: r,
                            closeUpsell: a,
                            creatorId: t
                        })
                    }
                },
                ua = {},
                uo = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        i = e.creatorId,
                        a = e.privatePlaytestInfo,
                        o = e.refetchPlayabilityStatus,
                        l = e.pageContext,
                        s = e.eventProperties,
                        u = void 0 === s ? ua : s,
                        c = e.appsFlyerReferralProperties,
                        d = void 0 === c ? ua : c,
                        f = av(),
                        h = ui({
                            creatorId: i
                        }),
                        p = h.openUpdatePlaytestSettingsUpsell,
                        m = h.openTrustedFriendsPlaytestUpsell,
                        v = h.playtestUpsellModals,
                        y = (0, ej.useCallback)(function() {
                            var e = rn(null != u.launchData ? String(u.launchData) : void 0);
                            n0(n, r, void 0, void 0, u, e, d, "PlaytestPlayButtonClick", !0)
                        }, [d, u, n, r]),
                        g = (0, ej.useCallback)(function(e) {
                            if (e.preventDefault(), e.stopPropagation(), a.isPlayable) return void y();
                            var n = a.playabilityStatus,
                                r = n9(n);
                            if (void 0 !== n && void 0 !== r) {
                                if (r === nq) {
                                    n7(t, tr.ageCheckUpsellName, n, l), eD(function() {
                                        return eM(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return e.trys.push([0, 2, , 3]), [4, n4({
                                                        context: ti,
                                                        pageContext: l
                                                    })];
                                                case 1:
                                                    return e.sent() && o(), [3, 3];
                                                case 2:
                                                    return e.sent(), [3, 3];
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })();
                                    return
                                }
                                if (r === nK) {
                                    p(), n7(t, tr.updatePlaytestSettingsUpsellName, n, l);
                                    return
                                }
                                m(), n7(t, tr.trustedFriendRequiredUpsellName, n, l)
                            }
                        }, [y, m, p, l, a, o, t]),
                        b = f(te.Playtest) || "Preview";
                    return (0, ri.jsxs)(eF().Fragment, {
                        children: [(0, ri.jsx)("button", {
                            type: "button",
                            "data-testid": "playtest-play-button",
                            className: "btn-control-lg btn-full-width playtest-play-button",
                            onClick: g,
                            children: b
                        }), v]
                    })
                },
                ul = function(e, t) {
                    if (void 0 === t) return null;
                    var n, r = e.find(function(e) {
                        var n = e.isEnabled,
                            r = e.primaryStatuses;
                        return n && r.has(t)
                    });
                    return null != (n = null == r ? void 0 : r.render()) ? n : null
                },
                us = function(e) {
                    var t = e.primaryButton,
                        n = e.secondaryButton,
                        r = e.isPrimaryButtonLoading;
                    return n ? (0, ri.jsxs)("div", {
                        className: "stacked-play-buttons-container",
                        children: [(0, ri.jsx)("div", {
                            className: "stacked-play-button-primary",
                            "data-testid": "stacked-play-button-primary",
                            children: t
                        }), !(void 0 !== r && r) && n]
                    }) : t
                },
                uu = function(e) {
                    var t = e.iconClassName,
                        n = e.buttonWidth,
                        r = e.buttonClassName,
                        i = e.hideButtonText,
                        a = av();
                    return (0, ri.jsxs)(rL, {
                        "data-testid": "play-unplayable-button",
                        variant: "Utility",
                        style: rj,
                        className: ro()(rM(void 0 === n ? rD : n), "game-play-button-unplayable", void 0 === r ? "btn-common-play-game-unplayable-lg game-play-button-unplayable-lg" : r),
                        isDisabled: !0,
                        onClick: function() {
                            return null
                        },
                        children: [(0, ri.jsx)("span", {
                            className: void 0 === t ? "icon icon-filled-circle-slash size-400" : t
                        }), !(void 0 !== i && i) && (0, ri.jsx)("span", {
                            className: "btn-text",
                            children: a(te.Unplayable)
                        })]
                    })
                },
                uc = function(e) {
                    var t = e.treatmentData,
                        n = e.isModalOpen,
                        r = e.onConfirm,
                        i = e.onDismiss,
                        a = av();
                    return (0, ri.jsx)(sx, {
                        titleText: t.titleText,
                        bodyText: t.bodyText,
                        primaryButtonText: t.primaryActionText,
                        secondaryButtonText: t.secondaryActionText,
                        closeLabelText: a("Action.Close"),
                        onPrimaryButtonClick: r,
                        onSecondaryButtonClick: i,
                        isModalOpen: n,
                        onCloseModal: i
                    })
                },
                ud = function(e) {
                    return !!e && "string" == typeof e.titleText && e.titleText.length > 0 && "string" == typeof e.bodyText && e.bodyText.length > 0 && "string" == typeof e.primaryActionText && e.primaryActionText.length > 0 && "string" == typeof e.secondaryActionText && e.secondaryActionText.length > 0
                },
                uf = function(e, t, n) {
                    var r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                        i = tx((0, ej.useState)(!1), 2),
                        a = i[0],
                        o = i[1],
                        l = ts(e, !r),
                        s = l.playabilityStatus,
                        u = l.playableUxTreatment,
                        c = l.isFetchingPlayability,
                        d = (0, ej.useCallback)(function(t) {
                            n7(e, t, e8.Playable, n)
                        }, [e, n]);
                    return {
                        doGameLaunchWithPlayableUxTreatment: (0, ej.useCallback)(function() {
                            if (r) return void t();
                            if (c) {
                                t(), eJ(tn.PlayableUxTreatmentPlayabilityStatusStillLoading), d(tr.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (s !== e8.Playable || !(null == u ? void 0 : u.treatment)) return void t();
                            if ("reconfirmLaunchModal" !== u.treatment) {
                                t(), eJ(tn.PlayableUxTreatmentUnknownTreatment), d(tr.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (!ud(u.data)) {
                                t(), eJ(tn.PlayableUxTreatmentMalformedData), d(tr.gameLaunchFallbackUpsellName);
                                return
                            }
                            o(!0), d(tr.reconfirmLaunchModalUpsellName)
                        }, [c, s, u, r, t, d]),
                        playableUxTreatmentModal: (0, ej.useMemo)(function() {
                            return a && u && ud(u.data) ? (0, ri.jsx)(uc, {
                                treatmentData: u.data,
                                isModalOpen: a,
                                onConfirm: function() {
                                    o(!1), t()
                                },
                                onDismiss: function() {
                                    o(!1)
                                }
                            }) : null
                        }, [u, a, t])
                    }
                };
            n(977), n(818);
            (L = eb || (eb = {})).ItemImpressions = "itemImpressions", L.ItemAction = "itemAction", (U = ew || (ew = {})).Games = "Games", U.Home = "Home", U.SearchLanding = "SearchLanding", U.Spotlight = "Spotlight", U.UserProfile = "UserProfile", U.GameDetail = "GameDetail", U.SongList = "SongList", U.SearchPage = "SearchPage", U.PreAuthLanding = "PreAuthLanding", (B = eE || (eE = {})).HomePageSessionInfo = "homePageSessionInfo", B.DiscoverPageSessionInfo = "discoverPageSessionInfo", B.GameSearchSessionInfo = "gameSearchSessionInfo", B.SpotlightPageSessionInfo = "spotlightPageSessionInfo", B.PreAuthLandingPageSessionInfo = "preAuthLandingPageSessionInfo", (D = eP || (eP = {})).ContentType = "contentType", D.Context = "context", D.CollectionId = "collectionId", D.CollectionPosition = "collectionPosition", D.CollectionComponentType = "collectionComponentType", D.InteractionUuid = "interactionUuid", (M = eI || (eI = {})).User = "User", M.Game = "Game", M.Song = "Song", M.Look = "Look", M.Description = "Description", (j = eS || (eS = {})).Online = "online", j.InGame = "inGame", j.InStudio = "inStudio", j.Offline = "offline", (F = ex || (ex = {})).Friend = "friend", F.NotFriend = "notFriend", (H = eA || (eA = {})).ItemIds = "itemIds", H.ItemPositions = "itemPositions", H.RowNumbers = "rowNumbers", H.FeedRowNumbers = "feedRowNumbers", H.PositionsInRow = "positionsInRow", H.PositionsInTopic = "positionsInTopic", H.TotalNumberOfItems = "totalNumberOfItems", (G = eC || (eC = {})).Presences = "presences", G.PresenceUniverseIds = "presenceUniverseIds", G.FriendStatuses = "friendStatuses", G.SourceCarousel = "sourceCarousel", (z = eT || (eT = {})).ItemId = "itemId", z.ItemPosition = "itemPosition", z.ItemComponentType = "itemComponentType", z.RowNumber = "rowNumber", z.FeedRowNumber = "feedRowNumber", z.PositionInRow = "positionInRow", z.PositionInTopic = "positionInTopic", z.TotalNumberOfItems = "totalNumberOfItems", z.ActionType = "actionType", (V = ek || (ek = {})).Presence = "presence", V.PresenceUniverseId = "presenceUniverseId", V.FriendStatus = "friendStatus", V.SourceCarousel = "sourceCarousel";
            var uh = window.Roblox["core-scripts"].util.currentBrowser,
                up = "Website.LandingPage",
                um = function() {
                    var e = (0, ty.getDeviceMeta)();
                    return (null == e ? void 0 : e.isAndroidDevice) === !0 && e.isPhone && !e.isInApp && (0, uh.currentBrowser)() === uh.Browser.Chrome
                },
                uv = function() {
                    return eD(function() {
                        return eM(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return e.trys.push([0, 2, , 3]), [4, rB().getAllValuesForLayer(up)];
                                case 1:
                                    var t;
                                    return [2, !0 === (t = e.sent().IsDownloadPageHidden) || "string" == typeof t && "true" === t.trim().toLowerCase()];
                                case 2:
                                    return e.sent(), eJ(tn.MobileWebSignupLayerReadFailed), [2, !1];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                uy = function(e, t, n) {
                    var r = e === e8.GuestProhibited && t === ew.GameDetail && !1 === n && um(),
                        i = (0, eH.useQuery)({
                            queryKey: ["mobileWebSignupForPlay"],
                            queryFn: uv,
                            enabled: r,
                            staleTime: 1 / 0,
                            retry: !1
                        }).data,
                        a = r && void 0 !== i;
                    return {
                        isMobileWebSignupEnabled: r && null != i && i,
                        logMobileWebSignupExposure: (0, ej.useCallback)(function() {
                            if (a) try {
                                rB().logLayerExposure(up)
                            } catch (e) {
                                eJ(tn.MobileWebSignupExposureLogFailed)
                            }
                        }, [a])
                    }
                },
                ug = function() {
                    var e, t = null == (e = rh()) ? void 0 : e.id,
                        n = (0, eH.useQuery)({
                            queryKey: ["wasmJoinId", t],
                            queryFn: function() {
                                var e;
                                return null == t ? Promise.resolve(null) : (e = {
                                    userId: t
                                }, eD(function() {
                                    var t, n, r;
                                    return eM(this, function(i) {
                                        switch (i.label) {
                                            case 0:
                                                if (!(t = s4.get("3f"))) throw Error("No scheme registered for CURRENT_SCHEME_ID 3f");
                                                return r = (n = "3f").concat, [4, t.create(e)];
                                            case 1:
                                                return [2, r.apply(n, [i.sent()])]
                                        }
                                    })
                                })())
                            },
                            enabled: null != t,
                            staleTime: 1 / 0,
                            retry: !1
                        }),
                        r = n.data;
                    return {
                        wasmJoinId: null != r ? r : void 0,
                        isLoading: n.isInitialLoading
                    }
                },
                ub = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.playabilityStatus,
                        i = e.pageContext;
                    return (0, ri.jsx)(ay, {
                        onButtonClick: function(e) {
                            return eD(function() {
                                return eM(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            e.preventDefault(), e.stopPropagation(), n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, , 4]), n7(t, tr.ageCheckUpsellName, r, i), [4, n4({
                                                context: ti,
                                                pageContext: i
                                            })];
                                        case 2:
                                            return n.sent() && window.location.reload(), [3, 4];
                                        case 3:
                                            return n.sent(), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        buttonClassName: n
                    })
                },
                uw = {},
                uE = new Set([e8.PurchaseRequired, e8.FiatPurchaseRequired, e8.FiatPurchaseDeviceRestricted, e8.ContextualPlayabilityRegionalAvailability]),
                uP = new Set(Object.values(e8).filter(function(e) {
                    return e !== e8.GuestProhibited
                })),
                uI = new Set([e8.Playable]),
                uS = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        i = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        o = e.status,
                        l = e.eventProperties,
                        s = void 0 === l ? uw : l,
                        u = e.appsFlyerReferralProperties,
                        c = void 0 === u ? uw : u,
                        d = e.iconClassName,
                        f = e.buttonWidth,
                        h = void 0 === f ? rD : f,
                        p = e.buttonClassName,
                        m = void 0 === p ? "btn-common-play-game-lg game-play-button-lg" : p,
                        v = e.disableLoadingState,
                        y = e.skipPlayabilityFetch,
                        g = e.buttonText,
                        b = void 0 === g ? void 0 : g,
                        w = e.hideIcon,
                        E = e.analyticsCallback,
                        P = void 0 === E ? void 0 : E,
                        I = e.pageContext,
                        S = tx((0, ej.useState)(void 0), 2),
                        x = S[0],
                        A = S[1],
                        C = tx((0, ej.useState)(void 0), 2),
                        T = C[0],
                        k = C[1],
                        _ = tx((0, ej.useState)(void 0), 2),
                        O = _[0],
                        N = _[1],
                        R = tx((0, ej.useState)(void 0), 2),
                        L = R[0],
                        U = R[1],
                        B = tx((0, ej.useState)(void 0), 2),
                        D = B[0],
                        M = B[1],
                        j = tx((0, ej.useState)(void 0), 2),
                        F = j[0],
                        H = j[1],
                        G = tx((0, ej.useState)(void 0), 2),
                        z = G[0],
                        V = G[1],
                        W = tx((0, ej.useState)(void 0), 2),
                        q = W[0],
                        K = W[1],
                        Z = (0, eH.useQuery)({
                            queryKey: ["tryGetIsVNGLandingRedirectEnabled"],
                            queryFn: tg.tryGetIsVNGLandingRedirectEnabled,
                            retry: !1
                        }).data;
                    (0, ej.useEffect)(function() {
                        eD(function() {
                            var e, n;
                            return eM(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 2, , 3]), [4, eD(function() {
                                            var e, n, r, i, a, o, l, s, u, c, d, f, h, p, m, v, y;
                                            return eM(this, function(g) {
                                                switch (g.label) {
                                                    case 0:
                                                        if (e = {
                                                                isUniverseEnabledForVoice: !1,
                                                                isUniverseEnabledForAvatarVideo: !1
                                                            }, void 0 === rh()) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: !0,
                                                            useCameraU13Design: !1,
                                                            useVoiceUpsellV2Design: !1
                                                        }];
                                                        return [4, e2()];
                                                    case 1:
                                                        var b;
                                                        if (r = (n = g.sent()).playButtonOverlayWebFlag, i = n.voiceOptInWebFlag, a = n.cameraOptInWebFlag, o = n.cameraOptInWebFlagU13, l = n.requireExplicitVoiceConsent, s = n.useCameraU13Design, u = n.useVoiceUpsellV2Design, !r && !(i || a)) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: l,
                                                            useCameraU13Design: s,
                                                            useVoiceUpsellV2Design: u
                                                        }];
                                                        return [4, (b = t, eD(function() {
                                                            var e;
                                                            return eM(this, function(t) {
                                                                switch (t.label) {
                                                                    case 0:
                                                                        return e = {
                                                                            withCredentials: !0,
                                                                            url: "".concat(eW().voiceApi, "/v1/settings/verify/show-age-verification-overlay/").concat(b)
                                                                        }, [4, eX.get(e)];
                                                                    case 1:
                                                                        return [2, t.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        if (d = (c = g.sent()).showAgeVerificationOverlay, f = c.showVoiceOptInOverlay, h = c.showAvatarVideoOptInOverlay, p = c.elegibleToSeeVoiceUpsell, m = c.universePlaceVoiceEnabledSettings, v = !1, y = !1, !rB().getAllValuesForLayer) return [3, 5];
                                                        return [4, rB().getAllValuesForLayer("Voice.AvatarChat.Upsell")];
                                                    case 3:
                                                        return v = Boolean.apply(void 0, [g.sent().ShouldShowUpsell]), [4, rB().getAllValuesForLayer("Voice.AvatarChat.U13Upsell")];
                                                    case 4:
                                                        y = Boolean.apply(void 0, [g.sent().ShouldShowUpsell]), g.label = 5;
                                                    case 5:
                                                        return [2, {
                                                            elegibleToSeeVoiceUpsell: p,
                                                            universePlaceVoiceEnabledSettings: m,
                                                            showAgeVerificationOverlay: r && d,
                                                            showVoiceOptInOverlay: i && f,
                                                            showAvatarVideoOptInOverlay: h && (a && v || o && y),
                                                            requireExplicitVoiceConsent: l,
                                                            useCameraU13Design: s,
                                                            useVoiceUpsellV2Design: u
                                                        }]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return A(null != (e = (n = r.sent()).universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice) && e), N(n.elegibleToSeeVoiceUpsell), k(n.showAgeVerificationOverlay), U(n.showVoiceOptInOverlay), M(n.showAvatarVideoOptInOverlay), H(n.requireExplicitVoiceConsent), V(n.useCameraU13Design), K(n.useVoiceUpsellV2Design), [3, 3];
                                    case 2:
                                        return r.sent(), eJ(tn.PlayButtonShowIdentificationError), N(!1), A(!1), k(!1), U(!1), M(!1), H(!0), V(!1), K(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []);
                    var Y = (0, ej.useCallback)(function() {
                            n6(n, t);
                            var e = rn(null != s.launchData ? String(s.launchData) : void 0);
                            n0(n, r, i, a, s, e, c)
                        }, [n, t, s, c, r, i, a]),
                        J = uf(t, Y, I, void 0 !== y && y),
                        X = J.doGameLaunchWithPlayableUxTreatment,
                        $ = J.playableUxTreatmentModal,
                        Q = uy(o, I, Z),
                        ee = Q.isMobileWebSignupEnabled,
                        et = Q.logMobileWebSignupExposure;
                    return void 0 !== T || void 0 !== v && v ? (0, ri.jsxs)(eF().Fragment, {
                        children: [(0, ri.jsxs)(rL, {
                            "data-testid": "play-button",
                            variant: "Emphasis",
                            style: rj,
                            className: ro()(rM(h), m),
                            onClick: function(e) {
                                return eD(function() {
                                    var t;
                                    return eM(this, function(r) {
                                        var i, a, l, s;
                                        switch (r.label) {
                                            case 0:
                                                if (e.preventDefault(), e.stopPropagation(), o !== e8.Playable) return [3, 7];
                                                if (O && x && rB().getAllValuesForLayer("SocialVoice.VoiceUpsell").then(function() {
                                                        rB().logLayerExposure("SocialVoice.VoiceUpsell")
                                                    }).catch(function() {
                                                        console.error("error logging exposure event in play-join")
                                                    }), !T) return [3, 2];
                                                return [4, eD(function() {
                                                    var e, t;
                                                    return eM(this, function(n) {
                                                        try {
                                                            return t = (e = n5()) ? e.startVerificationFlow() : tb("OpenIdentityVerificationModal", function(e) {
                                                                return {
                                                                    successCallback: function(t, n) {
                                                                        e([t, n])
                                                                    }
                                                                }
                                                            }, [!1, !1]), [2, t]
                                                        } catch (e) {
                                                            return [2, [!1, !1]]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return (t = tx.apply(void 0, [r.sent(), 2]))[0], t[1] && k(!1), [3, 6];
                                            case 2:
                                                if (!L) return [3, 4];
                                                return [4, (i = null == F || F, a = null != q && q, eD(function() {
                                                    var e, t;
                                                    return eM(this, function(n) {
                                                        try {
                                                            return t = (e = n5()) ? e.showVoiceOptInOverlay(i, a) : tb("OpenVoiceOptInOverlay", function(e) {
                                                                return {
                                                                    closeCallback: function(t) {
                                                                        e(t)
                                                                    },
                                                                    requireExplicitVoiceConsent: i,
                                                                    useVoiceUpsellV2Design: a
                                                                }
                                                            }, !1), [2, t]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 3:
                                                return r.sent() && U(!1), [3, 6];
                                            case 4:
                                                if (!D) return [3, 6];
                                                return [4, (l = null == F || F, s = null == z || z, eD(function() {
                                                    var e, t;
                                                    return eM(this, function(n) {
                                                        try {
                                                            return t = (e = n5()) ? e.showAvatarVideoOptInOverlay(l, s) : tb("OpenCameraOptInOverlay", function(e) {
                                                                return {
                                                                    closeCallback: function(t) {
                                                                        e(t)
                                                                    },
                                                                    requireExplicitCameraConsent: l,
                                                                    useCameraU13Design: s
                                                                }
                                                            }, !1), [2, t]
                                                        } catch (e) {
                                                            return [2, !1]
                                                        }
                                                    })
                                                })())];
                                            case 5:
                                                r.sent() && M(!1), r.label = 6;
                                            case 6:
                                                return X(), [3, 8];
                                            case 7:
                                                o === e8.GuestProhibited && (Z ? tg.navigateToLoginWithRedirect() : (et(), ee ? n3(n) : n1(n, c))), r.label = 8;
                                            case 8:
                                                return P && P(), [2]
                                        }
                                    })
                                })()
                            },
                            children: [!(void 0 !== w && w) && (0, ri.jsx)("span", {
                                className: void 0 === d ? "icon icon-filled-play-large size-700" : d
                            }), b && (0, ri.jsx)("span", {
                                className: "play-button-text",
                                children: b
                            })]
                        }), (0, ri.jsx)("div", {
                            id: "id-verification-container"
                        }), $]
                    }) : (0, ri.jsx)(ab, {
                        buttonClassName: m,
                        buttonWidth: h
                    })
                },
                ux = function(e, t) {
                    var n = t.playabilityStatus,
                        r = t.shouldShowVpcPlayButtonUpsells,
                        i = t.shouldShowNoticeAgreementIfPlayable,
                        a = t.unplayableDisplayText;
                    if (void 0 !== n) {
                        if (n === e8.Playable && i) return {
                            message: e(e9),
                            testId: "play-contextual-message"
                        };
                        if (a) return {
                            message: a,
                            testId: "play-server-message"
                        };
                        if (n !== e8.ContextualPlayabilityCoreGated && n8(n, r)) return {
                            message: e(Object.hasOwn(e7, n) ? e7[n] : e7[e8.UnplayableOtherReason]),
                            testId: "play-error"
                        }
                    }
                },
                uA = window.Roblox["core-scripts"].util.elementVisibility,
                uC = function(e, t) {
                    var n = t.universeId,
                        r = t.playabilityStatus,
                        i = t.pageContext,
                        a = t.attributionId,
                        o = t.contextualMessage,
                        l = (0, ej.useRef)(!1);
                    (0, ej.useEffect)(function() {
                        l.current = !1
                    }, [n, r, i, a, o]), (0, ej.useEffect)(function() {
                        if (e.current && !l.current && o) {
                            var t = null;
                            return t = (0, uA.observeVisibility)({
                                    element: e.current,
                                    threshold: .5
                                }, function(e) {
                                    e && !l.current && (l.current = !0, (0, tf.sendEventWithTarget)("playButtonContextualMessageImpression", i, {
                                        universeId: n,
                                        playabilityStatus: r,
                                        contextualMessage: o,
                                        attributionId: a
                                    }), null == t || t(), t = null)
                                }),
                                function() {
                                    null == t || t()
                                }
                        }
                    }, [e, n, r, i, a, o])
                };

            function uT(e) {
                var t = new(eL()).Deferred;
                return eU.Hybrid.Game.launchGame(e, function() {
                    t.resolve(e)
                }), t
            }
            var uk = {
                isJoinAttemptIdEnabled: !1,
                joinMultiplayerGame: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        n = {
                            requestType: eU.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                            placeId: e.placeId.toString(),
                            isPlayTogetherGame: t,
                            browserTrackerId: eU.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (n.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (n.joinAttemptOrigin = e.joinAttemptOrigin), uT(n)
                },
                followPlayerIntoGame: function(e) {
                    var t = {
                        requestType: eU.Hybrid.Game.LAUNCH_MODES.FOLLOW_USER,
                        userId: e.userId.toString(),
                        browserTrackerId: eU.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), uT(t)
                },
                joinGameInstance: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        n = {
                            requestType: eU.Hybrid.Game.LAUNCH_MODES.GAME_INSTANCE,
                            placeId: e.placeId.toString(),
                            instanceId: e.gameId,
                            isPlayTogetherGame: t,
                            browserTrackerId: eU.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (n.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (n.joinAttemptOrigin = e.joinAttemptOrigin), uT(n)
                },
                joinPrivateGame: function(e) {
                    var t = {
                        requestType: eU.Hybrid.Game.LAUNCH_MODES.PRIVATE_SERVER,
                        placeId: e.placeId.toString(),
                        accessCode: e.accessCode,
                        browserTrackerId: eU.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), uT(t)
                },
                playTogetherGame: function(e) {
                    var t = {
                        requestType: eU.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                        placeId: e.placeId.toString(),
                        conversationId: e.conversationId.toString(),
                        browserTrackerId: eU.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), uT(t)
                }
            };
            eL()(document).ready(function() {
                e_ = new eU.TranslationResourceProvider().getTranslationResource("Feature.GameLaunchGuestMode")
            });
            var u_ = {
                    restrictGuests: function(e) {
                        var t = new(eL()).Deferred;
                        return eU.CurrentUser.isAuthenticated ? t.resolve(e) : eU.Dialog.open({
                            titleText: e_.get("Heading.Dialog.SignUpOrLogin"),
                            bodyContent: e_.get("Description.Dialog.ConnectionsSignUpOrLogin"),
                            cssClass: "soli-modal",
                            acceptColor: eU.Dialog.green,
                            acceptText: e_.get("Action.Dialog.SignUp"),
                            declineText: e_.get("Action.Dialog.Login"),
                            onDecline: function() {
                                eU.FormEvents && eU.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_login");
                                var e = "/login?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search);
                                window.location.href = eU.Endpoints ? eU.Endpoints.getAbsoluteUrl(e) : e
                            },
                            onAccept: function() {
                                var e;
                                eU.FormEvents && eU.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_signup"), e = "/CreateAccount?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search), window.location.href = eU.Endpoints ? eU.Endpoints.getAbsoluteUrl(e) : e
                            }
                        }), t
                    }
                },
                uO = window.CoreUtilities,
                uN = {
                    gameLaunchInterface: null,
                    gameLaunchLogger: null,
                    initialized: new Promise(function(e) {
                        eO = e
                    })
                };

            function uR(e, t, n) {
                var r = e6(ez({}, e), {
                    joinAttemptId: null != t ? t : uO.uuidService.generateRandomUuid()
                });
                return n && (r.joinAttemptOrigin = n), r
            }

            function uL(e, t, n) {
                var r, i, a = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    o = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    l = arguments.length > 5 && void 0 !== arguments[5] && arguments[5],
                    s = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : "",
                    u = arguments.length > 7 && void 0 !== arguments[7] ? arguments[7] : "";
                a && o && (r = {
                    url: "".concat(eU.EnvironmentUrls.gameJoinApi, "/v1/team-create-preemptive"),
                    withCredentials: !0,
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json"
                    }
                }, i = {
                    gameJoinAttemptId: uO.uuidService.generateRandomUuid(),
                    placeId: e
                }, uO.httpService.post(r, i)), uN.gameLaunchInterface.editGameInStudio(e, t, n, a && l, s, u)
            }

            function uU(e, t, n, r, i, a, o, l) {
                var s = {
                    placeId: e,
                    launchData: null == a ? void 0 : a.launchData,
                    eventId: null == a ? void 0 : a.eventId,
                    isPlayTogetherGame: !0 === n,
                    referredByPlayerId: o
                };
                return !0 === l && (s.isEarlyTesting = "true"), uN.gameLaunchInterface.isJoinAttemptIdEnabled && (s = uR(s, r, i)), u_.restrictGuests(s).then(function(e) {
                    return uN.gameLaunchInterface.joinMultiplayerGame(e, null == a ? void 0 : a.getPlayOnWeb)
                })
            }
            eL().fn.bindGameLaunch = function() {
                return this.find(".VisitButtonPlayGLI").click(function() {
                    var e = eL()(this);
                    uU(e.attr("placeid"), e.data("is-membership-level-ok"))
                }), this.find(".VisitButtonEditGLI").click(function() {
                    var e = eL()(this);
                    uL(e.attr("placeid"), e.data("universeid"), !!e.data("allowupload"))
                }), this
            }, eL()(document).ready(function() {
                eL()("body").bindGameLaunch()
            }), Object.assign(uN, {
                authenticationChecker: u_,
                joinMultiplayerGame: uU,
                openStudio: function() {
                    uN.gameLaunchInterface.openStudio()
                },
                openPluginInStudio: function(e) {
                    uN.gameLaunchInterface.openPluginInStudio(e)
                },
                editGameInStudio: uL,
                followPlayerIntoGame: function(e, t, n) {
                    var r = {
                        userId: e
                    };
                    return uN.gameLaunchInterface.isJoinAttemptIdEnabled && (r = uR(r, t, n)), u_.restrictGuests(r).then(uN.gameLaunchInterface.followPlayerIntoGame)
                },
                joinGameInstance: function(e, t, n, r, i, a, o, l) {
                    var s = {
                        placeId: e,
                        gameId: t,
                        isPlayTogetherGame: !0 === r,
                        referredByPlayerId: o
                    };
                    return uN.gameLaunchInterface.isJoinAttemptIdEnabled && (s = uR(s, i, a)), u_.restrictGuests(s).then(function(e) {
                        return uN.gameLaunchInterface.joinGameInstance(e, l)
                    })
                },
                joinPrivateGame: function(e, t, n, r, i, a) {
                    return eD(function() {
                        var o;
                        return eM(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return [4, uN.initialized];
                                case 1:
                                    return l.sent(), o = {
                                        placeId: e,
                                        accessCode: t,
                                        linkCode: n
                                    }, uN.gameLaunchInterface.isJoinAttemptIdEnabled && (o = uR(o, r, i)), [2, uN.gameLaunchInterface.joinPrivateGame(o, a)]
                            }
                        })
                    })()
                },
                playTogetherGame: function(e, t, n, r) {
                    var i = {
                        placeId: e,
                        conversationId: t
                    };
                    return uN.gameLaunchInterface.isJoinAttemptIdEnabled && (i = uR(i, n, r)), u_.restrictGuests(i).then(uN.gameLaunchInterface.playTogetherGame)
                },
                setGameLaunchInterface: function(e) {
                    uN.gameLaunchInterface = e, eO()
                },
                setGameLaunchLogger: function(e) {
                    uN.gameLaunchLogger = e
                },
                tryAssetInStudio: function(e) {
                    uN.gameLaunchInterface.tryAssetInStudio(e)
                },
                isJoinAttemptIdEnabled: function() {
                    var e;
                    return null == (e = uN.gameLaunchInterface) ? void 0 : e.isJoinAttemptIdEnabled
                },
                startClientAttemptedEvent: "startClientAttempted",
                startClientFailedEvent: "startClientFailed",
                startClientSucceededEvent: "startClientSucceeded",
                beginInstallEvent: "beginInstall",
                successfulInstallEvent: "successfulInstall",
                manualDownloadEvent: "manualDownload"
            });
            var uB = function(e) {
                    var t, n = "".concat(e, "="),
                        r = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(n)
                        })) ? void 0 : t.slice(n.length);
                    return null == r ? null : {
                        name: e,
                        value: decodeURIComponent(r)
                    }
                },
                uD = function() {
                    var e = uB("RBXcb");
                    if (null == e || "" === e.value) return !1;
                    var t = e.value.split("&").find(function(e) {
                        return "GoogleAnalytics" === e.split("=")[0]
                    });
                    return "true" === (null == t ? void 0 : t.split("=")[1])
                },
                uM = {
                    lastContext: "unknown",
                    contextCategories: {
                        joinUser: "JoinUser"
                    }
                };

            function uj(e, t, n, r, i, a) {
                var o, l, s;
                null !== t && "" !== t && "unknown" !== t && (uM.lastContext = t), eU.EventStream.SendEvent(e, uM.lastContext, ez({
                    lType: "protocol",
                    pid: n,
                    refuid: r,
                    pg: (o = window.location.pathname.toLowerCase(), l = "profile", -1 !== (s = o.lastIndexOf(l)) && o.length === s + l.length ? l : 0 === o.indexOf("/develop") ? "develop" : 0 === o.indexOf("/discover") ? "games" : "gameDetail"),
                    joinAttemptId: i
                }, null != a && {
                    actionType: a
                }))
            }
            Object.assign(uM, {
                SendGamePlayIntent: function(e, t, n, r, i) {
                    uj("gamePlayIntent", e, t, n, r, i), eL()(document).trigger("playButton:gamePlayIntent")
                },
                SendDevelopIntent: function(e, t) {
                    uj("developIntent", e, t)
                },
                SendInstallBegin: function(e, t) {
                    uj("installBegin", e, t)
                },
                SendInstallSuccess: function(e, t) {
                    uj("installSuccess", e, t)
                },
                SendClientStartAttempt: function(e, t) {
                    uj("clientStartAttempt", e, t)
                },
                SendClientStartSuccessWeb: function(e, t) {
                    uj("clientStartSuccessWeb", e, t)
                },
                SendManualDownloadClick: function(e, t) {
                    uj("manualDownload", e, t)
                }
            });
            var uF = {
                    logToConsoleEnabled: !1,
                    logToGAEnabled: !0,
                    logToEphemeralCountersEnabled: !0
                },
                uH = {};
            uH[uN.startClientAttemptedEvent] = ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"], uH[uN.startClientSucceededEvent] = ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"];
            var uG = {};
            eU.GaEventSettings.gaLaunchAttemptAndLaunchSuccessEnabled && (uG[uN.startClientAttemptedEvent] = "Launch Attempt", uG[uN.startClientSucceededEvent] = "Launch Success"), uG[uN.beginInstallEvent] = "Install Begin", uG[uN.successfulInstallEvent] = "Install Success", uG[uN.manualDownloadEvent] = "Manual Download";
            var uz = {};

            function uV(e) {
                uF.logToConsoleEnabled && console.log(e)
            }

            function uW(e, t) {
                if (uF.logToEphemeralCountersEnabled) {
                    var n, r = eL()("#PlaceLauncherStatusPanel").data("os-name");
                    "Windows" === r && (r = "Win32");
                    var i = e;
                    i = (i = i.replace("<os>", r)).replace("<launchmethod>", t), (null == (n = window.EventTracker) ? void 0 : n.fireEvent) && window.EventTracker.fireEvent(i)
                }
            }

            function uq(e, t, n, r) {
                uD() && void 0 !== window.GoogleAnalyticsEvents && uF.logToGAEnabled && window.GoogleAnalyticsEvents.FireEvent && window.GoogleAnalyticsEvents.FireEvent([e, t, n, r])
            }

            function uK(e, t) {
                uV("".concat(e.type, ": ").concat(JSON.stringify(t))), uH[e.type] && eL().each(uH[e.type], function(e, n) {
                    uW(n, t.launchMethod)
                }), uG[e.type] && uq(t.launchMethod, uG[e.type], t.params.launchMode, 0), uz[e.type] && uz[e.type](null, t.params.placeId)
            }
            uz[uN.startClientAttemptedEvent] = uM.SendClientStartAttempt, uz[uN.startClientSucceededEvent] = uM.SendClientStartSuccessWeb, uz[uN.beginInstallEvent] = uM.SendInstallBegin, uz[uN.successfulInstallEvent] = uM.SendInstallSuccess, uz[uN.manualDownloadEvent] = uM.SendManualDownloadClick, Object.assign(uF, {
                logToConsole: uV,
                logToEphemeralCounters: uW,
                logToGA: uq
            }), eL()(document).ready(function() {
                var e = [uN.startClientAttemptedEvent, uN.startClientFailedEvent, uN.startClientSucceededEvent, uN.beginInstallEvent, uN.successfulInstallEvent, uN.manualDownloadEvent];
                eL()(uN).on(e.join(" "), uK)
            });
            var uZ = function() {
                    var e = "click";
                    eL()("body").on(e, ".VisitButtonPlay, .VisitButtonPlayGLI", function() {
                        var e, t = eL()(this);
                        if ((t.hasClass("VisitButtonPlay") || t.hasClass("VisitButtonPlayGLI")) && (e = "PlayButton"), e) {
                            var n = eL()(this).attr("placeid"),
                                r = eU.UrlParser ? eU.UrlParser.getParameterValueByName("rbxp") : null;
                            uM.SendGamePlayIntent(e, n, r)
                        }
                    }), eL()("body").on(e, ".VisitButtonEdit, .VisitButtonEditGLI", function() {
                        var e = eL()(this).attr("placeid");
                        uM.SendDevelopIntent("Edit", e)
                    }), eL()("#rbx-running-games").on(e, ".rbx-game-server-item .rbx-game-server-join", function() {
                        var e = eL()(this).data("placeid");
                        e && uM.SendGamePlayIntent("JoinInstance", e)
                    }), eL()("#rbx-friends-running-games").on(e, ".rbx-friends-game-server-item .rbx-friends-game-server-join", function() {
                        var e = eL()(this).data("placeid");
                        e && uM.SendGamePlayIntent("JoinInstance", e)
                    }), eL()("#game-instances").on(e, "#rbx-vip-servers .rbx-vip-server-item .rbx-vip-server-join", function() {
                        var e = eL()(this).data("placeid");
                        e && uM.SendGamePlayIntent("PrivateServer", e)
                    })
                },
                uY = window.Roblox["core-scripts"].react,
                uJ = "u" > typeof window ? window.navigator.userAgent : "",
                uX = /Mac OS X/i.test(uJ),
                u$ = /Windows NT/i.test(uJ);
            /Linux/i.test(uJ) && /Android/i.test(uJ);
            var uQ = /Android/i.test(uJ),
                u0 = /iPhone|iPad|iPod/i.test(uJ),
                u1 = function(e) {
                    var t = e.alt,
                        n = void 0 === t ? "App Icon" : t,
                        r = e.className,
                        i = e.title,
                        a = e.style;
                    return eF().createElement("div", {
                        className: "app-icon-bluebg app-icon-".concat(uX ? "mac" : u$ ? "windows" : u0 ? "ios" : uQ ? "android" : "windows", " ").concat(void 0 === r ? "" : r),
                        role: "img",
                        "aria-label": n,
                        title: (void 0 === i ? "" : i) || n,
                        style: void 0 === a ? {} : a
                    })
                },
                u2 = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding"],
                u3 = ["Common.VisitGame", "CommonUI.Controls"],
                u5 = {
                    Unknown: 1,
                    WindowsDirectDownload: 2,
                    WindowsStore: 3,
                    MacDirectDownload: 4,
                    AppleAppStore: 5,
                    GooglePlayStore: 6,
                    AmazonAppStore: 7
                },
                u4 = {
                    downloadPageHeader: "Heading.DownloadPage",
                    appStoreLinksHeader: "Heading.AppStoreLinks",
                    windowsDownloadLabel: "Action.DownloadWindowsApp",
                    windowsDownloadLink: (0, tc.getAbsoluteUrl)("/download/client?os=win"),
                    macDownloadLabel: "Action.DownloadMacApp",
                    macDownloadLink: (0, tc.getAbsoluteUrl)("/download/client?os=mac"),
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
                u6 = (eG(eN = {}, u5.WindowsDirectDownload, {
                    href: u4.windowsDownloadLink,
                    title: u4.windowsDownloadLabel,
                    name: "windows",
                    icon: "icon-filled-microsoft",
                    legacyIcon: "icon-logo-win",
                    isDirectDownload: !0
                }), eG(eN, u5.MacDirectDownload, {
                    href: u4.macDownloadLink,
                    title: u4.macDownloadLabel,
                    name: "mac",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !0
                }), eG(eN, u5.AmazonAppStore, {
                    href: u4.amazonStoreLink,
                    title: u4.androidAppDownloadLabel,
                    name: "amazonStore",
                    icon: "icon-filled-amazon",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), eG(eN, u5.GooglePlayStore, {
                    href: u4.googlePlayStoreLink,
                    title: u4.androidAppDownloadLabel,
                    name: "android",
                    icon: "icon-filled-android",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), eG(eN, u5.AppleAppStore, {
                    href: u4.appleAppStoreLink,
                    title: u4.iOSDownloadLabel,
                    name: "iOS",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !1
                }), eN),
                u8 = function(e) {
                    var t, n = e.translate;
                    return (0, ri.jsxs)(eF().Fragment, {
                        children: [(0, ri.jsxs)("div", {
                            className: "flex flex-col gap-small",
                            children: [(0, ri.jsx)("h3", {
                                className: "text-label-large content-emphasis padding-none",
                                children: n("Heading.MobileAppDownloadOption")
                            }), (0, ri.jsx)("p", {
                                className: "text-body-medium",
                                children: n("Label.MobileAppQrCode")
                            })]
                        }), (0, ri.jsx)("div", {
                            className: "flex grow justify-center items-center bg-shift-100 radius-medium padding-x-large",
                            children: (0, ri.jsx)("div", {
                                className: "radius-medium padding-small bg-[white]",
                                children: (0, ri.jsx)("img", {
                                    className: "size-2100",
                                    src: "string" == typeof(t = "https://images.rbxcdn.com/6674b8e189bf79c6.png") ? t : t.src,
                                    alt: ""
                                })
                            })
                        })]
                    })
                },
                u7 = function() {
                    function e(t, n) {
                        tB(this, e), eG(this, "url", void 0), eG(this, "searchParams", void 0), this.url = t, this.searchParams = n
                    }
                    return nS(e, [{
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
                    }]), e
                }(),
                u9 = function(e) {
                    return rl(new URLSearchParams(e))
                },
                ce = function(e) {
                    return Array.isArray(e)
                },
                ct = function(e) {
                    return String(e)
                },
                cn = ["__proto__", "prototype", "constructor"],
                cr = function(e) {
                    return u9(tq(e.entries()).filter(function(e) {
                        var t = tx(e, 2),
                            n = t[0],
                            r = t[1];
                        return !cn.includes(n) && !cn.includes(r)
                    }))
                },
                ci = function() {
                    function e(t) {
                        tB(this, e), eG(this, "searchParams", void 0), this.searchParams = t
                    }
                    return nS(e, [{
                        key: "resolveName",
                        value: function(e, t) {
                            if ("caseSensitive" === t || this.searchParams.has(e)) return e;
                            var n = e.toLowerCase(),
                                r = !0,
                                i = !1,
                                a = void 0;
                            try {
                                for (var o, l = this.searchParams.keys()[Symbol.iterator](); !(r = (o = l.next()).done); r = !0) {
                                    var s = o.value;
                                    if (s.toLowerCase() === n) return s
                                }
                            } catch (e) {
                                i = !0, a = e
                            } finally {
                                try {
                                    r || null == l.return || l.return()
                                } finally {
                                    if (i) throw a
                                }
                            }
                            return e
                        }
                    }, {
                        key: "size",
                        get: function() {
                            return this.searchParams.size
                        }
                    }, {
                        key: "get",
                        value: function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "caseInsensitive";
                            return this.searchParams.get(this.resolveName(e, t))
                        }
                    }, {
                        key: "getAll",
                        value: function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "caseInsensitive";
                            if ("caseSensitive" === t) return this.searchParams.getAll(e);
                            var n = e.toLowerCase();
                            return tq(this.searchParams.entries()).filter(function(e) {
                                return tx(e, 1)[0].toLowerCase() === n
                            }).map(function(e) {
                                return tx(e, 2)[1]
                            })
                        }
                    }, {
                        key: "has",
                        value: function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive";
                            return this.searchParams.has(this.resolveName(e, n), void 0 === t ? void 0 : ct(t))
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(t, n) {
                            var r = u9(this.searchParams);
                            return r.append(t, ct(n)), e.fromUnique(r)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(t) {
                            var n = (0, tU._)(t, URLSearchParams) || (0, tU._)(t, e) || ce(t) ? t : Object.entries(t);
                            return e.new(tq(this.searchParams).concat(tq(n)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(t, n) {
                            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive";
                            if ("caseSensitive" === r) {
                                var i = u9(this.searchParams);
                                return i.set(t, ct(n)), e.fromUnique(i)
                            }
                            var a = t.toLowerCase(),
                                o = [],
                                l = !1,
                                s = !0,
                                u = !1,
                                c = void 0;
                            try {
                                for (var d, f = this.searchParams.entries()[Symbol.iterator](); !(s = (d = f.next()).done); s = !0) {
                                    var h = tx(d.value, 2),
                                        p = h[0],
                                        m = h[1];
                                    p.toLowerCase() !== a ? o.push([p, m]) : l || (o.push([t, ct(n)]), l = !0)
                                }
                            } catch (e) {
                                u = !0, c = e
                            } finally {
                                try {
                                    s || null == f.return || f.return()
                                } finally {
                                    if (u) throw c
                                }
                            }
                            return l || o.push([t, ct(n)]), e.fromUnique(u9(o))
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(t, n) {
                            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive",
                                i = t.toLowerCase(),
                                a = void 0 === n ? void 0 : ct(n),
                                o = function(e) {
                                    var n = tx(e, 2),
                                        o = n[0],
                                        l = n[1];
                                    return ("caseSensitive" === r ? o === t : o.toLowerCase() === i) && (void 0 === a || l === a)
                                },
                                l = tq(this.searchParams.entries());
                            return l.some(o) ? e.fromUnique(u9(l.filter(function(e) {
                                return !o(e)
                            }))) : this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var t = u9(this.searchParams);
                            return t.sort(), e.fromUnique(t)
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
                    }], [{
                        key: "fromUnique",
                        value: function(t) {
                            return new e(t)
                        }
                    }, {
                        key: "internalFromUniqueURLSearchParams",
                        value: function(t) {
                            return e.fromUnique(t)
                        }
                    }, {
                        key: "new",
                        value: function(t) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                            if ((0, tU._)(t, e)) return t;
                            var r = u9((ce(t) ? t : Object.entries(t)).map(function(e) {
                                var t = tx(e, 2);
                                return [t[0], ct(t[1])]
                            }));
                            return e.fromUnique(n ? cr(r) : r)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(t) {
                            var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return e.fromUnique(n ? cr(t) : u9(t))
                        }
                    }, {
                        key: "parse",
                        value: function(t) {
                            var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                r = u9(t);
                            return e.fromUnique(n ? cr(r) : r)
                        }
                    }]), e
                }();
            eG(ci, "empty", ci.fromUnique(u9(""))), tF(Error), tF(Error);
            var ca = function(e) {
                    return rl(new URL(e))
                },
                co = function(e) {
                    function t(e, n) {
                        return tB(this, t), tL(this, t, [e, n])
                    }
                    return tM(t, e), nS(t, [{
                        key: "with",
                        value: function(e) {
                            var n = e.scheme,
                                r = e.host,
                                i = e.port,
                                a = e.path,
                                o = e.searchParams,
                                l = e.fragment;
                            if (null == n && null == r && null == i && null == a && null == o && null == l) return this;
                            var s = ca(this.url);
                            if (null != n && (s.protocol = n), null != r && (s.hostname = r), null != i && (s.port = "number" == typeof i ? i.toString() : i), null != a && (s.pathname = a), null != l && (s.hash = l), null != o) {
                                var u = ci.new(o);
                                return s.search = u.toString(), new t(s, u)
                            }
                            return new t(s, this.searchParams)
                        }
                    }, {
                        key: "withScheme",
                        value: function(e) {
                            var n = ca(this.url);
                            return n.protocol = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withHost",
                        value: function(e) {
                            var n = ca(this.url);
                            return n.hostname = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withPort",
                        value: function(e) {
                            var n = ca(this.url);
                            return n.port = "number" == typeof e ? e.toString() : e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(e) {
                            var n = ca(this.url);
                            return n.pathname = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(e) {
                            var n = ci.new(e),
                                r = ca(this.url);
                            return r.search = n.toString(), new t(r, n)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(e) {
                            var n = this.searchParams.copyAndAppendAll(e),
                                r = ca(this.url);
                            return r.search = n.toString(), new t(r, n)
                        }
                    }, {
                        key: "withFragment",
                        value: function(e) {
                            var n = ca(this.url);
                            return n.hash = e, new t(n, this.searchParams)
                        }
                    }], [{
                        key: "new",
                        value: function(e) {
                            e.password = "", e.username = "";
                            var n = ci.internalFromUniqueURLSearchParams(rl(e.searchParams));
                            return new t(e, n)
                        }
                    }, {
                        key: "fromURL",
                        value: function(e) {
                            return t.new(ca(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            try {
                                return nT(t.new(rl(new URL(e))))
                            } catch (e) {
                                return nk(e)
                            }
                        }
                    }]), t
                }(u7),
                cl = function(e) {
                    var t, n = new URLSearchParams(document.location.search).get("downloadType");
                    if (null != n) {
                        var r = u5[n];
                        if (null != r) return r
                    }
                    if (!e) return u5.Unknown;
                    var i = ty.getDeviceMeta();
                    return (null == i ? void 0 : i.isIosDevice) ? u5.AppleAppStore : (t = e, /Kindle|Silk|KFAPW|KFARWI|KFASWI|KFFOWI|KFJW|KFMEWI|KFOT|KFSAW|KFSOWI|KFTBW|KFTHW|KFTT|WFFOWI|KFAPWI/i.test(t)) ? u5.AmazonAppStore : (null == i ? void 0 : i.isAndroidDevice) ? u5.GooglePlayStore : ty.isMac() ? u5.MacDirectDownload : ty.isWindows() ? u5.WindowsDirectDownload : u5.Unknown
                },
                cs = function(e, t) {
                    (0, tf.sendEventWithTarget)(tf.eventTypes.formInteraction, "downloadV2", ez({
                        field: "".concat(e, "DownloadLink"),
                        aType: "click"
                    }, t ? {
                        source: t
                    } : {}))
                },
                cu = function(e) {
                    return Object.values(u5).some(function(t) {
                        return t === e
                    })
                },
                cc = function(e) {
                    if (null != e) {
                        if ("number" == typeof e) return cu(e) && u6[e] ? e : void 0;
                        var t = u5[e];
                        if (null != t && u6[t]) return t;
                        var n = Number(e);
                        if (Number.isInteger(n) && cu(n) && u6[n]) return n
                    }
                },
                cd = function(e) {
                    var t;
                    return null != (t = cc(e)) ? t : cl(navigator.userAgent)
                },
                cf = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = t.downloadTypeOverride,
                        r = t.translate,
                        i = cd(n),
                        a = u6[i];
                    if (a) {
                        var o = a.isDirectDownload ? a.href : null != (e = null == r ? void 0 : r(a.href)) ? e : a.href,
                            l = co.parse(o);
                        if (!l.isErr()) return {
                            downloadType: i,
                            link: a,
                            isDirectDownload: a.isDirectDownload,
                            href: l.value,
                            icon: a.icon,
                            legacyIcon: a.legacyIcon
                        }
                    }
                },
                ch = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, ri.jsxs)(eF().Fragment, {
                        children: [(0, ri.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, ri.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                cp = "\x01LINK_START\x01",
                cm = "\x01LINK_END\x01",
                cv = new RegExp("".concat(cp, "|").concat(cm)),
                cy = function() {
                    var e = tx(u2, 5),
                        t = e[0],
                        n = e[1],
                        r = e[2],
                        i = e[3],
                        a = e[4],
                        o = ap(t),
                        l = ap(n),
                        s = ap(r),
                        u = ap(i),
                        c = ap(a);
                    return (0, ej.useMemo)(function() {
                        var e;
                        return e = [c, u, s, l, o],
                            function(t, n, r) {
                                var i = n && Object.fromEntries(Object.entries(n).filter(function(e) {
                                        return "string" == typeof e[1] || "number" == typeof e[1] || (0, tU._)(e[1], Date)
                                    })),
                                    a = e.find(function(e) {
                                        return e.has(t)
                                    });
                                return a ? a.dynamic(t, i) : null != r ? r : ""
                            }
                    }, [c, u, s, l, o])
                },
                cg = Error("client not started"),
                cb = 0,
                cw = function(e) {
                    var t = tx((0, ej.useState)(function() {
                            return cb += 1
                        }), 1)[0],
                        n = (0, eH.useQuery)({
                            queryKey: ["client-status", t],
                            queryFn: function() {
                                return eD(function() {
                                    return eM(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, eD(function() {
                                                    var e, t;
                                                    return eM(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return [4, eq.get(nN(eW().matchmakingApi, "/v1/client-status"), nR, {
                                                                    credentials: "include"
                                                                })];
                                                            case 1:
                                                                return t = n.sent().getOrThrow().status, [2, null != (e = nL.find(function(e) {
                                                                    return e === t
                                                                })) ? e : "Unknown"]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                if ("Unknown" === t.sent()) throw cg;
                                                return e(), [2, !0]
                                        }
                                    })
                                })()
                            },
                            retry: 2,
                            retryDelay: 2500
                        }),
                        r = n.data,
                        i = n.isError;
                    return void 0 === r && !i
                },
                cE = function(e) {
                    var t = e.closeLabel,
                        n = e.title,
                        r = e.description,
                        i = e.button,
                        a = e.unmount;
                    return (0, ri.jsx)(lr, {
                        hasCloseAffordance: !0,
                        closeLabel: t,
                        isModal: !0,
                        open: !0,
                        size: "Medium",
                        onOpenChange: a,
                        children: (0, ri.jsxs)(li, {
                            className: "download-dialog",
                            children: [(0, ri.jsxs)(la, {
                                className: "flex flex-col items-center gap-xlarge",
                                children: [(0, ri.jsx)(u1, {
                                    className: "size-1600"
                                }), (0, ri.jsx)(lo, {
                                    className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center",
                                    children: n
                                }), r && (0, ri.jsx)("p", {
                                    className: "text-body-medium text-align-x-center",
                                    children: r
                                })]
                            }), (0, ri.jsx)(ll, {
                                className: "flex",
                                children: i
                            })]
                        })
                    })
                },
                cP = function(e) {
                    var t = e.download,
                        n = e.launchGame,
                        r = e.getPlayOnWeb,
                        i = e.unmount,
                        a = tx((0, ej.useState)(!1), 2),
                        o = a[0],
                        l = a[1],
                        s = cy(),
                        u = cw(i);
                    if (!o) {
                        if (r) {
                            var c = s("Action.Close");
                            if (u) return (0, ri.jsx)(cE, {
                                closeLabel: c,
                                title: s("PlayOnWebModal.Label.CheckingForRoblox", void 0, "Checking for Roblox..."),
                                button: (0, ri.jsx)(rL, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    isLoading: !0
                                }),
                                unmount: i
                            });
                            var d = r();
                            return d ? (0, ri.jsx)(cE, {
                                closeLabel: c,
                                title: s("PlayOnWebModal.Label.RobloxDidNotOpen", void 0, "Roblox didn't open?"),
                                description: s("PlayOnWebModal.Label.PlayInBrowserInstead", void 0, "You can play this game in your browser instead."),
                                button: (0, ri.jsx)(rL, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    onClick: function() {
                                        d(), i()
                                    },
                                    children: s("PlayButtonText.PlayOnWeb")
                                }),
                                unmount: i
                            }) : (0, ri.jsx)(cE, {
                                closeLabel: c,
                                title: s("Label.RobloxExciteToDownload"),
                                button: (0, ri.jsx)(rL, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    onClick: function() {
                                        return eD(function() {
                                            var e;
                                            return eM(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        try {
                                                            (e = cf()) && cs(e.link.name)
                                                        } catch (e) {}
                                                        return l(!0), [4, t()];
                                                    case 1:
                                                        return n.sent(), [2]
                                                }
                                            })
                                        })()
                                    },
                                    children: s("PlayOnWebModal.Action.Get", void 0, "Get")
                                }),
                                unmount: i
                            })
                        }
                        var f = s(u ? "Label.RobloxLoadingToPlay" : "Label.RobloxExciteToDownload");
                        return (0, ri.jsx)(lr, {
                            hasCloseAffordance: !0,
                            closeLabel: s("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: i,
                            children: (0, ri.jsxs)(li, {
                                className: "download-dialog",
                                children: [(0, ri.jsxs)(la, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, ri.jsx)(u1, {
                                        className: "size-1600"
                                    }), (0, ri.jsx)(lo, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? ch(f) : f
                                    })]
                                }), (0, ri.jsx)(ll, {
                                    className: "flex",
                                    children: u ? (0, ri.jsx)(rL, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, ri.jsx)(rL, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return eD(function() {
                                                var e;
                                                return eM(this, function(n) {
                                                    switch (n.label) {
                                                        case 0:
                                                            try {
                                                                (e = cf()) && cs(e.link.name)
                                                            } catch (e) {}
                                                            return l(!0), [4, t()];
                                                        case 1:
                                                            return n.sent(), [2]
                                                    }
                                                })
                                            })()
                                        },
                                        children: s("Title.DownloadPage")
                                    })
                                })]
                            })
                        })
                    }
                    var h = (0, ty.isMac)(),
                        p = h ? (0, tc.getAbsoluteUrl)("/download/client?os=mac") : (0, tc.getAbsoluteUrl)("/download/client?os=win");
                    return (0, ri.jsx)(lr, {
                        hasCloseAffordance: !0,
                        closeLabel: s("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: i,
                        children: (0, ri.jsx)(li, {
                            className: "install-dialog",
                            children: (0, ri.jsx)(la, {
                                className: "content-default",
                                children: (0, ri.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, ri.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, ri.jsx)(lo, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: s("Heading.DownloadConfirmation")
                                        }), (0, ri.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(s("Label.FollowInstallSteps"), " ").concat(s("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(p, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, ri.jsx)("div", {}), " ", (0, ri.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, ri.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, ri.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: s("Heading.InstallInstructions")
                                            }), (0, ri.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, ri.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: s(h ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ri.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: s("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ri.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: s("Response.Dialog.ThirdInstruction")
                                                }), (0, ri.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = s("Response.Dialog.FourthInstruction", {
                                                                startLink: cp,
                                                                endLink: cm
                                                            }),
                                                            t = e.split(cv);
                                                        if (t.length < 3) return e;
                                                        var r = tx(t, 3),
                                                            i = r[0],
                                                            a = r[1],
                                                            o = r[2];
                                                        return (0, ri.jsxs)(eF().Fragment, {
                                                            children: [i, (0, ri.jsx)("button", {
                                                                type: "button",
                                                                className: "download-link-underline",
                                                                onClick: function() {
                                                                    return null == n ? void 0 : n()
                                                                },
                                                                children: a
                                                            }), o]
                                                        })
                                                    }()
                                                })]
                                            })]
                                        }), (0, ri.jsx)("div", {}), " ", (0, ri.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, ri.jsx)("div", {}), " ", (0, ri.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, ri.jsx)(u8, {
                                                translate: s
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                },
                cI = function(e) {
                    var t = e.unmount,
                        n = tx(u3, 2),
                        r = n[0],
                        i = n[1],
                        a = ap(r),
                        o = ap(i);
                    return (0, ri.jsx)(lr, {
                        hasCloseAffordance: !1,
                        isModal: !0,
                        open: !0,
                        size: "Small",
                        onOpenChange: function(e) {
                            e || t()
                        },
                        children: (0, ri.jsxs)(li, {
                            children: [(0, ri.jsxs)(la, {
                                className: "flex flex-col gap-small",
                                children: [(0, ri.jsx)(lo, {
                                    className: "text-heading-small content-emphasis padding-none",
                                    children: a("Heading.ErrorStartingGame")
                                }), (0, ri.jsx)("p", {
                                    className: "text-body-medium content-default",
                                    children: a("Response.Dialog.ErrorLaunching")
                                })]
                            }), (0, ri.jsx)(ll, {
                                className: "flex",
                                children: (0, ri.jsx)(rL, {
                                    className: "grow",
                                    variant: "Emphasis",
                                    size: "Medium",
                                    onClick: t,
                                    children: o.has("Action.OK") ? o("Action.OK") : "OK"
                                })
                            })]
                        })
                    })
                },
                cS = window.Roblox["core-lib"].index;
            tq(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(tq(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var cx = tq(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(tq(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                cA = tq(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(tq(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            tq(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(tq(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var cC = new Map([
                    ["zh_cjv", "zh_cn"]
                ]),
                cT = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                ck = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = tx(e, 2),
                            n = t[0],
                            r = t[1];
                        return null == r ? [] : [
                            [ij(n), r]
                        ]
                    }))
                },
                c_ = function(e) {
                    var t = cT(),
                        n = t.Lang,
                        r = t.LangDynamic,
                        i = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [ij(e), ez({}, ck(null == i ? void 0 : i[e]), ck(null == n ? void 0 : n[e]), ck(null == r ? void 0 : r[e]))]
                    }))
                },
                cO = function(e) {
                    var t, n, r = e.namespaces,
                        i = e.locale,
                        a = e.children,
                        o = r.join(","),
                        l = (0, ej.useMemo)(function() {
                            return c_(r)
                        }, [o]);
                    return (0, ri.jsx)(i_, {
                        locale: null != i ? i : null != (t = null != (n = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, cS.arrayIncludes)(cA, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? n : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if ((0, tU._)(t, HTMLMetaElement)) {
                                var n = t.dataset.languageCode;
                                if (n) {
                                    var r = null != (e = cC.get(n)) ? e : n;
                                    if ((0, cS.arrayIncludes)(cx, r)) return r.replace("_", "-")
                                }
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: a
                    })
                },
                cN = JSON.parse('{"P":["Feature.GameLaunchGuestMode","Common.VisitGame","CommonUI.Controls","Feature.ExperienceDetails","Feature.DownloadLanding"]}'),
                cR = window.Roblox["core-scripts"].meta.user,
                cL = function() {
                    var e, t, n;
                    return null != (e = null == (n = uB("RBXEventTrackerV2")) || null == (t = n.value.match(/browserid=([^&]*)/i)) ? void 0 : t[1]) && e
                };
            ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
            });
            var cU = "Website.DownloadFunnel",
                cB = "deeplink",
                cD = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                    return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
                }),
                cM = ["/share-links"],
                cj = ["ExperienceAffiliate"],
                cF = function(e) {
                    var t;
                    return cM.includes(e.pathname) && cj.includes(null != (t = e.searchParams.get("type")) ? t : "")
                },
                cH = function(e) {
                    try {
                        var t = new URL(e).searchParams.get("referralUrl");
                        if (!t) return null;
                        var n = new URL(decodeURIComponent(t));
                        if (cF(n)) return n.href;
                        return null
                    } catch (e) {
                        return null
                    }
                },
                cG = function(e, t, n) {
                    var r;
                    try {
                        null == (r = window.Roblox.EventStream) || r.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: t,
                            group: cB,
                            action: "create-token-attempt",
                            status_code: n,
                            token: null != e ? e : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (e) {}
                },
                cz = "".concat(eW().apiGatewayUrl, "/deferred-deep-link/token-api"),
                cV = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return eD(function() {
                        var n, r, i, a, o, l, s, u, c;
                        return eM(this, function(d) {
                            switch (d.label) {
                                case 0:
                                    n = t.authTicket, r = t.btId, i = t.downloadSource, a = t.launchContext, o = {
                                        linkId: e,
                                        group: cB
                                    }, n && (o.authTicket = n), r && (o.btId = r), i && (o.downloadSource = i), a && (o.launchContext = a), l = {
                                        withCredentials: !0,
                                        url: "".concat(cz, "/create-token")
                                    }, d.label = 1;
                                case 1:
                                    return d.trys.push([1, 3, , 4]), [4, eX.post(l, o)];
                                case 2:
                                    return cG(c = null != (s = (u = d.sent()).data.token) ? s : null, e, u.status), [2, c];
                                case 3:
                                    return d.sent(), [2, null];
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                },
                cW = al("Download"),
                cq = function(e) {
                    cW("GameJoinDeeplinkToken", {
                        outcome: e
                    })
                },
                cK = new TextEncoder,
                cZ = function(e) {
                    var t;
                    return rl((t = e, rl(btoa(Array.from(cK.encode(t), function(e) {
                        return String.fromCodePoint(e)
                    }).join("")))).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, ""))
                };
            new TextDecoder;
            var cY = ["joinAttemptOrigin", "accessCode", "linkCode", "gameId", "launchData", "eventId", "conversationId"],
                cJ = function(e, t, n) {
                    var r = null == (p = co.parse(e).getOrNull()) ? void 0 : p.searchParams;
                    if (null == r) return null;
                    var i = sK(null != (d = r.get("placeId")) ? d : "");
                    if (null == i || i <= 0) return null;
                    var a = sK(String(null != n ? n : "")),
                        o = {
                            v: 1,
                            joinType: "GameJoin",
                            placeId: i,
                            isPlayTogetherGame: "true" === r.get("isPlayTogetherGame"),
                            referredByPlayerId: null != a && a > 0 ? a : null != (f = sK(null != (h = r.get("referredByPlayerId")) ? h : "0")) ? f : 0
                        },
                        l = r.get("request");
                    l && (o.requestType = l);
                    var s = !0,
                        u = !1,
                        c = void 0;
                    try {
                        for (var d, f, h, p, m, v = cY[Symbol.iterator](); !(s = (m = v.next()).done); s = !0) {
                            var y = m.value,
                                g = r.get(y);
                            g && (o[y] = g)
                        }
                    } catch (e) {
                        u = !0, c = e
                    } finally {
                        try {
                            s || null == v.return || v.return()
                        } finally {
                            if (u) throw c
                        }
                    }
                    return t && (o.launchExp = t), cZ(nO(o).value)
                },
                cX = ["Messages", "Avatar"],
                c$ = function(e) {
                    var t;
                    return null != (t = cX.find(function(t) {
                        return t === e
                    })) ? t : "other"
                },
                cQ = {
                    featureName: "AppShell",
                    team: "User > Consumer Apps > Platforms - Web & Backend",
                    features: {
                        page: {
                            counters: [{
                                name: "ShellStart",
                                dimensions: ["host", "page", "auth_state"]
                            }, {
                                name: "PageHeartbeat",
                                dimensions: ["host", "page", "beat"]
                            }]
                        },
                        presence: {
                            counters: [{
                                name: "PresenceHeartbeat",
                                dimensions: ["host", "page", "outcome"]
                            }]
                        },
                        navigation: {
                            counters: [{
                                name: "NavLoad",
                                dimensions: ["host", "page", "outcome"]
                            }]
                        },
                        realtime: {
                            counters: [{
                                name: "RealtimeStart",
                                dimensions: ["host", "page", "outcome"]
                            }]
                        },
                        chat: {
                            counters: [{
                                name: "ChatLoad",
                                dimensions: ["host", "page", "outcome"]
                            }]
                        },
                        gameLaunch: {
                            counters: [{
                                name: "GameLaunch",
                                dimensions: ["host", "page", "outcome"]
                            }]
                        }
                    }
                },
                c0 = (W = al(cQ.featureName), function(e, t) {
                    var n = Object.values(cQ.features).some(function(t) {
                        var n;
                        return null == (n = t.counters) ? void 0 : n.some(function(t) {
                            var n;
                            return "string" != typeof t && t.name === e && (null == (n = t.dimensions) ? void 0 : n.includes("page")) === !0
                        })
                    });
                    W(e, e6(ez({}, n && null == t.page ? {
                        page: c$(ad())
                    } : {}, t), {
                        host: "dotnet"
                    }))
                }),
                c1 = {
                    isInstalling: !1,
                    robloxLocale: "",
                    gameLocale: "",
                    studioChannel: "",
                    playerChannel: "",
                    isDuarAutoOptInEnabled: !1,
                    isDuarOptOutDisabled: !1,
                    isJoinAttemptIdEnabled: !1,
                    isOmitPlayerChannelForWinAndMacEnabled: !1
                },
                c2 = ["edit", "plugin", "asset"];

            function c3() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "react-dialog-container",
                    t = document.getElementById(e);
                return t ? (aR().unmountComponentAtNode(t), t.innerHTML = "") : ((t = document.createElement("div")).id = e, document.body.appendChild(t)), t
            }

            function c5() {
                eL().modal.close();
                var e = c3("react-launch-failure-dialog-container");
                (0, uY.renderWithErrorBoundary)((0, ri.jsx)(cO, {
                    namespaces: cN.P,
                    children: (0, ri.jsx)(cI, {
                        unmount: function() {
                            return aR().unmountComponentAtNode(e)
                        }
                    })
                }), e)
            }

            function c4(e) {
                var t = eL()("iframe#gamelaunch");
                t.length > 0 && t.remove(), t = eL()("<iframe id='gamelaunch' class='hidden'></iframe>").attr("src", e), eL()("body").append(t);
                var n = new Event("ProtocolLaunchStartSelenium");
                window.dispatchEvent(n)
            }

            function c6(e) {
                return eD(function() {
                    var t, n, r;
                    return eM(this, function(i) {
                        switch (i.label) {
                            case 0:
                                var a;
                                return t = document.getElementById("downloadInstallerIFrame"), n = "/download/client", t.referrerPolicy = "no-referrer", [4, (a = window.location.toString(), eD(function() {
                                    var t, n, r, i, o;
                                    return eM(this, function(l) {
                                        switch (l.label) {
                                            case 0:
                                                if (t = "", !(n = function(e) {
                                                        var t = cH(e);
                                                        if (t) return t;
                                                        var n = new URL(e);
                                                        return (n.search = "", n.hash = "", cD.some(function(e) {
                                                            return e.test(n.pathname)
                                                        })) ? n.toString() : null
                                                    }(a))) return e && cq("unsupportedPage"), [2, t];
                                                return i = [n], o = [{}], [4, eD(function() {
                                                    var e;
                                                    return eM(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                if (null == (0, cR.authenticatedUser)()) return [3, 2];
                                                                return [4, nU()];
                                                            case 1:
                                                                return e = t.sent(), [3, 3];
                                                            case 2:
                                                                e = void 0, t.label = 3;
                                                            case 3:
                                                                return [2, {
                                                                    authTicket: e,
                                                                    btId: cL() || void 0
                                                                }]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return [4, cV.apply(void 0, i.concat([ez.apply(void 0, [e6.apply(void 0, [ez.apply(void 0, o.concat([l.sent()])), {
                                                    downloadSource: "installer"
                                                }]), e ? {
                                                    launchContext: e
                                                } : {}])]))];
                                            case 2:
                                                return r = l.sent(), e && cq(r ? "minted" : "tokenFailed"), r && (t = "?".concat("token", "=").concat(r)), [2, t]
                                        }
                                    })
                                })())];
                            case 1:
                                return r = i.sent(), t.src = "".concat(n).concat(r), [2]
                        }
                    })
                })()
            }

            function c8() {
                return eD(function() {
                    return eM(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return eL()(uN).trigger(uN.manualDownloadEvent, {
                                    launchMethod: "Protocol",
                                    params: {}
                                }), [4, c6()];
                            case 1:
                                return e.sent(), [2]
                        }
                    })
                })()
            }
            var c7 = (ei = null != (en = (K = (q = {
                state: c1,
                getPlaceLauncherBaseUrl: function() {
                    var e = " ";
                    return eU.Endpoints && eU.Endpoints.Urls && (e = eU.Endpoints.getAbsoluteUrl("/Game/PlaceLauncher.ashx")), "h" !== e[0] && (e = "http://".concat(window.location.host, "/Game/PlaceLauncher.ashx")), e.replace("placelauncher", "PlaceLauncher")
                },
                triggerEvent: function(e, t) {
                    return eL()(uN).trigger(uN["".concat(e, "Event")], t)
                },
                logToConsole: function(e) {
                    var t, n;
                    return null == (n = uN.gameLaunchLogger) || null == (t = n.logToConsole) ? void 0 : t.call(n, e)
                },
                showDialog: function(e, t) {
                    return c1.showDialog(e, t)
                },
                closeDialog: function() {
                    return eL().modal.close()
                },
                showLaunchFailureDialog: c5,
                openProtocolUrl: c4
            }).state, Z = q.getPlaceLauncherBaseUrl, Y = q.triggerEvent, J = q.logToConsole, X = q.showDialog, $ = q.closeDialog, Q = q.showLaunchFailureDialog, ee = q.openProtocolUrl, et = {
                getConfig: function() {
                    return {
                        placeLauncherUrl: Z(),
                        robloxLocale: K.robloxLocale,
                        gameLocale: K.gameLocale,
                        playerChannel: K.playerChannel,
                        studioChannel: K.studioChannel,
                        isDuarAutoOptInEnabled: !!K.isDuarAutoOptInEnabled,
                        isDuarOptOutDisabled: !!K.isDuarOptOutDisabled,
                        isOmitPlayerChannelForWinAndMacEnabled: !!K.isOmitPlayerChannelForWinAndMacEnabled
                    }
                },
                getBrowserTrackerId: cL,
                isAuthenticated: cR.isAuthenticated,
                getUserId: cR.userId,
                isWindowsOrMac: function() {
                    return (0, ty.isWindows)() || (0, ty.isMac)()
                },
                onEvent: function(e, t) {
                    "startClientAttempted" === e && c0("GameLaunch", {
                        outcome: "attempted"
                    }), Y(e, t)
                },
                installState: {
                    get: function() {
                        return K.isInstalling
                    },
                    set: function(e) {
                        K.isInstalling = e
                    }
                },
                onLaunchStarted: X,
                onLaunchSucceeded: function() {
                    c0("GameLaunch", {
                        outcome: "succeeded"
                    }), $()
                },
                onLaunchFailed: function(e) {
                    c0("GameLaunch", {
                        outcome: "failed"
                    }), console.error(e), Q()
                },
                openProtocolUrl: function(e) {
                    J("launchProtocolUrl: ".concat(JSON.stringify({
                        url: e
                    }))), ee(e)
                }
            }).installState) ? en : (p = !1, {
                get: function() {
                    return p
                },
                set: function(e) {
                    p = e
                }
            }), ea = null != (er = et.openProtocolUrl) ? er : function(e) {
                null == (t = document.querySelector("iframe#gamelaunch")) || t.remove();
                var t, n = document.createElement("iframe");
                n.id = "gamelaunch", n.className = "hidden", n.src = e, document.body.appendChild(n), window.dispatchEvent(new Event("ProtocolLaunchStartSelenium"))
            }, eo = function(e) {
                return {
                    launchMethod: "Protocol",
                    params: e
                }
            }, el = function(e) {
                return eD(function() {
                    var t, n, r, i, a;
                    return eM(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (o.trys.push([0, 5, , 6]), t = nB(e.launchMode), n = eD(function() {
                                        return eM(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, eq.fetch(nN(eW().matchmakingApi, "/v1/client-status"), {
                                                        method: "POST",
                                                        credentials: "include",
                                                        headers: {
                                                            "content-type": "application/json"
                                                        },
                                                        body: nO({
                                                            status: "Unknown"
                                                        }).value
                                                    })];
                                                case 1:
                                                    return e.sent().getOrThrow(), [2]
                                            }
                                        })
                                    })(), !(et.isAuthenticated() && !t)) return [3, 2];
                                return [4, Promise.all([nU(), n])];
                            case 1:
                                return r = tx.apply(void 0, [o.sent(), 1])[0], [3, 4];
                            case 2:
                                return [4, n];
                            case 3:
                                o.sent(), o.label = 4;
                            case 4:
                                return i = t ? {
                                    userId: et.isAuthenticated() ? et.getUserId() : null,
                                    browser: t_()
                                } : void 0, ea(nj(e, r, i)), et.onLaunchSucceeded(), et.onEvent("startClientSucceeded", eo(e)), ei.get() && (et.onEvent("successfulInstall", eo(e)), ei.set(!1)), [3, 6];
                            case 5:
                                return a = o.sent(), et.onLaunchFailed(a), [3, 6];
                            case 6:
                                return [2]
                        }
                    })
                })()
            }, es = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "play",
                    n = et.getConfig(),
                    r = nB(t),
                    i = e6(ez({}, e), {
                        protocolName: nM(r ? "roblox-studio" : "roblox-player"),
                        launchMode: t,
                        launchTime: Date.now()
                    }),
                    a = i.otherParams;
                a.browsertrackerid = et.getBrowserTrackerId(), a.robloxLocale = n.robloxLocale, a.gameLocale = n.gameLocale, r ? a.channel = n.studioChannel : n.isOmitPlayerChannelForWinAndMacEnabled && et.isWindowsOrMac() || (a.channel = n.playerChannel), r || !n.isDuarAutoOptInEnabled || a.LaunchExp || (a.LaunchExp = n.isDuarOptOutDisabled ? "InApp" : "PreferInApp"), et.onEvent("startClientAttempted", eo(i));
                var o = el(i);
                return et.onLaunchStarted(i, function() {
                    return el(i)
                }), o
            }, eu = function(e, t) {
                var n = function() {
                    ea(e)
                };
                et.onLaunchStarted(t, function() {
                    return n(), Promise.resolve()
                }), n()
            }, ec = function(e, t) {
                var n, r, i, a;
                return n = et.getConfig().placeLauncherUrl, r = e, i = et.getBrowserTrackerId(), a = t, "".concat(n, "?").concat(Object.entries(ez({
                    request: r,
                    browserTrackerId: i
                }, Object.fromEntries(Object.entries(a).filter(function(e) {
                    return void 0 !== tx(e, 2)[1]
                })))).map(function(e) {
                    var t = tx(e, 2),
                        n = t[0],
                        r = t[1];
                    return "".concat(encodeURIComponent(n), "=").concat(encodeURIComponent(null != r ? r : ""))
                }).join("&").replace(/%20/g, "+"))
            }, ed = function(e) {
                return null == et.onGuestLaunch || et.isAuthenticated() ? e() : (et.onGuestLaunch(), Promise.resolve())
            }, ef = function(e, t, n) {
                var r, i = null == (r = et.launchInApp) ? void 0 : r.call(et, ez(e6(ez({}, e), {
                    browserTrackerId: et.getBrowserTrackerId()
                }), "string" == typeof t.joinAttemptId ? {
                    joinAttemptId: t.joinAttemptId
                } : {}, "string" == typeof t.joinAttemptOrigin ? {
                    joinAttemptOrigin: t.joinAttemptOrigin
                } : {}));
                return null != i ? i : n()
            }, {
                joinMultiplayerGame: function(e, t) {
                    return ed(function() {
                        return ef({
                            requestType: "RequestGame",
                            placeId: String(e.placeId),
                            isPlayTogetherGame: !0 === e.isPlayTogetherGame
                        }, e, function() {
                            return es({
                                otherParams: {
                                    placelauncherurl: ec("RequestGame", e)
                                },
                                placeId: e.placeId,
                                isPlayTogetherGame: !0 === e.isPlayTogetherGame,
                                launchData: e.launchData,
                                eventId: e.eventId,
                                getPlayOnWeb: t
                            })
                        })
                    })
                },
                followPlayerIntoGame: function(e) {
                    return ed(function() {
                        return ef({
                            requestType: "RequestFollowUser",
                            userId: String(e.userId)
                        }, e, function() {
                            return es({
                                otherParams: {
                                    placelauncherurl: ec("RequestFollowUser", e)
                                }
                            })
                        })
                    })
                },
                joinGameInstance: function(e, t) {
                    return ed(function() {
                        return ef({
                            requestType: "RequestGameJob",
                            placeId: String(e.placeId),
                            instanceId: e.gameId,
                            isPlayTogetherGame: !0 === e.isPlayTogetherGame
                        }, e, function() {
                            return es({
                                otherParams: {
                                    placelauncherurl: ec("RequestGameJob", e)
                                },
                                placeId: e.placeId,
                                isPlayTogetherGame: !0 === e.isPlayTogetherGame,
                                getPlayOnWeb: t
                            })
                        })
                    })
                },
                joinPrivateGame: function(e, t) {
                    return ef(ez({
                        requestType: "RequestPrivateGame",
                        placeId: String(e.placeId)
                    }, null == e.accessCode ? {} : {
                        accessCode: e.accessCode
                    }, null == e.linkCode ? {} : {
                        linkCode: e.linkCode
                    }), e, function() {
                        return es({
                            otherParams: {
                                placelauncherurl: ec("RequestPrivateGame", e)
                            },
                            placeId: e.placeId,
                            getPlayOnWeb: t
                        })
                    })
                },
                playTogetherGame: function(e) {
                    return ed(function() {
                        return ef({
                            requestType: "RequestGame",
                            placeId: String(e.placeId),
                            conversationId: String(e.conversationId)
                        }, e, function() {
                            return es({
                                otherParams: {
                                    placelauncherurl: ec("RequestPlayTogetherGame", e)
                                },
                                placeId: e.placeId,
                                conversationId: e.conversationId
                            })
                        })
                    })
                },
                openStudio: function() {
                    return es({
                        otherParams: {
                            avatar: "avatar"
                        }
                    }, "edit")
                },
                editGameInStudio: function(e) {
                    var t = e.placeId,
                        n = e.universeId,
                        r = e.startTeamTest,
                        i = void 0 !== r && r,
                        a = e.instanceId,
                        o = e.annotationId;
                    return es({
                        otherParams: e6(ez({
                            task: i ? "StartTeamTest" : "EditPlace",
                            placeId: t,
                            universeId: n
                        }, !i && a ? {
                            targetInstanceId: a
                        } : {}, !i && o ? {
                            annotationId: o
                        } : {}), {
                            avatar: "avatar"
                        }),
                        placeId: t
                    }, "edit")
                },
                tryAssetInStudio: function(e) {
                    return es({
                        otherParams: {
                            assetid: e.assetId,
                            avatar: "avatar"
                        }
                    }, "asset")
                },
                openPluginInStudio: function(e) {
                    return es({
                        otherParams: {
                            pluginid: e.pluginId,
                            avatar: "avatar"
                        }
                    }, "plugin")
                },
                startDeepLinkFlow: function(e) {
                    eu(e, {})
                },
                startGameWithDeepLinkUrl: function(e, t) {
                    eu(e, {
                        protocolName: nM("roblox-player"),
                        launchMode: "play",
                        otherParams: {},
                        placeId: t
                    })
                },
                beginInstall: function(e) {
                    et.onEvent("beginInstall", eo(e)), ei.set(!0)
                },
                manualDownload: function() {
                    et.onEvent("manualDownload", eo({}))
                }
            });
            Object.assign(c1, {
                joinMultiplayerGame: c7.joinMultiplayerGame,
                followPlayerIntoGame: c7.followPlayerIntoGame,
                joinGameInstance: c7.joinGameInstance,
                joinPrivateGame: c7.joinPrivateGame,
                playTogetherGame: c7.playTogetherGame,
                openStudio: c7.openStudio,
                tryAssetInStudio: function(e) {
                    return c7.tryAssetInStudio({
                        assetId: e
                    })
                },
                openPluginInStudio: function(e) {
                    return c7.openPluginInStudio({
                        pluginId: e
                    })
                },
                editGameInStudio: function(e, t, n, r, i, a) {
                    return c7.editGameInStudio({
                        placeId: e,
                        universeId: t,
                        startTeamTest: r,
                        instanceId: i,
                        annotationId: a
                    })
                },
                startDeepLinkFlow: c7.startDeepLinkFlow,
                startGameWithDeepLinkUrl: c7.startGameWithDeepLinkUrl,
                manualDownload: c8,
                attachManualDownloadToLink: function() {
                    return eD(function() {
                        return eM(this, function(e) {
                            return eL()("body #GameLaunchManualInstallLink").click(function() {
                                return eD(function() {
                                    return eM(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, c8()];
                                            case 1:
                                                return e.sent(), [2, !1]
                                        }
                                    })
                                })()
                            }), [2]
                        })
                    })()
                },
                startDownload: c6,
                setLocationHref: c4,
                showDialog: function(e, t) {
                    var n = c3(),
                        r = function() {
                            return aR().unmountComponentAtNode(n)
                        },
                        i = c2.includes(null == e ? void 0 : e.launchMode);
                    (0, uY.renderWithErrorBoundary)((0, ri.jsx)(cO, {
                        namespaces: cN.P,
                        children: (0, ri.jsx)(eH.QueryClientProvider, {
                            client: uY.queryClient,
                            children: (0, ri.jsx)(cP, {
                                download: function() {
                                    return eD(function() {
                                        var t, n, a, o;
                                        return eM(this, function(l) {
                                            switch (l.label) {
                                                case 0:
                                                    if (e.placeId && null != (t = window.localStorage.getItem("ref_info"))) {
                                                        window.localStorage.removeItem("ref_info"), n = {};
                                                        try {
                                                            n = JSON.parse(atob(t))
                                                        } catch (e) {}
                                                        e.referredByPlayerId = n[e.placeId]
                                                    }
                                                    if (eL()(uN).trigger(uN.beginInstallEvent, {
                                                            launchMethod: "Protocol",
                                                            params: e
                                                        }), c1.isInstalling = !0, !i) return [3, 1];
                                                    return document.getElementById("downloadInstallerIFrame").src = "/download/studio", r(), [3, 4];
                                                case 1:
                                                    var s, u, c;
                                                    return [4, (s = null == e || null == (a = e.otherParams) ? void 0 : a.placelauncherurl, u = null == e || null == (o = e.otherParams) ? void 0 : o.LaunchExp, c = null == e ? void 0 : e.referredByPlayerId, eD(function() {
                                                        var e;
                                                        return eM(this, function(t) {
                                                            switch (t.label) {
                                                                case 0:
                                                                    if (null == (e = cJ(null != s ? s : "", u, c))) return cq("noLaunchContext"), [2, void 0];
                                                                    return [4, eD(function() {
                                                                        var e;
                                                                        return eM(this, function(t) {
                                                                            switch (t.label) {
                                                                                case 0:
                                                                                    return t.trys.push([0, 2, , 3]), [4, rB().getAllValuesForLayer(cU)];
                                                                                case 1:
                                                                                    return e = t.sent(), rB().logLayerExposure(cU), [2, !0 === e.IsGameJoinDeeplinkEnabled];
                                                                                case 2:
                                                                                    return t.sent(), [2, !1];
                                                                                case 3:
                                                                                    return [2]
                                                                            }
                                                                        })
                                                                    })()];
                                                                case 1:
                                                                    if (!t.sent()) return cq("ixpOff"), [2, void 0];
                                                                    return [2, e]
                                                            }
                                                        })
                                                    })())];
                                                case 2:
                                                    return [4, c6(l.sent())];
                                                case 3:
                                                    l.sent(), l.label = 4;
                                                case 4:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                launchGame: function() {
                                    return eD(function() {
                                        return eM(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, t()];
                                                case 1:
                                                    return [2, e.sent()]
                                            }
                                        })
                                    })()
                                },
                                getPlayOnWeb: null == e ? void 0 : e.getPlayOnWeb,
                                unmount: r
                            })
                        })
                    }), n)
                },
                showLaunchFailureDialog: c5
            }), eL()(document).ready(function() {
                uN.setGameLaunchInterface(c1);
                var e = eL()("#PlaceLauncherStatusPanel");
                c1.isJoinAttemptIdEnabled = !0, c1.robloxLocale = e.data("protocol-roblox-locale"), c1.gameLocale = e.data("protocol-game-locale");
                var t = e.data("protocol-studio-channel-name");
                "string" == typeof t && "LIVE" !== t.toUpperCase() && (c1.studioChannel = t);
                var n = e.data("protocol-player-channel-name");
                "string" == typeof n && "LIVE" !== n.toUpperCase() && (c1.playerChannel = n), c1.isDuarAutoOptInEnabled = e.data("is-duar-auto-opt-in-enabled"), c1.isDuarOptOutDisabled = e.data("is-duar-opt-out-disabled"), c1.isOmitPlayerChannelForWinAndMacEnabled = e.data("is-omit-player-channel-for-win-and-mac-enabled")
            }), Object.assign(window.Roblox, {
                AuthenticationChecker: u_,
                GameLauncher: uN,
                GameLaunchLogger: uF,
                GamePlayEvents: uM,
                ProtocolHandlerClientInterface: c1,
                PlayButton: {
                    usePlayabilityStatus: ts,
                    PlayabilityStatuses: e8,
                    launchGame: n0,
                    launchLogin: n1,
                    shouldShowUnplayableButton: n8,
                    DefaultPlayButton: function(e) {
                        var t, n = e.placeId,
                            r = e.rootPlaceId,
                            i = e.universeId,
                            a = e.privateServerLinkCode,
                            o = e.gameInstanceId,
                            l = e.refetchPlayabilityStatus,
                            s = e.playabilityStatus,
                            u = e.demoModeAvailable,
                            c = e.privatePlaytestInfo,
                            d = e.creatorId,
                            f = e.hideButtonText,
                            h = e.eventProperties,
                            p = void 0 === h ? uw : h,
                            m = e.appsFlyerReferralProperties,
                            v = void 0 === m ? uw : m,
                            y = e.disableLoadingState,
                            g = e.skipPlayabilityFetch,
                            b = e.buttonClassName,
                            w = e.iconClassName,
                            E = e.purchaseIconClassName,
                            P = e.unplayableIconClassName,
                            I = e.redirectPurchaseUrl,
                            S = e.showDefaultPurchaseText,
                            x = e.shouldShowVpcPlayButtonUpsells,
                            A = e.playabilityStatusCtaOverrides,
                            C = e.pageContext,
                            T = e.playOnWebVariant,
                            k = void 0 === T ? "None" : T,
                            _ = sN(i, n, s === e8.PurchaseRequired || s === e8.FiatPurchaseRequired),
                            O = _.isLoading,
                            N = _.productInfo,
                            R = _.productDetails,
                            L = void 0 !== c && (c.isPlayable || void 0 !== n9(c.playabilityStatus)),
                            U = ug(),
                            B = U.wasmJoinId,
                            D = U.isLoading,
                            M = [{
                                isEnabled: L,
                                primaryStatuses: uP,
                                render: function() {
                                    return (0, ri.jsx)(uo, {
                                        universeId: i,
                                        placeId: n,
                                        rootPlaceId: r,
                                        creatorId: d,
                                        privatePlaytestInfo: c,
                                        refetchPlayabilityStatus: l,
                                        pageContext: C,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: v
                                    })
                                }
                            }, {
                                isEnabled: !!u,
                                primaryStatuses: uE,
                                render: function() {
                                    return (0, ri.jsx)(s3, {
                                        universeId: i,
                                        placeId: n,
                                        rootPlaceId: r,
                                        privateServerLinkCode: a,
                                        gameInstanceId: o,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: v
                                    })
                                }
                            }, {
                                isEnabled: k === rH,
                                primaryStatuses: uI,
                                render: function() {
                                    return (0, ri.jsx)(un, {
                                        placeId: n,
                                        rootPlaceId: r,
                                        universeId: i,
                                        privateServerLinkCode: a,
                                        gameInstanceId: o,
                                        eventProperties: p,
                                        wasmJoinId: B,
                                        playOnWebVariant: rH
                                    })
                                }
                            }],
                            j = !1;
                        switch (s) {
                            case void 0:
                                if (!y) {
                                    t = (0, ri.jsx)(ab, {
                                        buttonClassName: b
                                    });
                                    break
                                }
                                t = (0, ri.jsx)(uS, {
                                    universeId: i,
                                    placeId: n,
                                    rootPlaceId: r,
                                    privateServerLinkCode: a,
                                    gameInstanceId: o,
                                    status: e8.Playable,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: v,
                                    disableLoadingState: y,
                                    skipPlayabilityFetch: g,
                                    buttonClassName: b,
                                    iconClassName: w,
                                    pageContext: C
                                });
                                break;
                            case e8.GuestProhibited:
                            case e8.Playable:
                                var F = null == A ? void 0 : A[s];
                                if (void 0 !== F) {
                                    t = F;
                                    break
                                }
                                if (s === e8.Playable && k === rF) {
                                    if (D && !y) {
                                        t = (0, ri.jsx)(ab, {
                                            buttonClassName: b
                                        }), j = !0;
                                        break
                                    }
                                    if (B) {
                                        t = (0, ri.jsx)(un, {
                                            placeId: n,
                                            rootPlaceId: r,
                                            universeId: i,
                                            privateServerLinkCode: a,
                                            gameInstanceId: o,
                                            eventProperties: p,
                                            wasmJoinId: B,
                                            playOnWebVariant: rF
                                        });
                                        break
                                    }
                                }
                                t = (0, ri.jsx)(uS, {
                                    universeId: i,
                                    placeId: n,
                                    rootPlaceId: r,
                                    privateServerLinkCode: a,
                                    gameInstanceId: o,
                                    status: s,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: v,
                                    disableLoadingState: y,
                                    skipPlayabilityFetch: g,
                                    buttonClassName: b,
                                    iconClassName: w,
                                    pageContext: C
                                });
                                break;
                            case e8.ContextualPlayabilityUnverifiedSeventeenPlusUser:
                            case e8.ContextualPlayabilityAgeCheckRequired:
                                eJ(tn.ActionNeeded), t = (0, ri.jsx)(ub, {
                                    universeId: i,
                                    buttonClassName: b,
                                    playabilityStatus: s,
                                    pageContext: C
                                });
                                break;
                            case e8.PurchaseRequired:
                            case e8.FiatPurchaseRequired:
                                var H = s === e8.FiatPurchaseRequired ? !!(null == R ? void 0 : R.fiatPurchaseData) : !!(null == N ? void 0 : N.isForSale);
                                if (!O && !H) {
                                    eJ(tn.Unplayable), t = (0, ri.jsx)(uu, {
                                        hideButtonText: f,
                                        buttonClassName: b,
                                        iconClassName: P
                                    });
                                    break
                                }
                                t = (0, ri.jsx)(s2, {
                                    refetchPlayabilityStatus: l,
                                    universeId: i,
                                    placeId: n,
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: E,
                                    redirectPurchaseUrl: I,
                                    playabilityStatus: s,
                                    showDefaultPurchaseText: S,
                                    pageContext: C
                                }), j = O;
                                break;
                            case e8.FiatPurchaseDeviceRestricted:
                            case e8.ContextualPlayabilityRegionalAvailability:
                                eJ(tn.Unplayable), t = (0, ri.jsx)(uu, {
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: P
                                });
                                break;
                            case e8.ContextualPlayabilityAgeRecommendationParentalControls:
                                if (x) {
                                    eJ(tn.ActionNeeded), t = (0, ri.jsx)(sO, {
                                        universeId: i,
                                        buttonClassName: b,
                                        placeId: n,
                                        rootPlaceId: r,
                                        privateServerLinkCode: a,
                                        gameInstanceId: o,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: v,
                                        pageContext: C
                                    });
                                    break
                                }
                                eJ(tn.Unplayable), t = (0, ri.jsx)(uu, {
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: P
                                });
                                break;
                            case e8.ContextualPlayabilityRequireParentApproval:
                                if (x) {
                                    eJ(tn.ActionNeeded), t = (0, ri.jsx)(ag, {
                                        universeId: i,
                                        buttonClassName: b,
                                        pageContext: C
                                    });
                                    break
                                }
                                eJ(tn.Unplayable), t = (0, ri.jsx)(uu, {
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: P
                                });
                                break;
                            case e8.UnplayableOtherReason:
                            case e8.GameUnapproved:
                            case e8.IncorrectConfiguration:
                            case e8.UniverseRootPlaceIsPrivate:
                            case e8.InsufficientPermissionFriendsOnly:
                            case e8.InsufficientPermissionGroupOnly:
                            case e8.InsufficientPermissionEditorsOnly:
                            case e8.InsufficientPermissionPlayTestersOnly:
                            case e8.DeviceRestricted:
                            case e8.UnderReview:
                            case e8.AccountRestricted:
                            case e8.TemporarilyUnavailable:
                            case e8.ComplianceBlocked:
                            case e8.ContextualPlayabilityRegionalCompliance:
                            case e8.ContextualPlayabilityAgeGated:
                            case e8.PlaceHasNoPublishedVersion:
                            case e8.ContextualPlayabilityUnrated:
                            case e8.ContextualPlayabilityGeneral:
                            case e8.ContextualPlayabilityAgeGatedByDescriptor:
                            case e8.ContextualPlayabilityExperienceBlockedParentalControls:
                            case e8.ContextualPlayabilityCoreGated:
                            case e8.ContextualPlayabilityPlaytestDisabled:
                            case e8.ContextualPlayabilityTrustedFriendRequired:
                            default:
                                eJ(tn.Unplayable), t = (0, ri.jsx)(uu, {
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: P
                                })
                        }
                        return (0, ri.jsx)(us, {
                            primaryButton: t,
                            secondaryButton: ul(M, s),
                            isPrimaryButtonLoading: j
                        })
                    },
                    PlayButton: uS,
                    PurchaseButton: s2,
                    Error: function(e) {
                        var t = e.playabilityStatus,
                            n = e.errorClassName,
                            r = e.containerRef,
                            i = av()(Object.hasOwn(e7, t) ? e7[t] : e7[e8.UnplayableOtherReason]);
                        return (0, ri.jsx)("span", {
                            "data-testid": "play-error",
                            className: void 0 === n ? "error-message" : n,
                            ref: r,
                            children: i
                        })
                    },
                    ContextualMessage: function(e) {
                        var t = e.playabilityStatus,
                            n = e.shouldShowVpcPlayButtonUpsells,
                            r = e.unplayableDisplayText,
                            i = e.shouldShowNoticeAgreementIfPlayable,
                            a = e.contextualMessageClassName,
                            o = e.analyticsConfig,
                            l = av(),
                            s = (0, ej.useRef)(null),
                            u = ux(l, {
                                playabilityStatus: t,
                                shouldShowVpcPlayButtonUpsells: n,
                                shouldShowNoticeAgreementIfPlayable: i,
                                unplayableDisplayText: r
                            });
                        return (uC(s, {
                            universeId: o.universeId,
                            playabilityStatus: t,
                            pageContext: o.pageContext,
                            attributionId: o.attributionId,
                            contextualMessage: null == u ? void 0 : u.message
                        }), u) ? (0, ri.jsx)("span", {
                            ref: s,
                            "data-testid": u.testId,
                            className: void 0 === a ? "contextual-message" : a,
                            children: u.message
                        }) : null
                    }
                }
            }), eL()(document).ready(function() {
                uZ();
                var e = (0, eU.DeviceMeta)();
                (e.isUWPApp || e.isUniversalApp) && (uk.isJoinAttemptIdEnabled = !0, window.Roblox.AppHybridClientInterface = uk, uN.setGameLaunchInterface(uk)), uN.setGameLaunchLogger(uF)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "GameLaunch");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/gameLaunch-a3218744e939415f.js.map