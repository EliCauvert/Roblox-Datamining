! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "74192abefb5cd3f4dbf3590770372bb5c3aef03f"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "8f2c0c54-f67e-4fa3-86ba-d28dd058be3b", e._sentryDebugIdIdentifier = "sentry-dbid-8f2c0c54-f67e-4fa3-86ba-d28dd058be3b")
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
                            return C(e).length;
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
                            if (a) return r ? -1 : C(e).length;
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
                            return i = t, a = n, _(C(e, this.length - i), this, i, a);
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
                var T = /[^+/0-9A-Za-z-_]/g;

                function C(e, t) {
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
                        if ((e = (e = e.split("=")[0]).trim().replace(T, "")).length < 2) return "";
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
            var e, t, r, i, a, o, l, s, u, c, d, f, h, p, m, v, y, g, b, w, E, P, I, S, x, A, T, C, k, _, O, N, R, L, U, B, D, M, j, F, H, G, z, V, W, q, K, Z, Y, J, X, $, Q, ee, et, en, er, ei, ea, eo, el, es, eu, ec, ed, ef, eh, ep, em, ev, ey, eg, eb, ew, eE, eP, eI, eS, ex, eA, eT, eC, ek, e_, eO, eN = window.jQuery,
                eR = n.n(eN),
                eL = window.Roblox;

            function eU(e, t, n, r, i, a, o) {
                try {
                    var l = e[a](o),
                        s = l.value
                } catch (e) {
                    n(e);
                    return
                }
                l.done ? t(s) : Promise.resolve(s).then(r, i)
            }

            function eB(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, i) {
                        var a = e.apply(t, n);

                        function o(e) {
                            eU(a, r, i, o, l, "next", e)
                        }

                        function l(e) {
                            eU(a, r, i, o, l, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function eD(e, t) {
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
            var eM = window.React,
                ej = n.n(eM),
                eF = window.TanstackQuery;

            function eH(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function eG(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        eH(e, t, n[t])
                    })
                }
                return e
            }
            var ez = window.Roblox["core-scripts"].environmentUrls,
                eV = n.n(ez),
                eW = window.Roblox["core-lib"].http.index,
                eq = window.Roblox["core-lib"].url.index,
                eK = function() {
                    return eq.Url.parse(eV().metricsApi).getOrThrow().withPath("/v1/games/report-event")
                },
                eZ = function(e, t, n) {
                    try {
                        eW.postUntyped(e().withSearchParams(eG({
                            name: t
                        }, n)), "", {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e4)
                        })
                    } catch (e) {}
                },
                eY = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    t.forEach(function(e) {
                        eZ(eK, e)
                    })
                },
                eJ = window.Roblox["core-scripts"].http.http,
                eX = window.Roblox["core-scripts"].dataStore,
                e$ = n.n(eX),
                eQ = window.Roblox["core-scripts"].guac,
                e0 = e$().gamesDataStore,
                e1 = function() {
                    return eB(function() {
                        return eD(this, function(e) {
                            return [2, (0, eQ.callBehaviour)("play-button-ui")]
                        })
                    })()
                },
                e2 = function() {
                    var e = {
                        url: "".concat(eV().apiGatewayUrl, "/user-settings-api/v1/user-settings/settings-and-options"),
                        withCredentials: !0
                    };
                    return eJ.get(e).then(function(e) {
                        return e.data
                    })
                },
                e3 = function(e) {
                    var t = {
                        url: "".concat(eV().apiGatewayUrl, "/experience-guidelines-api/experience-guidelines/get-age-recommendation"),
                        withCredentials: !0
                    };
                    return eJ.post(t, {
                        universeId: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                e5 = function(e, t) {
                    var n = {
                        url: "".concat(eV().apiGatewayUrl, "/fiat-paid-access-service/v1/purchase"),
                        withCredentials: !0,
                        retryable: !0
                    };
                    return eJ.post(n, {
                        rootPlaceId: e,
                        expectedBasePriceId: t
                    }).then(function(e) {
                        var t, n;
                        return null != (n = JSON.parse(null != (t = e.data.checkoutUrl) ? t : "").checkoutUrl) ? n : ""
                    })
                };

            function e4(e, t) {
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
            var e6 = {
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
                e8 = (eH(ef = {}, e6.UnplayableOtherReason, "UnplayableError.UnplayableOther"), eH(ef, e6.TemporarilyUnavailable, "UnplayableError.TemporarilyUnavailable"), eH(ef, e6.GameUnapproved, "UnplayableError.GameUnapproved"), eH(ef, e6.IncorrectConfiguration, "UnplayableError.IncorrectConfiguration"), eH(ef, e6.UniverseRootPlaceIsPrivate, "UnplayableError.CreatorHasntMadeAvailable"), eH(ef, e6.InsufficientPermissionFriendsOnly, "UnplayableError.CreatorHasntMadeAvailable"), eH(ef, e6.InsufficientPermissionGroupOnly, "UnplayableError.CreatorHasntMadeAvailable"), eH(ef, e6.InsufficientPermissionEditorsOnly, "UnplayableError.UnplayableOther"), eH(ef, e6.InsufficientPermissionPlayTestersOnly, "UnplayableError.UnplayableOther"), eH(ef, e6.DeviceRestricted, "UnplayableError.DeviceRestrictedDefault"), eH(ef, e6.FiatPurchaseDeviceRestricted, "UnplayableError.FiatPurchaseDeviceRestricted"), eH(ef, e6.UnderReview, "UnplayableError.Moderated"), eH(ef, e6.AccountRestricted, "UnplayableError.AccountRestricted"), eH(ef, e6.ComplianceBlocked, "UnplayableError.ComplianceBlocked"), eH(ef, e6.ContextualPlayabilityRegionalAvailability, "UnplayableError.ContextualPlayabilityRegionalAvailability"), eH(ef, e6.ContextualPlayabilityRegionalCompliance, "UnplayableError.ContextualPlayabilityRegionalCompliance"), eH(ef, e6.ContextualPlayabilityAgeRecommendationParentalControls, "UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls"), eH(ef, e6.ContextualPlayabilityAgeGated, "UnplayableError.ContextualPlayabilityAgeGated"), eH(ef, e6.PlaceHasNoPublishedVersion, "UnplayableError.CreatorHasntMadeAvailable"), eH(ef, e6.ContextualPlayabilityUnrated, "UnplayableError.ContextualPlayabilityUnrated"), eH(ef, e6.ContextualPlayabilityGeneral, "UnplayableError.UnplayableOther"), eH(ef, e6.ContextualPlayabilityAgeGatedByDescriptor, "UnplayableError.ContextualPlayabilityAgeGatedByDescriptor"), eH(ef, e6.ContextualPlayabilityExperienceBlockedParentalControls, "UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls"), eH(ef, e6.ContextualPlayabilityRequireParentApproval, "UnplayableError.ContextualPlayabilityRequireParentApproval"), ef),
                e7 = "PlayButtonMessage.AgreeToNotice",
                e9 = {
                    Unlock: "PlayButtonText.Unlock",
                    Unplayable: "PlayButtonText.Unavailable",
                    Buy: "PlayButtonText.Buy",
                    PlayDemo: "PlayButtonText.PlayDemo",
                    PlayOnWeb: "PlayButtonText.PlayOnWeb",
                    PlayOnWebBetaNotice: "PlayButtonText.PlayOnWebBetaNotice",
                    Playtest: "PlayButtonText.Playtest"
                },
                te = function(e, t) {
                    return {
                        eventName: "playGameClicked",
                        ctx: "click",
                        properties: e4(eG({}, t), {
                            placeId: e
                        }),
                        gamePlayIntentEventCtx: "PlayButton"
                    }
                },
                tt = {
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
                tn = {
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
                tr = "gameJoinAgeCheckRequired",
                ti = "gameJoinContentMaturityLock",
                ta = {
                    settingChange: "account_management/SettingsChange",
                    accountManagement: "account_management/AccountManagement"
                },
                to = {
                    playabilityStatus: e6.TemporarilyUnavailable,
                    isPlayable: void 0,
                    unplayableDisplayText: void 0,
                    playableUxTreatment: void 0,
                    upsellUxTreatment: void 0,
                    demoModeAvailable: void 0,
                    privatePlaytestInfo: void 0
                },
                tl = function(e) {
                    var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                        n = (0, eF.useQuery)({
                            queryKey: ["playabilityStatus", e],
                            queryFn: function() {
                                return eB(function() {
                                    var t, n;
                                    return eD(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                if (!e) throw eY(tt.PlayabilityStatusFetchInvalidUniverseId), Error("Invalid universe ID for playability status fetch");
                                                r.label = 1;
                                            case 1:
                                                var i;
                                                return r.trys.push([1, 3, , 4]), [4, (i = [e], eB(function() {
                                                    var e;
                                                    return eD(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, e0.getPlayabilityStatus(i)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())];
                                            case 2:
                                                return n = r.sent(), [3, 4];
                                            case 3:
                                                throw r.sent(), eY(tt.PlayabilityStatusFetchFailed), Error("Playability status fetch failed");
                                            case 4:
                                                if (!(null == n ? void 0 : n.playabilityStatus) || void 0 === n.isPlayable) throw eY(tt.PlayabilityStatusFetchInvalidResponse), Error("Invalid playability status response");
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
                        l = (0, eM.useCallback)(function() {
                            o()
                        }, [o]);
                    return (0, eM.useEffect)(function() {
                        var e = function(e) {
                            e.persisted && t && l()
                        };
                        return window.addEventListener("pageshow", e),
                            function() {
                                window.removeEventListener("pageshow", e)
                            }
                    }, [l, t]), (0, eM.useMemo)(function() {
                        return a ? {
                            playabilityStatus: to.playabilityStatus,
                            isPlayable: to.isPlayable,
                            unplayableDisplayText: to.unplayableDisplayText,
                            playableUxTreatment: to.playableUxTreatment,
                            upsellUxTreatment: to.upsellUxTreatment,
                            demoModeAvailable: to.demoModeAvailable,
                            privatePlaytestInfo: to.privatePlaytestInfo,
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

            function ts(e, t) {
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
            var tu = window.Roblox["core-scripts"].endpoints,
                tc = window.Roblox["core-scripts"].game,
                td = window.Roblox["core-scripts"].eventStream,
                tf = window.Roblox["core-scripts"].util.url,
                th = "function" == typeof crypto.randomUUID,
                tp = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                tm = function() {
                    return th ? crypto.randomUUID() : tp()
                },
                tv = window.Roblox["core-scripts"].meta.device,
                ty = window.Roblox.NavigationService,
                tg = function(e, t, n) {
                    return new Promise(function(r) {
                        var i = new CustomEvent(e, {
                            cancelable: !0,
                            detail: t(r)
                        });
                        window.dispatchEvent(i) && r(n)
                    })
                },
                tb = function() {
                    return null
                };

            function tw(e) {
                if (Array.isArray(e)) return e
            }

            function tE() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tI(e, t) {
                if (e) {
                    if ("string" == typeof e) return tP(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tP(e, t)
                }
            }

            function tS(e, t) {
                return tw(e) || function(e, t) {
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
                }(e, t) || tI(e, t) || tE()
            }
            var tx = globalThis.window,
                tA = globalThis.document,
                tT = globalThis.navigator,
                tC = void 0 === tx ? void 0 : tx,
                tk = void 0 === tA ? void 0 : tA,
                t_ = null == tC || void 0 === tT ? void 0 : tT,
                tO = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null == t_ ? void 0 : t_.userAgent;
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

            function tN(e) {
                return (tN = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function tR() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (tR = function() {
                    return !!e
                })()
            }
            var tL = n(844);

            function tU(e, t, n) {
                t = tN(t);
                var r = tR() ? Reflect.construct(t, n || [], tN(e).constructor) : t.apply(e, n);
                if (r && ("object" === (0, tL._)(r) || "function" == typeof r)) return r;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }
            var tB = n(784);

            function tD(e, t) {
                if (!(0, tB._)(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function tM(e, t) {
                return (tM = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function tj(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && tM(e, t)
            }

            function tF(e, t, n) {
                return (tF = tR() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var i = new(Function.bind.apply(e, r));
                    return n && tM(i, n.prototype), i
                }).apply(null, arguments)
            }

            function tH(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (tH = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return tF(e, arguments, tN(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), tM(n, e)
                })(e)
            }

            function tG(e, t, n) {
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
                        return tD(this, t), tU(this, t, arguments)
                    }
                    return tj(t, e), t
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
                        return !!((null == n ? void 0 : n.Parent) && (0, tB._)(t, n.Parent)) || (null == t || null == (i = t._zod) || null == (r = i.traits) ? void 0 : r.has(e))
                    }
                }), Object.defineProperty(o, "name", {
                    value: e
                }), o
            }
            Object.freeze({
                status: "aborted"
            }), Symbol("zod_brand");
            var tz = function(e) {
                function t() {
                    return tD(this, t), tU(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                }
                return tj(t, e), t
            }(tH(Error));
            tH(Error);
            var tV = {};

            function tW(e) {
                return e && Object.assign(tV, e), tV
            }

            function tq(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function tK(e) {
                return function(e) {
                    if (Array.isArray(e)) return tP(e)
                }(e) || tq(e) || tI(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tZ(e, t) {
                return (void 0 === t ? "undefined" : (0, tL._)(t)) === "bigint" ? t.toString() : t
            }

            function tY(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }

            function tJ(e) {
                var t = +!!e.startsWith("^"),
                    n = e.endsWith("$") ? e.length - 1 : e.length;
                return e.slice(t, n)
            }
            var tX = Symbol("evaluating");

            function t$(e, t, n) {
                var r = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (r !== tX) return void 0 === r && (r = tX, r = n()), r
                    },
                    set: function(n) {
                        Object.defineProperty(e, t, {
                            value: n
                        })
                    },
                    configurable: !0
                })
            }
            var tQ = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n]
            };

            function t0(e) {
                return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
            }

            function t1(e) {
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
                return (delete e.message, "string" == typeof e.error) ? e4(eG({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function t2(e) {
                var t, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var r = n; r < e.issues.length; r++)
                    if ((null == (t = e.issues[r]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function t3(e, t) {
                return t.map(function(t) {
                    return null != t.path || (t.path = []), t.path.unshift(e), t
                })
            }

            function t5(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function t4(e, t, n) {
                var r, i, a, o, l, s, u, c, d, f, h, p = e4(eG({}, e), {
                    path: null != (r = e.path) ? r : []
                });
                return e.message || (p.message = null != (i = null != (a = null != (o = null != (l = t5(null == (c = e.inst) || null == (u = c._zod.def) || null == (s = u.error) ? void 0 : s.call(u, e))) ? l : t5(null == t || null == (d = t.error) ? void 0 : d.call(t, e))) ? o : t5(null == (f = n.customError) ? void 0 : f.call(n, e))) ? a : t5(null == (h = n.localeError) ? void 0 : h.call(n, e))) ? i : "Invalid input"), delete p.inst, delete p.continue, (null == t ? void 0 : t.reportInput) || delete p.input, p
            }
            tY(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var t6 = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, tZ, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                t8 = tG("$ZodError", t6),
                t7 = tG("$ZodError", t6, {
                    Parent: Error
                }),
                t9 = (e = t7, function(t, n, r, i) {
                    var a = r ? Object.assign(r, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        o = t._zod.run({
                            value: n,
                            issues: []
                        }, a);
                    if ((0, tB._)(o, Promise)) throw new tz;
                    if (o.issues.length) {
                        var l, s = new(null != (l = null == i ? void 0 : i.Err) ? l : e)(o.issues.map(function(e) {
                            return t4(e, a, tW())
                        }));
                        throw tQ(s, null == i ? void 0 : i.callee), s
                    }
                    return o.value
                }),
                ne = (t = t7, function(e, n, r, i) {
                    return eB(function() {
                        var a, o, l, s;
                        return eD(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    if (a = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, o = e._zod.run({
                                            value: n,
                                            issues: []
                                        }, a), !(0, tB._)(o, Promise)) return [3, 2];
                                    return [4, o];
                                case 1:
                                    o = u.sent(), u.label = 2;
                                case 2:
                                    if (o.issues.length) throw tQ(s = new(null != (l = null == i ? void 0 : i.Err) ? l : t)(o.issues.map(function(e) {
                                        return t4(e, a, tW())
                                    })), null == i ? void 0 : i.callee), s;
                                    return [2, o.value]
                            }
                        })
                    })()
                }),
                nt = (r = t7, function(e, t, n) {
                    var i = n ? e4(eG({}, n), {
                            async: !1
                        }) : {
                            async: !1
                        },
                        a = e._zod.run({
                            value: t,
                            issues: []
                        }, i);
                    if ((0, tB._)(a, Promise)) throw new tz;
                    return a.issues.length ? {
                        success: !1,
                        error: new(null != r ? r : t8)(a.issues.map(function(e) {
                            return t4(e, i, tW())
                        }))
                    } : {
                        success: !0,
                        data: a.value
                    }
                }),
                nn = (i = t7, function(e, t, n) {
                    return eB(function() {
                        var r, a;
                        return eD(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (r = n ? Object.assign(n, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, a = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, r), !(0, tB._)(a, Promise)) return [3, 2];
                                    return [4, a];
                                case 1:
                                    a = o.sent(), o.label = 2;
                                case 2:
                                    return [2, a.issues.length ? {
                                        success: !1,
                                        error: new i(a.issues.map(function(e) {
                                            return t4(e, r, tW())
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
            var nr = function(e) {
                    var t, n, r = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (n = null == e ? void 0 : e.maximum) ? n : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(r, "$"))
                },
                ni = {
                    major: 4,
                    minor: 1,
                    patch: 11
                },
                na = tG("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = ni;
                    var n, r = tK(null != (l = e._zod.def.checks) ? l : []);
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
                                var r = t2(e),
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
                                        if ((0, tB._)(a, Promise) && (null == n ? void 0 : n.async) === !1) throw new tz;
                                        if (l || (0, tB._)(a, Promise)) l = (null != l ? l : Promise.resolve()).then(function() {
                                            return eB(function() {
                                                return eD(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, a];
                                                        case 1:
                                                            if (t.sent(), e.issues.length === i) return [2];
                                                            return r || (r = t2(e, i)), [2]
                                                    }
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === i) return;
                                            r || (r = t2(e, i))
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
                                if (t2(t)) return t.aborted = !0, t;
                                var a = y(n, r, i);
                                if ((0, tB._)(a, Promise)) {
                                    if (!1 === i.async) throw new tz;
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
                                }, e4(eG({}, n), {
                                    skipChecks: !0
                                }));
                                return (0, tB._)(i, Promise) ? i.then(function(e) {
                                    return g(e, t, n)
                                }) : g(i, t, n)
                            }
                            var a = e._zod.parse(t, n);
                            if ((0, tB._)(a, Promise)) {
                                if (!1 === n.async) throw new tz;
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
                                var n, r = nt(e, t);
                                return r.success ? {
                                    value: r.data
                                } : {
                                    issues: null == (n = r.error) ? void 0 : n.issues
                                }
                            } catch (n) {
                                return nn(e, t).then(function(e) {
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
                no = tG("$ZodString", function(e, t) {
                    var n, r, i;
                    na.init(e, t), e._zod.pattern = null != (n = tK(null != (r = null == e || null == (i = e._zod.bag) ? void 0 : i.patterns) ? r : []).pop()) ? n : nr(e._zod.bag), e._zod.parse = function(n, r) {
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

            function nl(e, t, n) {
                if (e.issues.length) {
                    var r;
                    (r = t.issues).push.apply(r, tK(t3(n, e.issues)))
                }
                t.value[n] = e.value
            }
            var ns = tG("$ZodArray", function(e, t) {
                na.init(e, t), e._zod.parse = function(n, r) {
                    var i = function(e) {
                            var i = a[e],
                                l = t.element._zod.run({
                                    value: i,
                                    issues: []
                                }, r);
                            (0, tB._)(l, Promise) ? o.push(l.then(function(t) {
                                return nl(t, n, e)
                            })): nl(l, n, e)
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

            function nu(e, t, n, r) {
                if (e.issues.length) {
                    var i;
                    (i = t.issues).push.apply(i, tK(t3(n, e.issues)))
                }
                void 0 === e.value ? n in r && (t.value[n] = void 0) : t.value[n] = e.value
            }
            var nc = tG("$ZodObject", function(e, t) {
                    na.init(e, t);
                    var n, r = Object.getOwnPropertyDescriptor(t, "shape");
                    if (!(null == r ? void 0 : r.get)) {
                        var i = t.shape;
                        Object.defineProperty(t, "shape", {
                            get: function() {
                                var e = eG({}, i);
                                return Object.defineProperty(t, "shape", {
                                    value: e
                                }), e
                            }
                        })
                    }
                    var a = tY(function() {
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
                            return e4(eG({}, e), {
                                keys: n,
                                keySet: new Set(n),
                                numKeys: n.length,
                                optionalKeys: new Set(h)
                            })
                        }(t)
                    });
                    t$(e._zod, "propValues", function() {
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
                        if (!((void 0 === (f = i) ? "undefined" : (0, tL._)(f)) === "object" && null !== f && !Array.isArray(f))) return t.issues.push({
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
                                (0, tB._)(n, Promise) ? l.push(n.then(function(n) {
                                    return nu(n, t, e, i)
                                })): nu(n, t, e, i)
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
                                        (0, tB._)(a, Promise) ? e.push(a.then(function(e) {
                                            return nu(e, n, i, t)
                                        })): nu(a, n, i, t)
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
                nd = tG("$ZodLiteral", function(e, t) {
                    if (na.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
                    e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                        return "string" == typeof e ? t0(e) : e ? t0(e.toString()) : String(e)
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

            function nf(e, t) {
                return e.issues.length && void 0 === t ? {
                    issues: [],
                    value: void 0
                } : e
            }
            var nh = tG("$ZodOptional", function(e, t) {
                    na.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", t$(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tK(t.innerType._zod.values).concat([void 0])) : void 0
                    }), t$(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(tJ(e.source), ")?$")) : void 0
                    }), e._zod.parse = function(e, n) {
                        if ("optional" === t.innerType._zod.optin) {
                            var r = t.innerType._zod.run(e, n);
                            return (0, tB._)(r, Promise) ? r.then(function(t) {
                                return nf(t, e.value)
                            }) : nf(r, e.value)
                        }
                        return void 0 === e.value ? e : t.innerType._zod.run(e, n)
                    }
                }),
                np = tG("$ZodNullable", function(e, t) {
                    na.init(e, t), t$(e._zod, "optin", function() {
                        return t.innerType._zod.optin
                    }), t$(e._zod, "optout", function() {
                        return t.innerType._zod.optout
                    }), t$(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(tJ(e.source), "|null)$")) : void 0
                    }), t$(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(tK(t.innerType._zod.values).concat([null])) : void 0
                    }), e._zod.parse = function(e, n) {
                        return null === e.value ? e : t.innerType._zod.run(e, n)
                    }
                });
            Symbol("ZodOutput"), Symbol("ZodInput");
            var nm = tG("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    na.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, n) {
                        return t9(e, t, n, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, n) {
                        return nt(e, t, n)
                    }, e.parseAsync = function(t, n) {
                        return eB(function() {
                            return eD(this, function(r) {
                                return [2, ne(e, t, n, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, n) {
                        return eB(function() {
                            return eD(this, function(r) {
                                return [2, nn(e, t, n)]
                            })
                        })()
                    }, e.check = function() {
                        for (var n, r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                        return e.clone(e4(eG({}, t), {
                            checks: tK(null != (n = t.checks) ? n : []).concat(tK(i.map(function(e) {
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
                nv = tG("ZodMiniString", function(e, t) {
                    no.init(e, t), nm.init(e, t)
                });

            function ny(e) {
                return new nv(eG({
                    type: "string"
                }, t1(e)))
            }
            var ng = tG("ZodMiniArray", function(e, t) {
                    ns.init(e, t), nm.init(e, t)
                }),
                nb = tG("ZodMiniObject", function(e, t) {
                    nc.init(e, t), nm.init(e, t), t$(e, "shape", function() {
                        return t.shape
                    })
                });

            function nw(e, t) {
                return new nb(eG({
                    type: "object",
                    shape: null != e ? e : {}
                }, t1(t)))
            }
            var nE = tG("ZodMiniLiteral", function(e, t) {
                    nd.init(e, t), nm.init(e, t)
                }),
                nP = tG("ZodMiniOptional", function(e, t) {
                    nh.init(e, t), nm.init(e, t)
                }),
                nI = tG("ZodMiniNullable", function(e, t) {
                    np.init(e, t), nm.init(e, t)
                });

            function nS(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function nx(e, t, n) {
                return t && nS(e.prototype, t), n && nS(e, n), e
            }
            n(848);
            var nA = function() {
                    function e(t) {
                        tD(this, e), eH(this, "value", void 0), this.value = t
                    }
                    return nx(e, [{
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
                nT = function() {
                    function e(t) {
                        tD(this, e), eH(this, "error", void 0), this.error = t
                    }
                    return nx(e, [{
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
            (eh || (eh = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new nA(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var nC = function() {
                    function e(t) {
                        tD(this, e), eH(this, "promise", void 0), this.promise = t
                    }
                    return nx(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return eB(function() {
                                    var n, r;
                                    return eD(this, function(i) {
                                        switch (i.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return r = nA.bind, [4, t(e.value)];
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
                        key: "mapErr",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return eB(function() {
                                    var n, r;
                                    return eD(this, function(i) {
                                        switch (i.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return r = nT.bind, [4, t(e.error)];
                                            case 1:
                                                return n = new(r.apply(nT, [void 0, i.sent()])), [3, 3];
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
                                return (0, tB._)(r, e) ? r.promise : r
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(n) {
                                if (n.isOk()) return n.cast();
                                var r = t(n.error);
                                return (0, tB._)(r, e) ? r.promise : r
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
                                return new nA(e)
                            }).catch(function(e) {
                                return new nT(n(e))
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
                            return (0, tB._)(t, e) ? t : (0, tB._)(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                                return e.fromPromiseResult(t.apply(void 0, tK(r)))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(eh.all))
                        }
                    }]), e
                }(),
                nk = function(e) {
                    return new nA(e)
                },
                n_ = function(e) {
                    return new nT(e)
                };
            tH(Error);
            var nO = function(e) {
                    function t(e) {
                        var n;
                        return tD(this, t), eH(n = tU(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return tj(t, e), t
                }(tH(Error)),
                nN = function(e, t) {
                    try {
                        return nk(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return n_(new nO(e))
                    }
                },
                nR = function(e, t) {
                    return eq.Url.parse("".concat(e.replace(/\/+$/, "")).concat(t)).getOrThrow()
                },
                nL = nw({
                    status: ny()
                }),
                nU = ["Unknown", "BootstrapperInstalling", "AppStarted", "AcquiringGame", "JoiningGame", "InGame", "LeftGame"],
                nB = function() {
                    return eB(function() {
                        var e, t, n, r;
                        return eD(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return [4, eW.getUntyped(nR(eV().authApi, "/v1/client-assertion/"), {
                                        credentials: "include"
                                    })];
                                case 1:
                                    return t = i.sent(), [4, eW.fetch(nR(eV().authApi, "/v1/authentication-ticket/"), {
                                        method: "POST",
                                        credentials: "include",
                                        headers: {
                                            "content-type": "application/json"
                                        },
                                        body: nN(null != (e = t.isOk() ? t.value : null) ? e : {}).getOrThrow()
                                    })];
                                case 2:
                                    if ((n = i.sent()).isErr() || !(r = n.value.headers.get("rbx-authentication-ticket"))) return [2, void 0];
                                    return [2, r]
                            }
                        })
                    })()
                },
                nD = function(e) {
                    return "play" !== e
                },
                nM = ["sitetest1.robloxlabs.com", "sitetest2.robloxlabs.com", "sitetest3.robloxlabs.com"],
                nj = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : eV().domain;
                    return nM.includes(t) ? "".concat(e, "-").concat(t.split(".")[0]) : e
                },
                nF = function(e, t, n) {
                    var r = ["1", "launchmode:".concat(e.launchMode)];
                    return t && r.push("gameinfo:".concat(encodeURIComponent(t))), r.push("launchtime:".concat(String(e.launchTime))), n && (null != n.userId && r.push("distributorType:Global", "userId:".concat(String(n.userId))), r.push("browser:".concat(n.browser))), Object.entries(e.otherParams).forEach(function(e) {
                        var t = tS(e, 2),
                            n = t[0],
                            i = t[1];
                        r.push(n === i ? n : "".concat(n, ":").concat(encodeURIComponent(String(i))))
                    }), "".concat(e.protocolName, ":").concat(r.join("+"))
                },
                nH = function() {
                    var e, t, n;
                    return null != tb() || null != (e = null == (n = window.Roblox) || null == (t = n.GameLauncher) ? void 0 : t.isJoinAttemptIdEnabled()) && e
                },
                nG = function(e, t, n, r) {
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
                        var v = tm(),
                            y = function(e) {
                                return eG(e4(eG({}, e), {
                                    joinAttemptId: null != v ? v : tm()
                                }), o ? {
                                    joinAttemptOrigin: o
                                } : {})
                            },
                            g = function(e) {
                                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                (0, td.sendEventWithTarget)(i, a, eG(e4(eG({}, l), {
                                    joinAttemptId: v
                                }), t, null == r ? {} : {
                                    actionType: r
                                })), (0, td.sendGamePlayEvent)(o, e, void 0, v, r)
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
                nz = function(e, t, n) {
                    var r = tb();
                    null == r ? (0, tc.launchGame)(e, t, n) : nG(r, e, t, n)
                },
                nV = function(e) {
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
                    return tg("StartAccessManagementUpsell", function(e) {
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
                nW = "true" === n(773).env.NEXT_PUBLIC_IS_NEXTJS,
                nq = function() {
                    if (nW) return nV;
                    var e = null == tC ? void 0 : tC.Roblox.AccessManagementUpsellV2Service;
                    return e && function(t) {
                        return e.startAccessManagementUpsell(t)
                    }
                },
                nK = "AgeVerification",
                nZ = "UpdatePlaytestSettings",
                nY = {
                    pid: "experiencestart_mobileweb",
                    is_retargeting: "false"
                };

            function nJ(e) {
                if (!nH()) return {};
                var t = e.joinAttemptOrigin,
                    n = e.joinAttemptId;
                return {
                    joinAttemptId: n = "string" == typeof n ? n : tm(),
                    joinAttemptOrigin: t
                }
            }

            function nX(e, t, n, r) {
                var i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : "click";
                n.getPlayOnWeb;
                var a = ts(n, ["getPlayOnWeb"]),
                    o = eG({
                        placeId: t
                    }, e, nJ(e), a, null == r ? {} : {
                        actionType: r
                    });
                return (0, td.sendEventWithTarget)("playGameClicked", i, o), o
            }

            function n$(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = "";
                if (nH()) {
                    var r = nJ(e),
                        i = r.joinAttemptId,
                        a = r.joinAttemptOrigin;
                    "string" == typeof i && i.length > 0 && (n += "&joinAttemptId=".concat(i), "string" == typeof a && a.length > 0 && (n += "&joinAttemptOrigin=".concat(a)))
                }
                var o = e.launchData,
                    l = e.eventId;
                return "string" == typeof o && o.length > 0 && (n += "&launchData=".concat(o)), "string" == typeof l && l.length > 0 && (n += "&eventId=".concat(l)), t && (n += "&isEarlyTesting=true"), n
            }

            function nQ(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return encodeURIComponent("".concat(eV().websiteUrl, "/games/start?placeid=").concat(e).concat(n$(t, n)))
            }

            function n0(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return encodeURIComponent("roblox://experiences/start?placeId=".concat(e).concat(n$(t, n)))
            }
            var n1 = function(e, t, n, r) {
                    var i = arguments.length > 4 && void 0 !== arguments[4] ? arguments[4] : {},
                        a = arguments.length > 5 && void 0 !== arguments[5] ? arguments[5] : {},
                        o = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : {},
                        l = arguments.length > 7 ? arguments[7] : void 0,
                        s = arguments.length > 8 && void 0 !== arguments[8] && arguments[8],
                        u = (0, tv.getDeviceMeta)();
                    if ((null == u ? void 0 : u.isIosDevice) || (null == u ? void 0 : u.isAndroidDevice) || (0, tv.isIos13Ipad)() || (null == u ? void 0 : u.isChromeOs)) {
                        var c = nX(i, e, a, l),
                            d = nQ(e, c, s),
                            f = n0(e, c, s),
                            h = (0, tf.composeQueryString)(eG({}, nY, o));
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
                        }()[e]), nz((0, tc.buildPlayGameProperties)(t, e, r, void 0, n, p, a, s), te(e, i), l), window.localStorage.getItem("ref_info") && window.localStorage.removeItem("ref_info")
                    }
                },
                n2 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = (0, tv.getDeviceMeta)();
                    if ((null == n ? void 0 : n.isIosDevice) || (null == n ? void 0 : n.isAndroidDevice) || (0, tv.isIos13Ipad)() || (null == n ? void 0 : n.isChromeOs)) {
                        var r = nX({}, e, {}),
                            i = nQ(e, r),
                            a = n0(e, r),
                            o = (0, tf.composeQueryString)(eG({}, nY, t));
                        window.open("https://ro.blox.com/Ebh5?".concat(o, "&af_dp=").concat(a, "&af_web_dp=").concat(i, "&deep_link_value=").concat(i), "_self")
                    } else nz((0, tc.buildPlayGameProperties)(void 0, e), te(e, {}))
                },
                n3 = /^(\/[a-z]{2}(-[a-z]{2})?)?\/games\/[0-9]+(\/|$)/i,
                n5 = function(e) {
                    nX({}, e, {});
                    var t = "/games/".concat(e),
                        n = n3.test(window.location.pathname) ? void 0 : {
                            pathname: t,
                            search: "",
                            href: (0, tu.getAbsoluteUrl)(t)
                        };
                    window.location.assign((0, ty.getSignupUrl)(!1, n))
                },
                n4 = function() {
                    var e;
                    return null == (e = window.Roblox) ? void 0 : e.IdentityVerificationService
                },
                n6 = function(e) {
                    var t = e.context,
                        n = e.pageContext;
                    return eB(function() {
                        var e, r, i, a;
                        return eD(this, function(o) {
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
                                    }, [4, null == (r = nq()) ? void 0 : r(i)];
                                case 1:
                                    return [2, null != (e = o.sent()) && e];
                                case 2:
                                    throw a = o.sent(), eY(tt.PlayButtonUpsellAgeRestrictionVerificationError), a;
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                n8 = function(e, t) {
                    try {
                        var n = eq.UrlSearchParams.parse(window.location.search).get("shareLinkSourceType");
                        if ((null == n ? void 0 : n.toLowerCase()) !== "experiencedetails") return;
                        (0, td.sendEventWithTarget)("shareLinkGameJoin", "GamePlayButtonWeb", {
                            placeId: e,
                            universeId: t
                        }, td.targetTypes.WWW)
                    } catch (e) {}
                },
                n7 = function(e, t) {
                    return void 0 !== e && e !== e6.Playable && e !== e6.GuestProhibited && e !== e6.PurchaseRequired && e !== e6.ContextualPlayabilityUnverifiedSeventeenPlusUser && e !== e6.FiatPurchaseRequired && e !== e6.ContextualPlayabilityAgeCheckRequired && (e !== e6.ContextualPlayabilityAgeRecommendationParentalControls && e !== e6.ContextualPlayabilityRequireParentApproval || !t) && !0
                },
                n9 = function(e, t, n, r) {
                    (0, td.sendEvent)({
                        name: tn.eventName,
                        type: tn.eventName,
                        context: td.eventTypes.formInteraction
                    }, {
                        universeId: e,
                        upsellName: t,
                        playabilityStatus: n,
                        pg: r
                    })
                },
                re = function(e) {
                    return e === e6.ContextualPlayabilityUnverifiedSeventeenPlusUser || e === e6.ContextualPlayabilityAgeCheckRequired ? nK : e === e6.ContextualPlayabilityRequireParentApproval || e === e6.ContextualPlayabilityPlaytestDisabled ? nZ : e === e6.ContextualPlayabilityTrustedFriendRequired ? "AddTrustedFriend" : void 0
                },
                rt = function() {
                    window.location.assign((0, tu.getAbsoluteUrl)("/my/account#!/privacy/ContentRestrictions/PrivatePlaytest"))
                },
                rn = function(e) {
                    window.location.assign((0, tu.getAbsoluteUrl)("/users/".concat(e, "/profile")))
                },
                rr = function(e) {
                    var t, n;
                    return {
                        launchData: null != (t = new URLSearchParams(window.location.search).get("launchData")) ? t : e,
                        eventId: null != (n = new URLSearchParams(window.location.search).get("eventId")) ? n : void 0
                    }
                },
                ri = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                        r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
                        i = arguments.length > 4 ? arguments[4] : void 0;
                    n8(e, t);
                    var a = nX(n, e, r, "PlayOnWebButtonClick", i),
                        o = a.joinAttemptId,
                        l = a.joinAttemptOrigin;
                    return nH() && "string" == typeof o && "" !== o ? {
                        joinAttemptId: o,
                        joinAttemptOrigin: "string" == typeof l && l.length > 0 ? l : void 0
                    } : {}
                },
                ra = window.ReactJSX,
                ro = n(611),
                rl = n.n(ro),
                rs = function(e) {
                    return e
                },
                ru = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                rc = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? rs(e.toString()) : null
                },
                rd = function(e) {
                    var t = ru(e);
                    return null == t ? null : rc(t)
                },
                rf = "blackbird",
                rh = function(e) {
                    var t, n, r, i, a = null != (t = e.userid) ? t : e.user,
                        o = null == a ? void 0 : null != (n = rd(a)) ? n : void 0;
                    if ("string" == typeof o) return {
                        isAuthenticated: !0,
                        id: o,
                        userName: null != (r = e.name) ? r : e.userName,
                        displayName: null != (i = e.displayname) ? i : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === rf || e.userMembership === rf ? rf : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                },
                rp = function() {
                    if ("u" > typeof document) {
                        var e, t;
                        return rh(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                    }
                };

            function rm(e) {
                return tw(e) || tq(e) || tI(e) || tE()
            }
            var rv = function() {
                    for (var e, t, n = 0, r = "", i = arguments.length; n < i; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : (0, tL._)(t)))
                            if (Array.isArray(t)) {
                                var a = t.length;
                                for (n = 0; n < a; n++) t[n] && (r = e(t[n])) && (i && (i += " "), i += r)
                            } else
                                for (r in t) t[r] && (i && (i += " "), i += r);
                        return i
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                ry = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                rg = function(e) {
                    var t = e.className;
                    return ej().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: rv("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                rb = function(e) {
                    var t = e.width,
                        n = e.height;
                    return ej().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, ej().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                rw = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                rE = ej().forwardRef(function(e, t) {
                    var n = rm([e, t]),
                        r = n[0],
                        i = n.slice(1),
                        a = r.name,
                        o = r.size,
                        l = r.className,
                        s = (r.children, ts(r, ["name", "size", "className", "children"])),
                        u = tS(i, 1)[0];
                    return ej().createElement("span", eG({
                        ref: u,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: rv("grow-0 shrink-0 basis-auto icon", a, rw[void 0 === o ? "Medium" : o], l)
                    }, s))
                });

            function rP(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rI() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map(function(t) {
                            var r = rP(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        });
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : rP(t[e], null)
                        }
                    }
                }
            }

            function rS() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return eM.useCallback(rI.apply(void 0, tK(t)), t)
            }
            rE.displayName = "Icon";
            var rx = Symbol.for("react.lazy"),
                rA = eM[" use ".trim().toString()];

            function rT(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : (0, tL._)(e)) === "object" && "$$typeof" in e && e.$$typeof === rx && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : (0, tL._)(t)) === "object" && null !== t && "then" in t
            }
            var rC = ((a = eM.forwardRef(function(e, t) {
                    var n = e.children,
                        r = ts(e, ["children"]);
                    if (rT(n) && "function" == typeof rA && (n = rA(n._payload)), eM.isValidElement(n)) {
                        var i, a, o, l, s, u = (s = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (s = (l = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            c = function(e, t) {
                                var n = eG({}, t);
                                for (var r in t) ! function(r) {
                                    var i = e[r],
                                        a = t[r];
                                    /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = a.apply(void 0, tK(t));
                                        return i.apply(void 0, tK(t)), r
                                    } : i && (n[r] = i) : "style" === r ? n[r] = eG({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                }(r);
                                return eG({}, e, n)
                            }(r, n.props);
                        return n.type !== eM.Fragment && (c.ref = t ? rI(t, u) : u), eM.cloneElement(n, c)
                    }
                    return eM.Children.count(n) > 1 ? eM.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), m = a, (v = eM.forwardRef(function(e, t) {
                    var n = e.children,
                        r = ts(e, ["children"]);
                    rT(n) && "function" == typeof rA && (n = rA(n._payload));
                    var i = eM.Children.toArray(n),
                        a = i.find(r_);
                    if (a) {
                        var o = a.props.children,
                            l = i.map(function(e) {
                                return e !== a ? e : eM.Children.count(o) > 1 ? eM.Children.only(null) : eM.isValidElement(o) ? o.props.children : null
                            });
                        return (0, ra.jsx)(m, e4(eG({}, r), {
                            ref: t,
                            children: eM.isValidElement(o) ? eM.cloneElement(o, void 0, l) : null
                        }))
                    }
                    return (0, ra.jsx)(m, e4(eG({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), v),
                rk = Symbol("radix.slottable");

            function r_(e) {
                return eM.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rk
            }
            var rO = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                rN = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                rR = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rL = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rU = (0, eM.forwardRef)(function(e, t) {
                    var n = rm([e, t]),
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
                        g = ts(r, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        b = tS(i, 1)[0],
                        w = rv("foundation-web-button", u ? "opacity-[0.5]" : [ry, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", rN[p], u ? rL[v] : rR[v], o),
                        E = eG({
                            textDecoration: "none"
                        }, l),
                        P = function(e) {
                            return ej().createElement(ej().Fragment, null, ej().createElement(rg, null), d && ej().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, ej().createElement(rb, {
                                width: rO[p],
                                height: rO[p]
                            })), ej().createElement("span", {
                                className: rv("flex items-center min-width-0", "Large" === p || "Medium" === p ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, f && ej().createElement(rE, {
                                name: f,
                                size: p
                            }), ej().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (y) {
                        g.as;
                        var I = ts(g, ["as"]),
                            S = ej().Children.only(a);
                        return ej().createElement(rC, e4(eG({
                            ref: b
                        }, I), {
                            className: w,
                            style: E,
                            "aria-disabled": u || void 0
                        }), ej().cloneElement(S, {}, P(S.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var x = g.href,
                            A = ts(g, ["as", "href"]);
                        return ej().createElement("a", e4(eG({
                            ref: b
                        }, A), {
                            "aria-disabled": u,
                            href: u ? void 0 : x,
                            className: w,
                            style: E
                        }), P(a))
                    }
                    g.as;
                    var T = ts(g, ["as"]);
                    return ej().createElement("button", e4(eG({
                        ref: b,
                        type: "button"
                    }, T), {
                        disabled: u,
                        className: w,
                        style: E
                    }), P(a))
                }),
                rB = window.Roblox.ExperimentationService,
                rD = n.n(rB),
                rM = "full",
                rj = function(e) {
                    return e === rM && "btn-full-width"
                },
                rF = {
                    display: "flex"
                },
                rH = "OneButton",
                rG = "TwoButton";

            function rz(e, t) {
                var n = t && t.cache ? t.cache : rZ,
                    r = t && t.serializer ? t.serializer : rq;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var n, r, i = 1 === e.length ? rV : rW;
                    return n = t.cache.create(), r = t.serializer, i.bind(this, e, n, r)
                })(e, {
                    cache: n,
                    serializer: r
                })
            }

            function rV(e, t, n, r) {
                var i = null == r || "number" == typeof r || "boolean" == typeof r ? r : n(r),
                    a = t.get(i);
                return void 0 === a && (a = e.call(this, r), t.set(i, a)), a
            }

            function rW(e, t, n) {
                var r = Array.prototype.slice.call(arguments, 3),
                    i = n(r),
                    a = t.get(i);
                return void 0 === a && (a = e.apply(this, r), t.set(i, a)), a
            }
            var rq = function() {
                    return JSON.stringify(arguments)
                },
                rK = function() {
                    function e() {
                        tD(this, e), this.cache = Object.create(null)
                    }
                    return nx(e, [{
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
                rZ = {
                    create: function() {
                        return new rK
                    }
                },
                rY = {
                    variadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, rW.bind(this, e, n, r)
                    },
                    monadic: function(e, t) {
                        var n, r;
                        return n = t.cache.create(), r = t.serializer, rV.bind(this, e, n, r)
                    }
                },
                rJ = function(e) {
                    function t(e, n) {
                        tD(this, t);
                        var r, i = e;
                        return n && (i += ": " + n), (r = tU(this, t, [i])).code = e, n && (r.originalMessage = n), r
                    }
                    return tj(t, e), t
                }(tH(Error)),
                rX = ((y = rX || {}).MISSING_MESSAGE = "MISSING_MESSAGE", y.MISSING_FORMAT = "MISSING_FORMAT", y.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", y.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", y.INVALID_MESSAGE = "INVALID_MESSAGE", y.INVALID_KEY = "INVALID_KEY", y.FORMATTING_ERROR = "FORMATTING_ERROR", y);

            function r$(e, t) {
                return rz(e, {
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
                    strategy: rY.variadic
                })
            }

            function rQ(e, t) {
                return r$(function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return tF(e, tK(n))
                }, t)
            }

            function r0() {
                return (r0 = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }).apply(this, arguments)
            }
            var r1 = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                r2 = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                r3 = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                r5 = /^(@+)?(\+|#+)?[rs]?$/g,
                r4 = /(\*)(0+)|(#+)(0+)|(0+)/g,
                r6 = /^(0+)$/;

            function r8(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(r5, function(e, n, r) {
                    return "string" != typeof r ? (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length) : "+" === r ? t.minimumSignificantDigits = n.length : "#" === n[0] ? t.maximumSignificantDigits = n.length : (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length + ("string" == typeof r ? r.length : 0)), ""
                }), t
            }

            function r7(e) {
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

            function r9(e) {
                var t = r7(e);
                return t || {}
            }
            var ie = ((g = {})[g.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", g[g.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", g[g.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", g[g.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", g[g.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", g[g.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", g[g.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", g[g.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", g[g.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", g[g.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", g[g.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", g[g.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", g[g.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", g[g.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", g[g.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", g[g.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", g[g.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", g[g.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", g[g.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", g[g.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", g[g.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", g[g.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", g[g.INVALID_TAG = 23] = "INVALID_TAG", g[g.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", g[g.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", g[g.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", g);

            function it(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, tL._)(e)) === "object" && 0 === e.type)
            }

            function ir(e) {
                return !!(e && (void 0 === e ? "undefined" : (0, tL._)(e)) === "object" && 1 === e.type)
            }
            var ii = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                ia = {
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
                io = new RegExp("^".concat(ii.source, "*")),
                il = new RegExp("".concat(ii.source, "*$"));

            function is(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var iu = !!Object.fromEntries,
                ic = !!String.prototype.trimStart,
                id = !!String.prototype.trimEnd,
                ih = iu ? Object.fromEntries : function(e) {
                    var t = {},
                        n = !0,
                        r = !1,
                        i = void 0;
                    try {
                        for (var a, o = e[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) {
                            var l = tS(a.value, 2),
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
                ip = ic ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(io, "")
                },
                im = id ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(il, "")
                },
                iv = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                iy = function() {
                    function e(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        tD(this, e), this.message = t, this.position = {
                            offset: 0,
                            line: 1,
                            column: 1
                        }, this.ignoreTag = !!n.ignoreTag, this.locale = n.locale, this.requiresOtherClause = !!n.requiresOtherClause, this.shouldParseSkeletons = !!n.shouldParseSkeletons
                    }
                    return nx(e, [{
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
                                                location: is(n, this.clonePosition())
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
                                        location: is(o, this.clonePosition())
                                    })
                                } else if (60 !== i || this.ignoreTag || 47 !== this.peek())
                                    if (60 === i && !this.ignoreTag && ig(this.peek() || 0)) {
                                        var l = this.parseTag(e, t);
                                        if (l.err) return l;
                                        r.push(l.val)
                                    } else {
                                        var s = this.parseLiteral(e, t);
                                        if (s.err) return s;
                                        r.push(s.val)
                                    }
                                else if (!n) return this.error(26, is(this.clonePosition(), this.clonePosition()));
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
                                    location: is(n, this.clonePosition())
                                },
                                err: null
                            };
                            if (!this.bumpIf(">")) return this.error(23, is(n, this.clonePosition()));
                            var i = this.parseMessage(e + 1, t, !0);
                            if (i.err) return i;
                            var a = i.val,
                                o = this.clonePosition();
                            if (!this.bumpIf("</")) return this.error(27, is(n, this.clonePosition()));
                            if (this.isEOF() || !ig(this.char())) return this.error(23, is(o, this.clonePosition()));
                            var l = this.clonePosition();
                            return r !== this.parseTagName() ? this.error(26, is(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                val: {
                                    type: 8,
                                    value: r,
                                    children: a,
                                    location: is(n, this.clonePosition())
                                },
                                err: null
                            } : this.error(23, is(o, this.clonePosition()))
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
                                    location: is(n, this.clonePosition())
                                },
                                err: null
                            }
                        }
                    }, {
                        key: "tryParseLeftAngleBracket",
                        value: function() {
                            var e;
                            return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (ig(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                            return (t = String).fromCodePoint.apply(t, tK(n))
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
                            if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, is(n, this.clonePosition()));
                            if (125 === this.char()) return this.bump(), this.error(2, is(n, this.clonePosition()));
                            var r = this.parseIdentifierIfPossible().value;
                            if (!r) return this.error(3, is(n, this.clonePosition()));
                            if (this.bumpSpace(), this.isEOF()) return this.error(1, is(n, this.clonePosition()));
                            switch (this.char()) {
                                case 125:
                                    return this.bump(), {
                                        val: {
                                            type: 1,
                                            value: r,
                                            location: is(n, this.clonePosition())
                                        },
                                        err: null
                                    };
                                case 44:
                                    if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, is(n, this.clonePosition()));
                                    return this.parseArgumentOptions(e, t, r, n);
                                default:
                                    return this.error(3, is(n, this.clonePosition()))
                            }
                        }
                    }, {
                        key: "parseIdentifierIfPossible",
                        value: function() {
                            var e, t, n = this.clonePosition(),
                                r = this.offset(),
                                i = (e = this.message, iv.lastIndex = r, null != (t = iv.exec(e)[1]) ? t : ""),
                                a = r + i.length;
                            return this.bumpTo(a), {
                                value: i,
                                location: is(n, this.clonePosition())
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
                                    return this.error(4, is(i, o));
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
                                        var d = im(c.val);
                                        if (0 === d.length) return this.error(6, is(this.clonePosition(), this.clonePosition()));
                                        s = {
                                            style: d,
                                            styleLocation: is(u, this.clonePosition())
                                        }
                                    }
                                    var f = this.tryParseArgumentClose(r);
                                    if (f.err) return f;
                                    var h = is(r, this.clonePosition());
                                    if (s && s.style.startsWith("::")) {
                                        var p = ip(s.style.slice(2));
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
                                                            return "root" !== r && (t = e.maximize().region), (ia[t || ""] || ia[r || ""] || ia["".concat(r, "-001")] || ia["001"])[0]
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
                                                    parsedOptions: this.shouldParseSkeletons ? (v = {}, y.replace(r1, function(e) {
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
                                    if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, is(g, eG({}, g)));
                                    this.bumpSpace();
                                    var b = this.parseIdentifierIfPossible(),
                                        w = 0;
                                    if ("select" !== a && "offset" === b.value) {
                                        if (!this.bumpIf(":")) return this.error(13, is(this.clonePosition(), this.clonePosition()));
                                        this.bumpSpace();
                                        var E = this.tryParseDecimalInteger(13, 14);
                                        if (E.err) return E;
                                        this.bumpSpace(), b = this.parseIdentifierIfPossible(), w = E.val
                                    }
                                    var P = this.tryParsePluralOrSelectOptions(e, a, t, b);
                                    if (P.err) return P;
                                    var I = this.tryParseArgumentClose(r);
                                    if (I.err) return I;
                                    var S = is(r, this.clonePosition());
                                    if ("select" === a) return {
                                        val: {
                                            type: 5,
                                            value: n,
                                            options: ih(P.val),
                                            location: S
                                        },
                                        err: null
                                    };
                                    return {
                                        val: {
                                            type: 6,
                                            value: n,
                                            options: ih(P.val),
                                            offset: w,
                                            pluralType: "plural" === a ? "cardinal" : "ordinal",
                                            location: S
                                        }, err: null
                                    };
                                default:
                                    return this.error(5, is(i, o))
                            }
                        }
                    }, {
                        key: "tryParseArgumentClose",
                        value: function(e) {
                            return this.isEOF() || 125 !== this.char() ? this.error(1, is(e, this.clonePosition())) : (this.bump(), {
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
                                    if (!this.bumpUntil("'")) return this.error(11, is(n, this.clonePosition()));
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
                                    var t = e.split(r2).filter(function(e) {
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
                                            var u = rm(s),
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
                                                        t = eG(e4(eG({}, t), {
                                                            notation: "scientific"
                                                        }), l.options.reduce(function(e, t) {
                                                            return eG({}, e, r9(t))
                                                        }, {}));
                                                        continue;
                                                    case "engineering":
                                                        t = eG(e4(eG({}, t), {
                                                            notation: "engineering"
                                                        }), l.options.reduce(function(e, t) {
                                                            return eG({}, e, r9(t))
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
                                                        l.options[0].replace(r4, function(e, n, r, i, a, o) {
                                                            if (n) t.minimumIntegerDigits = r.length;
                                                            else if (i && a) throw Error("We currently do not support maximum integer digits");
                                                            else if (o) throw Error("We currently do not support exact integer digits");
                                                            return ""
                                                        });
                                                        continue
                                                }
                                                if (r6.test(l.stem)) {
                                                    t.minimumIntegerDigits = l.stem.length;
                                                    continue
                                                }
                                                if (r3.test(l.stem)) {
                                                    if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                    l.stem.replace(r3, function(e, n, r, i, a, o) {
                                                        return "*" === r ? t.minimumFractionDigits = n.length : i && "#" === i[0] ? t.maximumFractionDigits = i.length : a && o ? (t.minimumFractionDigits = a.length, t.maximumFractionDigits = a.length + o.length) : (t.minimumFractionDigits = n.length, t.maximumFractionDigits = n.length), ""
                                                    });
                                                    var s = l.options[0];
                                                    "w" === s ? t = e4(eG({}, t), {
                                                        trailingZeroDisplay: "stripIfInteger"
                                                    }) : s && (t = eG({}, t, r8(s)));
                                                    continue
                                                }
                                                if (r5.test(l.stem)) {
                                                    t = eG({}, t, r8(l.stem));
                                                    continue
                                                }
                                                var u = r7(l.stem);
                                                u && (t = eG({}, t, u));
                                                var c = function(e) {
                                                    var t;
                                                    if ("E" === e[0] && "E" === e[1] ? (t = {
                                                            notation: "engineering"
                                                        }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                            notation: "scientific"
                                                        }, e = e.slice(1)), t) {
                                                        var n = e.slice(0, 2);
                                                        if ("+!" === n ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === n && (t.signDisplay = "exceptZero", e = e.slice(2)), !r6.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                        t.minimumIntegerDigits = e.length
                                                    }
                                                    return t
                                                }(l.stem);
                                                c && (t = eG({}, t, c))
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
                                        s = is(c, this.clonePosition()), l = this.message.slice(c.offset, this.offset())
                                    } else break
                                }
                                if (o.has(l)) return this.error("select" === t ? 21 : 20, s);
                                "other" === l && (i = !0), this.bumpSpace();
                                var f = this.clonePosition();
                                if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, is(this.clonePosition(), this.clonePosition()));
                                var h = this.parseMessage(e + 1, t, n);
                                if (h.err) return h;
                                var p = this.tryParseArgumentClose(f);
                                if (p.err) return p;
                                a.push([l, {
                                    value: h.val,
                                    location: is(f, this.clonePosition())
                                }]), o.add(l), this.bumpSpace(), l = (u = this.parseIdentifierIfPossible()).value, s = u.location
                            }
                            return 0 === a.length ? this.error("select" === t ? 15 : 16, is(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !i ? this.error(22, is(this.clonePosition(), this.clonePosition())) : {
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
                            var l = is(r, this.clonePosition());
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

            function ig(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }
            var ib = function(e) {
                    function t(e, n, r) {
                        var i;
                        return tD(this, t), (i = tU(this, t, [e])).code = n, i.originalMessage = r, i
                    }
                    return tj(t, e), nx(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(tH(Error)),
                iw = function(e) {
                    function t(e, n, r, i) {
                        return tD(this, t), tU(this, t, ['Invalid values for "'.concat(e, '": "').concat(n, '". Options are "').concat(Object.keys(r).join('", "'), '"'), "INVALID_VALUE", i])
                    }
                    return tj(t, e), t
                }(ib),
                iE = function(e) {
                    function t(e, n, r) {
                        return tD(this, t), tU(this, t, ['Value for "'.concat(e, '" must be of type ').concat(n), "INVALID_VALUE", r])
                    }
                    return tj(t, e), t
                }(ib),
                iP = function(e) {
                    function t(e, n) {
                        return tD(this, t), tU(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(n, '"'), "MISSING_VALUE", n])
                    }
                    return tj(t, e), t
                }(ib);

            function iI(e) {
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
            var iS = ((ep = function() {
                function e(t) {
                    var n, r = this,
                        i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        a = arguments.length > 2 ? arguments[2] : void 0,
                        o = arguments.length > 3 ? arguments[3] : void 0;
                    if (tD(this, e), this.formatterCache = {
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
                                        if (!(a && m in a)) throw new iP(m, l);
                                        var v = a[m];
                                        if (1 === p.type) {
                                            v && "string" != typeof v && "number" != typeof v && (void 0 === v ? "undefined" : (0, tL._)(v)) !== "bigint" || (v = "string" == typeof v || "number" == typeof v || (void 0 === v ? "undefined" : (0, tL._)(v)) === "bigint" ? String(v) : ""), s.push({
                                                type: +("string" != typeof v),
                                                value: v
                                            });
                                            continue
                                        }
                                        if (3 === p.type) {
                                            var y = "string" == typeof p.style ? i.date[p.style] : ir(p.style) ? p.style.parsedOptions : void 0;
                                            s.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, y).format(v)
                                            });
                                            continue
                                        }
                                        if (4 === p.type) {
                                            var g = "string" == typeof p.style ? i.time[p.style] : ir(p.style) ? p.style.parsedOptions : i.time.medium;
                                            s.push({
                                                type: 0,
                                                value: r.getDateTimeFormat(n, g).format(v)
                                            });
                                            continue
                                        }
                                        if (2 === p.type) {
                                            var b = "string" == typeof p.style ? i.number[p.style] : it(p.style) ? p.style.parsedOptions : void 0;
                                            if (b && b.scale) {
                                                var w = b.scale || 1;
                                                if ((void 0 === v ? "undefined" : (0, tL._)(v)) === "bigint") {
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
                                            if ("function" != typeof I) throw new iE(P, "function", l);
                                            var S = I(e(E, n, r, i, a, o).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(S) || (S = [S]), s.push.apply(s, tK(S.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === p.type) {
                                            var x = v,
                                                A = (Object.prototype.hasOwnProperty.call(p.options, x) ? p.options[x] : void 0) || p.options.other;
                                            if (!A) throw new iw(p.value, v, Object.keys(p.options), l);
                                            s.push.apply(s, tK(e(A.value, n, r, i, a)));
                                            continue
                                        }
                                        if (6 === p.type) {
                                            var T = "=".concat(v),
                                                C = Object.prototype.hasOwnProperty.call(p.options, T) ? p.options[T] : void 0;
                                            if (!C) {
                                                if (!Intl.PluralRules) throw new ib('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var k = (void 0 === v ? "undefined" : (0, tL._)(v)) === "bigint" ? Number(v) : v,
                                                    _ = r.getPluralRules(n, {
                                                        type: p.pluralType
                                                    }).select(k - (p.offset || 0));
                                                C = (Object.prototype.hasOwnProperty.call(p.options, _) ? p.options[_] : void 0) || p.options.other
                                            }
                                            if (!C) throw new iw(p.value, v, Object.keys(p.options), l);
                                            var O = (void 0 === v ? "undefined" : (0, tL._)(v)) === "bigint" ? Number(v) : v;
                                            s.push.apply(s, tK(e(C.value, n, r, i, a, O - (p.offset || 0))));
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
                            }(l), r0({}, l));
                        this.ast = e.__parse(t, e4(eG({}, s), {
                            locale: this.resolvedLocale
                        }))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (n = e.formats, a ? Object.keys(n).reduce(function(e, t) {
                        var r, i;
                        return e[t] = (r = n[t], (i = a[t]) ? eG({}, r, i, Object.keys(r).reduce(function(e, t) {
                            return e[t] = eG({}, r[t], i[t]), e
                        }, {})) : r), e
                    }, eG({}, n)) : n), this.formatters = o && o.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: rz(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tF(Intl.NumberFormat, tK(t))
                            }, {
                                cache: iI(e.number),
                                strategy: rY.variadic
                            }),
                            getDateTimeFormat: rz(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tF(Intl.DateTimeFormat, tK(t))
                            }, {
                                cache: iI(e.dateTime),
                                strategy: rY.variadic
                            }),
                            getPluralRules: rz(function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                return tF(Intl.PluralRules, tK(t))
                            }, {
                                cache: iI(e.pluralRules),
                                strategy: rY.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return nx(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, ep.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, ep.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = new iy(e, t = eG({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (n.err) {
                    var r = SyntaxError(ie[n.err.kind]);
                    throw r.location = n.err.location, r.originalMessage = n.err.message, r
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var n in t.options) delete t.options[n].location, e(t.options[n].value);
                        else 2 === t.type && it(t.style) || (3 === t.type || 4 === t.type) && ir(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(n.val), n.val
            }, ep.formats = {
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
            }, ep);

            function ix() {
                for (var e, t, n, r, i, a = arguments.length, o = Array(a), l = 0; l < a; l++) o[l] = arguments[l];
                var s = tS(o, 4),
                    u = (s[0], s[1]),
                    c = s[2],
                    d = s[3];
                if (Array.isArray(u)) throw new rJ(rX.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === u ? "undefined" : (0, tL._)(u))) throw new rJ(rX.INSUFFICIENT_PATH, void 0);
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
                m.getMessageFormat || (m.getMessageFormat = r$(function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    return new iS(t[0], t[1], t[2], eG({
                        formatters: m
                    }, t[3]))
                }, h.message));
                try {
                    i = m.getMessageFormat(u, y, (e = iS.formats.date, t = iS.formats.time, n = eG({}, null == v ? void 0 : v.dateTime, null == p ? void 0 : p.dateTime), r = {
                        date: eG({}, e, n),
                        time: eG({}, t, n),
                        number: eG({}, null == v ? void 0 : v.number, null == p ? void 0 : p.number)
                    }, g && ["date", "time"].forEach(function(e) {
                        var t = r[e],
                            n = !0,
                            i = !1,
                            a = void 0;
                        try {
                            for (var o, l = Object.entries(t)[Symbol.iterator](); !(n = (o = l.next()).done); n = !0) {
                                var s = tS(o.value, 2),
                                    u = s[0],
                                    c = s[1];
                                t[u] = eG({
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
                        formatters: e4(eG({}, m), {
                            getDateTimeFormat: function(e, t) {
                                var n;
                                return m.getDateTimeFormat(e, e4(eG({}, t), {
                                    timeZone: null != (n = null == t ? void 0 : t.timeZone) ? n : g
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new rJ(rX.INVALID_MESSAGE, void 0)
                }
                var b = i.format(c);
                return (0, eM.isValidElement)(b) || Array.isArray(b) || "string" == typeof b ? b : String(b)
            }

            function iA() {
                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return t.filter(Boolean).join(".")
            }

            function iT(e) {
                return iA(e.namespace, e.key)
            }

            function iC(e) {
                console.error(e)
            }

            function ik(e, t, n, r) {
                var i = iA(r, n);
                if (!t) throw Error(i);
                var a = t;
                return n.split(".").forEach(function(t) {
                    var n = a[t];
                    if (null == t || null == n) throw Error(i + " (".concat(e, ")"));
                    a = n
                }), a
            }
            ix.raw = !0;
            var i_ = (0, eM.createContext)(void 0);

            function iO(e) {
                var t = e.children,
                    n = e.formats,
                    r = e.getMessageFallback,
                    i = e.locale,
                    a = e.messages,
                    o = e.now,
                    l = e.onError,
                    s = e.timeZone,
                    u = (0, eM.useContext)(i_),
                    c = (0, eM.useMemo)(function() {
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
                    d = (0, eM.useMemo)(function() {
                        return (null == u ? void 0 : u.formatters) || {
                            getDateTimeFormat: rQ(Intl.DateTimeFormat, c.dateTime),
                            getNumberFormat: rQ(Intl.NumberFormat, c.number),
                            getPluralRules: rQ(Intl.PluralRules, c.pluralRules),
                            getRelativeTimeFormat: rQ(Intl.RelativeTimeFormat, c.relativeTime),
                            getListFormat: rQ(Intl.ListFormat, c.list),
                            getDisplayNames: rQ(Intl.DisplayNames, c.displayNames)
                        }
                    }, [c, null == u ? void 0 : u.formatters]),
                    f = (0, eM.useMemo)(function() {
                        var e, t, f, h, p;
                        return e4(eG({}, (t = (e = {
                            locale: i,
                            formats: void 0 === n ? null == u ? void 0 : u.formats : n,
                            getMessageFallback: r || (null == u ? void 0 : u.getMessageFallback),
                            messages: void 0 === a ? null == u ? void 0 : u.messages : a,
                            now: o || (null == u ? void 0 : u.now),
                            onError: l || (null == u ? void 0 : u.onError),
                            timeZone: s || (null == u ? void 0 : u.timeZone)
                        }).formats, f = e.getMessageFallback, h = e.messages, p = e.onError, e4(eG({}, ts(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: h || void 0,
                            onError: p || iC,
                            getMessageFallback: f || iT
                        }))), {
                            formatters: d,
                            cache: c
                        })
                    }, [c, n, d, r, i, a, o, l, u, s]);
                return (0, ra.jsx)(i_.Provider, {
                    value: f,
                    children: t
                })
            }

            function iN() {
                var e = (0, eM.useContext)(i_);
                if (!e) throw Error(void 0);
                return e
            }
            var iR = !1,
                iL = "u" < typeof window,
                iU = "__FN_nvfToKPAOuiV__",
                iB = "__FN_END_nvfToKPAOuiV__",
                iD = new RegExp("".concat(iU, "(\\d+)\\|")),
                iM = new RegExp("".concat(iB, "(\\d+)\\|")),
                ij = function(e, t, n) {
                    var r = eG({}, n),
                        i = {};
                    t.forEach(function(e, t) {
                        var n = t.toString(),
                            a = "".concat(iU).concat(n, "|"),
                            o = "".concat(iB).concat(n, "|");
                        r[e.opening] = a, r[e.closing] = o, i[n] = {
                            start: a,
                            end: o,
                            render: e.render
                        }
                    });
                    var a = function(e) {
                            var t = [],
                                n = iD.exec(e),
                                r = iM.exec(e);
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
                                t.push.apply(t, tK(c))
                            }
                            return t
                        },
                        o = a(e(r));
                    return null == o ? null : o.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, ra.jsx)(eM.Fragment, {
                            children: e
                        }, t)
                    })
                },
                iF = function(e) {
                    return e.replaceAll(".", ":")
                };

            function iH() {
                return null != em || (em = "".concat(eV().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), em
            }
            var iG = function() {},
                iz = function(e, t) {
                    return e << 3 | t
                },
                iV = iz(1, 2),
                iW = iz(2, 2),
                iq = iz(5, 2),
                iK = iz(6, 2),
                iZ = iz(8, 2),
                iY = iz(1, 2),
                iJ = iz(2, 1),
                iX = iz(3, 0),
                i$ = iz(5, 2);
            iz(1, 2), iz(2, 1), iz(3, 0), iz(4, 2), iz(5, 2), iz(6, 0), iz(8, 2);
            var iQ = iz(4, 0),
                i0 = iz(6, 2),
                i1 = iz(7, 2);
            iz(1, 0), iz(2, 2);
            var i2 = iz(1, 2),
                i3 = iz(2, 2),
                i5 = iz(1, 2);
            iz(1, 2), iz(2, 2), iz(1, 2);
            var i4 = new TextEncoder,
                i6 = function() {
                    function e() {
                        tD(this, e), eH(this, "buf", [])
                    }
                    return nx(e, [{
                        key: "writeVarint",
                        value: function(e) {
                            var t = (void 0 === e ? "undefined" : (0, tL._)(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                            this.buf.push(Number(t))
                        }
                    }, {
                        key: "writeString",
                        value: function(e) {
                            var t = i4.encode(e);
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

            function i8(e, t, n) {
                var r = new i6;
                return r.writeVarint(iz(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
            }

            function i7(e) {
                var t = new i6;
                if (t.writeVarint(iY), t.writeString(e.name), t.writeVarint(iJ), t.writeDouble(e.value), t.writeVarint(iX), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var n = function(e) {
                        var t = new i6,
                            n = !0,
                            r = !1,
                            i = void 0;
                        try {
                            for (var a, o = Object.entries(e)[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) ! function() {
                                var e = tS(a.value, 2),
                                    n = e[0],
                                    r = e[1];
                                if ("string" == typeof r) {
                                    var i = i8(n, iz(2, 2), function(e) {
                                        e.writeString(r)
                                    });
                                    t.writeVarint(iq), t.writeBytes(i)
                                } else if ("boolean" == typeof r) {
                                    var o = i8(n, iz(2, 0), function(e) {
                                        e.writeVarint(+!!r)
                                    });
                                    t.writeVarint(iK), t.writeBytes(o)
                                } else if ((void 0 === r ? "undefined" : (0, tL._)(r)) === "bigint") {
                                    var l = i8(n, iz(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(iW), t.writeBytes(l)
                                } else if ("number" == typeof r)
                                    if (Number.isFinite(r))
                                        if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                            var s = i8(n, iz(2, 0), function(e) {
                                                e.writeVarint(r)
                                            });
                                            t.writeVarint(iV), t.writeBytes(s)
                                        } else if (Number.isInteger(r)) {
                                    var u = i8(n, iz(2, 0), function(e) {
                                        e.writeVarint(BigInt(r))
                                    });
                                    t.writeVarint(iW), t.writeBytes(u)
                                } else {
                                    var c = i8(n, iz(2, 1), function(e) {
                                        e.writeDouble(r)
                                    });
                                    t.writeVarint(iZ), t.writeBytes(c)
                                } else {
                                    var d = i8(n, iz(2, 2), function(e) {
                                        e.writeString(String(r))
                                    });
                                    t.writeVarint(iq), t.writeBytes(d)
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
                    t.writeVarint(i$), t.writeBytes(n)
                }
                return t.toBytes()
            }

            function i9(e, t, n) {
                var r = new i6;
                r.writeVarint(iQ), r.writeVarint(n);
                var i = !0,
                    a = !1,
                    o = void 0;
                try {
                    for (var l, s = e[Symbol.iterator](); !(i = (l = s.next()).done); i = !0) {
                        var u = l.value;
                        r.writeVarint(i0), r.writeBytes(u)
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
                        r.writeVarint(i1), r.writeBytes(m)
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

            function ae(e) {
                var t = new i6;
                t.writeVarint(i2), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(i3), t.writeBytes(e);
                var n = t.toBytes(),
                    r = new i6;
                return r.writeVarint(i5), r.writeBytes(n), r.toBytes()
            }
            var at = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function an(e) {
                return at.test(e)
            }
            var ar = [],
                ai = !1,
                aa = !1;

            function ao(e, t) {
                var n, r, i = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || aa || "u" > typeof document && "hidden" === document.visibilityState ? (n = ae(i9(i.map(i7), [], a)).buffer, fetch("".concat(iH()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: n,
                    credentials: "include",
                    keepalive: !0
                }).catch(iG)) : (r = ae(i9(i.map(i7), [], a)), eB(function() {
                    var e, t, n, i, a, o, l, s, u, c, d, f, h;
                    return eD(this, function(p) {
                        switch (p.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: r.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(r).catch(iG), t.close().catch(iG), n = [], [4, (i = e.readable.getReader()).read()];
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
                    return n && (r["Content-Encoding"] = "gzip"), fetch("".concat(iH()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: r,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(iG)
            }

            function al() {
                var e = !0,
                    t = !1,
                    n = void 0;
                try {
                    for (var r, i = ar[Symbol.iterator](); !(e = (r = i.next()).done); e = !0) {
                        var a = r.value.splice(0);
                        0 !== a.length && ao(a, !0)
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

            function as(e, t) {
                var n, r, i, a = Math.max(1, null != (n = null == t ? void 0 : t.batchSize) ? n : 10),
                    o = null != (r = null == t ? void 0 : t.batchIntervalMs) ? r : 250;

                function l(e, n) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, n): console.error(e, n)
                }
                if (!an(e)) return l('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var s = [];
                return ar.push(s), ai || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && al()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        aa = !0, al()
                    }), ai = !0),
                    function(t, n, r) {
                        var u = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!an(e)) return !1;
                                if (t) {
                                    var n = !0,
                                        r = !1,
                                        i = void 0;
                                    try {
                                        for (var a, o = Object.keys(t)[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) {
                                            var l = a.value;
                                            if (!an(l)) return !1
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
                        }), s.length >= a ? (void 0 !== i && (clearTimeout(i), i = void 0), ao(s.splice(0, a))) : void 0 === i && (i = setTimeout(function() {
                            for (i = void 0; s.length > 0;) ao(s.splice(0, a))
                        }, o))
                    }
            }
            var au = "WwwCommon",
                ac = function(e) {
                    var t = e.publish,
                        n = e.captureException,
                        r = e.featureName;

                    function i(e, t, i) {
                        if (null != i) {
                            var a = (0, tB._)(i, Error) ? i.name || "Error" : "UnknownError",
                                o = r ? "".concat(r, "_").concat(e) : e;
                            return null == n || n(i, {
                                error_counter: o
                            }), e4(eG({}, t), {
                                errorType: a
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var i = tS(n, 2);
                            t(i[0], i[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var a = tS(n, 3),
                                o = a[0],
                                l = a[1],
                                s = a[2],
                                u = i(o, e4(eG({}, null != l ? l : {}), {
                                    severity: "error"
                                }), s);
                            t(o, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                            var a = tS(n, 3),
                                o = a[0],
                                l = a[1],
                                s = a[2],
                                u = i(o, e4(eG({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), s);
                            t(o, u)
                        }
                    }
                }({
                    publish: as(au)
                });
            ac.trackCounter;
            var ad = ac.trackError;
            ac.trackCriticalError;
            var af = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                ah = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                ap = function(e, t, n) {
                    var r;
                    "u" > typeof window && ad(e, {
                        key: n,
                        namespace: t,
                        internalPageName: null != (r = af()) ? r : "unknown"
                    })
                },
                am = function(e) {
                    var t, n, r, i, a, o, l, s, u, c, d, f, h, p = (t = iF(e), n = {
                        "!": iN().messages
                    }, r = t ? "!.".concat(t) : "!", a = (i = iN()).cache, o = i.formats, l = i.formatters, s = i.getMessageFallback, u = i.locale, c = i.onError, d = i.timeZone, f = n["!"], h = "!" === r ? void 0 : r.slice(2), d || iR || !iL || (iR = !0, c(new rJ(rX.ENVIRONMENT_FALLBACK, void 0))), (0, eM.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, n) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var r = n ? ik(e, t, n) : t;
                                    if (!r) throw Error(n);
                                    return r
                                } catch (e) {
                                    return new rJ(rX.MISSING_MESSAGE, e.message)
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
                                    a = void 0 === i ? iT : i,
                                    o = e.locale,
                                    l = e.messagesOrError,
                                    s = e.namespace,
                                    u = e.onError,
                                    c = e.timeZone,
                                    d = (0, tB._)(l, rJ);

                                function f(e, t, n, r) {
                                    var i = new rJ(t, n);
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
                                        m = ik(o, l, e, s)
                                    } catch (t) {
                                        if (!p) return f(e, rX.MISSING_MESSAGE, t.message, p);
                                        m = p
                                    }
                                    try {
                                        var g, b = iA(s, e);
                                        return ix(b, m, i ? (g = {}, Object.keys(i).forEach(function(e) {
                                            var t, n = 0,
                                                r = i[e];
                                            t = "function" == typeof r ? function(t) {
                                                var i = r(t);
                                                return (0, eM.isValidElement)(i) ? (0, eM.cloneElement)(i, {
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
                                        return (0, tB._)(t, rJ) ? (v = t.code, y = t.originalMessage) : (v = rX.FORMATTING_ERROR, y = t.message), f(e, v, y, p)
                                    }
                                }

                                function p(e, t, n, r) {
                                    var i = h(e, t, n, r);
                                    return "string" != typeof i ? f(e, rX.INVALID_MESSAGE, void 0) : i
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
                                        return ik(o, l, e, s)
                                    } catch (t) {
                                        return f(e, rX.MISSING_MESSAGE, t.message)
                                    }
                                }, p.has = function(e) {
                                    if (d) return !1;
                                    try {
                                        return ik(o, l, e, s), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, p
                            }(e4(eG({}, e), {
                                messagesOrError: t
                            }))
                    }, [a, l, s, f, h, c, o, u, d]));
                    return (0, eM.useMemo)(function() {
                        return Object.assign(function(t, n, r) {
                            var i = iF(t);
                            return void 0 === r || p.has(i) ? p(i, n) : (ap("TranslationKeyNotFound", e, i), r)
                        }, {
                            rich: function(e, t) {
                                return p.rich(iF(e), t)
                            },
                            has: function(e) {
                                return ah(e) && p.has(iF(e))
                            },
                            dynamic: function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!ah(t)) return ap("TranslationKeyNotFound", e, String(t)), r;
                                var i = iF(t),
                                    a = p.has(i);
                                return a || ap("TranslationKeyNotFound", e, i), a ? p(i, n) : r
                            },
                            html: function(t, n, r) {
                                if (!ah(t)) return ap("TranslationKeyNotFound", e, String(t)), null;
                                var i = iF(t);
                                if (!p.has(i)) return ap("TranslationKeyNotFound", e, i), null;
                                var a = ij(function(e) {
                                    return p(i, e)
                                }, n, r);
                                return null == a && ap("TranslationMalformed", e, i), a
                            }
                        })
                    }, [p, e])
                },
                av = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding", "Feature.Build", "Feature.Friends"],
                ay = function() {
                    var e = tS(av, 7),
                        t = e[0],
                        n = e[1],
                        r = e[2],
                        i = e[3],
                        a = e[4],
                        o = e[5],
                        l = e[6],
                        s = am(t),
                        u = am(n),
                        c = am(r),
                        d = am(i),
                        f = am(a),
                        h = am(o),
                        p = am(l);
                    return (0, eM.useMemo)(function() {
                        var e = [p, h, f, d, c, u, s];
                        return function(t, n, r) {
                            var i = e.find(function(e) {
                                return e.has(t)
                            });
                            return i ? i.dynamic(t, n && Object.fromEntries(Object.entries(n).filter(function(e) {
                                return "string" == typeof e[1] || "number" == typeof e[1] || (0, tB._)(e[1], Date)
                            }))) : null != r ? r : ""
                        }
                    }, [s, u, c, d, f, h, p])
                },
                ag = function(e) {
                    var t = e.onButtonClick,
                        n = e.buttonWidth,
                        r = e.buttonClassName,
                        i = ay();
                    return (0, ra.jsxs)(ej().Fragment, {
                        children: [(0, ra.jsx)(rU, {
                            "data-testid": "play-action-needed-button",
                            variant: "Emphasis",
                            style: rF,
                            className: rl()(rj(void 0 === n ? rM : n), void 0 === r ? "game-play-button-action-needed-lg" : r),
                            onClick: t,
                            children: i(e9.Unlock)
                        }), (0, ra.jsx)("div", {
                            id: "access-management-upsell-container-v1"
                        })]
                    })
                },
                ab = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.pageContext,
                        i = (0, eM.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), eY(tt.PlayButtonUpsellExperienceApprovalTriggered), n9(t, tn.experienceApprovalUpsellName, e6.ContextualPlayabilityRequireParentApproval, r);
                            var n = nq();
                            n ? n({
                                featureName: "CanApproveExperience",
                                namespace: ta.accountManagement,
                                isAsyncCall: !1,
                                usePrologue: !0,
                                ampRecourseData: {
                                    universeId: t,
                                    experienceManagementAction: "Approve"
                                }
                            }).catch(function() {
                                eY(tt.PlayButtonUpsellExperienceApprovalError)
                            }) : eY(tt.PlayButtonUpsellExperienceApprovalError)
                        }, [t, r]);
                    return (0, ra.jsx)(ag, {
                        onButtonClick: i,
                        buttonClassName: n
                    })
                };
            ab.defaultProps = {
                buttonClassName: void 0
            };
            var aw = function(e) {
                    var t = e.buttonClassName,
                        n = e.buttonWidth;
                    return (0, ra.jsx)(rU, {
                        "data-testid": "play-button-loading",
                        variant: "Emphasis",
                        isLoading: !0,
                        "aria-label": "Loading",
                        style: rF,
                        className: rl()(rj(void 0 === n ? rM : n), void 0 === t ? "game-play-button-lg" : t)
                    })
                },
                aE = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                aP = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                aI = function(e) {
                    var t = e.variant,
                        n = e.size,
                        r = e.isCircular,
                        i = e.className,
                        a = ts(e, ["variant", "size", "isCircular", "className"]);
                    return ej().createElement("button", eG({
                        type: "button",
                        className: rv("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", ry, aP[t], aE[n], r && "radius-circle", i)
                    }, a), ej().createElement(rg, null), ej().createElement(rE, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };

            function aS(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    r = n.checkForDefaultPrevented,
                    i = void 0 === r || r;
                return function(n) {
                    if (null == e || e(n), !1 === i || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function ax() {
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
                            return eG({}, e, r(t)["__scope".concat(i)])
                        }, {});
                        return eM.useMemo(function() {
                            return eH({}, "__scope".concat(r.scopeName), n)
                        }, [n])
                    }
                };
                return i.scopeName = r.scopeName, i
            }
            var aA = (null == (ev = globalThis) ? void 0 : ev.document) ? eM.useLayoutEffect : function() {},
                aT = eM[" useId ".trim().toString()] || function() {},
                aC = 0;

            function ak(e) {
                var t = tS(eM.useState(aT()), 2),
                    n = t[0],
                    r = t[1];
                return aA(function() {
                    e || r(function(e) {
                        return null != e ? e : String(aC++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function a_(e) {
                var t = eM.useRef(e);
                return eM.useEffect(function() {
                    t.current = e
                }), eM.useMemo(function() {
                    return function() {
                        for (var e, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(tK(r)))
                    }
                }, [])
            }
            var aO = window.RadixUI["react-dismissable-layer"],
                aN = window.RadixUI["react-focus-scope"],
                aR = window.ReactDOM,
                aL = n.n(aR);

            function aU(e) {
                var t, n, r = (t = e, (n = eM.forwardRef(function(e, t) {
                        var n = e.children,
                            r = ts(e, ["children"]);
                        if (eM.isValidElement(n)) {
                            var i, a, o, l, s, u = (s = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (s = (l = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                c = function(e, t) {
                                    var n = eG({}, t);
                                    for (var r in t) ! function(r) {
                                        var i = e[r],
                                            a = t[r];
                                        /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                            a.apply(void 0, tK(t)), i.apply(void 0, tK(t))
                                        } : i && (n[r] = i) : "style" === r ? n[r] = eG({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                    }(r);
                                    return eG({}, e, n)
                                }(r, n.props);
                            return n.type !== eM.Fragment && (c.ref = t ? rI(t, u) : u), eM.cloneElement(n, c)
                        }
                        return eM.Children.count(n) > 1 ? eM.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), n),
                    i = eM.forwardRef(function(e, t) {
                        var n = e.children,
                            i = ts(e, ["children"]),
                            a = eM.Children.toArray(n),
                            o = a.find(aD);
                        if (o) {
                            var l = o.props.children,
                                s = a.map(function(e) {
                                    return e !== o ? e : eM.Children.count(l) > 1 ? eM.Children.only(null) : eM.isValidElement(l) ? l.props.children : null
                                });
                            return (0, ra.jsx)(r, e4(eG({}, i), {
                                ref: t,
                                children: eM.isValidElement(l) ? eM.cloneElement(l, void 0, s) : null
                            }))
                        }
                        return (0, ra.jsx)(r, e4(eG({}, i), {
                            ref: t,
                            children: n
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var aB = Symbol("radix.slottable");

            function aD(e) {
                return eM.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === aB
            }
            var aM = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var n = aU("Primitive.".concat(t)),
                        r = eM.forwardRef(function(e, r) {
                            var i = e.asChild,
                                a = ts(e, ["asChild"]),
                                o = i ? n : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ra.jsx)(o, e4(eG({}, a), {
                                ref: r
                            }))
                        });
                    return r.displayName = "Primitive.".concat(t), e4(eG({}, e), eH({}, t, r))
                }, {}),
                aj = eM.forwardRef(function(e, t) {
                    var n, r, i = e.container,
                        a = ts(e, ["container"]),
                        o = tS(eM.useState(!1), 2),
                        l = o[0],
                        s = o[1];
                    aA(function() {
                        return s(!0)
                    }, []);
                    var u = i || l && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
                    return u ? aL().createPortal((0, ra.jsx)(aM.div, e4(eG({}, a), {
                        ref: t
                    })), u) : null
                });
            aj.displayName = "Portal";
            var aF = function(e) {
                var t, n, r, i, a, o, l, s, u, c, d, f, h, p, m, v, y, g = e.present,
                    b = e.children,
                    w = (t = g, a = (i = tS(eM.useState(), 2))[0], o = i[1], l = eM.useRef({}), s = eM.useRef(t), u = eM.useRef("none"), d = (c = tS((n = t ? "mounted" : "unmounted", r = {
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
                    }, eM.useReducer(function(e, t) {
                        var n = r[e][t];
                        return null != n ? n : e
                    }, n)), 2))[0], f = c[1], eM.useEffect(function() {
                        var e = aH(l.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), aA(function() {
                        var e = l.current,
                            n = s.current;
                        if (n !== t) {
                            var r = u.current,
                                i = aH(e);
                            t ? f("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? f("UNMOUNT") : n && r !== i ? f("ANIMATION_OUT") : f("UNMOUNT"), s.current = t
                        }
                    }, [t, f]), aA(function() {
                        if (a) {
                            var e, t, n = null != (e = a.ownerDocument.defaultView) ? e : window,
                                r = function(e) {
                                    var r = aH(l.current).includes(e.animationName);
                                    if (e.target === a && r && (f("ANIMATION_END"), !s.current)) {
                                        var i = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === a && (u.current = aH(l.current))
                                };
                            return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", r), a.addEventListener("animationend", r),
                                function() {
                                    n.clearTimeout(t), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", r), a.removeEventListener("animationend", r)
                                }
                        }
                        f("ANIMATION_END")
                    }, [a, f]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: eM.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), o(e)
                        }, [])
                    }),
                    E = "function" == typeof b ? b({
                        present: w.isPresent
                    }) : eM.Children.only(b),
                    P = rS(w.ref, (y = (v = null == (p = Object.getOwnPropertyDescriptor((h = E).props, "ref")) ? void 0 : p.get) && "isReactWarning" in v && v.isReactWarning) ? h.ref : (y = (v = null == (m = Object.getOwnPropertyDescriptor(h, "ref")) ? void 0 : m.get) && "isReactWarning" in v && v.isReactWarning) ? h.props.ref : h.props.ref || h.ref);
                return "function" == typeof b || w.isPresent ? eM.cloneElement(E, {
                    ref: P
                }) : null
            };

            function aH(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            aF.displayName = "Presence";
            var aG = window.RadixUI["react-focus-guards"],
                az = function() {
                    return (az = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function aV(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) 0 > t.indexOf(r[i]) && Object.prototype.propertyIsEnumerable.call(e, r[i]) && (n[r[i]] = e[r[i]]);
                return n
            }
            var aW = "right-scroll-bar-position",
                aq = "width-before-scroll-bar";

            function aK(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var aZ = "u" > typeof window ? eM.useLayoutEffect : eM.useEffect,
                aY = new WeakMap,
                aJ = (void 0 === b && (b = {}), (void 0 === w && (w = function(e) {
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
                }).options = az({
                    async: !0,
                    ssr: !1
                }, b), I),
                aX = function() {},
                a$ = eM.forwardRef(function(e, t) {
                    var n, r, i, a, o = eM.useRef(null),
                        l = eM.useState({
                            onScrollCapture: aX,
                            onWheelCapture: aX,
                            onTouchMoveCapture: aX
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
                        I = aV(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (n = [o, t], r = function(e) {
                            return n.forEach(function(t) {
                                return aK(t, e)
                            })
                        }, (i = (0, eM.useState)(function() {
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
                        })[0]).callback = r, a = i.facade, aZ(function() {
                            var e = aY.get(a);
                            if (e) {
                                var t = new Set(e),
                                    r = new Set(n),
                                    i = a.current;
                                t.forEach(function(e) {
                                    r.has(e) || aK(e, null)
                                }), r.forEach(function(e) {
                                    t.has(e) || aK(e, i)
                                })
                            }
                            aY.set(a, n)
                        }, [n]), a),
                        x = az(az({}, I), s);
                    return eM.createElement(eM.Fragment, null, p && eM.createElement(v, {
                        sideCar: aJ,
                        removeScrollBar: h,
                        shards: m,
                        noRelative: y,
                        noIsolation: g,
                        inert: b,
                        setCallbacks: u,
                        allowPinchZoom: !!w,
                        lockRef: o,
                        gapMode: P
                    }), c ? eM.cloneElement(eM.Children.only(d), az(az({}, x), {
                        ref: S
                    })) : eM.createElement(void 0 === E ? "div" : E, az({}, x, {
                        className: f,
                        ref: S
                    }), d))
                });
            a$.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, a$.classNames = {
                fullWidth: aq,
                zeroRight: aW
            };
            var aQ = function(e) {
                var t = e.sideCar,
                    n = aV(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var r = t.read();
                if (!r) throw Error("Sidecar medium not found");
                return eM.createElement(r, az({}, n))
            };
            aQ.isSideCarExport = !0;
            var a0 = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = ey || n.nc;
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
                a1 = function() {
                    var e = a0();
                    return function(t, n) {
                        eM.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && n])
                    }
                },
                a2 = function() {
                    var e = a1();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                a3 = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                a5 = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                a4 = function(e) {
                    var t = window.getComputedStyle(document.body),
                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [a5(n), a5(r), a5(i)]
                },
                a6 = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return a3;
                    var t = a4(e),
                        n = document.documentElement.clientWidth,
                        r = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, r - n + t[2] - t[0])
                    }
                },
                a8 = a2(),
                a7 = "data-scroll-locked",
                a9 = function(e, t, n, r) {
                    var i = e.left,
                        a = e.top,
                        o = e.right,
                        l = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(l, "px ").concat(r, ";\n  }\n  body[").concat(a7, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(o, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(l, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(aW, " {\n    right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(aq, " {\n    margin-right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(aW, " .").concat(aW, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(aq, " .").concat(aq, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(a7, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                oe = function() {
                    var e = parseInt(document.body.getAttribute(a7) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                ot = function() {
                    eM.useEffect(function() {
                        return document.body.setAttribute(a7, (oe() + 1).toString()),
                            function() {
                                var e = oe() - 1;
                                e <= 0 ? document.body.removeAttribute(a7) : document.body.setAttribute(a7, e.toString())
                            }
                    }, [])
                },
                on = function(e) {
                    var t = e.noRelative,
                        n = e.noImportant,
                        r = e.gapMode,
                        i = void 0 === r ? "margin" : r;
                    ot();
                    var a = eM.useMemo(function() {
                        return a6(i)
                    }, [i]);
                    return eM.createElement(a8, {
                        styles: a9(a, !t, i, n ? "" : "!important")
                    })
                },
                or = !1;
            if ("u" > typeof window) try {
                var oi = Object.defineProperty({}, "passive", {
                    get: function() {
                        return or = !0, !0
                    }
                });
                window.addEventListener("test", oi, oi), window.removeEventListener("test", oi, oi)
            } catch (e) {
                or = !1
            }
            var oa = !!or && {
                    passive: !1
                },
                oo = function(e, t) {
                    if (!(0, tB._)(e, Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
                },
                ol = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("u" > typeof ShadowRoot && (0, tB._)(r, ShadowRoot) && (r = r.host), os(e, r)) {
                            var i = ou(e, r);
                            if (i[1] > i[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                os = function(e, t) {
                    return "v" === e ? oo(t, "overflowY") : oo(t, "overflowX")
                },
                ou = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                oc = function(e, t, n, r, i) {
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
                        var p = ou(e, s),
                            m = p[0],
                            v = p[1] - p[2] - o * m;
                        (m || v) && os(e, s) && (f += v, h += m);
                        var y = s.parentNode;
                        s = y && y.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? y.host : y
                    } while (!u && s !== document.body || u && (t.contains(s) || t === s));
                    return d && (i && 1 > Math.abs(f) || !i && l > f) ? c = !0 : !d && (i && 1 > Math.abs(h) || !i && -l > h) && (c = !0), c
                },
                od = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                of = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                oh = function(e) {
                    return e && "current" in e ? e.current : e
                },
                op = 0,
                om = [],
                ov = (S = function(e) {
                    var t = eM.useRef([]),
                        n = eM.useRef([0, 0]),
                        r = eM.useRef(),
                        i = eM.useState(op++)[0],
                        a = eM.useState(a2)[0],
                        o = eM.useRef(e);
                    eM.useEffect(function() {
                        o.current = e
                    }, [e]), eM.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, n) {
                                if (n || 2 == arguments.length)
                                    for (var r, i = 0, a = t.length; i < a; i++) !r && i in t || (r || (r = Array.prototype.slice.call(t, 0, i)), r[i] = t[i]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(oh), !0).filter(Boolean);
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
                    var l = eM.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !o.current.allowPinchZoom;
                            var i, a = od(e),
                                l = n.current,
                                s = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                c = e.target,
                                d = Math.abs(s) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === c.type) return !1;
                            var f = ol(d, c);
                            if (!f) return !0;
                            if (f ? i = d : (i = "v" === d ? "h" : "v", f = ol(d, c)), !f) return !1;
                            if (!r.current && "changedTouches" in e && (s || u) && (r.current = i), !i) return !0;
                            var h = r.current || i;
                            return oc(h, t, e, "h" === h ? s : u, !0)
                        }, []),
                        s = eM.useCallback(function(e) {
                            if (om.length && om[om.length - 1] === a) {
                                var n = "deltaY" in e ? of(e) : od(e),
                                    r = t.current.filter(function(t) {
                                        var r;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                                    })[0];
                                if (r && r.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!r) {
                                    var i = (o.current.shards || []).map(oh).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? l(e, i[0]) : !o.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = eM.useCallback(function(e, n, r, i) {
                            var a = {
                                name: e,
                                delta: n,
                                target: r,
                                should: i,
                                shadowParent: function(e) {
                                    for (var t = null; null !== e;)(0, tB._)(e, ShadowRoot) && (t = e.host, e = e.host), e = e.parentNode;
                                    return t
                                }(r)
                            };
                            t.current.push(a), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== a
                                })
                            }, 1)
                        }, []),
                        c = eM.useCallback(function(e) {
                            n.current = od(e), r.current = void 0
                        }, []),
                        d = eM.useCallback(function(t) {
                            u(t.type, of(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        f = eM.useCallback(function(t) {
                            u(t.type, od(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    eM.useEffect(function() {
                        return om.push(a), e.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: f
                            }), document.addEventListener("wheel", s, oa), document.addEventListener("touchmove", s, oa), document.addEventListener("touchstart", c, oa),
                            function() {
                                om = om.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", s, oa), document.removeEventListener("touchmove", s, oa), document.removeEventListener("touchstart", c, oa)
                            }
                    }, []);
                    var h = e.removeScrollBar,
                        p = e.inert;
                    return eM.createElement(eM.Fragment, null, p ? eM.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, h ? eM.createElement(on, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, aJ.useMedium(S), aQ),
                oy = eM.forwardRef(function(e, t) {
                    return eM.createElement(a$, az({}, e, {
                        ref: t,
                        sideCar: ov
                    }))
                });
            oy.classNames = a$.classNames;
            var og = new WeakMap,
                ob = new WeakMap,
                ow = {},
                oE = 0,
                oP = function(e) {
                    return e && (e.host || oP(e.parentNode))
                },
                oI = function(e, t, n, r) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var n = oP(e);
                        return n && t.contains(n) ? n : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    ow[n] || (ow[n] = new WeakMap);
                    var a = ow[n],
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
                                    s = (og.get(e) || 0) + 1,
                                    u = (a.get(e) || 0) + 1;
                                og.set(e, s), a.set(e, u), o.push(e), 1 === s && i && ob.set(e, !0), 1 === u && e.setAttribute(n, "true"), i || e.setAttribute(r, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return c(t), l.clear(), oE++,
                        function() {
                            o.forEach(function(e) {
                                var t = og.get(e) - 1,
                                    i = a.get(e) - 1;
                                og.set(e, t), a.set(e, i), t || (ob.has(e) || e.removeAttribute(r), ob.delete(e)), i || e.removeAttribute(n)
                            }), --oE || (og = new WeakMap, og = new WeakMap, ob = new WeakMap, ow = {})
                        }
                },
                oS = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (r.push.apply(r, Array.from(i.querySelectorAll("[aria-live], script"))), oI(r, i, n, "aria-hidden")) : function() {
                        return null
                    }
                },
                ox = "Dialog",
                oA = tS(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        r = function() {
                            var t = n.map(function(e) {
                                return eM.createContext(e)
                            });
                            return function(n) {
                                var r = (null == n ? void 0 : n[e]) || t;
                                return eM.useMemo(function() {
                                    return eH({}, "__scope".concat(e), e4(eG({}, n), eH({}, e, r)))
                                }, [n, r])
                            }
                        };
                    return r.scopeName = e, [function(t, r) {
                        var i = eM.createContext(r),
                            a = n.length;
                        n = tK(n).concat([r]);
                        var o = function(t) {
                            var n, r = t.scope,
                                o = t.children,
                                l = ts(t, ["scope", "children"]),
                                s = (null == r || null == (n = r[e]) ? void 0 : n[a]) || i,
                                u = eM.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, ra.jsx)(s.Provider, {
                                value: u,
                                children: o
                            })
                        };
                        return o.displayName = t + "Provider", [o, function(n, o) {
                            var l, s = (null == o || null == (l = o[e]) ? void 0 : l[a]) || i,
                                u = eM.useContext(s);
                            if (u) return u;
                            if (void 0 !== r) return r;
                            throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
                        }]
                    }, ax.apply(void 0, [r].concat(tK(t)))]
                }(ox), 2),
                oT = oA[0];
            oA[1];
            var oC = tS(oT(ox), 2),
                ok = oC[0],
                o_ = oC[1],
                oO = function(e) {
                    var t, n, r, i, a, o, l, s, u, c, d, f, h, p, m, v, y, g = e.__scopeDialog,
                        b = e.children,
                        w = e.open,
                        E = e.defaultOpen,
                        P = e.onOpenChange,
                        I = e.modal,
                        S = eM.useRef(null),
                        x = eM.useRef(null),
                        A = tS((u = (s = {
                            prop: w,
                            defaultProp: E,
                            onChange: P
                        }).prop, h = (f = tS((n = (t = {
                            defaultProp: s.defaultProp,
                            onChange: d = void 0 === (c = s.onChange) ? function() {} : c
                        }).defaultProp, r = t.onChange, a = tS(i = eM.useState(n), 1)[0], o = eM.useRef(a), l = a_(r), eM.useEffect(function() {
                            o.current !== a && (l(a), o.current = a)
                        }, [a, o, l]), i), 2))[0], p = f[1], v = (m = void 0 !== u) ? u : h, y = a_(d), [v, eM.useCallback(function(e) {
                            if (m) {
                                var t = "function" == typeof e ? e(u) : e;
                                t !== u && y(t)
                            } else p(e)
                        }, [m, u, p, y])]), 2),
                        T = A[0],
                        C = A[1];
                    return (0, ra.jsx)(ok, {
                        scope: g,
                        triggerRef: S,
                        contentRef: x,
                        contentId: ak(),
                        titleId: ak(),
                        descriptionId: ak(),
                        open: void 0 !== T && T,
                        onOpenChange: C,
                        onOpenToggle: eM.useCallback(function() {
                            return C(function(e) {
                                return !e
                            })
                        }, [C]),
                        modal: void 0 === I || I,
                        children: b
                    })
                };
            oO.displayName = ox;
            var oN = "DialogTrigger";
            eM.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = ts(e, ["__scopeDialog"]),
                    i = o_(oN, n),
                    a = rS(t, i.triggerRef);
                return (0, ra.jsx)(aM.button, e4(eG({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": o$(i.open)
                }, r), {
                    ref: a,
                    onClick: aS(e.onClick, i.onOpenToggle)
                }))
            }).displayName = oN;
            var oR = "DialogPortal",
                oL = tS(oT(oR, {
                    forceMount: void 0
                }), 2),
                oU = oL[0],
                oB = oL[1],
                oD = function(e) {
                    var t = e.__scopeDialog,
                        n = e.forceMount,
                        r = e.children,
                        i = e.container,
                        a = o_(oR, t);
                    return (0, ra.jsx)(oU, {
                        scope: t,
                        forceMount: n,
                        children: eM.Children.map(r, function(e) {
                            return (0, ra.jsx)(aF, {
                                present: n || a.open,
                                children: (0, ra.jsx)(aj, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            oD.displayName = oR;
            var oM = "DialogOverlay",
                oj = eM.forwardRef(function(e, t) {
                    var n = oB(oM, e.__scopeDialog),
                        r = e.forceMount,
                        i = void 0 === r ? n.forceMount : r,
                        a = ts(e, ["forceMount"]),
                        o = o_(oM, e.__scopeDialog);
                    return o.modal ? (0, ra.jsx)(aF, {
                        present: i || o.open,
                        children: (0, ra.jsx)(oH, e4(eG({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            oj.displayName = oM;
            var oF = aU("DialogOverlay.RemoveScroll"),
                oH = eM.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = ts(e, ["__scopeDialog"]),
                        i = o_(oM, n);
                    return (0, ra.jsx)(oy, {
                        as: oF,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, ra.jsx)(aM.div, e4(eG({
                            "data-state": o$(i.open)
                        }, r), {
                            ref: t,
                            style: eG({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                }),
                oG = "DialogContent",
                oz = eM.forwardRef(function(e, t) {
                    var n = oB(oG, e.__scopeDialog),
                        r = e.forceMount,
                        i = void 0 === r ? n.forceMount : r,
                        a = ts(e, ["forceMount"]),
                        o = o_(oG, e.__scopeDialog);
                    return (0, ra.jsx)(aF, {
                        present: i || o.open,
                        children: o.modal ? (0, ra.jsx)(oV, e4(eG({}, a), {
                            ref: t
                        })) : (0, ra.jsx)(oW, e4(eG({}, a), {
                            ref: t
                        }))
                    })
                });
            oz.displayName = oG;
            var oV = eM.forwardRef(function(e, t) {
                    var n = o_(oG, e.__scopeDialog),
                        r = eM.useRef(null),
                        i = rS(t, n.contentRef, r);
                    return eM.useEffect(function() {
                        var e = r.current;
                        if (e) return oS(e)
                    }, []), (0, ra.jsx)(oq, e4(eG({}, e), {
                        ref: i,
                        trapFocus: n.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: aS(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = n.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: aS(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                n = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || n) && e.preventDefault()
                        }),
                        onFocusOutside: aS(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                oW = eM.forwardRef(function(e, t) {
                    var n = o_(oG, e.__scopeDialog),
                        r = eM.useRef(!1),
                        i = eM.useRef(!1);
                    return (0, ra.jsx)(oq, e4(eG({}, e), {
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
                oq = eM.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        o = ts(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = o_(oG, n),
                        s = eM.useRef(null),
                        u = rS(t, s);
                    return (0, aG.useFocusGuards)(), (0, ra.jsxs)(ra.Fragment, {
                        children: [(0, ra.jsx)(aN.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: r,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: a,
                            children: (0, ra.jsx)(aO.DismissableLayer, e4(eG({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": o$(l.open)
                            }, o), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, ra.jsxs)(ra.Fragment, {
                            children: [(0, ra.jsx)(o2, {
                                titleId: l.titleId
                            }), (0, ra.jsx)(o3, {
                                contentRef: s,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                oK = "DialogTitle",
                oZ = eM.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = ts(e, ["__scopeDialog"]),
                        i = o_(oK, n);
                    return (0, ra.jsx)(aM.h2, e4(eG({
                        id: i.titleId
                    }, r), {
                        ref: t
                    }))
                });
            oZ.displayName = oK;
            var oY = "DialogDescription";
            eM.forwardRef(function(e, t) {
                var n = e.__scopeDialog,
                    r = ts(e, ["__scopeDialog"]),
                    i = o_(oY, n);
                return (0, ra.jsx)(aM.p, e4(eG({
                    id: i.descriptionId
                }, r), {
                    ref: t
                }))
            }).displayName = oY;
            var oJ = "DialogClose",
                oX = eM.forwardRef(function(e, t) {
                    var n = e.__scopeDialog,
                        r = ts(e, ["__scopeDialog"]),
                        i = o_(oJ, n);
                    return (0, ra.jsx)(aM.button, e4(eG({
                        type: "button"
                    }, r), {
                        ref: t,
                        onClick: aS(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function o$(e) {
                return e ? "open" : "closed"
            }
            oX.displayName = oJ;
            var oQ = "DialogTitleWarning",
                o0 = tS((x = {
                    contentName: oG,
                    titleName: oK,
                    docsSlug: "dialog"
                }, A = eM.createContext(x), (T = function(e) {
                    var t = e.children,
                        n = ts(e, ["children"]),
                        r = eM.useMemo(function() {
                            return n
                        }, Object.values(n));
                    return (0, ra.jsx)(A.Provider, {
                        value: r,
                        children: t
                    })
                }).displayName = oQ + "Provider", [T, function(e) {
                    var t = eM.useContext(A);
                    if (t) return t;
                    if (void 0 !== x) return x;
                    throw Error("`".concat(e, "` must be used within `").concat(oQ, "`"))
                }]), 2),
                o1 = (o0[0], o0[1]),
                o2 = function(e) {
                    var t = e.titleId,
                        n = o1(oQ),
                        r = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
                    return eM.useEffect(function() {
                        t && (document.getElementById(t) || console.error(r))
                    }, [r, t]), null
                },
                o3 = function(e) {
                    var t = e.contentRef,
                        n = e.descriptionId,
                        r = o1("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
                    return eM.useEffect(function() {
                        var e, r = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        n && r && (document.getElementById(n) || console.warn(i))
                    }, [i, t, n]), null
                },
                o5 = Symbol("radix.slottable");

            function o4(e) {
                return eM.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o5
            }
            var o6 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                    var n, r, i, a, o, l = (n = i = "Primitive.".concat(t), (r = eM.forwardRef(function(e, t) {
                            var n = e.children,
                                r = ts(e, ["children"]);
                            if (eM.isValidElement(n)) {
                                var i, a, o, l, s, u = (s = (l = null == (a = Object.getOwnPropertyDescriptor((i = n).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (s = (l = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                    c = function(e, t) {
                                        var n = eG({}, t);
                                        for (var r in t) ! function(r) {
                                            var i = e[r],
                                                a = t[r];
                                            /^on[A-Z]/.test(r) ? i && a ? n[r] = function() {
                                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                var r = a.apply(void 0, tK(t));
                                                return i.apply(void 0, tK(t)), r
                                            } : i && (n[r] = i) : "style" === r ? n[r] = eG({}, i, a) : "className" === r && (n[r] = [i, a].filter(Boolean).join(" "))
                                        }(r);
                                        return eG({}, e, n)
                                    }(r, n.props);
                                return n.type !== eM.Fragment && (c.ref = t ? rI(t, u) : u), eM.cloneElement(n, c)
                            }
                            return eM.Children.count(n) > 1 ? eM.Children.only(null) : null
                        })).displayName = "".concat(n, ".SlotClone"), a = r, (o = eM.forwardRef(function(e, t) {
                            var n = e.children,
                                r = ts(e, ["children"]),
                                i = eM.Children.toArray(n),
                                o = i.find(o4);
                            if (o) {
                                var l = o.props.children,
                                    s = i.map(function(e) {
                                        return e !== o ? e : eM.Children.count(l) > 1 ? eM.Children.only(null) : eM.isValidElement(l) ? l.props.children : null
                                    });
                                return (0, ra.jsx)(a, e4(eG({}, r), {
                                    ref: t,
                                    children: eM.isValidElement(l) ? eM.cloneElement(l, void 0, s) : null
                                }))
                            }
                            return (0, ra.jsx)(a, e4(eG({}, r), {
                                ref: t,
                                children: n
                            }))
                        })).displayName = "".concat(i, ".Slot"), o),
                        s = eM.forwardRef(function(e, n) {
                            var r = e.asChild,
                                i = ts(e, ["asChild"]),
                                a = r ? l : t;
                            return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, ra.jsx)(a, e4(eG({}, i), {
                                ref: n
                            }))
                        });
                    return s.displayName = "Primitive.".concat(t), e4(eG({}, e), eH({}, t, s))
                }, {}),
                o8 = Object.freeze({
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
                o7 = eM.forwardRef(function(e, t) {
                    return (0, ra.jsx)(o6.span, e4(eG({}, e), {
                        ref: t,
                        style: eG({}, o8, e.style)
                    }))
                });
            o7.displayName = "VisuallyHidden";
            var o9 = (0, eM.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                le = function() {
                    var e = (0, eM.useContext)(o9);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                lt = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                ln = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                lr = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                li = function(e) {
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
                        g = (0, eM.useMemo)(function() {
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
                    return (0, eM.useEffect)(function() {
                        y && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [y, t]), ej().createElement(o9.Provider, {
                        value: g
                    }, ej().createElement(oO, {
                        open: t,
                        onOpenChange: n
                    }, r))
                };
            li.displayName = "Dialog";
            var la = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.style,
                    i = e.overlayClassName,
                    a = e.overlayStyle,
                    o = e.onOpenAutoFocus,
                    l = ts(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    s = le(),
                    u = s.size,
                    c = s.isModal,
                    d = s.hasCloseAffordance,
                    f = s.closeLabel,
                    h = s.hasDescription,
                    p = rv("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", c && "bg-common-backdrop", i),
                    m = rv("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", n);
                return ej().createElement(oD, null, ej().createElement(oj, {
                    className: p,
                    style: a
                }, ej().createElement(oz, eG({
                    className: m,
                    "data-size": u,
                    style: r,
                    onOpenAutoFocus: o
                }, !h && {
                    "aria-describedby": void 0
                }, l), d && ej().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, ej().createElement(oX, {
                    asChild: !0
                }, ej().createElement(aI, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": f
                }))), t)))
            };
            la.displayName = "DialogContent";
            var lo = function(e) {
                var t = e.children,
                    n = e.className,
                    r = ts(e, ["children", "className"]),
                    i = le(),
                    a = i.size,
                    o = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    s = rv(lt[a], o && ln[a], l && lr[a], n);
                return ej().createElement("div", eG({
                    className: s
                }, r), t)
            };
            lo.displayName = "DialogBody";
            var ll = function(e) {
                var t = e.children,
                    n = e.className,
                    r = e.hidden,
                    i = ts(e, ["children", "className", "hidden"]),
                    a = ej().createElement(oZ, eG({
                        className: n
                    }, i), t);
                return r ? ej().createElement(o7, null, a) : a
            };
            ll.displayName = "DialogTitle";
            var ls = function(e) {
                var t = e.children,
                    n = e.className,
                    r = ts(e, ["children", "className"]),
                    i = le().size,
                    a = rv(lt[i], lr[i], n);
                return ej().createElement("div", eG({
                    className: a
                }, r), t)
            }; /*! @license DOMPurify 3.4.17 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.4.17/LICENSE */
            function lu(e, t) {
                this.v = e, this.k = t
            }

            function lc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ld(e) {
                var t, n;

                function r(t, n) {
                    try {
                        var a = e[t](n),
                            o = a.value,
                            l = (0, tB._)(o, lu);
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
            ls.displayName = "DialogFooter", ld.prototype["function" == typeof Symbol && Symbol.asyncIterator || "@@asyncIterator"] = function() {
                return this
            }, ld.prototype.next = function(e) {
                return this._invoke("next", e)
            }, ld.prototype.throw = function(e) {
                return this._invoke("throw", e)
            }, ld.prototype.return = function(e) {
                return this._invoke("return", e)
            };
            var lf = Object.entries,
                lh = Object.setPrototypeOf,
                lp = Object.isFrozen,
                lm = Object.getPrototypeOf,
                lv = Object.getOwnPropertyDescriptor,
                ly = Object.freeze,
                lg = Object.seal,
                lb = Object.create,
                lw = "u" > typeof Reflect && Reflect,
                lE = lw.apply,
                lP = lw.construct;
            ly || (ly = function(e) {
                return e
            }), lg || (lg = function(e) {
                return e
            }), lE || (lE = function(e, t) {
                for (var n = arguments.length, r = Array(n > 2 ? n - 2 : 0), i = 2; i < n; i++) r[i - 2] = arguments[i];
                return e.apply(t, r)
            }), lP || (lP = function(e) {
                for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                return tF(e, tK(n))
            });
            var lI = lK(Array.prototype.forEach);
            Array.prototype.indexOf;
            var lS = lK(Array.prototype.lastIndexOf),
                lx = lK(Array.prototype.pop),
                lA = lK(Array.prototype.push),
                lT = lK(Array.prototype.slice),
                lC = lK(Array.prototype.splice),
                lk = Array.isArray,
                l_ = lZ(Set),
                lO = lK(Set.prototype.add),
                lN = lK(Set.prototype.has),
                lR = lK(String.prototype.toLowerCase),
                lL = lK(String.prototype.toString),
                lU = lK(String.prototype.match),
                lB = lK(String.prototype.replace),
                lD = lK(String.prototype.indexOf),
                lM = lK(String.prototype.trim),
                lj = lK(Number.prototype.toString),
                lF = lK(Boolean.prototype.toString),
                lH = "u" < typeof BigInt ? null : lK(BigInt.prototype.toString),
                lG = "u" < typeof Symbol ? null : lK(Symbol.prototype.toString),
                lz = lK(Object.prototype.hasOwnProperty),
                lV = lK(Object.prototype.toString),
                lW = lK(RegExp.prototype.test),
                lq = lZ(TypeError);

            function lK(e) {
                return function(t) {
                    (0, tB._)(t, RegExp) && (t.lastIndex = 0);
                    for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), i = 1; i < n; i++) r[i - 1] = arguments[i];
                    return lE(e, t, r)
                }
            }

            function lZ(e) {
                return function() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    return lP(e, n)
                }
            }

            function lY(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : lR;
                if (lh && lh(e, null), !lk(t)) return e;
                for (var r = t.length; r--;) {
                    var i = t[r];
                    if ("string" == typeof i) {
                        var a = n(i);
                        a !== i && (lp(t) || (t[r] = a), i = a)
                    }
                    e[i] = !0
                }
                return e
            }

            function lJ(e) {
                var t = lb(null),
                    n = !0,
                    r = !1,
                    i = void 0;
                try {
                    for (var a, o = lf(e)[Symbol.iterator](); !(n = (a = o.next()).done); n = !0) {
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
                                    if ("string" == typeof e) return lc(e, 2);
                                    var t = ({}).toString.call(e).slice(8, -1);
                                    return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? lc(e, 2) : void 0
                                }
                            }(l) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            u = s[0],
                            c = s[1];
                        lz(e, u) && (lk(c) ? t[u] = function(e) {
                            for (var t = 0; t < e.length; t++) lz(e, t) || (e[t] = null);
                            return e
                        }(c) : c && (void 0 === c ? "undefined" : (0, tL._)(c)) === "object" && c.constructor === Object ? t[u] = lJ(c) : t[u] = c)
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

            function lX(e, t) {
                for (; null !== e;) {
                    var n = lv(e, t);
                    if (n) {
                        if (n.get) return lK(n.get);
                        if ("function" == typeof n.value) return lK(n.value)
                    }
                    e = lm(e)
                }
                return function() {
                    return null
                }
            }
            var l$ = ly(["a", "abbr", "acronym", "address", "area", "article", "aside", "audio", "b", "bdi", "bdo", "big", "blink", "blockquote", "body", "br", "button", "canvas", "caption", "center", "cite", "code", "col", "colgroup", "content", "data", "datalist", "dd", "decorator", "del", "details", "dfn", "dialog", "dir", "div", "dl", "dt", "element", "em", "fieldset", "figcaption", "figure", "font", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "img", "input", "ins", "kbd", "label", "legend", "li", "main", "map", "mark", "marquee", "menu", "menuitem", "meter", "nav", "nobr", "ol", "optgroup", "option", "output", "p", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "search", "section", "select", "shadow", "slot", "small", "source", "spacer", "span", "strike", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "tr", "track", "tt", "u", "ul", "var", "video", "wbr"]),
                lQ = ly(["svg", "a", "altglyph", "altglyphdef", "altglyphitem", "animatecolor", "animatemotion", "animatetransform", "circle", "clippath", "defs", "desc", "ellipse", "enterkeyhint", "exportparts", "filter", "font", "g", "glyph", "glyphref", "hkern", "image", "inputmode", "line", "lineargradient", "marker", "mask", "metadata", "mpath", "part", "path", "pattern", "polygon", "polyline", "radialgradient", "rect", "stop", "style", "switch", "symbol", "text", "textpath", "title", "tref", "tspan", "view", "vkern"]),
                l0 = ly(["feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting", "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR", "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight", "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence"]),
                l1 = ly(["animate", "color-profile", "cursor", "discard", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "foreignobject", "hatch", "hatchpath", "mesh", "meshgradient", "meshpatch", "meshrow", "missing-glyph", "script", "set", "solidcolor", "unknown", "use"]),
                l2 = ly(["math", "menclose", "merror", "mfenced", "mfrac", "mglyph", "mi", "mlabeledtr", "mmultiscripts", "mn", "mo", "mover", "mpadded", "mphantom", "mroot", "mrow", "ms", "mspace", "msqrt", "mstyle", "msub", "msup", "msubsup", "mtable", "mtd", "mtext", "mtr", "munder", "munderover", "mprescripts"]),
                l3 = ly(["maction", "maligngroup", "malignmark", "mlongdiv", "mscarries", "mscarry", "msgroup", "mstack", "msline", "msrow", "semantics", "annotation", "annotation-xml", "mprescripts", "none"]),
                l5 = ly(["#text"]),
                l4 = ly(["accept", "action", "align", "alt", "autocapitalize", "autocomplete", "autopictureinpicture", "autoplay", "background", "bgcolor", "border", "capture", "cellpadding", "cellspacing", "checked", "cite", "class", "clear", "color", "cols", "colspan", "command", "commandfor", "controls", "controlslist", "coords", "crossorigin", "datetime", "decoding", "default", "dir", "disabled", "disablepictureinpicture", "disableremoteplayback", "download", "draggable", "enctype", "enterkeyhint", "exportparts", "face", "for", "headers", "height", "hidden", "high", "href", "hreflang", "id", "inert", "inputmode", "integrity", "ismap", "kind", "label", "lang", "list", "loading", "loop", "low", "max", "maxlength", "media", "method", "min", "minlength", "multiple", "muted", "name", "nonce", "noshade", "novalidate", "nowrap", "open", "optimum", "part", "pattern", "placeholder", "playsinline", "popover", "popovertarget", "popovertargetaction", "poster", "preload", "pubdate", "radiogroup", "readonly", "rel", "required", "rev", "reversed", "role", "rows", "rowspan", "spellcheck", "scope", "selected", "shape", "size", "sizes", "slot", "span", "srclang", "start", "src", "srcset", "step", "style", "summary", "tabindex", "title", "translate", "type", "usemap", "valign", "value", "width", "wrap", "xmlns"]),
                l6 = ly(["accent-height", "accumulate", "additive", "alignment-baseline", "amplitude", "ascent", "attributename", "attributetype", "azimuth", "basefrequency", "baseline-shift", "begin", "bias", "by", "class", "clip", "clippathunits", "clip-path", "clip-rule", "color", "color-interpolation", "color-interpolation-filters", "color-profile", "color-rendering", "cx", "cy", "d", "dx", "dy", "diffuseconstant", "direction", "display", "divisor", "dominant-baseline", "dur", "edgemode", "elevation", "end", "exponent", "fill", "fill-opacity", "fill-rule", "filter", "filterunits", "flood-color", "flood-opacity", "font-family", "font-size", "font-size-adjust", "font-stretch", "font-style", "font-variant", "font-weight", "fx", "fy", "g1", "g2", "glyph-name", "glyphref", "gradientunits", "gradienttransform", "height", "href", "id", "image-rendering", "in", "in2", "intercept", "k", "k1", "k2", "k3", "k4", "kerning", "keypoints", "keysplines", "keytimes", "lang", "lengthadjust", "letter-spacing", "kernelmatrix", "kernelunitlength", "lighting-color", "local", "marker-end", "marker-mid", "marker-start", "markerheight", "markerunits", "markerwidth", "maskcontentunits", "maskunits", "max", "mask", "mask-type", "media", "method", "mode", "min", "name", "numoctaves", "offset", "operator", "opacity", "order", "orient", "orientation", "origin", "overflow", "paint-order", "path", "pathlength", "patterncontentunits", "patterntransform", "patternunits", "pointer-events", "points", "preservealpha", "preserveaspectratio", "primitiveunits", "r", "rx", "ry", "radius", "refx", "refy", "repeatcount", "repeatdur", "restart", "result", "rotate", "scale", "seed", "shape-rendering", "slope", "specularconstant", "specularexponent", "spreadmethod", "startoffset", "stddeviation", "stitchtiles", "stop-color", "stop-opacity", "stroke-dasharray", "stroke-dashoffset", "stroke-linecap", "stroke-linejoin", "stroke-miterlimit", "stroke-opacity", "stroke", "stroke-width", "style", "surfacescale", "systemlanguage", "tabindex", "tablevalues", "targetx", "targety", "transform", "transform-origin", "text-anchor", "text-decoration", "text-orientation", "text-rendering", "textlength", "type", "u1", "u2", "unicode", "values", "vector-effect", "viewbox", "visibility", "version", "vert-adv-y", "vert-origin-x", "vert-origin-y", "width", "word-spacing", "wrap", "writing-mode", "xchannelselector", "ychannelselector", "x", "x1", "x2", "xmlns", "y", "y1", "y2", "z", "zoomandpan"]),
                l8 = ly(["accent", "accentunder", "align", "bevelled", "close", "columnalign", "columnlines", "columnspacing", "columnspan", "denomalign", "depth", "dir", "display", "displaystyle", "encoding", "fence", "frame", "height", "href", "id", "largeop", "length", "linethickness", "lquote", "lspace", "mathbackground", "mathcolor", "mathsize", "mathvariant", "maxsize", "minsize", "movablelimits", "notation", "numalign", "open", "rowalign", "rowlines", "rowspacing", "rowspan", "rspace", "rquote", "scriptlevel", "scriptminsize", "scriptsizemultiplier", "selection", "separator", "separators", "stretchy", "subscriptshift", "supscriptshift", "symmetric", "voffset", "width", "xmlns"]),
                l7 = ly(["xlink:href", "xml:id", "xlink:title", "xml:space", "xmlns:xlink"]),
                l9 = lg(/{{[\w\W]*|^[\w\W]*}}/g),
                se = lg(/<%[\w\W]*|^[\w\W]*%>/g),
                st = lg(/\${[\w\W]*/g),
                sn = lg(/^data-[\-\w.\u00B7-\uFFFF]+$/),
                sr = lg(/^aria-[\-\w]+$/),
                si = lg(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),
                sa = lg(/^(?:\w+script|data):/i),
                so = lg(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),
                sl = lg(/^html$/i),
                ss = lg(/^[a-z][.\w]*(-[.\w]+)+$/i),
                su = lg(/<[/\w!]/g),
                sc = lg(/<[/\w]/g),
                sd = lg(/<\/no(script|embed|frames)/i),
                sf = lg(/\/>/i),
                sh = ly(lY({}, ["style", "script", "xmp", "iframe", "noembed", "noframes", "plaintext", "noscript"])),
                sp = function(e, t) {
                    if ((void 0 === e ? "undefined" : (0, tL._)(e)) !== "object" || "function" != typeof e.createPolicy) return null;
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
                sm = function() {
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
                sv = function(e, t, n, r) {
                    return lz(e, t) && lk(e[t]) ? lY(r.base ? lJ(r.base) : {}, e[t], r.transform) : n
                },
                sy = function(e, t, n) {
                    var r = lz(e, t) ? e[t] : void 0;
                    return r && (void 0 === r ? "undefined" : (0, tL._)(r)) === "object" ? lJ(r) : n()
                },
                sg = function e() {
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
                        m = lX(p, "cloneNode"),
                        v = lX(p, "remove"),
                        y = lX(p, "removeAttributeNode"),
                        g = lX(p, "nextSibling"),
                        b = lX(p, "childNodes"),
                        w = lX(p, "parentNode"),
                        E = lX(p, "shadowRoot"),
                        P = lX(p, "attributes"),
                        I = u && u.prototype ? lX(u.prototype, "nodeType") : null,
                        S = u && u.prototype ? lX(u.prototype, "nodeName") : null,
                        x = u && u.prototype ? lX(u.prototype, "ownerDocument") : null,
                        A = function(e) {
                            return I ? I(e) : e.nodeType
                        },
                        T = function(e) {
                            return S ? S(e) : e.nodeName
                        },
                        C = function(e, t) {
                            for (; null !== e;) {
                                var n = lv(e, t);
                                if (n) return n.get ? lK(n.get) : null;
                                e = lm(e)
                            }
                            return null
                        }(p, "namespaceURI"),
                        k = function(e) {
                            return C ? C(e) : e.namespaceURI
                        };
                    if ("function" == typeof s) {
                        var _ = a.createElement("template");
                        _.content && _.content.ownerDocument && (a = _.content.ownerDocument)
                    }
                    var O = "",
                        N = !1,
                        R = 0,
                        L = function() {
                            if (R > 0) throw lq('A configured TRUSTED_TYPES_POLICY callback (createHTML or createScriptURL) must not call DOMPurify.sanitize, as that causes infinite recursion. Do not pass a policy whose callbacks wrap DOMPurify as TRUSTED_TYPES_POLICY; see the "DOMPurify and Trusted Types" section of the README.')
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
                        z = sm();
                    i.isSupported = "function" == typeof lf && "function" == typeof w && M && void 0 !== M.createHTMLDocument;
                    var V = si,
                        W = null,
                        q = lY({}, tK(l$).concat(tK(lQ), tK(l0), tK(l2), tK(l5))),
                        K = null,
                        Z = lY({}, tK(l4).concat(tK(l6), tK(l8), tK(l7))),
                        Y = Object.seal(lb(null, {
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
                        $ = Object.seal(lb(null, {
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
                        eE = lY({}, ["annotation-xml", "audio", "colgroup", "desc", "foreignobject", "head", "iframe", "math", "mi", "mn", "mo", "ms", "mtext", "noembed", "noframes", "noscript", "plaintext", "script", "selectedcontent", "style", "svg", "template", "thead", "title", "video", "xmp"]),
                        eP = null,
                        eI = lY({}, ["audio", "video", "img", "source", "image", "track"]),
                        eS = null,
                        ex = lY({}, ["alt", "class", "for", "id", "label", "name", "pattern", "placeholder", "role", "summary", "title", "value", "style", "xmlns"]),
                        eA = "http://www.w3.org/1998/Math/MathML",
                        eT = "http://www.w3.org/2000/svg",
                        eC = "http://www.w3.org/1999/xhtml",
                        ek = eC,
                        e_ = !1,
                        eO = null,
                        eN = lY({}, [eA, eT, eC], lL),
                        eR = ly(["mi", "mo", "mn", "ms", "mtext"]),
                        eL = lY({}, eR),
                        eU = ly(["annotation-xml"]),
                        eB = lY({}, eU),
                        eD = lY({}, ["title", "style", "font", "a", "script"]),
                        eM = null,
                        ej = ["application/xhtml+xml", "text/html"],
                        eF = null,
                        eH = null,
                        eG = a.createElement("form"),
                        ez = function(e) {
                            return (0, tB._)(e, RegExp) || (0, tB._)(e, Function)
                        },
                        eV = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            if (!eH || eH !== e) {
                                e && (void 0 === e ? "undefined" : (0, tL._)(e)) === "object" || (e = {}), e = lJ(e), eF = "application/xhtml+xml" === (eM = -1 === ej.indexOf(e.PARSER_MEDIA_TYPE) ? "text/html" : e.PARSER_MEDIA_TYPE) ? lL : lR, W = sv(e, "ALLOWED_TAGS", q, {
                                    transform: eF
                                }), K = sv(e, "ALLOWED_ATTR", Z, {
                                    transform: eF
                                }), eO = sv(e, "ALLOWED_NAMESPACES", eN, {
                                    transform: lL
                                }), eS = sv(e, "ADD_URI_SAFE_ATTR", ex, {
                                    transform: eF,
                                    base: ex
                                }), eP = sv(e, "ADD_DATA_URI_TAGS", eI, {
                                    transform: eF,
                                    base: eI
                                }), ew = sv(e, "FORBID_CONTENTS", eE, {
                                    transform: eF
                                }), J = sv(e, "FORBID_TAGS", lJ({}), {
                                    transform: eF
                                }), X = sv(e, "FORBID_ATTR", lJ({}), {
                                    transform: eF
                                }), eb = !!lz(e, "USE_PROFILES") && (e.USE_PROFILES && "object" === (0, tL._)(e.USE_PROFILES) ? lJ(e.USE_PROFILES) : e.USE_PROFILES), Q = !1 !== e.ALLOW_ARIA_ATTR, ee = !1 !== e.ALLOW_DATA_ATTR, et = e.ALLOW_UNKNOWN_PROTOCOLS || !1, en = !1 !== e.ALLOW_SELF_CLOSE_IN_ATTR, er = e.SAFE_FOR_TEMPLATES || !1, ei = !1 !== e.SAFE_FOR_XML, ea = e.WHOLE_DOCUMENT || !1, ec = e.RETURN_DOM || !1, ed = e.RETURN_DOM_FRAGMENT || !1, ef = e.RETURN_TRUSTED_TYPE || !1, eu = e.FORCE_BODY || !1, eh = !1 !== e.SANITIZE_DOM, ep = e.SANITIZE_NAMED_PROPS || !1, ev = !1 !== e.KEEP_CONTENT, ey = e.IN_PLACE || !1, V = ! function(e) {
                                    try {
                                        return lW(e, ""), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }(e.ALLOWED_URI_REGEXP) ? si : e.ALLOWED_URI_REGEXP, ek = "string" == typeof e.NAMESPACE ? e.NAMESPACE : eC, eL = sy(e, "MATHML_TEXT_INTEGRATION_POINTS", function() {
                                    return lY({}, eR)
                                }), eB = sy(e, "HTML_INTEGRATION_POINTS", function() {
                                    return lY({}, eU)
                                });
                                var r = sy(e, "CUSTOM_ELEMENT_HANDLING", function() {
                                    return lb(null)
                                });
                                if (Y = lb(null), lz(r, "tagNameCheck") && ez(r.tagNameCheck) && (Y.tagNameCheck = r.tagNameCheck), lz(r, "attributeNameCheck") && ez(r.attributeNameCheck) && (Y.attributeNameCheck = r.attributeNameCheck), lz(r, "allowCustomizedBuiltInElements") && "boolean" == typeof r.allowCustomizedBuiltInElements && (Y.allowCustomizedBuiltInElements = r.allowCustomizedBuiltInElements), lg(Y), er && (ee = !1), ed && (ec = !0), eb && (W = lY({}, l5), K = lb(null), !0 === eb.html && (lY(W, l$), lY(K, l4)), !0 === eb.svg && (lY(W, lQ), lY(K, l6), lY(K, l7)), !0 === eb.svgFilters && (lY(W, l0), lY(K, l6), lY(K, l7)), !0 === eb.mathMl && (lY(W, l2), lY(K, l8), lY(K, l7))), $.tagCheck = null, $.attributeCheck = null, lz(e, "ADD_TAGS") && ("function" == typeof e.ADD_TAGS ? $.tagCheck = e.ADD_TAGS : lk(e.ADD_TAGS) && (W === q && (W = lJ(W)), lY(W, e.ADD_TAGS, eF))), lz(e, "ADD_ATTR") && ("function" == typeof e.ADD_ATTR ? $.attributeCheck = e.ADD_ATTR : lk(e.ADD_ATTR) && (K === Z && (K = lJ(K)), lY(K, e.ADD_ATTR, eF))), lz(e, "ADD_FORBID_CONTENTS") && lk(e.ADD_FORBID_CONTENTS) && (ew === eE && (ew = lJ(ew)), lY(ew, e.ADD_FORBID_CONTENTS, eF)), ev && (W["#text"] = !0), ea && lY(W, ["html", "head", "body"]), W.table && (lY(W, ["tbody"]), delete J.tbody), e.TRUSTED_TYPES_POLICY) {
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createHTML) throw lq('TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.');
                                    if ("function" != typeof e.TRUSTED_TYPES_POLICY.createScriptURL) throw lq('TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.');
                                    var i = t;
                                    t = e.TRUSTED_TYPES_POLICY;
                                    try {
                                        O = U("")
                                    } catch (e) {
                                        throw t = i, e
                                    }
                                } else null === e.TRUSTED_TYPES_POLICY ? (t = void 0, O = "") : (void 0 === t && (N || (n = sp(h, l), N = !0), t = n), t && "string" == typeof O && (O = U("")));
                                ly && ly(e), eH = e
                            }
                        },
                        eW = lY({}, tK(lQ).concat(tK(l0), tK(l1))),
                        eq = lY({}, tK(l2).concat(tK(l3))),
                        eK = function(e) {
                            var t, n, r, i, a, o, l, s, u = k(e),
                                c = lR(T(e)),
                                d = w(e);
                            return d && 1 === A(d) ? (l = {
                                namespaceURI: k(d)
                            }, s = lR(T(d))) : (l = {
                                namespaceURI: ek
                            }, s = "template"), !!eO[u] && (u === eT ? (t = l, n = s, t.namespaceURI === eC ? "svg" === c : t.namespaceURI === eA ? "svg" === c && ("annotation-xml" === n || eL[n]) : !!eW[c]) : u === eA ? (r = l, i = s, r.namespaceURI === eC ? "math" === c : r.namespaceURI === eT ? "math" === c && eB[i] : !!eq[c]) : u === eC ? (a = l, o = s, (a.namespaceURI !== eT || !!eB[o]) && (a.namespaceURI !== eA || !!eL[o]) && !eq[c] && (eD[c] || !eW[c])) : "application/xhtml+xml" === eM && !!eO[u])
                        },
                        eZ = function(e) {
                            lA(i.removed, {
                                element: e
                            });
                            try {
                                w(e).removeChild(e)
                            } catch (t) {
                                if (v(e), !w(e)) throw lq("a node selected for removal could not be detached from its tree and cannot be safely returned; refusing to sanitize in place")
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
                            t && lI(lT(t), function(e) {
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
                            lA(i.removed, {
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
                            var n = l_();
                            lI(e1(e), function(e) {
                                1 === A(e) && lO(n, e)
                            }), lI(t, function(e) {
                                1 !== A(e) || lN(n, e) || e$(e)
                            })
                        },
                        e3 = function(e, t) {
                            var n = !1;
                            return lI(i.removed, function(t) {
                                t.element && (n = n || t.element === e, e0(t.element))
                            }), e2(e, t), n
                        },
                        e5 = function(e, t) {
                            for (var n = eg, r = null, i = function() {
                                    return r || (r = l_(), lI(t, function(e) {
                                        lO(r, e)
                                    })), r
                                }, a = 0;; a++) {
                                var o = function(t) {
                                    var r = e1(e),
                                        a = [e],
                                        o = !1;
                                    if (lI(r, function(e) {
                                            11 === A(e) ? lA(a, e) : o || lN(n, e) || (o = lN(i(), e))
                                        }), !o) return {
                                        v: void 0
                                    };
                                    if (t >= 8) throw lq("the tree kept changing during in-place sanitization; refusing to return it");
                                    lI(a, function(t, n) {
                                        e4(t, n > 0, e, i())
                                    })
                                }(a);
                                if ("object" === (0, tL._)(o)) return o.v
                            }
                        },
                        e4 = function(e, t, n, r) {
                            for (var i, a = te(e); i = a.nextNode();) !(!lN(r, i) || lN(eg, i)) && (t && tl(z.uponSanitizeShadowNode, i, null), tf(i, n), tb(i, n), ta(i.content) && tw(i.content))
                        },
                        e6 = function(e) {
                            eg && lO(eg, e)
                        },
                        e8 = function(e, t) {
                            return !!ei && ("patchsrc" === e || "for" === e && "label" !== t && "output" !== t)
                        },
                        e7 = function(e) {
                            ei && eQ(e, function(e) {
                                var t = A(e);
                                if (7 === t || 8 === t && lW(sc, e.data)) {
                                    try {
                                        v(e)
                                    } catch (e) {}
                                    return !1
                                }
                                if (1 === t) {
                                    var n = eF(T(e));
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
                                var i = lU(e, /^[\r\n\t ]+/);
                                r = i && i[0]
                            }
                            "application/xhtml+xml" === eM && ek === eC && (e = '<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>' + e + "</body></html>");
                            var o = t ? U(e) : e;
                            if (ek === eC) try {
                                n = new f().parseFromString(o, eM)
                            } catch (e) {}
                            if (!n || !n.documentElement) {
                                n = M.createDocument(ek, "template", null);
                                try {
                                    n.documentElement.innerHTML = e_ ? O : o
                                } catch (e) {}
                            }
                            var l = n.body || n.documentElement;
                            return (e && r && l.insertBefore(a.createTextNode(r), l.childNodes[0] || null), ek === eC) ? H.call(n, ea ? "html" : "body")[0] : ea ? n.documentElement : l
                        },
                        te = function(e) {
                            var t = x ? x(e) : e.ownerDocument;
                            return j.call(t || e, e, d.SHOW_ELEMENT | d.SHOW_COMMENT | d.SHOW_TEXT | d.SHOW_PROCESSING_INSTRUCTION | d.SHOW_CDATA_SECTION, null)
                        },
                        tt = function(e) {
                            return e = lB(e, l9, " "), e = lB(e, se, " "), e = lB(e, st, " ")
                        },
                        tn = function(e) {
                            tr(e);
                            var t, n = null == (t = e.querySelectorAll) ? void 0 : t.call(e, "template");
                            n && lI(n, function(e) {
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
                            if (!I || (void 0 === e ? "undefined" : (0, tL._)(e)) !== "object" || null === e) return !1;
                            try {
                                return 11 === I(e)
                            } catch (e) {
                                return !1
                            }
                        },
                        to = function(e) {
                            if (!I || (void 0 === e ? "undefined" : (0, tL._)(e)) !== "object" || null === e) return !1;
                            try {
                                return "number" == typeof I(e)
                            } catch (e) {
                                return !1
                            }
                        };

                    function tl(e, t, n) {
                        0 !== e.length && lI(e, function(e) {
                            e.call(i, t, n, eH)
                        })
                    }
                    var ts = function(e, t) {
                            if ((0, tB._)(e, RegExp)) return lW(e, t);
                            if ((0, tB._)(e, Function)) {
                                for (var n = arguments.length, r = Array(n > 2 ? n - 2 : 0), i = 2; i < n; i++) r[i - 2] = arguments[i];
                                return !!e.apply(void 0, [t].concat(tK(r)))
                            }
                            return !1
                        },
                        tu = function(e, t, n) {
                            if (!J[t] && tm(t) && ts(Y.tagNameCheck, t)) return !1;
                            if (ev && !ew[t] && !ew[lR(t)]) {
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
                            return 0 === e.length ? t : t === n || t === r ? lJ(t) : t
                        },
                        td = function(e, t) {
                            return e !== t && null === w(e) && (ey && e0(e), !0)
                        },
                        tf = function(e, t) {
                            if (e6(e), tl(z.beforeSanitizeElements, e, null), td(e, t)) return !0;
                            if (ti(e)) return eZ(e), !0;
                            var n = eF(T(e));
                            if (W = tc(z.uponSanitizeElement, W, q, el), tl(z.uponSanitizeElement, e, {
                                    tagName: n,
                                    allowedTags: W
                                }), td(e, t)) return !0;
                            if (ei && e.hasChildNodes() && !to(e.firstElementChild) && lW(su, e.textContent) && lW(su, e.innerHTML) || ei && sh[n] && 1 === A(e) && k(e) === eC && (to(e.firstElementChild) || "string" == typeof e.textContent && lW(su, e.textContent)) || 7 === e.nodeType || ei && 8 === e.nodeType && lW(sc, e.data)) return eZ(e), !0;
                            if (J[n] || !((0, tB._)($.tagCheck, Function) && $.tagCheck(n)) && !W[n]) {
                                var r = tu(e, n, t);
                                return !!(!1 === r && (tl(z.afterSanitizeElements, e, null), td(e, t))) || r
                            }
                            if (1 === A(e) && !eK(e) || ("noscript" === n || "noembed" === n || "noframes" === n) && lW(sd, e.innerHTML)) return eZ(e), !0;
                            if (er && 3 === e.nodeType) {
                                var a = tt(e.textContent);
                                e.textContent !== a && (lA(i.removed, {
                                    element: e.cloneNode()
                                }), e.textContent = a)
                            }
                            return tl(z.afterSanitizeElements, e, null), td(e, t)
                        },
                        th = function(e, t, n) {
                            if (X[t] || e8(t, e) || eh && ("id" === t || "name" === t) && (n in a || n in eG)) return !1;
                            var r = K[t] || (0, tB._)($.attributeCheck, Function) && $.attributeCheck(t, e);
                            return !!(ee && lW(sn, t) || Q && lW(sr, t)) || (r ? !(!(eS[t] || lW(V, lB(n, so, ""))) && ("src" !== t && "xlink:href" !== t && "href" !== t || "script" === e || 0 !== lD(n, "data:") || !eP[e]) && (!et || lW(sa, lB(n, so, "")))) || !n : tm(e) && ts(Y.tagNameCheck, e) && ts(Y.attributeNameCheck, t, e) || "is" === t && Y.allowCustomizedBuiltInElements && ts(Y.tagNameCheck, n))
                        },
                        tp = lY({}, ["annotation-xml", "color-profile", "font-face", "font-face-format", "font-face-name", "font-face-src", "font-face-uri", "missing-glyph"]),
                        tm = function(e) {
                            return !tp[lR(e)] && lW(ss, e)
                        },
                        tv = function(e, n, r, i) {
                            if (t && (void 0 === h ? "undefined" : (0, tL._)(h)) === "object" && "function" == typeof h.getAttributeType && !r) switch (h.getAttributeType(e, n)) {
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
                            return !!(ei && lW(/((--!?|])>)|<\/(style|script|title|xmp|textarea|noscript|iframe|noembed|noframes)/i, t)) || "attributename" === lR(e) && null !== lU(t, "href")
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
                                            f = "value" === s ? c : lM(c),
                                            h = !1;
                                        if (r.attrName = d, r.attrValue = f, r.keepAttr = !0, r.forceKeepAttr = void 0, tl(z.uponSanitizeAttribute, e, r), f = r.attrValue, ep && ("id" === d || "name" === d) && 0 !== lD(f, em) && (eX(s, e, l), f = em + f, h = !0), tg(s, f)) {
                                            eX(s, e, l);
                                            continue
                                        }
                                        if (!r.forceKeepAttr) {
                                            if (!r.keepAttr || !en && lW(sf, f) || (er && (f = tt(f)), !th(o, d, f))) {
                                                eX(s, e, l);
                                                continue
                                            }(f = tv(o, d, u, f)) !== c && ty(e, s, u, f) && h && lx(i.removed)
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
                                switch (void 0 === e ? "undefined" : (0, tL._)(e)) {
                                    case "string":
                                        return e;
                                    case "number":
                                        return lj(e);
                                    case "boolean":
                                        return lF(e);
                                    case "bigint":
                                        return lH ? lH(e) : "0";
                                    case "symbol":
                                        return lG ? lG(e) : "Symbol()";
                                    case "undefined":
                                    default:
                                        return lV(e);
                                    case "function":
                                    case "object":
                                        if (null === e) return lV(e);
                                        var t = lX(e, "toString");
                                        if ("function" == typeof t) {
                                            var n = t(e);
                                            return "string" == typeof n ? n : lV(n)
                                        }
                                        return lV(e)
                                }
                            }(e))) throw lq("dirty is not a string, aborting");
                        if (!i.isSupported) return e;
                        eo ? (W = el, K = es) : eV(n), (z.uponSanitizeElement.length > 0 || z.uponSanitizeAttribute.length > 0) && (W = lJ(W)), z.uponSanitizeAttribute.length > 0 && (K = lJ(K)), i.removed = [];
                        var u = ey && "string" != typeof e && to(e),
                            c = [],
                            d = eg;
                        if (u) {
                            e7(e);
                            var f = T(e);
                            if ("string" == typeof f) {
                                var h = eF(f);
                                if (!W[h] || J[h]) throw eJ(e), lq("root node is forbidden and cannot be sanitized in-place")
                            }
                            if (ti(e)) throw eJ(e), lq("root node is clobbered and cannot be sanitized in-place");
                            c = e1(e), eg = l_()
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
                            if (e3(e, c)) throw lq("a node selected for removal could not be safely returned; refusing to sanitize in place");
                            return er && tn(e), e
                        }
                        if (ec) {
                            if (er && tn(r), ed)
                                for (s = F.call(r.ownerDocument); r.firstChild;) s.appendChild(r.firstChild);
                            else s = r;
                            return (K.shadowroot || K.shadowrootmode) && (s = G.call(o, s, !0)), s
                        }
                        var v = ea ? r.outerHTML : r.innerHTML;
                        return ea && W["!doctype"] && r.ownerDocument && r.ownerDocument.doctype && r.ownerDocument.doctype.name && lW(sl, r.ownerDocument.doctype.name) && (v = "<!DOCTYPE " + r.ownerDocument.doctype.name + ">\n" + v), er && (v = tt(v)), t && ef ? U(v) : v
                    }, i.setConfig = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        eV(e), eo = !0, el = W, es = K
                    }, i.clearConfig = function() {
                        eH = null, eo = !1, el = null, es = null, t = n, O = ""
                    }, i.isValidAttribute = function(e, t, n) {
                        eH || eV({});
                        var r = eF(e),
                            i = eF(t);
                        return !("string" == typeof n && (tg(t, n) || !en && lW(sf, n))) && th(r, i, n)
                    }, i.addHook = function(e, t) {
                        "function" != typeof t || lz(z, e) && lA(z[e], t)
                    }, i.removeHook = function(e, t) {
                        if (lz(z, e)) {
                            if (void 0 !== t) {
                                var n = lS(z[e], t);
                                return -1 === n ? void 0 : lC(z[e], n, 1)[0]
                            }
                            return lx(z[e])
                        }
                    }, i.removeHooks = function(e) {
                        lz(z, e) && (z[e] = [])
                    }, i.removeAllHooks = function() {
                        z = sm()
                    }, i
                }(),
                sb = sg.sanitize.bind(sg),
                sw = sg.isSupported;
            sg.addHook.bind(sg), sg.removeHook.bind(sg), sg.removeHooks.bind(sg), sg.removeAllHooks.bind(sg), sg.setConfig.bind(sg), sg.clearConfig.bind(sg), sg.isValidAttribute.bind(sg), sg.version, sg.removed;
            var sE = {
                    ADD_ATTR: ["target"]
                },
                sP = e4(eG({}, sE), {
                    RETURN_DOM_FRAGMENT: !0
                }),
                sI = function(e) {
                    e.setAttribute("target", "_blank"), e.setAttribute("rel", "noopener noreferrer")
                },
                sS = function(e, t) {
                    if (!t || !sw) return sb(e, sE);
                    var n = sb(e, sP);
                    if ("string" == typeof n) return n;
                    n.querySelectorAll("a").forEach(sI);
                    var r = n.ownerDocument.createElement("div");
                    return r.appendChild(n), r.innerHTML
                },
                sx = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        n = t.shouldOpenLinksInNewTab;
                    return (0, eM.useMemo)(function() {
                        return sS(e, null != n && n)
                    }, [e, n])
                },
                sA = function(e) {
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
                        h = sx(n, {
                            shouldOpenLinksInNewTab: !0
                        }),
                        p = r && o ? (0, ra.jsx)(rU, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: o,
                            className: "grow basis-0",
                            children: r
                        }) : null,
                        m = i && l ? (0, ra.jsx)(rU, {
                            variant: "Standard",
                            size: "Medium",
                            onClick: l,
                            className: "grow basis-0",
                            children: i
                        }) : null;
                    return (0, ra.jsx)(li, {
                        open: s,
                        onOpenChange: function(e) {
                            e || u()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: void 0 === c || c,
                        closeLabel: a,
                        children: (0, ra.jsxs)(la, {
                            children: [(0, ra.jsxs)(lo, {
                                className: "flex flex-col gap-large",
                                children: [(0, ra.jsx)(ll, {
                                    children: t
                                }), (0, ra.jsx)("span", {
                                    className: "[&_a]:[font-weight:700] [&_a]:underline",
                                    dangerouslySetInnerHTML: {
                                        __html: h
                                    }
                                })]
                            }), (0, ra.jsx)(ls, {
                                className: f ? "flex flex-col gap-small" : "flex gap-x-medium",
                                children: f ? (0, ra.jsxs)(eM.Fragment, {
                                    children: [p, m]
                                }) : (0, ra.jsxs)(eM.Fragment, {
                                    children: [m, p]
                                })
                            })]
                        })
                    })
                },
                sT = function(e) {
                    var t = e.isModalOpen,
                        n = e.navigateToAccountSettings,
                        r = e.closeModal,
                        i = e.translate;
                    return (0, ra.jsx)(sA, {
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
                    return (0, ra.jsx)(sA, {
                        titleText: r("RestrictedUnplayableModal.Label.Title"),
                        bodyText: r("RestrictedUnplayableModal.Label.Body"),
                        secondaryButtonText: r("RestrictedUnplayableModal.Action.Ok"),
                        closeLabelText: r("Action.Close"),
                        onSecondaryButtonClick: n,
                        isModalOpen: t,
                        onCloseModal: n
                    })
                },
                sk = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        n = !!e && !t,
                        r = (0, eF.useQuery)({
                            queryKey: ["ageRecommendation", e],
                            queryFn: function() {
                                return e3(e)
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
                s_ = function(e) {
                    var t, n, r = tS((0, eM.useState)(void 0), 2),
                        i = r[0],
                        a = r[1],
                        o = tS((0, eM.useState)(!1), 2),
                        l = o[0],
                        s = o[1],
                        u = tS((0, eM.useState)(!1), 2),
                        c = u[0],
                        d = u[1];
                    (0, eM.useEffect)(function() {
                        d(!1), s(!0), e2().then(function(e) {
                            a(e.contentAgeRestriction)
                        }).catch(function() {
                            d(!0)
                        }).finally(function() {
                            s(!1)
                        })
                    }, []);
                    var f = sk(e),
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
                sO = function(e, t, n, r, i, a, o, l) {
                    var s = (0, eF.useQuery)({
                            queryKey: ["guacPlayButtonUI"],
                            queryFn: function() {
                                return e1()
                            },
                            staleTime: 6e4
                        }).data,
                        u = tS((0, eM.useState)(!1), 2),
                        c = u[0],
                        d = u[1],
                        f = tS((0, eM.useState)(!1), 2),
                        h = f[0],
                        p = f[1],
                        m = (0, eM.useCallback)(function() {
                            n1(e, r, i, a, o, void 0, l)
                        }, [o, a, e, i, r, l]),
                        v = (0, eM.useCallback)(function(e, r, i) {
                            return eB(function() {
                                var a, o, l, u, c, f;
                                return eD(this, function(h) {
                                    switch (h.label) {
                                        case 0:
                                            if (a = function(e) {
                                                    n9(t, e, e6.ContextualPlayabilityAgeRecommendationParentalControls, n)
                                                }, i || void 0 === e || void 0 === r) return m(), eY(tt.PlayButtonUpsellUnknownSettingOrAge), a(tn.gameLaunchFallbackUpsellName), [2];
                                            if ("minimal" === r) return m(), eY(tt.PlayButtonUpsellMinimalMaturityRating), a(tn.gameLaunchFallbackUpsellName), [2];
                                            if (!(o = ({
                                                    mild: "NinePlus",
                                                    moderate: "ThirteenPlus",
                                                    restricted: "SeventeenPlus",
                                                    unrated: "ThirteenPlus"
                                                })[r])) return m(), eY(tt.PlayButtonUpsellAgeNotInMapping), a(tn.gameLaunchFallbackUpsellName), [2];
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
                                            return d(!0), eY(tt.PlayButtonUpsellSelfUpdateSettingTriggered), a(u), [3, 12];
                                        case 2:
                                            if (eY(tt.PlayButtonUpsellAskYourParentTriggered), a(u), !(c = nq())) return eY(tt.PlayButtonUpsellParentalConsentError), [3, 12];
                                            h.label = 3;
                                        case 3:
                                            return h.trys.push([3, 5, , 6]), f = (null == s ? void 0 : s.useExperienceApprovalForParentalConsent) ? {
                                                featureName: "CanApproveExperience",
                                                namespace: ta.accountManagement,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    universeId: t,
                                                    experienceManagementAction: "Approve"
                                                }
                                            } : {
                                                featureName: "CanChangeSetting",
                                                namespace: ta.settingChange,
                                                isAsyncCall: !1,
                                                usePrologue: !0,
                                                ampRecourseData: {
                                                    contentAgeRestriction: l.option.optionValue
                                                }
                                            }, [4, c(f)];
                                        case 4:
                                            return h.sent(), [3, 6];
                                        case 5:
                                            return h.sent(), m(), eY(tt.PlayButtonUpsellParentalConsentError), a(tn.gameLaunchFallbackUpsellName), [3, 6];
                                        case 6:
                                        case 10:
                                            return [3, 12];
                                        case 7:
                                            return h.trys.push([7, 9, , 10]), eY(tt.PlayButtonUpsellAgeRestrictionVerificationTriggered), a(u), [4, n6({
                                                context: ti,
                                                pageContext: n
                                            })];
                                        case 8:
                                            return h.sent() && window.location.reload(), [3, 10];
                                        case 9:
                                            return h.sent(), m(), a(tn.gameLaunchFallbackUpsellName), [3, 10];
                                        case 11:
                                            m(), eY(tt.PlayButtonUpsellUnknownRequirement), a(tn.gameLaunchFallbackUpsellName), h.label = 12;
                                        case 12:
                                            return [3, 14];
                                        case 13:
                                            p(!0), eY(tt.PlayButtonUpsellRestrictedUnplayableTriggered), a(tn.restrictedUnplayableUpsellName), h.label = 14;
                                        case 14:
                                            return [2]
                                    }
                                })
                            })()
                        }, [s, m, t, n]),
                        y = (0, eM.useCallback)(function() {
                            d(!1)
                        }, []),
                        g = (0, eM.useCallback)(function() {
                            p(!1)
                        }, []);
                    return {
                        launchPlayButtonUpsell: v,
                        isSelfUpdateSettingModalOpen: c,
                        navigateToAccountSettings: (0, eM.useCallback)(function() {
                            var e = (0, tu.getAbsoluteUrl)("/my/account#!/privacy");
                            "u" > typeof window && (window.location.href = e, d(!1))
                        }, []),
                        closeSelfUpdateSettingModal: y,
                        isRestrictedUnplayableModalOpen: h,
                        closeRestrictedUnplayableModal: g
                    }
                },
                sN = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.placeId,
                        i = e.rootPlaceId,
                        a = e.privateServerLinkCode,
                        o = e.gameInstanceId,
                        l = e.eventProperties,
                        s = e.appsFlyerReferralProperties,
                        u = e.pageContext,
                        c = ay(),
                        d = s_(t),
                        f = d.contentAgeRestriction,
                        h = d.contentMaturityRating,
                        p = d.isFetching,
                        m = d.hasError,
                        v = sO(r, t, u, i, a, o, l, s),
                        y = v.launchPlayButtonUpsell,
                        g = v.isSelfUpdateSettingModalOpen,
                        b = v.navigateToAccountSettings,
                        w = v.closeSelfUpdateSettingModal,
                        E = v.isRestrictedUnplayableModalOpen,
                        P = v.closeRestrictedUnplayableModal,
                        I = (0, eM.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), y(f, h, m)
                        }, [y, f, h, m]);
                    return !m && p ? (0, ra.jsx)(aw, {
                        buttonClassName: null != n ? n : "game-play-button-action-needed-lg"
                    }) : (0, ra.jsxs)(ej().Fragment, {
                        children: [(0, ra.jsx)(ag, {
                            onButtonClick: I,
                            buttonClassName: n
                        }), g && (0, ra.jsx)(sT, {
                            isModalOpen: g,
                            navigateToAccountSettings: b,
                            closeModal: w,
                            translate: c
                        }), E && (0, ra.jsx)(sC, {
                            isModalOpen: E,
                            closeModal: P,
                            translate: c
                        })]
                    })
                };
            sN.defaultProps = {
                buttonClassName: void 0,
                rootPlaceId: void 0,
                privateServerLinkCode: void 0,
                gameInstanceId: void 0,
                eventProperties: {},
                appsFlyerReferralProperties: {}
            };
            var sR = function(e, t) {
                    var n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2],
                        r = (0, eF.useQuery)({
                            queryKey: ["purchaseProductData", e, t],
                            queryFn: function() {
                                return eB(function() {
                                    var n;
                                    return eD(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                var i, a;
                                                return [4, Promise.all([(i = [e], eB(function() {
                                                    var e;
                                                    return eD(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, e0.getProductInfo(i)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data.data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })()), (a = [t], eB(function() {
                                                    var e;
                                                    return eD(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                return [4, e0.getPlaceDetails(a)];
                                                            case 1:
                                                                return [2, (void 0 === (e = t.sent().data) ? [] : e)[0]]
                                                        }
                                                    })
                                                })())])];
                                            case 1:
                                                return [2, {
                                                    productInfo: (n = tS.apply(void 0, [r.sent(), 2]))[0],
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
                sL = function(e) {
                    var t = e.buttonWidth,
                        n = e.buttonClassName,
                        r = e.iconClassName,
                        i = e.hideButtonText,
                        a = e.hideButtonIcon,
                        o = e.buttonContent,
                        l = e.onClick,
                        s = e.isPurchasing,
                        u = e.redirectUrl;
                    return u ? (0, ra.jsx)("a", {
                        href: u,
                        className: "purchase-button-link",
                        children: (0, ra.jsxs)(rU, {
                            "data-testid": "play-purchase-button",
                            variant: "Emphasis",
                            style: rF,
                            className: rl()(rj(t), n),
                            onClick: function() {
                                return null
                            },
                            isDisabled: s,
                            children: [!a && (0, ra.jsx)("span", {
                                className: r
                            }), !i && (0, ra.jsx)("span", {
                                className: "btn-text",
                                children: o
                            })]
                        })
                    }) : (0, ra.jsxs)(rU, {
                        "data-testid": "play-purchase-button",
                        variant: "Emphasis",
                        style: rF,
                        className: rl()(rj(t), n),
                        onClick: function(e) {
                            l && !s && l(e)
                        },
                        isDisabled: s,
                        children: [!a && (0, ra.jsx)("span", {
                            className: r
                        }), !i && (0, ra.jsx)("span", {
                            className: "btn-text",
                            children: o
                        })]
                    })
                };
            sL.defaultProps = {
                hideButtonText: !1,
                buttonWidth: rM,
                buttonClassName: "game-play-button-purchase-lg",
                iconClassName: "icon icon-regular-robux size-400",
                hideButtonIcon: !1,
                isPurchasing: !1,
                onClick: void 0,
                redirectUrl: void 0
            };
            var sU = function(e) {
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
                        p = tS((0, eM.useState)(!1), 2),
                        m = p[0],
                        v = p[1],
                        y = (0, eM.useCallback)(function(e) {
                            return eB(function() {
                                var t, n, o;
                                return eD(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            if (e.preventDefault(), e.stopPropagation(), n = null == (t = a.fiatPurchaseData) ? void 0 : t.basePriceId, !i || !n) return [2];
                                            v(!0), l.label = 1;
                                        case 1:
                                            return l.trys.push([1, 3, 4, 5]), n9(r, tn.fiatPurchaseUpsellName, e6.FiatPurchaseRequired, h), [4, e5(i, n)];
                                        case 2:
                                            return (o = l.sent()) && (0, tf.isValidStripeCheckoutUrl)(o) && (window.location.href = o), [3, 5];
                                        case 3:
                                            return l.sent(), eY(tt.PreparePurchaseUrlError), console.error("Error preparing purchase url"), [3, 5];
                                        case 4:
                                            return v(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, [i, a, r, h]);
                    return (0, ra.jsx)(sL, {
                        buttonWidth: s,
                        buttonClassName: u,
                        iconClassName: l,
                        hideButtonText: c,
                        hideButtonIcon: !0,
                        buttonContent: void 0 !== f && f ? o(e9.Buy) : null != (t = null == (n = a.fiatPurchaseData) ? void 0 : n.localizedFiatPrice) ? t : "",
                        onClick: d ? void 0 : y,
                        redirectUrl: d,
                        isPurchasing: m
                    })
                },
                sB = window.RobloxItemPurchase,
                sD = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
                sM = (0, eM.forwardRef)(function(e, t) {
                    var n = rm([e, t]),
                        r = n[0],
                        i = n.slice(1),
                        a = r.className,
                        o = r.style,
                        l = r.variant,
                        s = void 0 === l ? "Rectangle" : l,
                        u = r.isAnimated,
                        c = r.width,
                        d = r.height,
                        f = ts(r, ["className", "style", "variant", "isAnimated", "width", "height"]),
                        h = tS(i, 1)[0],
                        p = "Text" === s,
                        m = "Circle" === s,
                        v = {};
                    return p ? (v.height = null != d ? d : "1em", v.width = null != c ? c : "100%") : (void 0 !== c && (v.width = c), void 0 !== d && (v.height = d)), ej().createElement("div", e4(eG({
                        ref: h,
                        "aria-hidden": "true",
                        "data-variant": s
                    }, f), {
                        className: rv("relative clip block bg-[var(--color-common-shimmer)]", p && "radius-xsmall", m && "radius-circle", !p && !m && "radius-small", (void 0 === u || u) && sD, a),
                        style: eG({}, v, o)
                    }))
                });
            sM.displayName = "Skeleton";
            var sj = Error("thumbnail pending"),
                sF = function(e, t) {
                    return t === sj && e < 5
                },
                sH = function() {
                    var e, t;
                    return {
                        promise: new Promise(function(n, r) {
                            e = n, t = r
                        }),
                        resolve: e,
                        reject: t
                    }
                },
                sG = "150x150",
                sz = "webp",
                sV = function(e) {
                    var t, n, r, i;
                    return "".concat(e.type, ":").concat(e.targetId, ":").concat(null != (t = e.size) ? t : sG, ":").concat(null != (n = e.format) ? n : sz, ":").concat(null != (r = e.version) ? r : "", ":").concat(null != (i = e.headShape) ? i : "", ":").concat(e.includeBackground ? "bg" : "", ":").concat(e.includeProfileFrame ? "frame" : "")
                },
                sW = nw({
                    data: (k = nw({
                        requestId: ny(),
                        state: new nE(eG({
                            type: "literal",
                            values: Array.isArray(C = ["Completed", "Pending", "Blocked", "Error", "InReview"]) ? C : [C]
                        }, t1(void 0))),
                        imageUrl: new nP({
                            type: "optional",
                            innerType: new nI({
                                type: "nullable",
                                innerType: ny()
                            })
                        })
                    }), new ng(eG({
                        type: "array",
                        element: k
                    }, t1(void 0))))
                }),
                sq = function(e) {
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
                sK = (_ = {
                    delay: 50,
                    maxSize: 100
                }, O = function(e) {
                    return eB(function() {
                        var t, n;
                        return eD(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return t = eq.Url.parse(eV().thumbnailsApi).getOrThrow().withPath("/v1/batch"), n = e.map(function(e) {
                                        var t, n;
                                        return eG({
                                            requestId: sV(e),
                                            type: e.type,
                                            targetId: e.targetId,
                                            size: null != (t = e.size) ? t : sG,
                                            format: null != (n = e.format) ? n : sz
                                        }, null != e.version ? {
                                            version: e.version
                                        } : {}, e.headShape ? {
                                            headShape: e.headShape
                                        } : {}, e.includeBackground ? {
                                            includeBackground: !0
                                        } : {}, e.includeProfileFrame && "AvatarHeadShot" === e.type ? {
                                            includeProfileFrame: !0
                                        } : {})
                                    }), [4, eW.post(t, n, sW, {
                                        credentials: "include",
                                        headers: {
                                            Accept: "application/json"
                                        },
                                        retry: eW.defaultBrowserRetryDelay
                                    })];
                                case 1:
                                    return [2, sq(r.sent().getOrThrow())]
                            }
                        })
                    })()
                }, N = function(e, t) {
                    var n;
                    return null != (n = e.get(sV(t))) ? n : {
                        state: "Error"
                    }
                }, o = _, l = O, u = o.delay, c = o.maxSize, d = [], f = sH(), h = function() {
                    var e = f.resolve,
                        t = f.reject,
                        n = d;
                    d = [], f = sH(), l(n).then(e).catch(t)
                }, R = function(e) {
                    0 === d.length && (s = setTimeout(h, u)), d.push(e);
                    var t = f.promise;
                    return null != c && d.length >= c && (clearTimeout(s), h()), t
                }, function(e) {
                    return R(e).then(function(t) {
                        return N(t, e)
                    })
                }),
                sZ = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                        n = Number.parseInt(e, t);
                    return Number.isNaN(n) ? null : n
                },
                sY = function() {
                    if ("u" < typeof document) return {
                        batchSize: 100,
                        waitMs: 1e3
                    };
                    var e, t, n, r, i, a = document.getElementsByName("performance")[0],
                        o = sZ(null != (e = null == a ? void 0 : a.getAttribute("data-ui-performance-metrics-batch-size")) ? e : ""),
                        l = tS((null != (t = null == a ? void 0 : a.getAttribute("data-ui-performance-metrics-batch-wait-time")) ? t : "").split(":"), 3),
                        s = l[0],
                        u = l[1],
                        c = l[2],
                        d = ((null != (n = sZ(null != s ? s : "")) ? n : 0) * 3600 + (null != (r = sZ(null != u ? u : "")) ? r : 0) * 60 + (null != (i = sZ(null != c ? c : "")) ? i : 0)) * 1e3;
                    return {
                        batchSize: null != o ? o : 100,
                        waitMs: 0 === d ? 1e3 : d
                    }
                },
                sJ = [],
                sX = !1,
                s$ = function() {
                    if (sX = !1, 0 !== sJ.length) {
                        var e = sJ;
                        sJ = [], eW.postUntyped(eq.Url.parse("".concat(eV().beaconApi, "/v1/measurements")).getOrThrow(), e, {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e3)
                        })
                    }
                },
                sQ = function(e, t) {
                    var n = nN(t);
                    sJ.push({
                        metricName: e,
                        jsonData: n.isOk() ? n.value : "{}"
                    });
                    var r = sY(),
                        i = r.batchSize,
                        a = r.waitMs;
                    sJ.length >= i ? s$() : sX || (sX = !0, setTimeout(s$, a))
                },
                s0 = function(e) {
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
                        p = (0, eM.useRef)(Date.now()),
                        m = (0, eM.useRef)(0),
                        v = (0, eM.useRef)(!1),
                        y = null != s ? s : (null == r ? void 0 : r.toLowerCase()) === "avatarheadshot",
                        g = (0, eF.useQuery)({
                            queryKey: ["thumbnail-2d", r, n, i, a, o, l, y, u],
                            staleTime: 1 / 0,
                            retry: sF,
                            queryFn: function() {
                                return eB(function() {
                                    var e;
                                    return eD(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, sK({
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
                                                if ("Pending" === (e = t.sent()).state) throw m.current += 1, sj;
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
                    (0, eM.useEffect)(function() {
                        p.current = Date.now(), m.current = 0, v.current = !1
                    }, [r, n, i, a, o, l, y, u]), (0, eM.useEffect)(function() {
                        if (!v.current) {
                            var e = "".concat(r, "_2d");
                            if (b) {
                                if (v.current = !0, sQ("ThumbnailStatusCountWebapp", {
                                        Status: b.state,
                                        ThumbnailType: e
                                    }), "Completed" === b.state) {
                                    var t = m.current;
                                    sQ("ThumbnailLoadDurationWebapp", {
                                        Status: "Success",
                                        ThumbnailType: e,
                                        Value: String(Date.now() - p.current)
                                    }), sQ(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                                        ThumbnailType: e
                                    } : {
                                        ThumbnailType: e,
                                        Value: String(t)
                                    })
                                }
                            } else w && E === sj && (v.current = !0, sQ("ThumbnailTimeoutWebapp", {
                                ThumbnailType: e
                            }))
                        }
                    }, [b, w, E, r]);
                    var S = null != (t = null == b ? void 0 : b.imageUrl) ? t : null,
                        x = (null == b ? void 0 : b.state) === "Blocked" ? "icon-blocked" : (null == b ? void 0 : b.state) === "InReview" ? "icon-in-review" : (null == b ? void 0 : b.state) === "Error" ? "icon-broken" : w ? E === sj ? "icon-pending" : "icon-broken" : "",
                        A = null != P ? P : I,
                        T = ["thumbnail-2d-container float-left overflow-hidden", void 0 === f ? "" : f, x, A && "thumbnail-2d-loading"].filter(Boolean).join(" ");
                    return (0, ra.jsxs)("span", {
                        className: T,
                        children: [A && (0, ra.jsx)(sM, {
                            variant: "Rectangle",
                            width: "100%",
                            height: "100%"
                        }), null != S && (0, ra.jsx)("img", {
                            className: ["size-full", void 0 === d ? "" : d].filter(Boolean).join(" "),
                            src: S,
                            alt: void 0 === c ? "" : c,
                            onLoad: h
                        })]
                    })
                },
                s1 = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.price.toString()) ? t : ""
                },
                s2 = function(e) {
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
                        d = (0, eM.useRef)(void 0);
                    null != d.current || (d.current = (0, sB.createItemPurchase)());
                    var f = tS(d.current, 2),
                        h = f[0],
                        p = f[1],
                        m = (0, eM.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), p.start()
                        }, [p]);
                    return (0, ra.jsxs)(ej().Fragment, {
                        children: [(0, ra.jsx)(sL, {
                            buttonWidth: r,
                            buttonClassName: i,
                            iconClassName: n,
                            hideButtonText: a,
                            buttonContent: s1(s),
                            onClick: o ? void 0 : m,
                            redirectUrl: o
                        }), (0, ra.jsx)(h, {
                            translate: u,
                            productId: s.productId,
                            expectedPrice: s.price,
                            thumbnail: (0, ra.jsx)(s0, {
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
                s3 = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.iconClassName,
                        i = void 0 === r ? "icon icon-regular-robux size-400" : r,
                        a = e.buttonWidth,
                        o = void 0 === a ? rM : a,
                        l = e.buttonClassName,
                        s = void 0 === l ? "game-play-button-purchase-lg" : l,
                        u = e.refetchPlayabilityStatus,
                        c = e.hideButtonText,
                        d = void 0 !== c && c,
                        f = e.redirectPurchaseUrl,
                        h = e.playabilityStatus,
                        p = e.showDefaultPurchaseText,
                        m = e.pageContext,
                        v = ay(),
                        y = sR(t, n),
                        g = y.productInfo,
                        b = y.productDetails;
                    return y.isLoading ? (0, ra.jsx)(aw, {
                        buttonClassName: s,
                        buttonWidth: o
                    }) : "Fiat" == (h === e6.FiatPurchaseRequired && (null == b ? void 0 : b.fiatPurchaseData) ? "Fiat" : "Robux") ? (0, ra.jsx)(sU, {
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
                    }) : (0, ra.jsx)(s2, {
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
                s5 = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        i = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.appsFlyerReferralProperties,
                        s = ay(),
                        u = (0, eM.useCallback)(function(e) {
                            e.preventDefault(), e.stopPropagation(), n8(n, t);
                            var s = rr((null == o ? void 0 : o.launchData) != null ? String(o.launchData) : void 0);
                            n1(n, r, i, a, o, s, l, "DemoPlayButtonClick")
                        }, [t, n, r, i, a, o, l]),
                        c = s(e9.PlayDemo) || "Play Demo";
                    return (0, ra.jsx)("button", {
                        type: "button",
                        "data-testid": "demo-play-button",
                        className: "btn-control-lg btn-full-width demo-play-button",
                        onClick: u,
                        children: c
                    })
                },
                s4 = {
                    create: function(e) {
                        var t = e.userId;
                        return eB(function() {
                            return eD(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        var n;
                                        return [4, (n = "wasm-hash-v1:".concat(t), eB(function() {
                                            var e, t;
                                            return eD(this, function(r) {
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
                        return eB(function() {
                            return eD(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, s4.create(t)];
                                    case 1:
                                        return [2, e === n.sent()]
                                }
                            })
                        })()
                    }
                },
                s6 = new Map([
                    ["3f", s4]
                ]),
                s8 = as("PlayButton"),
                s7 = function() {
                    s8("PlayOnWebImpression")
                },
                s9 = function() {
                    s8("PlayOnWebClick")
                },
                ue = function(e) {
                    var t = e.placeId,
                        n = e.rootPlaceId,
                        r = e.universeId,
                        i = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.wasmJoinId,
                        s = e.joinData,
                        u = void 0 === s ? rr((null == o ? void 0 : o.launchData) != null ? String(o.launchData) : void 0) : s,
                        c = e.eventContext;
                    s9();
                    var d = ri(t, r, o, u, c),
                        f = d.joinAttemptId,
                        h = d.joinAttemptOrigin,
                        p = new URL("".concat(eV().playWebsite, "/games/start?placeId=").concat(t));
                    u.launchData && p.searchParams.set("launchData", u.launchData), u.eventId && p.searchParams.set("eventId", u.eventId), a && t === n ? p.searchParams.set("gameInstanceId", a) : i && p.searchParams.set("privateServerLinkCode", i), f && p.searchParams.set("joinAttemptId", f), null != h && p.searchParams.set("joinAttemptOrigin", String(h)), l && p.searchParams.set("wasmJoinId", l), window.open(p.toString(), "_blank", "noopener")
                },
                ut = function(e, t) {
                    var n = null == tC ? void 0 : tC.IntersectionObserver;
                    if ("function" != typeof n) return function() {};
                    var r = e.element,
                        i = ts(e, ["element"]);
                    try {
                        var a = new n(function(e, n) {
                            var r, i = tS(e, 1)[0];
                            t(null != (r = null == i ? void 0 : i.isIntersecting) && r, n)
                        }, i);
                        return a.observe(r),
                            function() {
                                a.disconnect()
                            }
                    } catch (e) {}
                    return function() {}
                },
                un = function(e, t, n) {
                    var r = (0, eM.useRef)(!1);
                    (0, eM.useEffect)(function() {
                        r.current = !1
                    }, [t]), (0, eM.useEffect)(function() {
                        if (n && e.current && !r.current) return ut({
                            element: e.current,
                            threshold: .5
                        }, function(e, t) {
                            e && !r.current && (r.current = !0, s7(), t.disconnect())
                        })
                    }, [e, t, n])
                },
                ur = function(e) {
                    var t = e.placeId,
                        n = e.rootPlaceId,
                        r = e.universeId,
                        i = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        o = e.eventProperties,
                        l = e.wasmJoinId,
                        s = e.playOnWebVariant,
                        u = am("Feature.ExperienceDetails"),
                        c = (0, eM.useRef)(null),
                        d = !!l;
                    un(c, r, d);
                    var f = (0, eM.useCallback)(function(e) {
                        e.preventDefault(), e.stopPropagation(), ue({
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
                    var h = u.dynamic(e9.PlayOnWeb, void 0, "Play in browser"),
                        p = s === rH;
                    return (0, ra.jsxs)("div", {
                        className: "play-on-web-button-container",
                        children: [(0, ra.jsx)(rU, {
                            ref: c,
                            "data-testid": "play-on-web-button",
                            variant: p ? "Emphasis" : "Standard",
                            size: "Large",
                            style: rF,
                            className: rl()("btn-full-width play-on-web-button", p ? "game-play-button-lg" : "btn-control-lg"),
                            "aria-label": p ? h : void 0,
                            onClick: f,
                            children: p ? (0, ra.jsx)("span", {
                                className: "icon icon-filled-play-large size-700"
                            }) : h
                        }), (0, ra.jsx)("span", {
                            "data-testid": "play-on-web-beta-notice",
                            className: "text-caption-medium content-muted play-on-web-beta-notice",
                            children: u.dynamic(e9.PlayOnWebBetaNotice, void 0, "Play in browser is in beta")
                        })]
                    })
                },
                ui = function(e) {
                    var t = e.activeUpsell,
                        n = e.closeUpsell,
                        r = e.creatorId,
                        i = ay(),
                        a = i("Action.Cancel") || "Cancel",
                        o = i("Action.OK") || "OK",
                        l = i("Action.Close") || "Close";
                    return (0, ra.jsxs)(ej().Fragment, {
                        children: [(0, ra.jsx)(sA, {
                            titleText: i("Action.Settings") || "Settings",
                            bodyText: i("Message.UpdateSettingsToPlaytest") || "Update your settings to join this Playtest.",
                            primaryButtonText: i("Action.OpenSettings") || "Open Settings",
                            secondaryButtonText: a,
                            closeLabelText: l,
                            onPrimaryButtonClick: function() {
                                n(), rt()
                            },
                            onSecondaryButtonClick: n,
                            isModalOpen: "settings" === t,
                            onCloseModal: n,
                            hasCloseAffordance: !1,
                            orientButtonsVertically: !0
                        }), (0, ra.jsx)(sA, {
                            titleText: i("TrustedFriend.Label.AddTrustedFriend") || "Add trusted friend",
                            bodyText: i("Message.TrustedFriendsRequiredForPlaytest") || "Add this creator as a trusted friend to join the Playtest.",
                            primaryButtonText: void 0 !== r ? i("Action.Add") || "Add" : void 0,
                            secondaryButtonText: void 0 !== r ? a : o,
                            closeLabelText: l,
                            onPrimaryButtonClick: void 0 !== r ? function() {
                                n(), rn(r)
                            } : void 0,
                            onSecondaryButtonClick: n,
                            isModalOpen: "trustedFriends" === t,
                            onCloseModal: n,
                            hasCloseAffordance: !1,
                            orientButtonsVertically: !0
                        })]
                    })
                },
                ua = function(e) {
                    var t = e.creatorId,
                        n = tS((0, eM.useState)(null), 2),
                        r = n[0],
                        i = n[1],
                        a = (0, eM.useCallback)(function() {
                            i(null)
                        }, []);
                    return {
                        openUpdatePlaytestSettingsUpsell: (0, eM.useCallback)(function() {
                            i("settings")
                        }, []),
                        openTrustedFriendsPlaytestUpsell: (0, eM.useCallback)(function() {
                            i("trustedFriends")
                        }, []),
                        playtestUpsellModals: (0, ra.jsx)(ui, {
                            activeUpsell: r,
                            closeUpsell: a,
                            creatorId: t
                        })
                    }
                },
                uo = {},
                ul = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        i = e.creatorId,
                        a = e.privatePlaytestInfo,
                        o = e.refetchPlayabilityStatus,
                        l = e.pageContext,
                        s = e.eventProperties,
                        u = void 0 === s ? uo : s,
                        c = e.appsFlyerReferralProperties,
                        d = void 0 === c ? uo : c,
                        f = ay(),
                        h = ua({
                            creatorId: i
                        }),
                        p = h.openUpdatePlaytestSettingsUpsell,
                        m = h.openTrustedFriendsPlaytestUpsell,
                        v = h.playtestUpsellModals,
                        y = (0, eM.useCallback)(function() {
                            var e = rr(null != u.launchData ? String(u.launchData) : void 0);
                            n1(n, r, void 0, void 0, u, e, d, "PlaytestPlayButtonClick", !0)
                        }, [d, u, n, r]),
                        g = (0, eM.useCallback)(function(e) {
                            if (e.preventDefault(), e.stopPropagation(), a.isPlayable) return void y();
                            var n = a.playabilityStatus,
                                r = re(n);
                            if (void 0 !== n && void 0 !== r) {
                                if (r === nK) {
                                    n9(t, tn.ageCheckUpsellName, n, l), eB(function() {
                                        return eD(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return e.trys.push([0, 2, , 3]), [4, n6({
                                                        context: tr,
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
                                if (r === nZ) {
                                    p(), n9(t, tn.updatePlaytestSettingsUpsellName, n, l);
                                    return
                                }
                                m(), n9(t, tn.trustedFriendRequiredUpsellName, n, l)
                            }
                        }, [y, m, p, l, a, o, t]),
                        b = f(e9.Playtest) || "Preview";
                    return (0, ra.jsxs)(ej().Fragment, {
                        children: [(0, ra.jsx)("button", {
                            type: "button",
                            "data-testid": "playtest-play-button",
                            className: "btn-control-lg btn-full-width playtest-play-button",
                            onClick: g,
                            children: b
                        }), v]
                    })
                },
                us = function(e, t) {
                    if (void 0 === t) return null;
                    var n, r = e.find(function(e) {
                        var n = e.isEnabled,
                            r = e.primaryStatuses;
                        return n && r.has(t)
                    });
                    return null != (n = null == r ? void 0 : r.render()) ? n : null
                },
                uu = function(e) {
                    var t = e.primaryButton,
                        n = e.secondaryButton,
                        r = e.isPrimaryButtonLoading;
                    return n ? (0, ra.jsxs)("div", {
                        className: "stacked-play-buttons-container",
                        children: [(0, ra.jsx)("div", {
                            className: "stacked-play-button-primary",
                            "data-testid": "stacked-play-button-primary",
                            children: t
                        }), !(void 0 !== r && r) && n]
                    }) : t
                },
                uc = function(e) {
                    var t = e.iconClassName,
                        n = e.buttonWidth,
                        r = e.buttonClassName,
                        i = e.hideButtonText,
                        a = ay();
                    return (0, ra.jsxs)(rU, {
                        "data-testid": "play-unplayable-button",
                        variant: "Utility",
                        style: rF,
                        className: rl()(rj(void 0 === n ? rM : n), "game-play-button-unplayable", void 0 === r ? "game-play-button-unplayable-lg" : r),
                        isDisabled: !0,
                        onClick: function() {
                            return null
                        },
                        children: [(0, ra.jsx)("span", {
                            className: void 0 === t ? "icon icon-filled-circle-slash size-400" : t
                        }), !(void 0 !== i && i) && (0, ra.jsx)("span", {
                            className: "btn-text",
                            children: a(e9.Unplayable)
                        })]
                    })
                },
                ud = function(e) {
                    var t = e.treatmentData,
                        n = e.isModalOpen,
                        r = e.onConfirm,
                        i = e.onDismiss,
                        a = ay();
                    return (0, ra.jsx)(sA, {
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
                uf = function(e) {
                    return !!e && "string" == typeof e.titleText && e.titleText.length > 0 && "string" == typeof e.bodyText && e.bodyText.length > 0 && "string" == typeof e.primaryActionText && e.primaryActionText.length > 0 && "string" == typeof e.secondaryActionText && e.secondaryActionText.length > 0
                },
                uh = function(e, t, n) {
                    var r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                        i = tS((0, eM.useState)(!1), 2),
                        a = i[0],
                        o = i[1],
                        l = tl(e, !r),
                        s = l.playabilityStatus,
                        u = l.playableUxTreatment,
                        c = l.isFetchingPlayability,
                        d = (0, eM.useCallback)(function(t) {
                            n9(e, t, e6.Playable, n)
                        }, [e, n]);
                    return {
                        doGameLaunchWithPlayableUxTreatment: (0, eM.useCallback)(function() {
                            if (r) return void t();
                            if (c) {
                                t(), eY(tt.PlayableUxTreatmentPlayabilityStatusStillLoading), d(tn.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (s !== e6.Playable || !(null == u ? void 0 : u.treatment)) return void t();
                            if ("reconfirmLaunchModal" !== u.treatment) {
                                t(), eY(tt.PlayableUxTreatmentUnknownTreatment), d(tn.gameLaunchFallbackUpsellName);
                                return
                            }
                            if (!uf(u.data)) {
                                t(), eY(tt.PlayableUxTreatmentMalformedData), d(tn.gameLaunchFallbackUpsellName);
                                return
                            }
                            o(!0), d(tn.reconfirmLaunchModalUpsellName)
                        }, [c, s, u, r, t, d]),
                        playableUxTreatmentModal: (0, eM.useMemo)(function() {
                            return a && u && uf(u.data) ? (0, ra.jsx)(ud, {
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
            (L = eg || (eg = {})).ItemImpressions = "itemImpressions", L.ItemAction = "itemAction", (U = eb || (eb = {})).Games = "Games", U.Home = "Home", U.SearchLanding = "SearchLanding", U.Spotlight = "Spotlight", U.UserProfile = "UserProfile", U.GameDetail = "GameDetail", U.SongList = "SongList", U.SearchPage = "SearchPage", U.PreAuthLanding = "PreAuthLanding", (B = ew || (ew = {})).HomePageSessionInfo = "homePageSessionInfo", B.DiscoverPageSessionInfo = "discoverPageSessionInfo", B.GameSearchSessionInfo = "gameSearchSessionInfo", B.SpotlightPageSessionInfo = "spotlightPageSessionInfo", B.PreAuthLandingPageSessionInfo = "preAuthLandingPageSessionInfo", (D = eE || (eE = {})).ContentType = "contentType", D.Context = "context", D.CollectionId = "collectionId", D.CollectionPosition = "collectionPosition", D.CollectionComponentType = "collectionComponentType", D.InteractionUuid = "interactionUuid", (M = eP || (eP = {})).User = "User", M.Game = "Game", M.Song = "Song", M.Look = "Look", M.Description = "Description", (j = eI || (eI = {})).Online = "online", j.InGame = "inGame", j.InStudio = "inStudio", j.Offline = "offline", (F = eS || (eS = {})).Friend = "friend", F.NotFriend = "notFriend", (H = ex || (ex = {})).ItemIds = "itemIds", H.ItemPositions = "itemPositions", H.RowNumbers = "rowNumbers", H.FeedRowNumbers = "feedRowNumbers", H.PositionsInRow = "positionsInRow", H.PositionsInTopic = "positionsInTopic", H.TotalNumberOfItems = "totalNumberOfItems", (G = eA || (eA = {})).Presences = "presences", G.PresenceUniverseIds = "presenceUniverseIds", G.FriendStatuses = "friendStatuses", G.SourceCarousel = "sourceCarousel", (z = eT || (eT = {})).ItemId = "itemId", z.ItemPosition = "itemPosition", z.ItemComponentType = "itemComponentType", z.RowNumber = "rowNumber", z.FeedRowNumber = "feedRowNumber", z.PositionInRow = "positionInRow", z.PositionInTopic = "positionInTopic", z.TotalNumberOfItems = "totalNumberOfItems", z.ActionType = "actionType", (V = eC || (eC = {})).Presence = "presence", V.PresenceUniverseId = "presenceUniverseId", V.FriendStatus = "friendStatus", V.SourceCarousel = "sourceCarousel";
            var up = window.Roblox["core-scripts"].util.currentBrowser,
                um = "Website.LandingPage",
                uv = function() {
                    var e = (0, tv.getDeviceMeta)();
                    return (null == e ? void 0 : e.isAndroidDevice) === !0 && e.isPhone && !e.isInApp && (0, up.currentBrowser)() === up.Browser.Chrome
                },
                uy = function() {
                    return eB(function() {
                        return eD(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return e.trys.push([0, 2, , 3]), [4, rD().getAllValuesForLayer(um)];
                                case 1:
                                    var t;
                                    return [2, !0 === (t = e.sent().IsDownloadPageHidden) || "string" == typeof t && "true" === t.trim().toLowerCase()];
                                case 2:
                                    return e.sent(), eY(tt.MobileWebSignupLayerReadFailed), [2, !1];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                ug = function(e, t, n) {
                    var r = e === e6.GuestProhibited && t === eb.GameDetail && !1 === n && uv(),
                        i = (0, eF.useQuery)({
                            queryKey: ["mobileWebSignupForPlay"],
                            queryFn: uy,
                            enabled: r,
                            staleTime: 1 / 0,
                            retry: !1
                        }).data,
                        a = r && void 0 !== i;
                    return {
                        isMobileWebSignupEnabled: r && null != i && i,
                        logMobileWebSignupExposure: (0, eM.useCallback)(function() {
                            if (a) try {
                                rD().logLayerExposure(um)
                            } catch (e) {
                                eY(tt.MobileWebSignupExposureLogFailed)
                            }
                        }, [a])
                    }
                },
                ub = function() {
                    var e, t = null == (e = rp()) ? void 0 : e.id,
                        n = (0, eF.useQuery)({
                            queryKey: ["wasmJoinId", t],
                            queryFn: function() {
                                var e;
                                return null == t ? Promise.resolve(null) : (e = {
                                    userId: t
                                }, eB(function() {
                                    var t, n, r;
                                    return eD(this, function(i) {
                                        switch (i.label) {
                                            case 0:
                                                if (!(t = s6.get("3f"))) throw Error("No scheme registered for CURRENT_SCHEME_ID 3f");
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
                uw = function(e) {
                    var t = e.universeId,
                        n = e.buttonClassName,
                        r = e.playabilityStatus,
                        i = e.pageContext;
                    return (0, ra.jsx)(ag, {
                        onButtonClick: function(e) {
                            return eB(function() {
                                return eD(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            e.preventDefault(), e.stopPropagation(), n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, , 4]), n9(t, tn.ageCheckUpsellName, r, i), [4, n6({
                                                context: tr,
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
                uE = {},
                uP = new Set([e6.PurchaseRequired, e6.FiatPurchaseRequired, e6.FiatPurchaseDeviceRestricted, e6.ContextualPlayabilityRegionalAvailability]),
                uI = new Set(Object.values(e6).filter(function(e) {
                    return e !== e6.GuestProhibited
                })),
                uS = new Set([e6.Playable]),
                ux = function(e) {
                    var t = e.universeId,
                        n = e.placeId,
                        r = e.rootPlaceId,
                        i = e.privateServerLinkCode,
                        a = e.gameInstanceId,
                        o = e.status,
                        l = e.eventProperties,
                        s = void 0 === l ? uE : l,
                        u = e.appsFlyerReferralProperties,
                        c = void 0 === u ? uE : u,
                        d = e.iconClassName,
                        f = e.buttonWidth,
                        h = void 0 === f ? rM : f,
                        p = e.buttonClassName,
                        m = void 0 === p ? "game-play-button-lg" : p,
                        v = e.disableLoadingState,
                        y = e.skipPlayabilityFetch,
                        g = e.buttonText,
                        b = void 0 === g ? void 0 : g,
                        w = e.hideIcon,
                        E = e.analyticsCallback,
                        P = void 0 === E ? void 0 : E,
                        I = e.pageContext,
                        S = tS((0, eM.useState)(void 0), 2),
                        x = S[0],
                        A = S[1],
                        T = tS((0, eM.useState)(void 0), 2),
                        C = T[0],
                        k = T[1],
                        _ = tS((0, eM.useState)(void 0), 2),
                        O = _[0],
                        N = _[1],
                        R = tS((0, eM.useState)(void 0), 2),
                        L = R[0],
                        U = R[1],
                        B = tS((0, eM.useState)(void 0), 2),
                        D = B[0],
                        M = B[1],
                        j = tS((0, eM.useState)(void 0), 2),
                        F = j[0],
                        H = j[1],
                        G = tS((0, eM.useState)(void 0), 2),
                        z = G[0],
                        V = G[1],
                        W = tS((0, eM.useState)(void 0), 2),
                        q = W[0],
                        K = W[1],
                        Z = (0, eF.useQuery)({
                            queryKey: ["tryGetIsVNGLandingRedirectEnabled"],
                            queryFn: ty.tryGetIsVNGLandingRedirectEnabled,
                            retry: !1
                        }).data;
                    (0, eM.useEffect)(function() {
                        eB(function() {
                            var e, n;
                            return eD(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 2, , 3]), [4, eB(function() {
                                            var e, n, r, i, a, o, l, s, u, c, d, f, h, p, m, v, y;
                                            return eD(this, function(g) {
                                                switch (g.label) {
                                                    case 0:
                                                        if (e = {
                                                                isUniverseEnabledForVoice: !1,
                                                                isUniverseEnabledForAvatarVideo: !1
                                                            }, void 0 === rp()) return [2, {
                                                            elegibleToSeeVoiceUpsell: !1,
                                                            universePlaceVoiceEnabledSettings: e,
                                                            showAgeVerificationOverlay: !1,
                                                            showVoiceOptInOverlay: !1,
                                                            showAvatarVideoOptInOverlay: !1,
                                                            requireExplicitVoiceConsent: !0,
                                                            useCameraU13Design: !1,
                                                            useVoiceUpsellV2Design: !1
                                                        }];
                                                        return [4, e1()];
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
                                                        return [4, (b = t, eB(function() {
                                                            var e;
                                                            return eD(this, function(t) {
                                                                switch (t.label) {
                                                                    case 0:
                                                                        return e = {
                                                                            withCredentials: !0,
                                                                            url: "".concat(eV().voiceApi, "/v1/settings/verify/show-age-verification-overlay/").concat(b)
                                                                        }, [4, eJ.get(e)];
                                                                    case 1:
                                                                        return [2, t.sent().data]
                                                                }
                                                            })
                                                        })())];
                                                    case 2:
                                                        if (d = (c = g.sent()).showAgeVerificationOverlay, f = c.showVoiceOptInOverlay, h = c.showAvatarVideoOptInOverlay, p = c.elegibleToSeeVoiceUpsell, m = c.universePlaceVoiceEnabledSettings, v = !1, y = !1, !rD().getAllValuesForLayer) return [3, 5];
                                                        return [4, rD().getAllValuesForLayer("Voice.AvatarChat.Upsell")];
                                                    case 3:
                                                        return v = Boolean.apply(void 0, [g.sent().ShouldShowUpsell]), [4, rD().getAllValuesForLayer("Voice.AvatarChat.U13Upsell")];
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
                                        return r.sent(), eY(tt.PlayButtonShowIdentificationError), N(!1), A(!1), k(!1), U(!1), M(!1), H(!0), V(!1), K(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []);
                    var Y = (0, eM.useCallback)(function() {
                            n8(n, t);
                            var e = rr(null != s.launchData ? String(s.launchData) : void 0);
                            n1(n, r, i, a, s, e, c)
                        }, [n, t, s, c, r, i, a]),
                        J = uh(t, Y, I, void 0 !== y && y),
                        X = J.doGameLaunchWithPlayableUxTreatment,
                        $ = J.playableUxTreatmentModal,
                        Q = ug(o, I, Z),
                        ee = Q.isMobileWebSignupEnabled,
                        et = Q.logMobileWebSignupExposure;
                    return void 0 !== C || void 0 !== v && v ? (0, ra.jsxs)(ej().Fragment, {
                        children: [(0, ra.jsxs)(rU, {
                            "data-testid": "play-button",
                            variant: "Emphasis",
                            style: rF,
                            className: rl()(rj(h), m),
                            onClick: function(e) {
                                return eB(function() {
                                    var t;
                                    return eD(this, function(r) {
                                        var i, a, l, s;
                                        switch (r.label) {
                                            case 0:
                                                if (e.preventDefault(), e.stopPropagation(), o !== e6.Playable) return [3, 7];
                                                if (O && x && rD().getAllValuesForLayer("SocialVoice.VoiceUpsell").then(function() {
                                                        rD().logLayerExposure("SocialVoice.VoiceUpsell")
                                                    }).catch(function() {
                                                        console.error("error logging exposure event in play-join")
                                                    }), !C) return [3, 2];
                                                return [4, eB(function() {
                                                    var e, t;
                                                    return eD(this, function(n) {
                                                        try {
                                                            return t = (e = n4()) ? e.startVerificationFlow() : tg("OpenIdentityVerificationModal", function(e) {
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
                                                return (t = tS.apply(void 0, [r.sent(), 2]))[0], t[1] && k(!1), [3, 6];
                                            case 2:
                                                if (!L) return [3, 4];
                                                return [4, (i = null == F || F, a = null != q && q, eB(function() {
                                                    var e, t;
                                                    return eD(this, function(n) {
                                                        try {
                                                            return t = (e = n4()) ? e.showVoiceOptInOverlay(i, a) : tg("OpenVoiceOptInOverlay", function(e) {
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
                                                return [4, (l = null == F || F, s = null == z || z, eB(function() {
                                                    var e, t;
                                                    return eD(this, function(n) {
                                                        try {
                                                            return t = (e = n4()) ? e.showAvatarVideoOptInOverlay(l, s) : tg("OpenCameraOptInOverlay", function(e) {
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
                                                o === e6.GuestProhibited && (Z ? ty.navigateToLoginWithRedirect() : (et(), ee ? n5(n) : n2(n, c))), r.label = 8;
                                            case 8:
                                                return P && P(), [2]
                                        }
                                    })
                                })()
                            },
                            children: [!(void 0 !== w && w) && (0, ra.jsx)("span", {
                                className: void 0 === d ? "icon icon-filled-play-large size-700" : d
                            }), b && (0, ra.jsx)("span", {
                                className: "play-button-text",
                                children: b
                            })]
                        }), (0, ra.jsx)("div", {
                            id: "id-verification-container"
                        }), $]
                    }) : (0, ra.jsx)(aw, {
                        buttonClassName: m,
                        buttonWidth: h
                    })
                },
                uA = function(e, t) {
                    var n = t.playabilityStatus,
                        r = t.shouldShowVpcPlayButtonUpsells,
                        i = t.shouldShowNoticeAgreementIfPlayable,
                        a = t.unplayableDisplayText;
                    if (void 0 !== n) {
                        if (n === e6.Playable && i) return {
                            message: e(e7),
                            testId: "play-contextual-message"
                        };
                        if (a) return {
                            message: a,
                            testId: "play-server-message"
                        };
                        if (n !== e6.ContextualPlayabilityCoreGated && n7(n, r)) return {
                            message: e(Object.hasOwn(e8, n) ? e8[n] : e8[e6.UnplayableOtherReason]),
                            testId: "play-error"
                        }
                    }
                },
                uT = window.Roblox["core-scripts"].util.elementVisibility,
                uC = function(e, t) {
                    var n = t.universeId,
                        r = t.playabilityStatus,
                        i = t.pageContext,
                        a = t.attributionId,
                        o = t.contextualMessage,
                        l = (0, eM.useRef)(!1);
                    (0, eM.useEffect)(function() {
                        l.current = !1
                    }, [n, r, i, a, o]), (0, eM.useEffect)(function() {
                        if (e.current && !l.current && o) {
                            var t = null;
                            return t = (0, uT.observeVisibility)({
                                    element: e.current,
                                    threshold: .5
                                }, function(e) {
                                    e && !l.current && (l.current = !0, (0, td.sendEventWithTarget)("playButtonContextualMessageImpression", i, {
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

            function uk(e) {
                var t = new(eR()).Deferred;
                return eL.Hybrid.Game.launchGame(e, function() {
                    t.resolve(e)
                }), t
            }
            var u_ = {
                isJoinAttemptIdEnabled: !1,
                joinMultiplayerGame: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        n = {
                            requestType: eL.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                            placeId: e.placeId.toString(),
                            isPlayTogetherGame: t,
                            browserTrackerId: eL.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (n.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (n.joinAttemptOrigin = e.joinAttemptOrigin), uk(n)
                },
                followPlayerIntoGame: function(e) {
                    var t = {
                        requestType: eL.Hybrid.Game.LAUNCH_MODES.FOLLOW_USER,
                        userId: e.userId.toString(),
                        browserTrackerId: eL.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), uk(t)
                },
                joinGameInstance: function(e) {
                    var t = !0 === e.isPlayTogetherGame,
                        n = {
                            requestType: eL.Hybrid.Game.LAUNCH_MODES.GAME_INSTANCE,
                            placeId: e.placeId.toString(),
                            instanceId: e.gameId,
                            isPlayTogetherGame: t,
                            browserTrackerId: eL.Cookies.getBrowserTrackerId()
                        };
                    return e.joinAttemptId && (n.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (n.joinAttemptOrigin = e.joinAttemptOrigin), uk(n)
                },
                joinPrivateGame: function(e) {
                    var t = {
                        requestType: eL.Hybrid.Game.LAUNCH_MODES.PRIVATE_SERVER,
                        placeId: e.placeId.toString(),
                        accessCode: e.accessCode,
                        browserTrackerId: eL.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), uk(t)
                },
                playTogetherGame: function(e) {
                    var t = {
                        requestType: eL.Hybrid.Game.LAUNCH_MODES.SIMPLE_GAME,
                        placeId: e.placeId.toString(),
                        conversationId: e.conversationId.toString(),
                        browserTrackerId: eL.Cookies.getBrowserTrackerId()
                    };
                    return e.joinAttemptId && (t.joinAttemptId = e.joinAttemptId), e.joinAttemptOrigin && (t.joinAttemptOrigin = e.joinAttemptOrigin), uk(t)
                }
            };
            eR()(document).ready(function() {
                ek = new eL.TranslationResourceProvider().getTranslationResource("Feature.GameLaunchGuestMode")
            });
            var uO = {
                    restrictGuests: function(e) {
                        var t = new(eR()).Deferred;
                        return eL.CurrentUser.isAuthenticated ? t.resolve(e) : eL.Dialog.open({
                            titleText: ek.get("Heading.Dialog.SignUpOrLogin"),
                            bodyContent: ek.get("Description.Dialog.ConnectionsSignUpOrLogin"),
                            cssClass: "soli-modal",
                            acceptColor: eL.Dialog.green,
                            acceptText: ek.get("Action.Dialog.SignUp"),
                            declineText: ek.get("Action.Dialog.Login"),
                            onDecline: function() {
                                eL.FormEvents && eL.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_login");
                                var e = "/login?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search);
                                window.location.href = eL.Endpoints ? eL.Endpoints.getAbsoluteUrl(e) : e
                            },
                            onAccept: function() {
                                var e;
                                eL.FormEvents && eL.FormEvents.SendInteractionClick("gameDetails", "gameLaunch_signup"), e = "/CreateAccount?returnurl=" + encodeURIComponent(window.location.origin + window.location.pathname + window.location.search), window.location.href = eL.Endpoints ? eL.Endpoints.getAbsoluteUrl(e) : e
                            }
                        }), t
                    }
                },
                uN = window.CoreUtilities,
                uR = {
                    gameLaunchInterface: null,
                    gameLaunchLogger: null,
                    initialized: new Promise(function(e) {
                        e_ = e
                    })
                };

            function uL(e, t, n) {
                var r = e4(eG({}, e), {
                    joinAttemptId: null != t ? t : uN.uuidService.generateRandomUuid()
                });
                return n && (r.joinAttemptOrigin = n), r
            }

            function uU(e, t, n) {
                var r, i, a = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    o = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                    l = arguments.length > 5 && void 0 !== arguments[5] && arguments[5],
                    s = arguments.length > 6 && void 0 !== arguments[6] ? arguments[6] : "",
                    u = arguments.length > 7 && void 0 !== arguments[7] ? arguments[7] : "";
                a && o && (r = {
                    url: "".concat(eL.EnvironmentUrls.gameJoinApi, "/v1/team-create-preemptive"),
                    withCredentials: !0,
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json"
                    }
                }, i = {
                    gameJoinAttemptId: uN.uuidService.generateRandomUuid(),
                    placeId: e
                }, uN.httpService.post(r, i)), uR.gameLaunchInterface.editGameInStudio(e, t, n, a && l, s, u)
            }

            function uB(e, t, n, r, i, a, o, l) {
                var s = {
                    placeId: e,
                    launchData: null == a ? void 0 : a.launchData,
                    eventId: null == a ? void 0 : a.eventId,
                    isPlayTogetherGame: !0 === n,
                    referredByPlayerId: o
                };
                return !0 === l && (s.isEarlyTesting = "true"), uR.gameLaunchInterface.isJoinAttemptIdEnabled && (s = uL(s, r, i)), uO.restrictGuests(s).then(function(e) {
                    return uR.gameLaunchInterface.joinMultiplayerGame(e, null == a ? void 0 : a.getPlayOnWeb)
                })
            }
            eR().fn.bindGameLaunch = function() {
                return this.find(".VisitButtonPlayGLI").click(function() {
                    var e = eR()(this);
                    uB(e.attr("placeid"), e.data("is-membership-level-ok"))
                }), this.find(".VisitButtonEditGLI").click(function() {
                    var e = eR()(this);
                    uU(e.attr("placeid"), e.data("universeid"), !!e.data("allowupload"))
                }), this
            }, eR()(document).ready(function() {
                eR()("body").bindGameLaunch()
            }), Object.assign(uR, {
                authenticationChecker: uO,
                joinMultiplayerGame: uB,
                openStudio: function() {
                    uR.gameLaunchInterface.openStudio()
                },
                openPluginInStudio: function(e) {
                    uR.gameLaunchInterface.openPluginInStudio(e)
                },
                editGameInStudio: uU,
                followPlayerIntoGame: function(e, t, n) {
                    var r = {
                        userId: e
                    };
                    return uR.gameLaunchInterface.isJoinAttemptIdEnabled && (r = uL(r, t, n)), uO.restrictGuests(r).then(uR.gameLaunchInterface.followPlayerIntoGame)
                },
                joinGameInstance: function(e, t, n, r, i, a, o, l) {
                    var s = {
                        placeId: e,
                        gameId: t,
                        isPlayTogetherGame: !0 === r,
                        referredByPlayerId: o
                    };
                    return uR.gameLaunchInterface.isJoinAttemptIdEnabled && (s = uL(s, i, a)), uO.restrictGuests(s).then(function(e) {
                        return uR.gameLaunchInterface.joinGameInstance(e, l)
                    })
                },
                joinPrivateGame: function(e, t, n, r, i, a) {
                    return eB(function() {
                        var o;
                        return eD(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return [4, uR.initialized];
                                case 1:
                                    return l.sent(), o = {
                                        placeId: e,
                                        accessCode: t,
                                        linkCode: n
                                    }, uR.gameLaunchInterface.isJoinAttemptIdEnabled && (o = uL(o, r, i)), [2, uR.gameLaunchInterface.joinPrivateGame(o, a)]
                            }
                        })
                    })()
                },
                playTogetherGame: function(e, t, n, r) {
                    var i = {
                        placeId: e,
                        conversationId: t
                    };
                    return uR.gameLaunchInterface.isJoinAttemptIdEnabled && (i = uL(i, n, r)), uO.restrictGuests(i).then(uR.gameLaunchInterface.playTogetherGame)
                },
                setGameLaunchInterface: function(e) {
                    uR.gameLaunchInterface = e, e_()
                },
                setGameLaunchLogger: function(e) {
                    uR.gameLaunchLogger = e
                },
                tryAssetInStudio: function(e) {
                    uR.gameLaunchInterface.tryAssetInStudio(e)
                },
                isJoinAttemptIdEnabled: function() {
                    var e;
                    return null == (e = uR.gameLaunchInterface) ? void 0 : e.isJoinAttemptIdEnabled
                },
                startClientAttemptedEvent: "startClientAttempted",
                startClientFailedEvent: "startClientFailed",
                startClientSucceededEvent: "startClientSucceeded",
                beginInstallEvent: "beginInstall",
                successfulInstallEvent: "successfulInstall",
                manualDownloadEvent: "manualDownload"
            });
            var uD = function(e) {
                    var t, n = "".concat(e, "="),
                        r = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(n)
                        })) ? void 0 : t.slice(n.length);
                    return null == r ? null : {
                        name: e,
                        value: decodeURIComponent(r)
                    }
                },
                uM = function() {
                    var e = uD("RBXcb");
                    if (null == e || "" === e.value) return !1;
                    var t = e.value.split("&").find(function(e) {
                        return "GoogleAnalytics" === e.split("=")[0]
                    });
                    return "true" === (null == t ? void 0 : t.split("=")[1])
                },
                uj = {
                    lastContext: "unknown",
                    contextCategories: {
                        joinUser: "JoinUser"
                    }
                };

            function uF(e, t, n, r, i, a) {
                var o, l, s;
                null !== t && "" !== t && "unknown" !== t && (uj.lastContext = t), eL.EventStream.SendEvent(e, uj.lastContext, eG({
                    lType: "protocol",
                    pid: n,
                    refuid: r,
                    pg: (o = window.location.pathname.toLowerCase(), l = "profile", -1 !== (s = o.lastIndexOf(l)) && o.length === s + l.length ? l : 0 === o.indexOf("/develop") ? "develop" : 0 === o.indexOf("/discover") ? "games" : "gameDetail"),
                    joinAttemptId: i
                }, null != a && {
                    actionType: a
                }))
            }
            Object.assign(uj, {
                SendGamePlayIntent: function(e, t, n, r, i) {
                    uF("gamePlayIntent", e, t, n, r, i), eR()(document).trigger("playButton:gamePlayIntent")
                },
                SendDevelopIntent: function(e, t) {
                    uF("developIntent", e, t)
                },
                SendInstallBegin: function(e, t) {
                    uF("installBegin", e, t)
                },
                SendInstallSuccess: function(e, t) {
                    uF("installSuccess", e, t)
                },
                SendClientStartAttempt: function(e, t) {
                    uF("clientStartAttempt", e, t)
                },
                SendClientStartSuccessWeb: function(e, t) {
                    uF("clientStartSuccessWeb", e, t)
                },
                SendManualDownloadClick: function(e, t) {
                    uF("manualDownload", e, t)
                }
            });
            var uH = {
                    logToConsoleEnabled: !1,
                    logToGAEnabled: !0,
                    logToEphemeralCountersEnabled: !0
                },
                uG = {};
            uG[uR.startClientAttemptedEvent] = ["GameLaunchAttempt_<os>", "GameLaunchAttempt_<os>_<launchmethod>"], uG[uR.startClientSucceededEvent] = ["GameLaunchSuccessWeb_<os>", "GameLaunchSuccessWeb_<os>_<launchmethod>"];
            var uz = {};
            eL.GaEventSettings.gaLaunchAttemptAndLaunchSuccessEnabled && (uz[uR.startClientAttemptedEvent] = "Launch Attempt", uz[uR.startClientSucceededEvent] = "Launch Success"), uz[uR.beginInstallEvent] = "Install Begin", uz[uR.successfulInstallEvent] = "Install Success", uz[uR.manualDownloadEvent] = "Manual Download";
            var uV = {};

            function uW(e) {
                uH.logToConsoleEnabled && console.log(e)
            }

            function uq(e, t) {
                if (uH.logToEphemeralCountersEnabled) {
                    var n, r = eR()("#PlaceLauncherStatusPanel").data("os-name");
                    "Windows" === r && (r = "Win32");
                    var i = e;
                    i = (i = i.replace("<os>", r)).replace("<launchmethod>", t), (null == (n = window.EventTracker) ? void 0 : n.fireEvent) && window.EventTracker.fireEvent(i)
                }
            }

            function uK(e, t, n, r) {
                uM() && void 0 !== window.GoogleAnalyticsEvents && uH.logToGAEnabled && window.GoogleAnalyticsEvents.FireEvent && window.GoogleAnalyticsEvents.FireEvent([e, t, n, r])
            }

            function uZ(e, t) {
                uW("".concat(e.type, ": ").concat(JSON.stringify(t))), uG[e.type] && eR().each(uG[e.type], function(e, n) {
                    uq(n, t.launchMethod)
                }), uz[e.type] && uK(t.launchMethod, uz[e.type], t.params.launchMode, 0), uV[e.type] && uV[e.type](null, t.params.placeId)
            }
            uV[uR.startClientAttemptedEvent] = uj.SendClientStartAttempt, uV[uR.startClientSucceededEvent] = uj.SendClientStartSuccessWeb, uV[uR.beginInstallEvent] = uj.SendInstallBegin, uV[uR.successfulInstallEvent] = uj.SendInstallSuccess, uV[uR.manualDownloadEvent] = uj.SendManualDownloadClick, Object.assign(uH, {
                logToConsole: uW,
                logToEphemeralCounters: uq,
                logToGA: uK
            }), eR()(document).ready(function() {
                var e = [uR.startClientAttemptedEvent, uR.startClientFailedEvent, uR.startClientSucceededEvent, uR.beginInstallEvent, uR.successfulInstallEvent, uR.manualDownloadEvent];
                eR()(uR).on(e.join(" "), uZ)
            });
            var uY = function() {
                    var e = "click";
                    eR()("body").on(e, ".VisitButtonPlay, .VisitButtonPlayGLI", function() {
                        var e, t = eR()(this);
                        if ((t.hasClass("VisitButtonPlay") || t.hasClass("VisitButtonPlayGLI")) && (e = "PlayButton"), e) {
                            var n = eR()(this).attr("placeid"),
                                r = eL.UrlParser ? eL.UrlParser.getParameterValueByName("rbxp") : null;
                            uj.SendGamePlayIntent(e, n, r)
                        }
                    }), eR()("body").on(e, ".VisitButtonEdit, .VisitButtonEditGLI", function() {
                        var e = eR()(this).attr("placeid");
                        uj.SendDevelopIntent("Edit", e)
                    }), eR()("#rbx-running-games").on(e, ".rbx-game-server-item .rbx-game-server-join", function() {
                        var e = eR()(this).data("placeid");
                        e && uj.SendGamePlayIntent("JoinInstance", e)
                    }), eR()("#rbx-friends-running-games").on(e, ".rbx-friends-game-server-item .rbx-friends-game-server-join", function() {
                        var e = eR()(this).data("placeid");
                        e && uj.SendGamePlayIntent("JoinInstance", e)
                    }), eR()("#game-instances").on(e, "#rbx-vip-servers .rbx-vip-server-item .rbx-vip-server-join", function() {
                        var e = eR()(this).data("placeid");
                        e && uj.SendGamePlayIntent("PrivateServer", e)
                    })
                },
                uJ = window.Roblox["core-scripts"].react,
                uX = "u" > typeof window ? window.navigator.userAgent : "",
                u$ = /Mac OS X/i.test(uX),
                uQ = /Windows NT/i.test(uX);
            /Linux/i.test(uX) && /Android/i.test(uX);
            var u0 = /Android/i.test(uX),
                u1 = /iPhone|iPad|iPod/i.test(uX),
                u2 = function(e) {
                    var t = e.alt,
                        n = void 0 === t ? "App Icon" : t,
                        r = e.className,
                        i = e.title,
                        a = e.style;
                    return ej().createElement("div", {
                        className: "app-icon-bluebg app-icon-".concat(u$ ? "mac" : uQ ? "windows" : u1 ? "ios" : u0 ? "android" : "windows", " ").concat(void 0 === r ? "" : r),
                        role: "img",
                        "aria-label": n,
                        title: (void 0 === i ? "" : i) || n,
                        style: void 0 === a ? {} : a
                    })
                },
                u3 = ["Feature.GameLaunchGuestMode", "Common.VisitGame", "CommonUI.Controls", "Feature.ExperienceDetails", "Feature.DownloadLanding"],
                u5 = ["Common.VisitGame", "CommonUI.Controls"],
                u4 = {
                    Unknown: 1,
                    WindowsDirectDownload: 2,
                    WindowsStore: 3,
                    MacDirectDownload: 4,
                    AppleAppStore: 5,
                    GooglePlayStore: 6,
                    AmazonAppStore: 7
                },
                u6 = {
                    downloadPageHeader: "Heading.DownloadPage",
                    appStoreLinksHeader: "Heading.AppStoreLinks",
                    windowsDownloadLabel: "Action.DownloadWindowsApp",
                    windowsDownloadLink: (0, tu.getAbsoluteUrl)("/download/client?os=win"),
                    macDownloadLabel: "Action.DownloadMacApp",
                    macDownloadLink: (0, tu.getAbsoluteUrl)("/download/client?os=mac"),
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
                u8 = (eH(eO = {}, u4.WindowsDirectDownload, {
                    href: u6.windowsDownloadLink,
                    title: u6.windowsDownloadLabel,
                    name: "windows",
                    icon: "icon-filled-microsoft",
                    legacyIcon: "icon-logo-win",
                    isDirectDownload: !0
                }), eH(eO, u4.MacDirectDownload, {
                    href: u6.macDownloadLink,
                    title: u6.macDownloadLabel,
                    name: "mac",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !0
                }), eH(eO, u4.AmazonAppStore, {
                    href: u6.amazonStoreLink,
                    title: u6.androidAppDownloadLabel,
                    name: "amazonStore",
                    icon: "icon-filled-amazon",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), eH(eO, u4.GooglePlayStore, {
                    href: u6.googlePlayStoreLink,
                    title: u6.androidAppDownloadLabel,
                    name: "android",
                    icon: "icon-filled-android",
                    legacyIcon: "icon-logo-android",
                    isDirectDownload: !1
                }), eH(eO, u4.AppleAppStore, {
                    href: u6.appleAppStoreLink,
                    title: u6.iOSDownloadLabel,
                    name: "iOS",
                    icon: "icon-filled-apple",
                    legacyIcon: "icon-logo-apple",
                    isDirectDownload: !1
                }), eO),
                u7 = function(e) {
                    var t, n = e.translate;
                    return (0, ra.jsxs)(ej().Fragment, {
                        children: [(0, ra.jsxs)("div", {
                            className: "flex flex-col gap-small",
                            children: [(0, ra.jsx)("h3", {
                                className: "text-label-large content-emphasis padding-none",
                                children: n("Heading.MobileAppDownloadOption")
                            }), (0, ra.jsx)("p", {
                                className: "text-body-medium",
                                children: n("Label.MobileAppQrCode")
                            })]
                        }), (0, ra.jsx)("div", {
                            className: "flex grow justify-center items-center bg-shift-100 radius-medium padding-x-large",
                            children: (0, ra.jsx)("div", {
                                className: "radius-medium padding-small bg-[white]",
                                children: (0, ra.jsx)("img", {
                                    className: "size-2100",
                                    src: "string" == typeof(t = "https://images.rbxcdn.com/6674b8e189bf79c6.png") ? t : t.src,
                                    alt: ""
                                })
                            })
                        })]
                    })
                },
                u9 = function() {
                    function e(t, n) {
                        tD(this, e), eH(this, "url", void 0), eH(this, "searchParams", void 0), this.url = t, this.searchParams = n
                    }
                    return nx(e, [{
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
                ce = function(e) {
                    return rs(new URLSearchParams(e))
                },
                ct = function(e) {
                    return Array.isArray(e)
                },
                cn = function(e) {
                    return String(e)
                },
                cr = ["__proto__", "prototype", "constructor"],
                ci = function(e) {
                    return ce(tK(e.entries()).filter(function(e) {
                        var t = tS(e, 2),
                            n = t[0],
                            r = t[1];
                        return !cr.includes(n) && !cr.includes(r)
                    }))
                },
                ca = function() {
                    function e(t) {
                        tD(this, e), eH(this, "searchParams", void 0), this.searchParams = t
                    }
                    return nx(e, [{
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
                            return tK(this.searchParams.entries()).filter(function(e) {
                                return tS(e, 1)[0].toLowerCase() === n
                            }).map(function(e) {
                                return tS(e, 2)[1]
                            })
                        }
                    }, {
                        key: "has",
                        value: function(e, t) {
                            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive";
                            return this.searchParams.has(this.resolveName(e, n), void 0 === t ? void 0 : cn(t))
                        }
                    }, {
                        key: "copyAndAppend",
                        value: function(t, n) {
                            var r = ce(this.searchParams);
                            return r.append(t, cn(n)), e.fromUnique(r)
                        }
                    }, {
                        key: "copyAndAppendAll",
                        value: function(t) {
                            var n = (0, tB._)(t, URLSearchParams) || (0, tB._)(t, e) || ct(t) ? t : Object.entries(t);
                            return e.new(tK(this.searchParams).concat(tK(n)))
                        }
                    }, {
                        key: "copyAndSet",
                        value: function(t, n) {
                            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive";
                            if ("caseSensitive" === r) {
                                var i = ce(this.searchParams);
                                return i.set(t, cn(n)), e.fromUnique(i)
                            }
                            var a = t.toLowerCase(),
                                o = [],
                                l = !1,
                                s = !0,
                                u = !1,
                                c = void 0;
                            try {
                                for (var d, f = this.searchParams.entries()[Symbol.iterator](); !(s = (d = f.next()).done); s = !0) {
                                    var h = tS(d.value, 2),
                                        p = h[0],
                                        m = h[1];
                                    p.toLowerCase() !== a ? o.push([p, m]) : l || (o.push([t, cn(n)]), l = !0)
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
                            return l || o.push([t, cn(n)]), e.fromUnique(ce(o))
                        }
                    }, {
                        key: "copyAndDelete",
                        value: function(t, n) {
                            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "caseInsensitive",
                                i = t.toLowerCase(),
                                a = void 0 === n ? void 0 : cn(n),
                                o = function(e) {
                                    var n = tS(e, 2),
                                        o = n[0],
                                        l = n[1];
                                    return ("caseSensitive" === r ? o === t : o.toLowerCase() === i) && (void 0 === a || l === a)
                                },
                                l = tK(this.searchParams.entries());
                            return l.some(o) ? e.fromUnique(ce(l.filter(function(e) {
                                return !o(e)
                            }))) : this
                        }
                    }, {
                        key: "toSorted",
                        value: function() {
                            var t = ce(this.searchParams);
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
                            if ((0, tB._)(t, e)) return t;
                            var r = ce((ct(t) ? t : Object.entries(t)).map(function(e) {
                                var t = tS(e, 2);
                                return [t[0], cn(t[1])]
                            }));
                            return e.fromUnique(n ? ci(r) : r)
                        }
                    }, {
                        key: "fromURLSearchParams",
                        value: function(t) {
                            var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1];
                            return e.fromUnique(n ? ci(t) : ce(t))
                        }
                    }, {
                        key: "parse",
                        value: function(t) {
                            var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                                r = ce(t);
                            return e.fromUnique(n ? ci(r) : r)
                        }
                    }]), e
                }();
            eH(ca, "empty", ca.fromUnique(ce(""))), tH(Error), tH(Error);
            var co = function(e) {
                    return rs(new URL(e))
                },
                cl = function(e) {
                    function t(e, n) {
                        return tD(this, t), tU(this, t, [e, n])
                    }
                    return tj(t, e), nx(t, [{
                        key: "with",
                        value: function(e) {
                            var n = e.scheme,
                                r = e.host,
                                i = e.port,
                                a = e.path,
                                o = e.searchParams,
                                l = e.fragment;
                            if (null == n && null == r && null == i && null == a && null == o && null == l) return this;
                            var s = co(this.url);
                            if (null != n && (s.protocol = n), null != r && (s.hostname = r), null != i && (s.port = "number" == typeof i ? i.toString() : i), null != a && (s.pathname = a), null != l && (s.hash = l), null != o) {
                                var u = ca.new(o);
                                return s.search = u.toString(), new t(s, u)
                            }
                            return new t(s, this.searchParams)
                        }
                    }, {
                        key: "withScheme",
                        value: function(e) {
                            var n = co(this.url);
                            return n.protocol = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withHost",
                        value: function(e) {
                            var n = co(this.url);
                            return n.hostname = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withPort",
                        value: function(e) {
                            var n = co(this.url);
                            return n.port = "number" == typeof e ? e.toString() : e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withPath",
                        value: function(e) {
                            var n = co(this.url);
                            return n.pathname = e, new t(n, this.searchParams)
                        }
                    }, {
                        key: "withSearchParams",
                        value: function(e) {
                            var n = ca.new(e),
                                r = co(this.url);
                            return r.search = n.toString(), new t(r, n)
                        }
                    }, {
                        key: "withSearchParamsAppended",
                        value: function(e) {
                            var n = this.searchParams.copyAndAppendAll(e),
                                r = co(this.url);
                            return r.search = n.toString(), new t(r, n)
                        }
                    }, {
                        key: "withFragment",
                        value: function(e) {
                            var n = co(this.url);
                            return n.hash = e, new t(n, this.searchParams)
                        }
                    }], [{
                        key: "new",
                        value: function(e) {
                            e.password = "", e.username = "";
                            var n = ca.internalFromUniqueURLSearchParams(rs(e.searchParams));
                            return new t(e, n)
                        }
                    }, {
                        key: "fromURL",
                        value: function(e) {
                            return t.new(co(e))
                        }
                    }, {
                        key: "parse",
                        value: function(e) {
                            try {
                                return nk(t.new(rs(new URL(e))))
                            } catch (e) {
                                return n_(e)
                            }
                        }
                    }]), t
                }(u9),
                cs = function(e) {
                    var t, n = new URLSearchParams(document.location.search).get("downloadType");
                    if (null != n) {
                        var r = u4[n];
                        if (null != r) return r
                    }
                    if (!e) return u4.Unknown;
                    var i = tv.getDeviceMeta();
                    return (null == i ? void 0 : i.isIosDevice) ? u4.AppleAppStore : (t = e, /Kindle|Silk|KFAPW|KFARWI|KFASWI|KFFOWI|KFJW|KFMEWI|KFOT|KFSAW|KFSOWI|KFTBW|KFTHW|KFTT|WFFOWI|KFAPWI/i.test(t)) ? u4.AmazonAppStore : (null == i ? void 0 : i.isAndroidDevice) ? u4.GooglePlayStore : tv.isMac() ? u4.MacDirectDownload : tv.isWindows() ? u4.WindowsDirectDownload : u4.Unknown
                },
                cu = function(e, t) {
                    (0, td.sendEventWithTarget)(td.eventTypes.formInteraction, "downloadV2", eG({
                        field: "".concat(e, "DownloadLink"),
                        aType: "click"
                    }, t ? {
                        source: t
                    } : {}))
                },
                cc = function(e) {
                    return Object.values(u4).some(function(t) {
                        return t === e
                    })
                },
                cd = function(e) {
                    if (null != e) {
                        if ("number" == typeof e) return cc(e) && u8[e] ? e : void 0;
                        var t = u4[e];
                        if (null != t && u8[t]) return t;
                        var n = Number(e);
                        if (Number.isInteger(n) && cc(n) && u8[n]) return n
                    }
                },
                cf = function(e) {
                    var t;
                    return null != (t = cd(e)) ? t : cs(navigator.userAgent)
                },
                ch = function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = t.downloadTypeOverride,
                        r = t.translate,
                        i = cf(n),
                        a = u8[i];
                    if (a) {
                        var o = a.isDirectDownload ? a.href : null != (e = null == r ? void 0 : r(a.href)) ? e : a.href,
                            l = cl.parse(o);
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
                cp = function(e) {
                    var t = e.indexOf(".");
                    return t >= 0 ? (0, ra.jsxs)(ej().Fragment, {
                        children: [(0, ra.jsx)("span", {
                            children: e.substring(0, t + 1)
                        }), (0, ra.jsx)("span", {
                            children: e.substring(t + 1)
                        })]
                    }) : e
                },
                cm = "\x01LINK_START\x01",
                cv = "\x01LINK_END\x01",
                cy = new RegExp("".concat(cm, "|").concat(cv)),
                cg = function() {
                    var e = tS(u3, 5),
                        t = e[0],
                        n = e[1],
                        r = e[2],
                        i = e[3],
                        a = e[4],
                        o = am(t),
                        l = am(n),
                        s = am(r),
                        u = am(i),
                        c = am(a);
                    return (0, eM.useMemo)(function() {
                        var e;
                        return e = [c, u, s, l, o],
                            function(t, n, r) {
                                var i = n && Object.fromEntries(Object.entries(n).filter(function(e) {
                                        return "string" == typeof e[1] || "number" == typeof e[1] || (0, tB._)(e[1], Date)
                                    })),
                                    a = e.find(function(e) {
                                        return e.has(t)
                                    });
                                return a ? a.dynamic(t, i) : null != r ? r : ""
                            }
                    }, [c, u, s, l, o])
                },
                cb = Error("client not started"),
                cw = 0,
                cE = function(e) {
                    var t = tS((0, eM.useState)(function() {
                            return cw += 1
                        }), 1)[0],
                        n = (0, eF.useQuery)({
                            queryKey: ["client-status", t],
                            queryFn: function() {
                                return eB(function() {
                                    return eD(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return [4, eB(function() {
                                                    var e, t;
                                                    return eD(this, function(n) {
                                                        switch (n.label) {
                                                            case 0:
                                                                return [4, eW.get(nR(eV().matchmakingApi, "/v1/client-status"), nL, {
                                                                    credentials: "include"
                                                                })];
                                                            case 1:
                                                                return t = n.sent().getOrThrow().status, [2, null != (e = nU.find(function(e) {
                                                                    return e === t
                                                                })) ? e : "Unknown"]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                if ("Unknown" === t.sent()) throw cb;
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
                cP = function(e) {
                    var t = e.closeLabel,
                        n = e.title,
                        r = e.description,
                        i = e.button,
                        a = e.unmount;
                    return (0, ra.jsx)(li, {
                        hasCloseAffordance: !0,
                        closeLabel: t,
                        isModal: !0,
                        open: !0,
                        size: "Medium",
                        onOpenChange: a,
                        children: (0, ra.jsxs)(la, {
                            className: "download-dialog",
                            children: [(0, ra.jsxs)(lo, {
                                className: "flex flex-col items-center gap-xlarge",
                                children: [(0, ra.jsx)(u2, {
                                    className: "size-1600"
                                }), (0, ra.jsx)(ll, {
                                    className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center",
                                    children: n
                                }), r && (0, ra.jsx)("p", {
                                    className: "text-body-medium text-align-x-center",
                                    children: r
                                })]
                            }), (0, ra.jsx)(ls, {
                                className: "flex",
                                children: i
                            })]
                        })
                    })
                },
                cI = function(e) {
                    var t = e.download,
                        n = e.launchGame,
                        r = e.getPlayOnWeb,
                        i = e.unmount,
                        a = tS((0, eM.useState)(!1), 2),
                        o = a[0],
                        l = a[1],
                        s = cg(),
                        u = cE(i);
                    if (!o) {
                        if (r) {
                            var c = s("Action.Close");
                            if (u) return (0, ra.jsx)(cP, {
                                closeLabel: c,
                                title: s("PlayOnWebModal.Label.CheckingForRoblox", void 0, "Checking for Roblox..."),
                                button: (0, ra.jsx)(rU, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    isLoading: !0
                                }),
                                unmount: i
                            });
                            var d = r();
                            return d ? (0, ra.jsx)(cP, {
                                closeLabel: c,
                                title: s("PlayOnWebModal.Label.RobloxDidNotOpen", void 0, "Roblox didn't open?"),
                                description: s("PlayOnWebModal.Label.PlayInBrowserInstead", void 0, "You can play this game in your browser instead."),
                                button: (0, ra.jsx)(rU, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    onClick: function() {
                                        d(), i()
                                    },
                                    children: s("PlayButtonText.PlayOnWeb")
                                }),
                                unmount: i
                            }) : (0, ra.jsx)(cP, {
                                closeLabel: c,
                                title: s("Label.RobloxExciteToDownload"),
                                button: (0, ra.jsx)(rU, {
                                    variant: "Emphasis",
                                    size: "Medium",
                                    className: "grow",
                                    onClick: function() {
                                        return eB(function() {
                                            var e;
                                            return eD(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        try {
                                                            (e = ch()) && cu(e.link.name)
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
                        return (0, ra.jsx)(li, {
                            hasCloseAffordance: !0,
                            closeLabel: s("Action.Close"),
                            isModal: !0,
                            open: !0,
                            size: "Medium",
                            onOpenChange: i,
                            children: (0, ra.jsxs)(la, {
                                className: "download-dialog",
                                children: [(0, ra.jsxs)(lo, {
                                    className: "flex flex-col items-center gap-xlarge",
                                    children: [(0, ra.jsx)(u2, {
                                        className: "size-1600"
                                    }), (0, ra.jsx)(ll, {
                                        className: "text-heading-small padding-x-xxlarge padding-y-none text-align-x-center flex flex-col",
                                        "aria-hidden": !0,
                                        children: u ? cp(f) : f
                                    })]
                                }), (0, ra.jsx)(ls, {
                                    className: "flex",
                                    children: u ? (0, ra.jsx)(rU, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        isLoading: !0
                                    }) : (0, ra.jsx)(rU, {
                                        variant: "Emphasis",
                                        size: "Medium",
                                        className: "grow",
                                        onClick: function() {
                                            return eB(function() {
                                                var e;
                                                return eD(this, function(n) {
                                                    switch (n.label) {
                                                        case 0:
                                                            try {
                                                                (e = ch()) && cu(e.link.name)
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
                    var h = (0, tv.isMac)(),
                        p = h ? (0, tu.getAbsoluteUrl)("/download/client?os=mac") : (0, tu.getAbsoluteUrl)("/download/client?os=win");
                    return (0, ra.jsx)(li, {
                        hasCloseAffordance: !0,
                        closeLabel: s("Action.Close"),
                        isModal: !0,
                        open: !0,
                        size: "Large",
                        onOpenChange: i,
                        children: (0, ra.jsx)(la, {
                            className: "install-dialog",
                            children: (0, ra.jsx)(lo, {
                                className: "content-default",
                                children: (0, ra.jsxs)("div", {
                                    className: "flex flex-col gap-xlarge padding-xlarge",
                                    children: [(0, ra.jsxs)("div", {
                                        className: "flex flex-col gap-xsmall",
                                        children: [(0, ra.jsx)(ll, {
                                            className: "text-heading-medium content-emphasis padding-none",
                                            children: s("Heading.DownloadConfirmation")
                                        }), (0, ra.jsx)("p", {
                                            className: "text-body-large",
                                            dangerouslySetInnerHTML: {
                                                __html: "".concat(s("Label.FollowInstallSteps"), " ").concat(s("Label.RetryDownload", {
                                                    startLink: '<a href="'.concat(p, '" class="download-link-underline">'),
                                                    endLink: "</a>"
                                                }))
                                            }
                                        })]
                                    }), (0, ra.jsx)("div", {}), " ", (0, ra.jsxs)("div", {
                                        className: "flex gap-xxlarge",
                                        children: [(0, ra.jsxs)("section", {
                                            className: "flex flex-col fill basis-0 gap-large",
                                            children: [(0, ra.jsx)("h3", {
                                                className: "text-title-large content-emphasis padding-none",
                                                children: s("Heading.InstallInstructions")
                                            }), (0, ra.jsxs)("ol", {
                                                className: "download-instructions-list flex flex-col gap-xlarge margin-none padding-left-large text-body-medium",
                                                children: [(0, ra.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: s(h ? "Response.Dialog.MacFirstInstruction" : "Response.Dialog.WindowsFirstInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ra.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    dangerouslySetInnerHTML: {
                                                        __html: s("Response.Dialog.SecondInstruction", {
                                                            startBold: "<b>",
                                                            endBold: "</b>"
                                                        })
                                                    }
                                                }), (0, ra.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: s("Response.Dialog.ThirdInstruction")
                                                }), (0, ra.jsx)("li", {
                                                    className: "padding-left-medium",
                                                    children: function() {
                                                        var e = s("Response.Dialog.FourthInstruction", {
                                                                startLink: cm,
                                                                endLink: cv
                                                            }),
                                                            t = e.split(cy);
                                                        if (t.length < 3) return e;
                                                        var r = tS(t, 3),
                                                            i = r[0],
                                                            a = r[1],
                                                            o = r[2];
                                                        return (0, ra.jsxs)(ej().Fragment, {
                                                            children: [i, (0, ra.jsx)("button", {
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
                                        }), (0, ra.jsx)("div", {}), " ", (0, ra.jsx)("div", {
                                            className: "stroke-standard stroke-default"
                                        }), (0, ra.jsx)("div", {}), " ", (0, ra.jsx)("section", {
                                            className: "flex flex-col fill basis-0 gap-xxlarge",
                                            children: (0, ra.jsx)(u7, {
                                                translate: s
                                            })
                                        })]
                                    })]
                                })
                            })
                        })
                    })
                },
                cS = function(e) {
                    var t = e.unmount,
                        n = tS(u5, 2),
                        r = n[0],
                        i = n[1],
                        a = am(r),
                        o = am(i);
                    return (0, ra.jsx)(li, {
                        hasCloseAffordance: !1,
                        isModal: !0,
                        open: !0,
                        size: "Small",
                        onOpenChange: function(e) {
                            e || t()
                        },
                        children: (0, ra.jsxs)(la, {
                            children: [(0, ra.jsxs)(lo, {
                                className: "flex flex-col gap-small",
                                children: [(0, ra.jsx)(ll, {
                                    className: "text-heading-small content-emphasis padding-none",
                                    children: a("Heading.ErrorStartingGame")
                                }), (0, ra.jsx)("p", {
                                    className: "text-body-medium content-default",
                                    children: a("Response.Dialog.ErrorLaunching")
                                })]
                            }), (0, ra.jsx)(ls, {
                                className: "flex",
                                children: (0, ra.jsx)(rU, {
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
                cx = window.Roblox["core-lib"].index;
            tK(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(tK(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var cA = tK(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(tK(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                cT = tK(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(tK(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            tK(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(tK(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var cC = new Map([
                    ["zh_cjv", "zh_cn"]
                ]),
                ck = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                c_ = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = tS(e, 2),
                            n = t[0],
                            r = t[1];
                        return null == r ? [] : [
                            [iF(n), r]
                        ]
                    }))
                },
                cO = function(e) {
                    var t = ck(),
                        n = t.Lang,
                        r = t.LangDynamic,
                        i = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [iF(e), eG({}, c_(null == i ? void 0 : i[e]), c_(null == n ? void 0 : n[e]), c_(null == r ? void 0 : r[e]))]
                    }))
                },
                cN = function(e) {
                    var t, n, r = e.namespaces,
                        i = e.locale,
                        a = e.children,
                        o = r.join(","),
                        l = (0, eM.useMemo)(function() {
                            return cO(r)
                        }, [o]);
                    return (0, ra.jsx)(iO, {
                        locale: null != i ? i : null != (t = null != (n = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, cx.arrayIncludes)(cT, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? n : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if ((0, tB._)(t, HTMLMetaElement)) {
                                var n = t.dataset.languageCode;
                                if (n) {
                                    var r = null != (e = cC.get(n)) ? e : n;
                                    if ((0, cx.arrayIncludes)(cA, r)) return r.replace("_", "-")
                                }
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: a
                    })
                },
                cR = JSON.parse('{"P":["Feature.GameLaunchGuestMode","Common.VisitGame","CommonUI.Controls","Feature.ExperienceDetails","Feature.DownloadLanding"]}'),
                cL = window.Roblox["core-scripts"].meta.user,
                cU = function() {
                    var e, t, n;
                    return null != (e = null == (n = uD("RBXEventTrackerV2")) || null == (t = n.value.match(/browserid=([^&]*)/i)) ? void 0 : t[1]) && e
                };
            ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
            });
            var cB = "Website.DownloadFunnel",
                cD = "deeplink",
                cM = ["/games/{placeId}/{placeName}", "/share-links?code={linkId}&type=ExperienceInvite"].map(function(e) {
                    return new RegExp(e.replace(/\{.*?\}/g, "([^/]+)"))
                }),
                cj = ["/share-links"],
                cF = ["ExperienceAffiliate"],
                cH = function(e) {
                    var t;
                    return cj.includes(e.pathname) && cF.includes(null != (t = e.searchParams.get("type")) ? t : "")
                },
                cG = function(e) {
                    try {
                        var t = new URL(e).searchParams.get("referralUrl");
                        if (!t) return null;
                        var n = new URL(decodeURIComponent(t));
                        if (cH(n)) return n.href;
                        return null
                    } catch (e) {
                        return null
                    }
                },
                cz = function(e, t, n) {
                    var r;
                    try {
                        null == (r = window.Roblox.EventStream) || r.SendEventWithTarget("tokenAction", "EdpDownloadRobloxInstaller", {
                            link_url: t,
                            group: cD,
                            action: "create-token-attempt",
                            status_code: n,
                            token: null != e ? e : ""
                        }, window.Roblox.EventStream.TargetTypes.WWW)
                    } catch (e) {}
                },
                cV = "".concat(eV().apiGatewayUrl, "/deferred-deep-link/token-api"),
                cW = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return eB(function() {
                        var n, r, i, a, o, l, s, u, c;
                        return eD(this, function(d) {
                            switch (d.label) {
                                case 0:
                                    n = t.authTicket, r = t.btId, i = t.downloadSource, a = t.launchContext, o = {
                                        linkId: e,
                                        group: cD
                                    }, n && (o.authTicket = n), r && (o.btId = r), i && (o.downloadSource = i), a && (o.launchContext = a), l = {
                                        withCredentials: !0,
                                        url: "".concat(cV, "/create-token")
                                    }, d.label = 1;
                                case 1:
                                    return d.trys.push([1, 3, , 4]), [4, eJ.post(l, o)];
                                case 2:
                                    return cz(c = null != (s = (u = d.sent()).data.token) ? s : null, e, u.status), [2, c];
                                case 3:
                                    return d.sent(), [2, null];
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                },
                cq = as("Download"),
                cK = function(e) {
                    cq("GameJoinDeeplinkToken", {
                        outcome: e
                    })
                },
                cZ = new TextEncoder,
                cY = function(e) {
                    var t;
                    return rs((t = e, rs(btoa(Array.from(cZ.encode(t), function(e) {
                        return String.fromCodePoint(e)
                    }).join("")))).replace(/\+/g, "-").replace(/\//g, "_").replace(/=/g, ""))
                };
            new TextDecoder;
            var cJ = ["joinAttemptOrigin", "accessCode", "linkCode", "gameId", "launchData", "eventId", "conversationId"],
                cX = function(e, t, n) {
                    var r = null == (p = cl.parse(e).getOrNull()) ? void 0 : p.searchParams;
                    if (null == r) return null;
                    var i = sZ(null != (d = r.get("placeId")) ? d : "");
                    if (null == i || i <= 0) return null;
                    var a = sZ(String(null != n ? n : "")),
                        o = {
                            v: 1,
                            joinType: "GameJoin",
                            placeId: i,
                            isPlayTogetherGame: "true" === r.get("isPlayTogetherGame"),
                            referredByPlayerId: null != a && a > 0 ? a : null != (f = sZ(null != (h = r.get("referredByPlayerId")) ? h : "0")) ? f : 0
                        },
                        l = r.get("request");
                    l && (o.requestType = l);
                    var s = !0,
                        u = !1,
                        c = void 0;
                    try {
                        for (var d, f, h, p, m, v = cJ[Symbol.iterator](); !(s = (m = v.next()).done); s = !0) {
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
                    return t && (o.launchExp = t), cY(nN(o).value)
                },
                c$ = new Map(["android", "ios", "xbox", "uwp", "amazon", "win32", "universalApp", "unknown"].map(function(e) {
                    return [e.toLowerCase(), e]
                })),
                cQ = function(e) {
                    var t, n;
                    return null != (t = c$.get(null != (n = null == e ? void 0 : e.trim().toLowerCase()) ? n : "")) ? t : "unknown"
                },
                c0 = ["Messages", "Avatar"],
                c1 = function(e) {
                    var t;
                    return null != (t = c0.find(function(t) {
                        return t === e
                    })) ? t : "other"
                },
                c2 = function() {
                    var e;
                    return cQ(null == tk || null == (e = tk.querySelector('meta[name="device-meta"]')) ? void 0 : e.dataset.appType)
                },
                c3 = {
                    featureName: "AppShell",
                    team: "User > Consumer Apps > Platforms - Web & Backend",
                    features: {
                        page: {
                            counters: [{
                                name: "ShellStart",
                                dimensions: ["host", "page", "appType", "auth_state"]
                            }, {
                                name: "PageHeartbeat",
                                dimensions: ["host", "page", "appType", "beat"]
                            }]
                        },
                        presence: {
                            counters: [{
                                name: "PresenceHeartbeat",
                                dimensions: ["host", "page", "appType", "outcome"]
                            }]
                        },
                        navigation: {
                            counters: [{
                                name: "NavLoad",
                                dimensions: ["host", "page", "appType", "outcome"]
                            }]
                        },
                        realtime: {
                            counters: [{
                                name: "RealtimeStart",
                                dimensions: ["host", "page", "appType", "outcome"]
                            }]
                        },
                        chat: {
                            counters: [{
                                name: "ChatLoad",
                                dimensions: ["host", "page", "appType", "outcome"]
                            }]
                        },
                        gameLaunch: {
                            counters: [{
                                name: "GameLaunch",
                                dimensions: ["host", "page", "appType", "outcome"]
                            }]
                        }
                    }
                },
                c5 = function(e, t, n) {
                    var r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {},
                        i = r.appType,
                        a = void 0 !== i && i;
                    return function(r, i) {
                        var o = Object.values(e.features).some(function(e) {
                            var t;
                            return null == (t = e.counters) ? void 0 : t.some(function(e) {
                                var t;
                                return "string" != typeof e && e.name === r && (null == (t = e.dimensions) ? void 0 : t.includes("page")) === !0
                            })
                        });
                        t(r, eG(e4(eG({}, o && null == i.page ? {
                            page: c1(af())
                        } : {}, i), {
                            host: n
                        }), a ? {
                            appType: c2()
                        } : {}))
                    }
                }(c3, as(c3.featureName), "dotnet", {
                    appType: !0
                }),
                c4 = {
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
                c6 = ["edit", "plugin", "asset"];

            function c8() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "react-dialog-container",
                    t = document.getElementById(e);
                return t ? (aL().unmountComponentAtNode(t), t.innerHTML = "") : ((t = document.createElement("div")).id = e, document.body.appendChild(t)), t
            }

            function c7() {
                eR().modal.close();
                var e = c8("react-launch-failure-dialog-container");
                (0, uJ.renderWithErrorBoundary)((0, ra.jsx)(cN, {
                    namespaces: cR.P,
                    children: (0, ra.jsx)(cS, {
                        unmount: function() {
                            return aL().unmountComponentAtNode(e)
                        }
                    })
                }), e)
            }

            function c9(e) {
                var t = eR()("iframe#gamelaunch");
                t.length > 0 && t.remove(), t = eR()("<iframe id='gamelaunch' class='hidden'></iframe>").attr("src", e), eR()("body").append(t);
                var n = new Event("ProtocolLaunchStartSelenium");
                window.dispatchEvent(n)
            }

            function de(e) {
                return eB(function() {
                    var t, n, r;
                    return eD(this, function(i) {
                        switch (i.label) {
                            case 0:
                                var a;
                                return t = document.getElementById("downloadInstallerIFrame"), n = "/download/client", t.referrerPolicy = "no-referrer", [4, (a = window.location.toString(), eB(function() {
                                    var t, n, r, i, o;
                                    return eD(this, function(l) {
                                        switch (l.label) {
                                            case 0:
                                                if (t = "", !(n = function(e) {
                                                        var t = cG(e);
                                                        if (t) return t;
                                                        var n = new URL(e);
                                                        return (n.search = "", n.hash = "", cM.some(function(e) {
                                                            return e.test(n.pathname)
                                                        })) ? n.toString() : null
                                                    }(a))) return e && cK("unsupportedPage"), [2, t];
                                                return i = [n], o = [{}], [4, eB(function() {
                                                    var e;
                                                    return eD(this, function(t) {
                                                        switch (t.label) {
                                                            case 0:
                                                                if (null == (0, cL.authenticatedUser)()) return [3, 2];
                                                                return [4, nB()];
                                                            case 1:
                                                                return e = t.sent(), [3, 3];
                                                            case 2:
                                                                e = void 0, t.label = 3;
                                                            case 3:
                                                                return [2, {
                                                                    authTicket: e,
                                                                    btId: cU() || void 0
                                                                }]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return [4, cW.apply(void 0, i.concat([eG.apply(void 0, [e4.apply(void 0, [eG.apply(void 0, o.concat([l.sent()])), {
                                                    downloadSource: "installer"
                                                }]), e ? {
                                                    launchContext: e
                                                } : {}])]))];
                                            case 2:
                                                return r = l.sent(), e && cK(r ? "minted" : "tokenFailed"), r && (t = "?".concat("token", "=").concat(r)), [2, t]
                                        }
                                    })
                                })())];
                            case 1:
                                return r = i.sent(), t.src = "".concat(n).concat(r), [2]
                        }
                    })
                })()
            }

            function dt() {
                return eB(function() {
                    return eD(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return eR()(uR).trigger(uR.manualDownloadEvent, {
                                    launchMethod: "Protocol",
                                    params: {}
                                }), [4, de()];
                            case 1:
                                return e.sent(), [2]
                        }
                    })
                })()
            }
            var dn = (er = null != (et = (q = (W = {
                state: c4,
                getPlaceLauncherBaseUrl: function() {
                    var e = " ";
                    return eL.Endpoints && eL.Endpoints.Urls && (e = eL.Endpoints.getAbsoluteUrl("/Game/PlaceLauncher.ashx")), "h" !== e[0] && (e = "http://".concat(window.location.host, "/Game/PlaceLauncher.ashx")), e.replace("placelauncher", "PlaceLauncher")
                },
                triggerEvent: function(e, t) {
                    return eR()(uR).trigger(uR["".concat(e, "Event")], t)
                },
                logToConsole: function(e) {
                    var t, n;
                    return null == (n = uR.gameLaunchLogger) || null == (t = n.logToConsole) ? void 0 : t.call(n, e)
                },
                showDialog: function(e, t) {
                    return c4.showDialog(e, t)
                },
                closeDialog: function() {
                    return eR().modal.close()
                },
                showLaunchFailureDialog: c7,
                openProtocolUrl: c9
            }).state, K = W.getPlaceLauncherBaseUrl, Z = W.triggerEvent, Y = W.logToConsole, J = W.showDialog, X = W.closeDialog, $ = W.showLaunchFailureDialog, Q = W.openProtocolUrl, ee = {
                getConfig: function() {
                    return {
                        placeLauncherUrl: K(),
                        robloxLocale: q.robloxLocale,
                        gameLocale: q.gameLocale,
                        playerChannel: q.playerChannel,
                        studioChannel: q.studioChannel,
                        isDuarAutoOptInEnabled: !!q.isDuarAutoOptInEnabled,
                        isDuarOptOutDisabled: !!q.isDuarOptOutDisabled,
                        isOmitPlayerChannelForWinAndMacEnabled: !!q.isOmitPlayerChannelForWinAndMacEnabled
                    }
                },
                getBrowserTrackerId: cU,
                isAuthenticated: cL.isAuthenticated,
                getUserId: cL.userId,
                isWindowsOrMac: function() {
                    return (0, tv.isWindows)() || (0, tv.isMac)()
                },
                onEvent: function(e, t) {
                    "startClientAttempted" === e && c5("GameLaunch", {
                        outcome: "attempted"
                    }), Z(e, t)
                },
                installState: {
                    get: function() {
                        return q.isInstalling
                    },
                    set: function(e) {
                        q.isInstalling = e
                    }
                },
                onLaunchStarted: J,
                onLaunchSucceeded: function() {
                    c5("GameLaunch", {
                        outcome: "succeeded"
                    }), X()
                },
                onLaunchFailed: function(e) {
                    c5("GameLaunch", {
                        outcome: "failed"
                    }), console.error(e), $()
                },
                openProtocolUrl: function(e) {
                    Y("launchProtocolUrl: ".concat(JSON.stringify({
                        url: e
                    }))), Q(e)
                }
            }).installState) ? et : (p = !1, {
                get: function() {
                    return p
                },
                set: function(e) {
                    p = e
                }
            }), ei = null != (en = ee.openProtocolUrl) ? en : function(e) {
                null == (t = document.querySelector("iframe#gamelaunch")) || t.remove();
                var t, n = document.createElement("iframe");
                n.id = "gamelaunch", n.className = "hidden", n.src = e, document.body.appendChild(n), window.dispatchEvent(new Event("ProtocolLaunchStartSelenium"))
            }, ea = function(e) {
                return {
                    launchMethod: "Protocol",
                    params: e
                }
            }, eo = function(e) {
                return eB(function() {
                    var t, n, r, i, a;
                    return eD(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (o.trys.push([0, 5, , 6]), t = nD(e.launchMode), n = eB(function() {
                                        return eD(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, eW.fetch(nR(eV().matchmakingApi, "/v1/client-status"), {
                                                        method: "POST",
                                                        credentials: "include",
                                                        headers: {
                                                            "content-type": "application/json"
                                                        },
                                                        body: nN({
                                                            status: "Unknown"
                                                        }).value
                                                    })];
                                                case 1:
                                                    return e.sent().getOrThrow(), [2]
                                            }
                                        })
                                    })(), !(ee.isAuthenticated() && !t)) return [3, 2];
                                return [4, Promise.all([nB(), n])];
                            case 1:
                                return r = tS.apply(void 0, [o.sent(), 1])[0], [3, 4];
                            case 2:
                                return [4, n];
                            case 3:
                                o.sent(), o.label = 4;
                            case 4:
                                return i = t ? {
                                    userId: ee.isAuthenticated() ? ee.getUserId() : null,
                                    browser: tO()
                                } : void 0, ei(nF(e, r, i)), ee.onLaunchSucceeded(), ee.onEvent("startClientSucceeded", ea(e)), er.get() && (ee.onEvent("successfulInstall", ea(e)), er.set(!1)), [3, 6];
                            case 5:
                                return a = o.sent(), ee.onLaunchFailed(a), [3, 6];
                            case 6:
                                return [2]
                        }
                    })
                })()
            }, el = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "play",
                    n = ee.getConfig(),
                    r = nD(t),
                    i = e4(eG({}, e), {
                        protocolName: nj(r ? "roblox-studio" : "roblox-player"),
                        launchMode: t,
                        launchTime: Date.now()
                    }),
                    a = i.otherParams;
                a.browsertrackerid = ee.getBrowserTrackerId(), a.robloxLocale = n.robloxLocale, a.gameLocale = n.gameLocale, r ? a.channel = n.studioChannel : n.isOmitPlayerChannelForWinAndMacEnabled && ee.isWindowsOrMac() || (a.channel = n.playerChannel), r || !n.isDuarAutoOptInEnabled || a.LaunchExp || (a.LaunchExp = n.isDuarOptOutDisabled ? "InApp" : "PreferInApp"), ee.onEvent("startClientAttempted", ea(i));
                var o = eo(i);
                return ee.onLaunchStarted(i, function() {
                    return eo(i)
                }), o
            }, es = function(e, t) {
                var n = function() {
                    ei(e)
                };
                ee.onLaunchStarted(t, function() {
                    return n(), Promise.resolve()
                }), n()
            }, eu = function(e, t) {
                var n, r, i, a;
                return n = ee.getConfig().placeLauncherUrl, r = e, i = ee.getBrowserTrackerId(), a = t, "".concat(n, "?").concat(Object.entries(eG({
                    request: r,
                    browserTrackerId: i
                }, Object.fromEntries(Object.entries(a).filter(function(e) {
                    return void 0 !== tS(e, 2)[1]
                })))).map(function(e) {
                    var t = tS(e, 2),
                        n = t[0],
                        r = t[1];
                    return "".concat(encodeURIComponent(n), "=").concat(encodeURIComponent(null != r ? r : ""))
                }).join("&").replace(/%20/g, "+"))
            }, ec = function(e) {
                return null == ee.onGuestLaunch || ee.isAuthenticated() ? e() : (ee.onGuestLaunch(), Promise.resolve())
            }, ed = function(e, t, n) {
                var r, i = null == (r = ee.launchInApp) ? void 0 : r.call(ee, eG(e4(eG({}, e), {
                    browserTrackerId: ee.getBrowserTrackerId()
                }), "string" == typeof t.joinAttemptId ? {
                    joinAttemptId: t.joinAttemptId
                } : {}, "string" == typeof t.joinAttemptOrigin ? {
                    joinAttemptOrigin: t.joinAttemptOrigin
                } : {}));
                return null != i ? i : n()
            }, {
                joinMultiplayerGame: function(e, t) {
                    return ec(function() {
                        return ed({
                            requestType: "RequestGame",
                            placeId: String(e.placeId),
                            isPlayTogetherGame: !0 === e.isPlayTogetherGame
                        }, e, function() {
                            return el({
                                otherParams: {
                                    placelauncherurl: eu("RequestGame", e)
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
                    return ec(function() {
                        return ed({
                            requestType: "RequestFollowUser",
                            userId: String(e.userId)
                        }, e, function() {
                            return el({
                                otherParams: {
                                    placelauncherurl: eu("RequestFollowUser", e)
                                }
                            })
                        })
                    })
                },
                joinGameInstance: function(e, t) {
                    return ec(function() {
                        return ed({
                            requestType: "RequestGameJob",
                            placeId: String(e.placeId),
                            instanceId: e.gameId,
                            isPlayTogetherGame: !0 === e.isPlayTogetherGame
                        }, e, function() {
                            return el({
                                otherParams: {
                                    placelauncherurl: eu("RequestGameJob", e)
                                },
                                placeId: e.placeId,
                                isPlayTogetherGame: !0 === e.isPlayTogetherGame,
                                getPlayOnWeb: t
                            })
                        })
                    })
                },
                joinPrivateGame: function(e, t) {
                    return ed(eG({
                        requestType: "RequestPrivateGame",
                        placeId: String(e.placeId)
                    }, null == e.accessCode ? {} : {
                        accessCode: e.accessCode
                    }, null == e.linkCode ? {} : {
                        linkCode: e.linkCode
                    }), e, function() {
                        return el({
                            otherParams: {
                                placelauncherurl: eu("RequestPrivateGame", e)
                            },
                            placeId: e.placeId,
                            getPlayOnWeb: t
                        })
                    })
                },
                playTogetherGame: function(e) {
                    return ec(function() {
                        return ed({
                            requestType: "RequestGame",
                            placeId: String(e.placeId),
                            conversationId: String(e.conversationId)
                        }, e, function() {
                            return el({
                                otherParams: {
                                    placelauncherurl: eu("RequestPlayTogetherGame", e)
                                },
                                placeId: e.placeId,
                                conversationId: e.conversationId
                            })
                        })
                    })
                },
                openStudio: function() {
                    return el({
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
                    return el({
                        otherParams: e4(eG({
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
                    return el({
                        otherParams: {
                            assetid: e.assetId,
                            avatar: "avatar"
                        }
                    }, "asset")
                },
                openPluginInStudio: function(e) {
                    return el({
                        otherParams: {
                            pluginid: e.pluginId,
                            avatar: "avatar"
                        }
                    }, "plugin")
                },
                startDeepLinkFlow: function(e) {
                    es(e, {})
                },
                startGameWithDeepLinkUrl: function(e, t) {
                    es(e, {
                        protocolName: nj("roblox-player"),
                        launchMode: "play",
                        otherParams: {},
                        placeId: t
                    })
                },
                beginInstall: function(e) {
                    ee.onEvent("beginInstall", ea(e)), er.set(!0)
                },
                manualDownload: function() {
                    ee.onEvent("manualDownload", ea({}))
                }
            });
            Object.assign(c4, {
                joinMultiplayerGame: dn.joinMultiplayerGame,
                followPlayerIntoGame: dn.followPlayerIntoGame,
                joinGameInstance: dn.joinGameInstance,
                joinPrivateGame: dn.joinPrivateGame,
                playTogetherGame: dn.playTogetherGame,
                openStudio: dn.openStudio,
                tryAssetInStudio: function(e) {
                    return dn.tryAssetInStudio({
                        assetId: e
                    })
                },
                openPluginInStudio: function(e) {
                    return dn.openPluginInStudio({
                        pluginId: e
                    })
                },
                editGameInStudio: function(e, t, n, r, i, a) {
                    return dn.editGameInStudio({
                        placeId: e,
                        universeId: t,
                        startTeamTest: r,
                        instanceId: i,
                        annotationId: a
                    })
                },
                startDeepLinkFlow: dn.startDeepLinkFlow,
                startGameWithDeepLinkUrl: dn.startGameWithDeepLinkUrl,
                manualDownload: dt,
                attachManualDownloadToLink: function() {
                    return eB(function() {
                        return eD(this, function(e) {
                            return eR()("body #GameLaunchManualInstallLink").click(function() {
                                return eB(function() {
                                    return eD(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, dt()];
                                            case 1:
                                                return e.sent(), [2, !1]
                                        }
                                    })
                                })()
                            }), [2]
                        })
                    })()
                },
                startDownload: de,
                setLocationHref: c9,
                showDialog: function(e, t) {
                    var n = c8(),
                        r = function() {
                            return aL().unmountComponentAtNode(n)
                        },
                        i = c6.includes(null == e ? void 0 : e.launchMode);
                    (0, uJ.renderWithErrorBoundary)((0, ra.jsx)(cN, {
                        namespaces: cR.P,
                        children: (0, ra.jsx)(eF.QueryClientProvider, {
                            client: uJ.queryClient,
                            children: (0, ra.jsx)(cI, {
                                download: function() {
                                    return eB(function() {
                                        var t, n, a, o;
                                        return eD(this, function(l) {
                                            switch (l.label) {
                                                case 0:
                                                    if (e.placeId && null != (t = window.localStorage.getItem("ref_info"))) {
                                                        window.localStorage.removeItem("ref_info"), n = {};
                                                        try {
                                                            n = JSON.parse(atob(t))
                                                        } catch (e) {}
                                                        e.referredByPlayerId = n[e.placeId]
                                                    }
                                                    if (eR()(uR).trigger(uR.beginInstallEvent, {
                                                            launchMethod: "Protocol",
                                                            params: e
                                                        }), c4.isInstalling = !0, !i) return [3, 1];
                                                    return document.getElementById("downloadInstallerIFrame").src = "/download/studio", r(), [3, 4];
                                                case 1:
                                                    var s, u, c;
                                                    return [4, (s = null == e || null == (a = e.otherParams) ? void 0 : a.placelauncherurl, u = null == e || null == (o = e.otherParams) ? void 0 : o.LaunchExp, c = null == e ? void 0 : e.referredByPlayerId, eB(function() {
                                                        var e;
                                                        return eD(this, function(t) {
                                                            switch (t.label) {
                                                                case 0:
                                                                    if (null == (e = cX(null != s ? s : "", u, c))) return cK("noLaunchContext"), [2, void 0];
                                                                    return [4, eB(function() {
                                                                        var e;
                                                                        return eD(this, function(t) {
                                                                            switch (t.label) {
                                                                                case 0:
                                                                                    return t.trys.push([0, 2, , 3]), [4, rD().getAllValuesForLayer(cB)];
                                                                                case 1:
                                                                                    return e = t.sent(), rD().logLayerExposure(cB), [2, !0 === e.IsGameJoinDeeplinkEnabled];
                                                                                case 2:
                                                                                    return t.sent(), [2, !1];
                                                                                case 3:
                                                                                    return [2]
                                                                            }
                                                                        })
                                                                    })()];
                                                                case 1:
                                                                    if (!t.sent()) return cK("ixpOff"), [2, void 0];
                                                                    return [2, e]
                                                            }
                                                        })
                                                    })())];
                                                case 2:
                                                    return [4, de(l.sent())];
                                                case 3:
                                                    l.sent(), l.label = 4;
                                                case 4:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                launchGame: function() {
                                    return eB(function() {
                                        return eD(this, function(e) {
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
                showLaunchFailureDialog: c7
            }), eR()(document).ready(function() {
                uR.setGameLaunchInterface(c4);
                var e = eR()("#PlaceLauncherStatusPanel");
                c4.isJoinAttemptIdEnabled = !0, c4.robloxLocale = e.data("protocol-roblox-locale"), c4.gameLocale = e.data("protocol-game-locale");
                var t = e.data("protocol-studio-channel-name");
                "string" == typeof t && "LIVE" !== t.toUpperCase() && (c4.studioChannel = t);
                var n = e.data("protocol-player-channel-name");
                "string" == typeof n && "LIVE" !== n.toUpperCase() && (c4.playerChannel = n), c4.isDuarAutoOptInEnabled = e.data("is-duar-auto-opt-in-enabled"), c4.isDuarOptOutDisabled = e.data("is-duar-opt-out-disabled"), c4.isOmitPlayerChannelForWinAndMacEnabled = e.data("is-omit-player-channel-for-win-and-mac-enabled")
            }), Object.assign(window.Roblox, {
                AuthenticationChecker: uO,
                GameLauncher: uR,
                GameLaunchLogger: uH,
                GamePlayEvents: uj,
                ProtocolHandlerClientInterface: c4,
                PlayButton: {
                    usePlayabilityStatus: tl,
                    PlayabilityStatuses: e6,
                    launchGame: n1,
                    launchLogin: n2,
                    shouldShowUnplayableButton: n7,
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
                            p = void 0 === h ? uE : h,
                            m = e.appsFlyerReferralProperties,
                            v = void 0 === m ? uE : m,
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
                            T = e.pageContext,
                            C = e.playOnWebVariant,
                            k = void 0 === C ? "None" : C,
                            _ = sR(i, n, s === e6.PurchaseRequired || s === e6.FiatPurchaseRequired),
                            O = _.isLoading,
                            N = _.productInfo,
                            R = _.productDetails,
                            L = void 0 !== c && (c.isPlayable || void 0 !== re(c.playabilityStatus)),
                            U = ub(),
                            B = U.wasmJoinId,
                            D = U.isLoading,
                            M = [{
                                isEnabled: L,
                                primaryStatuses: uI,
                                render: function() {
                                    return (0, ra.jsx)(ul, {
                                        universeId: i,
                                        placeId: n,
                                        rootPlaceId: r,
                                        creatorId: d,
                                        privatePlaytestInfo: c,
                                        refetchPlayabilityStatus: l,
                                        pageContext: T,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: v
                                    })
                                }
                            }, {
                                isEnabled: !!u,
                                primaryStatuses: uP,
                                render: function() {
                                    return (0, ra.jsx)(s5, {
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
                                isEnabled: k === rG,
                                primaryStatuses: uS,
                                render: function() {
                                    return (0, ra.jsx)(ur, {
                                        placeId: n,
                                        rootPlaceId: r,
                                        universeId: i,
                                        privateServerLinkCode: a,
                                        gameInstanceId: o,
                                        eventProperties: p,
                                        wasmJoinId: B,
                                        playOnWebVariant: rG
                                    })
                                }
                            }],
                            j = !1;
                        switch (s) {
                            case void 0:
                                if (!y) {
                                    t = (0, ra.jsx)(aw, {
                                        buttonClassName: b
                                    });
                                    break
                                }
                                t = (0, ra.jsx)(ux, {
                                    universeId: i,
                                    placeId: n,
                                    rootPlaceId: r,
                                    privateServerLinkCode: a,
                                    gameInstanceId: o,
                                    status: e6.Playable,
                                    eventProperties: p,
                                    appsFlyerReferralProperties: v,
                                    disableLoadingState: y,
                                    skipPlayabilityFetch: g,
                                    buttonClassName: b,
                                    iconClassName: w,
                                    pageContext: T
                                });
                                break;
                            case e6.GuestProhibited:
                            case e6.Playable:
                                var F = null == A ? void 0 : A[s];
                                if (void 0 !== F) {
                                    t = F;
                                    break
                                }
                                if (s === e6.Playable && k === rH) {
                                    if (D && !y) {
                                        t = (0, ra.jsx)(aw, {
                                            buttonClassName: b
                                        }), j = !0;
                                        break
                                    }
                                    if (B) {
                                        t = (0, ra.jsx)(ur, {
                                            placeId: n,
                                            rootPlaceId: r,
                                            universeId: i,
                                            privateServerLinkCode: a,
                                            gameInstanceId: o,
                                            eventProperties: p,
                                            wasmJoinId: B,
                                            playOnWebVariant: rH
                                        });
                                        break
                                    }
                                }
                                t = (0, ra.jsx)(ux, {
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
                                    pageContext: T
                                });
                                break;
                            case e6.ContextualPlayabilityUnverifiedSeventeenPlusUser:
                            case e6.ContextualPlayabilityAgeCheckRequired:
                                eY(tt.ActionNeeded), t = (0, ra.jsx)(uw, {
                                    universeId: i,
                                    buttonClassName: b,
                                    playabilityStatus: s,
                                    pageContext: T
                                });
                                break;
                            case e6.PurchaseRequired:
                            case e6.FiatPurchaseRequired:
                                var H = s === e6.FiatPurchaseRequired ? !!(null == R ? void 0 : R.fiatPurchaseData) : !!(null == N ? void 0 : N.isForSale);
                                if (!O && !H) {
                                    eY(tt.Unplayable), t = (0, ra.jsx)(uc, {
                                        hideButtonText: f,
                                        buttonClassName: b,
                                        iconClassName: P
                                    });
                                    break
                                }
                                t = (0, ra.jsx)(s3, {
                                    refetchPlayabilityStatus: l,
                                    universeId: i,
                                    placeId: n,
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: E,
                                    redirectPurchaseUrl: I,
                                    playabilityStatus: s,
                                    showDefaultPurchaseText: S,
                                    pageContext: T
                                }), j = O;
                                break;
                            case e6.FiatPurchaseDeviceRestricted:
                            case e6.ContextualPlayabilityRegionalAvailability:
                                eY(tt.Unplayable), t = (0, ra.jsx)(uc, {
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: P
                                });
                                break;
                            case e6.ContextualPlayabilityAgeRecommendationParentalControls:
                                if (x) {
                                    eY(tt.ActionNeeded), t = (0, ra.jsx)(sN, {
                                        universeId: i,
                                        buttonClassName: b,
                                        placeId: n,
                                        rootPlaceId: r,
                                        privateServerLinkCode: a,
                                        gameInstanceId: o,
                                        eventProperties: p,
                                        appsFlyerReferralProperties: v,
                                        pageContext: T
                                    });
                                    break
                                }
                                eY(tt.Unplayable), t = (0, ra.jsx)(uc, {
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: P
                                });
                                break;
                            case e6.ContextualPlayabilityRequireParentApproval:
                                if (x) {
                                    eY(tt.ActionNeeded), t = (0, ra.jsx)(ab, {
                                        universeId: i,
                                        buttonClassName: b,
                                        pageContext: T
                                    });
                                    break
                                }
                                eY(tt.Unplayable), t = (0, ra.jsx)(uc, {
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: P
                                });
                                break;
                            case e6.UnplayableOtherReason:
                            case e6.GameUnapproved:
                            case e6.IncorrectConfiguration:
                            case e6.UniverseRootPlaceIsPrivate:
                            case e6.InsufficientPermissionFriendsOnly:
                            case e6.InsufficientPermissionGroupOnly:
                            case e6.InsufficientPermissionEditorsOnly:
                            case e6.InsufficientPermissionPlayTestersOnly:
                            case e6.DeviceRestricted:
                            case e6.UnderReview:
                            case e6.AccountRestricted:
                            case e6.TemporarilyUnavailable:
                            case e6.ComplianceBlocked:
                            case e6.ContextualPlayabilityRegionalCompliance:
                            case e6.ContextualPlayabilityAgeGated:
                            case e6.PlaceHasNoPublishedVersion:
                            case e6.ContextualPlayabilityUnrated:
                            case e6.ContextualPlayabilityGeneral:
                            case e6.ContextualPlayabilityAgeGatedByDescriptor:
                            case e6.ContextualPlayabilityExperienceBlockedParentalControls:
                            case e6.ContextualPlayabilityCoreGated:
                            case e6.ContextualPlayabilityPlaytestDisabled:
                            case e6.ContextualPlayabilityTrustedFriendRequired:
                            default:
                                eY(tt.Unplayable), t = (0, ra.jsx)(uc, {
                                    hideButtonText: f,
                                    buttonClassName: b,
                                    iconClassName: P
                                })
                        }
                        return (0, ra.jsx)(uu, {
                            primaryButton: t,
                            secondaryButton: us(M, s),
                            isPrimaryButtonLoading: j
                        })
                    },
                    PlayButton: ux,
                    PurchaseButton: s3,
                    Error: function(e) {
                        var t = e.playabilityStatus,
                            n = e.errorClassName,
                            r = e.containerRef,
                            i = ay()(Object.hasOwn(e8, t) ? e8[t] : e8[e6.UnplayableOtherReason]);
                        return (0, ra.jsx)("span", {
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
                            l = ay(),
                            s = (0, eM.useRef)(null),
                            u = uA(l, {
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
                        }), u) ? (0, ra.jsx)("span", {
                            ref: s,
                            "data-testid": u.testId,
                            className: void 0 === a ? "contextual-message" : a,
                            children: u.message
                        }) : null
                    }
                }
            }), eR()(document).ready(function() {
                uY();
                var e = (0, eL.DeviceMeta)();
                (e.isUWPApp || e.isUniversalApp) && (u_.isJoinAttemptIdEnabled = !0, window.Roblox.AppHybridClientInterface = u_, uR.setGameLaunchInterface(u_)), uR.setGameLaunchLogger(uH)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "GameLaunch");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/gameLaunch-eda8102e9d066bf1.js.map